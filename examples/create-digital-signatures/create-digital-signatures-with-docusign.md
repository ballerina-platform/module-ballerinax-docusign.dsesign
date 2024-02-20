# Create digital signatures with DocuSign

## Introduction

This guide demonstrates how to utilize the DocuSign API in Ballerina to create a digital signature. In this example, there are steps to add a user signature, retrieve signature information, and obtain the details about all the signatures.

## Step 1: Import DocuSign connector

To begin, import the `ballerinax/docusign.dsesign` module into your Ballerina project.

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

## Step 3: Add user signature

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

## Step 4: Retrieve all signatures

Retrieve information about all user signatures associated with the specified account and user.

```ballerina
dsesign:UserSignaturesInformation usageSignatureInfo = check docusignClient->/accounts/[accountId]/users/[userId]/signatures("signature");
io:println("All signatures: ", usageSignatureInfo);
```

## Step 5: Retrieve signature information

Retrieve detailed information about a specific user signature using its ID.

```ballerina
string signatureId = <string>(<dsesign:UserSignature[]>usageSignatureInfo.userSignatures)[0].signatureId;
dsesign:UserSignature userSignature = check docusignClient->/accounts/[accountId]/users/[userId]/signatures/[signatureId];
io:println("Signature Info: ", userSignature);
```
