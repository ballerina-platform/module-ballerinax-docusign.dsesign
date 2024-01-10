import ballerina/io;
import ballerinax/docusign.esign;
import ballerina/lang.array;

configurable string accessToken = ?;
configurable string accountId = ?;
configurable string userId = ?;
esign:ConnectionConfig connectionConfig = {
    auth: {
        token: accessToken
    }
};
public function main() returns error? {
    esign:Client docusignClient = check new(serviceUrl = "https://demo.docusign.net/restapi/", config = connectionConfig);
    string base64Encoded = array:toBase64(check io:fileReadBytes("./resources/README.pdf"));

    string documentId = "1";
    esign:EnvelopeSummary envResult = check docusignClient->/accounts/[accountId]/envelopes.post(
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
                    recipientId: "12"
                }
                ]
            },
            status: "sent"
        }
    );

    io:println(envResult);

    string? envelopeId = envResult.envelopeId;
    if envelopeId is () {
        return error("Envelope ID is not available");
    }

    // esign:Envelope envelopeStatus = check docusignClient->/accounts/[accountId]/envelopes/[envelopeId];
    // io:println(envelopeStatus);
   
    esign:EnvelopeDocumentsResult envelopeDocumentsResult = check docusignClient->/accounts/[accountId]/envelopes/[envelopeId]/documents();

    io:println(envelopeDocumentsResult);

    // // Define the account ID and user ID
    // string accountId = "your_account_id";
    // string userId = "your_user_id";

    // // Create a new user signature
    // esign:UserSignaturesInformation userSignature = {
    //     userSignatures: [
    //         {
    //             signatureFont: "Arial",
    //             signatureInitials: "AB",
    //             signatureName: "Alice Ballerina",
    //             signatureType: "initials",
    //             signature150ImageId: "image_id",
    //             signatureId: "signature_id"
    //         }
    //     ]
    // };
    // esign:UserSignaturesInformation createResponse = check docusignClient->/accounts/[accountId]/users/[userId]/signatures.post(userSignature);
    // io:println(createResponse);

    // // Get the created user signature
    // esign:UserSignature|error getResponse = docusignClient->/accounts/[accountId]/users/[userId]/signatures/["signatureId"]();
    // io:println(getResponse);
    
    // // Delete the created user signature
    // error? deleteResponse = docusignClient->/accounts/[accountId]/users/[userId]/signatures/["signatureId"].delete();
    // io:println(deleteResponse);
}
