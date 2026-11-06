# Ballerina DocuSign eSignature connector

[![Build](https://github.com/ballerina-platform/module-ballerinax-docusign.dsesign/actions/workflows/ci.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-docusign.dsesign/actions/workflows/ci.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-docusign.dsesign.svg)](https://github.com/ballerina-platform/module-ballerinax-docusign.dsesign/commits/main)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/docusign.dsesign.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%2Fdocusign.dsesign)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## Overview

[DocuSign](https://www.docusign.com) is a digital transaction management platform that enables users to securely sign, send, and manage documents electronically.

The Ballerina DocuSign eSignature connector integrates with the [DocuSign eSignature REST API v2.1](https://developers.docusign.com/docs/esign-rest-api/reference/). It lets Ballerina applications send documents for signature, build and reuse templates, embed signing and sending sessions in their own user interfaces, track envelope status and audit history, and administer accounts, users, groups, and branding.

## Setup guide

To utilize the eSignature connector, you must have access to the DocuSign REST API through a DocuSign account.

### Step 1: Create a DocuSign account

In order to use the DocuSign eSignature connector, you need to first create the DocuSign credentials for the connector to interact with DocuSign.

- You can [create an account](https://go.docusign.com/o/sandbox/) for free at the [Developer Center](https://developers.docusign.com/).

    <img src="https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-docusign.dsesign/main/ballerina/resources/create-account.png" alt="Create DocuSign Account" width="50%">

### Step 2: Create integration key and secret key

1. **Create an integration key**: Visit the [Apps and Keys](https://admindemo.docusign.com/apps-and-keys) page on DocuSign. Click on `Add App and Integration Key,` provide a name for the app, and click `Create App`. This will generate an `Integration Key`.

    <img src="https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-docusign.dsesign/main/ballerina/resources/app-and-integration-key.png" alt="Create Integration Key" width="50%">

2. **Generate a secret key**: Under the `Authentication` section, click on `Add Secret Key`. This will generate a secret Key. Make sure to copy and save both the `Integration Key` and `Secret Key`.

    <img src="https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-docusign.dsesign/main/ballerina/resources/add-secret-key.png" alt="Add Secret Key" width="50%">

### Step 3: Generate refresh token

1. **Add a redirect URI**: Click on `Add URI` and enter your redirect URI (e.g., <http://www.example.com/callback>).

    <img src="https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-docusign.dsesign/main/ballerina/resources/add-redirect-uri.png" alt="Add Redirect URI" width="50%">

2. **Generate the encoded key**: The `Encoded Key` is a base64 encoded string of your `Integration key` and `Secret Key` in the format `{IntegrationKey:SecretKey}`. You can generate this in your web browser's console using the `btoa()` function: `btoa('IntegrationKey:SecretKey')`. You can also generate it with any base64 encoder.

3. **Get the authorization code**: Visit the following URL in your web browser, replacing `{iKey}` with your Integration Key and `{redirectUri}` with your redirect URI.

    ```url
    https://account-d.docusign.com/oauth/auth?response_type=code&scope=signature%20impersonation%20extended&client_id={iKey}&redirect_uri={redirectUri}
    ```

    This will redirect you to your Redirect URI with a `code` query parameter. This is your `authorization code`.

4. **Get the refresh token**: Use the following `curl` command to get the refresh token, replacing `{encodedKey}` with your Encoded Key and `{codeFromUrl}` with your `authorization code`.

    ```bash
    curl --location 'https://account-d.docusign.com/oauth/token' \
    --header 'Authorization: Basic {encodedKey}' \
    --header 'Content-Type: application/x-www-form-urlencoded' \
    --data-urlencode 'code={codeFromUrl}' \
    --data-urlencode 'grant_type=authorization_code'
    ```

    The response will contain your refresh token. Use `https://account-d.docusign.com/oauth/token` as the refresh URL.

Remember to replace `{IntegrationKey:SecretKey}`, `{iKey}`, `{redirectUri}`, `{encodedKey}`, and `{codeFromUrl}` with your actual values.

The steps above use the DocuSign developer (demo) environment, whose eSignature REST API is served at `https://demo.docusign.net/restapi`. The connector defaults to the production service URL, `https://www.docusign.net/restapi`, so pass the demo URL explicitly while developing. When your app is ready to go live, follow the [go-live guidelines](https://developers.docusign.com/docs/esign-rest-api/go-live/) and use the production account server (`https://account.docusign.com/oauth/token`) and your account's base URI.

## Quickstart

To use the DocuSign eSignature connector in your Ballerina application, modify the `.bal` file as follows.

### Step 1: Import the module

Import the `ballerinax/docusign.dsesign` module.

```ballerina
import ballerinax/docusign.dsesign;
```

### Step 2: Instantiate a new connector

Create a `dsesign:ConnectionConfig` with the OAuth 2.0 credentials obtained above and initialize the connector with it, passing the service URL of your DocuSign environment.

```ballerina
configurable string clientId = ?;
configurable string clientSecret = ?;
configurable string refreshToken = ?;
configurable string refreshUrl = ?;
configurable string serviceUrl = ?;
configurable string accountId = ?;

final dsesign:Client docusign = check new ({
    auth: {
        clientId,
        clientSecret,
        refreshToken,
        refreshUrl
    }
}, serviceUrl);
```

### Step 3: Invoke the connector operation

Now, utilize the available connector operations. For example, list the envelopes whose status changed since a given date.

```ballerina
public function main() returns error? {
    dsesign:EnvelopesInformation _ = check docusign->listEnvelopes(accountId, fromDate = "2026-01-01T00:00Z");
}
```

### Step 4: Run the Ballerina application

Add the configuration values to a `Config.toml` file and run the application.

```toml
clientId = "<INTEGRATION_KEY>"
clientSecret = "<SECRET_KEY>"
refreshToken = "<REFRESH_TOKEN>"
refreshUrl = "https://account-d.docusign.com/oauth/token"
serviceUrl = "https://demo.docusign.net/restapi"
accountId = "<ACCOUNT_ID>"
```

```bash
bal run
```

## Examples

The DocuSign eSignature connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-docusign.dsesign/tree/main/examples/), covering the following use cases:

1. [Send documents for esignatures](https://github.com/ballerina-platform/module-ballerinax-docusign.dsesign/tree/main/examples/send-documents-for-esignatures) - Send an envelope with a document to a recipient to add their eSignature, then list the envelope's documents.
2. [Create digital signatures](https://github.com/ballerina-platform/module-ballerinax-docusign.dsesign/tree/main/examples/create-digital-signatures) - Add a signature image for a DocuSign user, then list the user's signatures and read one back.

## Build from source

### Setting up prerequisites

1. Download and install Java SE Development Kit (JDK) version 21 from either of the following sources:

    * [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)
    * [OpenJDK](https://adoptium.net/)

   > **Note:** After installation, remember to set the `JAVA_HOME` environment variable to the directory where the JDK is installed.

2. Download and install [Ballerina Swan Lake](https://ballerina.io/).

3. Download and install [Docker](https://www.docker.com/get-started).

   > **Note**: Ensure that the Docker daemon is running before executing any tests.

4. Export a GitHub Personal Access Token with read package permissions as follows:

    ```bash
    export packageUser=<Username>
    export packagePAT=<Personal Access Token>
    ```

### Build options

Run the following commands to build from source.

1. To build the package:

   ```bash
   ./gradlew clean build
   ```

2. To run the tests:

   ```bash
   ./gradlew clean test
   ```

3. To build without the tests:

   ```bash
   ./gradlew clean build -x test
   ```

4. To run tests against different environments:

   ```bash
   ./gradlew clean test -Pgroups=<Comma separated groups/test cases>
   ```

5. To debug the package with a remote debugger:

   ```bash
   ./gradlew clean build -Pdebug=<port>
   ```

6. To debug with the Ballerina language:

   ```bash
   ./gradlew clean build -PbalJavaDebug=<port>
   ```

7. Publish the generated artifacts to the local Ballerina Central repository:

    ```bash
    ./gradlew clean build -PpublishToLocalCentral=true
    ```

8. Publish the generated artifacts to the Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToCentral=true
   ```

## Contribute to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

* For more information go to the [`docusign.dsesign` package](https://central.ballerina.io/ballerinax/docusign.dsesign/latest).
* For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
