## Overview

The Ballerina Docusign eSignature Connector provides the capability to securely sign, send, and manage documents in a digital environment.

The Ballerina Docusign eSignature module supports [DocuSign eSignature API V2.1](https://github.com/docusign/OpenAPI-Specifications/blob/master/esignature.rest.swagger-v2.1.json).

## Setup guide

To utilize the eSignature connector, you must have access to the DocuSign REST API through a DocuSign account.

### Step 1: Create a DocuSign account

In order to use the DocuSign eSignature connector, you need to first create the DocuSign credentials for the connector to interact with DocuSign.

* You can [create an account](https://go.docusign.com/o/sandbox/) for free at the [Developer Center](https://developers.docusign.com/).

    ![Create DocuSign account](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-docusign/main/ballerina/resources/create-account.png)

### Step 2: Create integration key and secret key

1. **Create an integration key**: Visit the [Apps and Keys](https://admindemo.docusign.com/apps-and-keys) page on DocuSign. Click on "Add App and Integration Key", provide an App name, and click "Create App". This will generate an `Integration Key`.

    ![Create integration key](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-docusign/main/ballerina/resources/app-and-integration-key.png)

2. **Generate a secret key**: Under the "Authentication" section, click on "Add Secret Key". This will generate a secret Key. Make sure to copy and save both the `Integration Key` and `Secret Key.`

    ![Add secret key](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-docusign/main/ballerina/resources/add-secret-key.png)

### Step 3: Generate refresh token

1. **Add a redirect URI**: Click on "Add URI" and enter your redirect URI (e.g., <http://www.example.com/callback>).

    ![Add redirect URI](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-docusign/main/ballerina/resources/add-redirect-uri.png)

2. **Generate the encoded key**: The `Encoded Key` is a base64 encoded string of your `Integration key` and `Secret Key` in the format `{IntegrationKey:SecretKey}`. You can generate this in your web browser's console using the `btoa()` function: `btoa('IntegrationKey:SecretKey')`. You can either generate the encoded key from an online base64 encoder.

3. **Get the authorization code**: Visit the following URL in your web browser, replacing `{iKey}` with your Integration Key and `{redirectUri}` with your Redirect URI:

    ```url
    https://account-d.docusign.com/oauth/auth?response_type=code&scope=signature%20impersonation&client_id={iKey}&redirect_uri={redirectUri}
    ```

    This will redirect you to your Redirect URI with a `code` query parameter. This is your Authorization Code.

4. **Get the refresh token**: Use the following `curl` command to get the refresh token, replacing `{encodedKey}` with your Encoded Key and `{codeFromUrl}` with your authorization code:

    ```bash
    curl --location 'https://account-d.docusign.com/oauth/token' \
    --header 'Authorization: Basic {encodedKey}' \
    --header 'Content-Type: application/x-www-form-urlencoded' \
    --data-urlencode 'code={codeFromUrl}' \
    --data-urlencode 'grant_type=authorization_code'
    ```

    The response will contain your refresh token. Use `https://account-d.docusign.com/oauth/token` as the refresh URL.

Remember to replace `{IntegrationKey:SecretKey}`, `{iKey}`, `{redirectUri}`, `{encodedKey}`, and `{codeFromUrl}` with your actual values.

Above is about using the DocuSign eSignature APIs in the developer mode. If your app is ready to go live, you need to follow the guidelines given [here](https://developers.docusign.com/docs/esign-rest-api/go-live/) to make it work.

## Quickstart

This sample demonstrates a scenario of creating an envelope with a document and sending it to respective recipients to add the e-signature using the Ballerina DocuSign eSignature connector.

### Step 1: Import the module

Import the `ballerinax/docusign.dsesign` module into your Ballerina project.

```ballerina
import ballerinax/docusign.dsesign;
```

### Step 2: Instantiate a new connector

Create a `dsesign:ConnectionConfig` with the obtained OAuth2.0 tokens and initialize the connector with it.

```ballerina
dsesign:Client docusignClient = check new({
    auth: {
        clientId,
        clientSecret,
        refreshToken,
        refreshUrl
    },
    serviceUrl = "https://demo.docusign.net/restapi"
});
```

### Step 3: Invoke the connector operation

You can now utilize the operations available within the connector.

```ballerina
public function main() returns error? {
    dsesign:Client docusignClient = ...//; initializes the DocuSign eSignature client

    // Creates an envelope
    dsesign:EnvelopeSummary newEnvelope = check docusignClient->/accounts/[accountId]/envelopes.post({
        documents: [
            {
                documentBase64: "base64-encoded-pdf-file",
                documentId: "1",
                fileExtension: "pdf",
                name: "document"
            }
        ],
        emailSubject: "Simple Signing Example 02",
        recipients: {
            signers: [
                {
                    email: "randomtester12@corp.com",
                    name: "randomtester12",
                    recipientId: "12"
                }
            ]
        },
        status: "sent"
    });

    // Retrieves specific sets of envelopes from a given date
    dsesign:EnvelopesInformation envelope = check docusignClient->/accounts/[accountId]/envelopes(from_date = "2024-01-01T00:00Z");
}
```

>**Hint:** To apply a value to the `documentBase64` field, you can either use an online tool designed to convert a PDF file into a base64-encoded string, or you can refer to the provided [example code](https://github.com/ballerina-platform/module-ballerinax-docusign.dsesign/blob/main/examples/send-documents-for-esignatures/main.bal#L42)

### Step 4: Run the Ballerina application

Use the following command to compile and run the Ballerina program.

```bash
bal run
```

## Examples

The DocuSign eSignature connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-docusign.dsesign/tree/main/examples).

1. [Send documents for esignatures](https://github.com/ballerina-platform/module-ballerinax-docusign.dsesign/tree/main/examples/send-documents-for-esignatures)
    This example shows how to use DocuSign eSignature APIs to send envelope to recipients to add their respective esignatures to documents in the envelope.

2. [Create esignatures](https://github.com/ballerina-platform/module-ballerinax-docusign.dsesign/tree/main/examples/create-digital-signatures)
    This example shows how to create a eSignature for your DocuSign account.
