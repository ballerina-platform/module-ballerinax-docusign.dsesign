## Package overview

The Ballerina Docusign eSignature Connector provides the capability to securely sign, send, and manage documents in a digital environment.

The Ballerina Docusign eSignature module supports [DocuSign eSignature API V2.1](https://github.com/docusign/OpenAPI-Specifications/blob/master/esignature.rest.swagger-v2.1.json).

## Set up Guide

To utilize the eSignature connector, you must have access to the DocuSign REST API through a DocuSign account.

### Step 1: Create a DocuSign Account

In order to use the DocuSign eSignature connector, you need to first create the DocuSign credentials for the connector to interact with DocuSign.

You can [create an account](https://go.docusign.com/o/sandbox/) for free at the [Developer Center](https://developers.docusign.com/).

### Step 2: Create Integration Key and Secret Key

1. **Create an Integration Key and Secret Key**: Visit the [Apps and Keys](https://admindemo.docusign.com/apps-and-keys) page on DocuSign. Click on "Add App and Integration Key", provide an App name, and click "Create App". This will generate an Integration Key.

2. **Generate a Secret Key**: Under the Authentication section, click on "Add Secret Key". This will generate a Secret Key. Make sure to copy and save both the Integration Key and Secret Key.

### Step 3: Generate Access Token

1. **Add a Redirect URI**: Click on "Add URI" and enter your redirect URI (e.g., <http://www.example.com/callback>).

2. **Generate the Encoded Key**: The Encoded Key is a base64 encoded string of your Integration Key and Secret Key in the format `{IntegrationKey:SecretKey}`. You can generate this in your web browser's console using the `btoa()` function: `btoa('IntegrationKey:SecretKey')`.

3. **Get the Authorization Code**: Visit the following URL in your web browser, replacing `{iKey}` with your Integration Key and `{redirectUri}` with your Redirect URI:

    ```url
    https://account-d.docusign.com/oauth/auth?response_type=code&scope=signature%20impersonation&client_id={iKey}&redirect_uri={redirectUri}
    ```

    This will redirect you to your Redirect URI with a `code` query parameter. This is your Authorization Code.

4. **Get the Access Token**: Use the following `curl` command to get the Access Token, replacing `{encodedKey}` with your Encoded Key and `{codeFromUrl}` with your Authorization Code:

    ```bash
    curl --location 'https://account-d.docusign.com/oauth/token' \
    --header 'Authorization: Basic {encodedKey}' \
    --header 'Content-Type: application/x-www-form-urlencoded' \
    --data-urlencode 'code={codeFromUrl}' \
    --data-urlencode 'grant_type=authorization_code'
    ```

    The response will contain your Access Token.

Remember to replace `{IntegrationKey:SecretKey}`, `{iKey}`, `{redirectUri}`, `{encodedKey}`, and `{codeFromUrl}` with your actual values.

## Quickstart

This sample demonstrates a scenario of creating an envelope with a document and sending it to respective recipients to add the e-signature using the Ballerina Google DocuSign eSignature connector.

### Step 1: Import the package

Import the `ballerinax/docusign.dsesign` package into your Ballerina project.

```ballerina
import ballerinax/docusign.dsesign;
```

### Step 2: Instantiate a new connector

Create a `dsesign:ConnectionConfig` with the obtained OAuth2.0 tokens and initialize the connector with it.

```ballerina
configurable string accessToken = ?;

dsesign:ConnectionConfig connectionConfig = {
    auth: {
        token: accessToken
    }
};

public function main() returns error? {
    dsesign:Client docusignClient = check new(
        config = connectionConfig,
        serviceUrl = "https://demo.docusign.net/restapi/"
    );
}
```

### Step 3: Invoke the connector operation

You can now utilize the operations available within the connector.

```ballerina
public function main() returns error? {
    dsesign:Client docusignClient = ...//;

    dsesign:EnvelopeSummary envResult = check docusignClient->/accounts/[accountId]/envelopes.post(
    {
        documents: [
            {
                documentBase64: "base64-encoded-pdf-file",
                documentId: "1",
                fileExtension: "pdf",
                name: "document"
            }
        ],
        emailSubject: "Simple Signing Example",
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
    }
);
}
```

## Examples

The DocuSign eSignature connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-docusign.dsesign/tree/main/examples).

1. [Send Documents for eSignatures](https://github.com/ballerina-platform/module-ballerinax-googleapis.docusign.dsesign/tree/main/examples/send-documents)
    This example shows how to use DocuSign eSignature APIs to send envelope to recipients to add their respective esignatures to documents in the envelope.

2. [Create eSignatures](https://github.com/ballerina-platform/module-ballerinax-googleapis.docusign.dsesign/tree/main/examples/create-signature)
    This example shows how to create a eSignature for your DocuSign account.
