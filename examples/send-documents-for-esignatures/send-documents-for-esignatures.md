# Send Documents for e-Signatures with DocuSign

This guide illustrates the process of integrating DocuSign APIs to send documents to add digital signatures. The example covers steps to send a document for signature, including document preparation, recipient setup, and envelope creation.

## Step 1: Import DocuSign Connector

Start by importing the `ballerinax/docusign.dsesign` module into your Ballerina project.

```ballerina
import ballerinax/docusign.dsesign;
```

## Step 2: Set Up DocuSign Connection

Define configurable parameters such as `accessToken`, `accountId`, and `userId` to set up the DocuSign connection.

```ballerina
configurable string accessToken = ?;
configurable string accountId = ?;
configurable string userId = ?;

dsesign:ConnectionConfig connectionConfig = {
    auth: {
        token: accessToken
    }
};
```

## Step 3: Create DocuSign Client

Initialize the DocuSign client with the specified service URL and connection configuration.

```ballerina
dsesign:Client docusignClient = check new(serviceUrl = "https://demo.docusign.net/restapi/", config = connectionConfig);
```

## Step 4: Prepare Document for Signature

Read the document content, convert it to Base64, and send it to DocuSign along with necessary details such as document ID, file extension, and name.

```ballerina
string base64Encoded = array:toBase64(check io:fileReadBytes("./resources/README.pdf"));
string documentId = "1";

dsesign:EnvelopeSummary envResult = check docusignClient->/accounts/[accountId]/envelopes.post(
    {
        documents: [
            {
                documentBase64: base64Encoded,
                documentId: documentId,
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

io:println(envResult);
```

## Step 5: Retrieve Envelope Documents

After sending the document for signature, retrieve information about the envelope documents.

```ballerina
string? envelopeId = envResult.envelopeId;
if envelopeId is () {
    return error("Envelope ID is not available");
}

dsesign:EnvelopeDocumentsResult envelopeDocumentsResult = check docusignClient->/accounts/[accountId]/envelopes/[envelopeId]/documents();
io:println(envelopeDocumentsResult);
```
