import ballerina/io;
import ballerinax/docusign.dsesign;
import ballerina/lang.array;

configurable string accessToken = ?;
configurable string accountId = ?;
configurable string userId = ?;

dsesign:ConnectionConfig connectionConfig = {
    auth: {
        token: accessToken
    }
};

public function main() returns error? {
    dsesign:Client docusignClient = check new(serviceUrl = "https://demo.docusign.net/restapi/", config = connectionConfig);
    string base64Encoded = array:toBase64(check io:fileReadBytes("./resources/signature.png"));
    dsesign:UserSignaturesInformation addSignature = check docusignClient->/accounts/[accountId]/users/[userId]/signatures.post({
        userSignatures: [
            {
                imageBase64: base64Encoded,
                signatureName: "test signature"
            }
        ]
    });
    io:println(addSignature);
    dsesign:UserSignaturesInformation usageSignatureInfo = check docusignClient->/accounts/[accountId]/users/[userId]/signatures("signature");
    io:println("All signatures: ", usageSignatureInfo);
    string signatureId = <string>(<dsesign:UserSignature[]>usageSignatureInfo.userSignatures)[0].signatureId;
    dsesign:UserSignature unionResult = check docusignClient->/accounts/[accountId]/users/[userId]/signatures/[signatureId];
    io:println("Signature Info: ", unionResult);
}
