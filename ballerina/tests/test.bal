// Copyright (c) 2023, WSO2 LLC. (http://www.wso2.com) All Rights Reserved.
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/test;
// import ballerina/io;

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

// @test:Config {
//     groups: ["account"]
// }
// function testServiceInfo() returns error? {
//     ServiceInformation res = check docuSignClient->/service_information;
//     io:println(res);
// }

// @test:Config {
//     groups: ["account"]
// }
// function testUserSignInfo() returns error? {
//     UserSignaturesInformation userSignInfo = check docuSignClient->/accounts/["path"]/users/["path"]/signatures();
//     io:println(userSignInfo);
// }

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
