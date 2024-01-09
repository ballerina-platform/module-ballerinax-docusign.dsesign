import ballerina/io;
import ballerinax/docusign.esign;

configurable string accessToken = ?;

public function main() returns error? {
    // Initialize the client
    esign:Client docusignClient = check new(serviceUrl = "https://demo.docusign.net/restapi/", config = {auth: {token: accessToken}});

    // Define the account ID and user ID
    string accountId = "your_account_id";
    string userId = "your_user_id";

    // Create a new user signature
    esign:UserSignaturesInformation userSignature = {
        userSignatures: [
            {
                signatureFont: "Arial",
                signatureInitials: "AB",
                signatureName: "Alice Ballerina",
                signatureType: "initials",
                signature150ImageId: "image_id",
                signatureId: "signature_id"
            }
        ]
    };
    esign:UserSignaturesInformation createResponse = check docusignClient->/accounts/[accountId]/users/[userId]/signatures.post(userSignature);
    io:println(createResponse);

    // Get the created user signature
    esign:UserSignature|error getResponse = docusignClient->/accounts/[accountId]/users/[userId]/signatures/["signatureId"]();
    io:println(getResponse);
    
    // Delete the created user signature
    error? deleteResponse = docusignClient->/accounts/[accountId]/users/[userId]/signatures/["signatureId"].delete();
    io:println(deleteResponse);

    // // Initialize the client
    // esign:Client client2 = check new(serviceUrl = "https://demo.docusign.net/restapi/", config = {auth: {token: accessToken}});

    // string accountId = "d3d412a8";
    // string userId = "72d8d572";
    // esign:UserSignaturesInformation usageSignatureInfo = check client2->/accounts/[accountId]/users/[userId]/signatures("signature");
    // io:println(usageSignatureInfo);
    // string signatureId = <string>(<esign:UserSignature[]>usageSignatureInfo.userSignatures)[0].signatureId;
    // esign:UserSignature unionResult = check client2->/accounts/[accountId]/users/[userId]/signatures/[signatureId];
    // io:println(unionResult);
}
