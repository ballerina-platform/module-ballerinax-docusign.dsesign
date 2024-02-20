# Send documents for esignatures with DocuSign

This guide illustrates the process of integrating DocuSign APIs to send documents to add digital signatures. The example covers steps to send a document for signature, including document preparation, recipient setup, and envelope creation.

## Step 1: Import DocuSign connector

Import the `ballerinax/docusign.dsesign` module into your Ballerina project.

```ballerina
import ballerinax/docusign.dsesign;
```

## Step 2: Instantiate a new connector

Create a `dsesign:ConnectionConfig` with the obtained OAuth2.0 tokens and initialize the connector with it.

```ballerina
dsesign:Client docusignClient = check new(
    {
        auth: {
            clientId: <CLIENT_ID>,
            clientSecret: <CLIENT_SECRET>,
            refreshToken: <REFRESH_TOKEN>,
            refreshUrl: <REFRESH_URL>
        }
    },
    serviceUrl = "https://demo.docusign.net/restapi/"
);
```

## Step 3: Creates an envelope

Read the document content, convert it to Base64, and send it to DocuSign along with necessary details such as document ID, file extension, and name.

```ballerina
dsesign:EnvelopeSummary envResult = check docusignClient->/accounts/[accountId]/envelopes.post(
    {
        documents: [
            {
                documentBase64: "base64Encoded-pdf-file",
                documentId: 1,
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
                    recipientId: "12",
                    tabs: {
                        signHereTabs: [
                            {
                                xPosition: "100",
                                yPosition: "100",
                                documentId: documentId,
                                pageNumber: "1",
                                height: "10"
                            }
                        ]
                    }
                }
            ]
        },
        status: "sent"
    }
);
```

## Step 4: Retrieve envelope documents

After sending the document for signature, retrieve information about the envelope documents.

```ballerina
dsesign:EnvelopeDocumentsResult envelopeDocumentsResult = check docusignClient->/accounts/[accountId]/envelopes/[envelopeId]/documents();
```
