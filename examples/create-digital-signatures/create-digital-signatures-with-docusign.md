# Create Digital Signatures with DocuSign

## Introduction

This guide demonstrates how to utilize the DocuSign API in Ballerina to create a digital signature. In this example, there are steps to add a user signature, retrieve signature information, and obtain the details about all the signatures.

## Step 1: Import DocuSign Connector

To begin, import the `ballerinax/docusign.dsesign` module into your Ballerina project.

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

## Step 4: Add User Signature

Encode the signature image in Base64 format and use the DocuSign API to add a user signature.

```ballerina
dsesign:UserSignaturesInformation addSignature = check docusignClient->/accounts/[accountId]/users/[userId]/signatures.post({
    userSignatures: [
        {
            imageBase64: array:toBase64(check io:fileReadBytes("./resources/signature.png")),
            signatureName: "test signature"
        }
    ]
});
```

## Step 5: Retrieve All Signatures

Retrieve information about all user signatures associated with the specified account and user.

```ballerina
dsesign:UserSignaturesInformation usageSignatureInfo = check docusignClient->/accounts/[accountId]/users/[userId]/signatures("signature");
io:println("All signatures: ", usageSignatureInfo);
```

## Step 6: Retrieve Signature Information

Retrieve detailed information about a specific user signature using its ID.

```ballerina
string signatureId = <string>(<dsesign:UserSignature[]>usageSignatureInfo.userSignatures)[0].signatureId;
dsesign:UserSignature unionResult = check docusignClient->/accounts/[accountId]/users/[userId]/signatures/[signatureId];
io:println("Signature Info: ", unionResult);
```
