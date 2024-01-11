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
   
    esign:EnvelopeDocumentsResult envelopeDocumentsResult = check docusignClient->/accounts/[accountId]/envelopes/[envelopeId]/documents();

    io:println(envelopeDocumentsResult);

    // esign:BulkSendingCopyRecipient[] bulkRecipients = [
    //     {
    //         email: "example1@example.com",
    //         name: "Example1",
    //         recipientId: "1",
    //         roleName: "signer",
    //         tabs: [
    //             {
    //                 tabLabel: "signHere",
    //                 initialValue: "12345"
    //             }
    //         ]
    //     },
    //     {
    //         email: "example2@example.com",
    //         name: "Example2",
    //         recipientId: "2"
    //     }
    // ];

    // esign:BulkSendingCopy bulkCopy = {
    //     recipients: bulkRecipients
    // };

    // esign:BulkSendingList bulkSendList = check docusignClient->/accounts/[accountId]/bulk_send_lists.post({
    //     name: "New Bulk List"
    // });

    // io:println(bulkSendList);

    // esign:BulkSendingList updateBulkList = check docusignClient->/accounts/[accountId]/bulk_send_lists/[<string>bulkSendList.listId].put({
    //     bulkCopies: [
    //         bulkCopy
    //     ]
    // });

    // io:println(updateBulkList);

    // esign:BulkSendingList bulkSendList = check docusignClient->/accounts/["a"]/bulk_send_lists.post({
    //     name: "New Bulk List",
    //     bulkCopies: [
    //         {
    //             recipients: {
    //                 signers: [
    //                     {
    //                         email: "nuvidu.18@cse.mrt.ac.lk",
    //                         name: "Nuvidu",
    //                         recipientId: "1"
    //                     }
    //                 ]
    //             }
    //         }
    //     ]
    // });
}
