import ballerina/io;
import ballerinax/docusign.dsesign;

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
    dsesign:UserSignaturesInformation usageSignatureInfo = check docusignClient->/accounts/[accountId]/users/[userId]/signatures("signature");
    io:println("All signatures: ", usageSignatureInfo);
    string signatureId = <string>(<dsesign:UserSignature[]>usageSignatureInfo.userSignatures)[0].signatureId;
    dsesign:UserSignature unionResult = check docusignClient->/accounts/[accountId]/users/[userId]/signatures/[signatureId];
    io:println("Signature Info: ", unionResult);
}
