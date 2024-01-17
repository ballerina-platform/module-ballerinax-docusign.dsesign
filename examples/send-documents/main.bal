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

    string? envelopeId = envResult.envelopeId;
    if envelopeId is () {
        return error("Envelope ID is not available");
    }

    // esign:Envelope envelopeStatus = check docusignClient->/accounts/[accountId]/envelopes/[envelopeId];
    // io:println(envelopeStatus);
   
    dsesign:EnvelopeDocumentsResult envelopeDocumentsResult = check docusignClient->/accounts/[accountId]/envelopes/[envelopeId]/documents();

    io:println(envelopeDocumentsResult);
}
