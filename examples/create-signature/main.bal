import ballerina/io;
import ballerinax/docusign.esign;

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
    esign:UserSignaturesInformation usageSignatureInfo = check docusignClient->/accounts/[accountId]/users/[userId]/signatures("signature");
    io:println("All signatures: ", usageSignatureInfo);
    string signatureId = <string>(<esign:UserSignature[]>usageSignatureInfo.userSignatures)[0].signatureId;
    esign:UserSignature unionResult = check docusignClient->/accounts/[accountId]/users/[userId]/signatures/[signatureId];
    io:println("Signature Info: ", unionResult);
}
