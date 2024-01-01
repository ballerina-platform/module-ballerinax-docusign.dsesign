import ballerina/test;
import ballerina/io;

Client docuSignClient = test:mock(Client);

@test:BeforeSuite
function initializeClientsForMockServer() returns error? {
    docuSignClient = check new(
        {
            timeout: 10000,
            auth: {
                token: "eyJ0eXAiOiJNVCIsImFsZyI6IlJTMjU2I"
            }
        },
        serviceUrl = "http://localhost:9090/restapi"
    );
}

@test:Config {
    groups: ["account"]
}
function testServiceInfo() returns error? {
    ServiceInformation res = check docuSignClient->/service_information;
    io:println(res);
}

// @test:Config {
//     groups: ["account"]
// }
// function testCreateAccount() returns error? {
//     NewAccountSummary res = check docuSignClient->/accounts.post({
//         accountName: "My Account",
//         distributorCode: "DistributorCode",
//         distributorPassword: "DistributorPassword",
//         enablePreAuth: "true",
//         envelopePartitionId: "EnvelopePartitionId",
//         paymentMethod: "CreditCard",
//         paymentProcessor: "PaymentProcessor",
//         taxExemptId: "TaxExemptId"
//     });
//     io:println(res);
// }

// @test:Config {
//     groups: ["account"]
// }
// function testCreateAccount() returns error? {
//     NewAccountDefinition newAcc = {
//         accountName: "My Account",
//         distributorCode: "DistributorCode",
//         distributorPassword: "DistributorPassword",
//         enablePreAuth: "true",
//         envelopePartitionId: "EnvelopePartitionId",
//         paymentMethod: "CreditCard",
//         paymentProcessor: "PaymentProcessor",
//         taxExemptId: "TaxExemptId"
//     };

//     NewAccountSummary res = check docuSignClient->/accounts.post(newAcc);
//     io:println(res);
// }
