// Copyright (c) 2024, WSO2 LLC. (http://www.wso2.com) All Rights Reserved.
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
import ballerina/io;
import ballerina/lang.array;
import ballerina/os;

Client docuSignClient = test:mock(Client);

configurable boolean isTestOnLiveServer = os:getEnv("IS_TEST_ON_LIVE_SERVER") == "true";

configurable string accountId = ?;
configurable string userId = ?;
configurable string clientId = ?;
configurable string clientSecret = ?;
configurable string refreshToken = ?;
configurable string refreshUrl = ?;

@test:BeforeSuite
function initializeClientsForDocuSignServer () returns error? {
    if isTestOnLiveServer {
        docuSignClient = check new("https://demo.docusign.net/restapi/",
            {
                auth: {
                    clientId: os:getEnv("CLIENT_ID"),
                    clientSecret: os:getEnv("CLIENT_SECRET"),
                    refreshToken: os:getEnv("REFRESH_TOKEN"),
                    refreshUrl: os:getEnv("REFRESH_URL")
                }
            }
        );
    } else {
        docuSignClient = check new("http://localhost:9092/restapi",
            {
                auth: {
                    clientId: clientId,
                    clientSecret: clientSecret,
                    refreshToken: refreshToken,
                    refreshUrl: refreshUrl
                }
            }
        );
    }
}

@test:Config {
    groups: ["account"]
}
function testServiceInfo() returns error? {
    ServiceInformation expectedResponse = {
        buildVersion:"23.4.0.45303 (23.4.00.00.45303+951e7d1b18c5)",
        linkedSites:["https://www.docusign.net","https://na2.docusign.net","https://na3.docusign.net","https://eu.docusign.net","https://au.docusign.net","https://ca.docusign.net","https://na4.docusign.net"],
        serviceVersions: [
            {
                version: "v1",
                versionUrl: "https://demo.docusign.net/restapi/v1"
            },
            {
                version: "v2",
                versionUrl: "https://demo.docusign.net/restapi/v2"
            },
            {   
                version: "v2.1",
                versionUrl: "https://demo.docusign.net/restapi/v2.1"
            }
        ]
    };
    ServiceInformation response = check docuSignClient->/service_information;
    test:assertEquals(response.serviceVersions, expectedResponse.serviceVersions);
}

@test:Config {
    groups: ["account"]
}
function testVersion() returns error? {
    ResourceInformation expectedResponse = {
        resources: [
            {
                name: "accounts",
                value: "https://demo.docusign.net/restapi/v2.1/accounts"
            },
            {
                name: "billing_plans",
                value: "https://demo.docusign.net/restapi/v2.1/billing_plans"
            },
            {
                name: "login_information",
                value: "https://demo.docusign.net/restapi/v2.1/login_information"
            },
            {
                name: "oauth2",
                value: "https://demo.docusign.net/restapi/v2.1/oauth2"
            }
        ]
    };
    ResourceInformation response = check docuSignClient->/["v2.1"];
    test:assertEquals(response.resources, expectedResponse.resources);
}

@test:Config {
    groups: ["account"]
}
function testCreateAndDeleteUserSignatures() returns error? {
    string base64Encoded = array:toBase64(check io:fileReadBytes("tests/resources/signature.png"));
    string signatureName = "test signature";
    UserSignaturesInformation payload = {
        userSignatures: [
            {
                imageBase64: base64Encoded,
                signatureName: signatureName
            }
        ]
    };
    UserSignaturesInformation response = check docuSignClient->/accounts/[accountId]/users/[userId]/signatures.post(payload);
    UserSignature[]? signatures = response.userSignatures;
    if signatures is () {
        return error("signatures are null");
    }
    test:assertEquals(signatures[0].signatureName, signatureName);
    string? signatureId = signatures[0].signatureId;
    if signatureId is () {
        return error("signatureId is null");
    }
    error? userSignature = docuSignClient->/accounts/[accountId]/users/[userId]/signatures/[signatureId].delete();
    test:assertEquals(userSignature, ());
}

@test:Config {
    groups: ["account"]
}
function testGetUserSignature() returns error? {
    string base64Encoded = array:toBase64(check io:fileReadBytes("tests/resources/signature.png"));
    string signatureName = "test signature";
    UserSignaturesInformation payload = {
        userSignatures: [
            {
                imageBase64: base64Encoded,
                signatureName: signatureName
            }
        ]
    };
    UserSignaturesInformation response = check docuSignClient->/accounts/[accountId]/users/[userId]/signatures.post(payload);
    UserSignature[]? signatures = response.userSignatures;
    if signatures is () {
        return error("signatures are null");
    }
    test:assertEquals(signatures[0].signatureName, signatureName);
    string? signatureId = signatures[0].signatureId;
    if signatureId is () {
        return error("signatureId is null");
    }

    UserSignature getSignature = check docuSignClient->/accounts/[accountId]/users/[userId]/signatures/[signatureId]();
    test:assertEquals(getSignature.signatureName, signatureName);

    error? userSignature = docuSignClient->/accounts/[accountId]/users/[userId]/signatures/[signatureId].delete();
    test:assertEquals(userSignature, ());
}

@test:Config {
    groups: ["account"]
}
function testAllUserSignature() returns error? {
    string base64Encoded = array:toBase64(check io:fileReadBytes("tests/resources/signature.png"));
    string signatureName = "test signature";
    UserSignaturesInformation payload = {
        userSignatures: [
            {
                imageBase64: base64Encoded,
                signatureName: signatureName
            }
        ]
    };
    UserSignaturesInformation response = check docuSignClient->/accounts/[accountId]/users/[userId]/signatures.post(payload);
    UserSignature[]? signatures = response.userSignatures;
    if signatures is () {
        return error("signatures are null");
    }
    test:assertEquals(signatures[0].signatureName, signatureName);
    string? signatureId = signatures[0].signatureId;
    if signatureId is () {
        return error("signatureId is null");
    }

    UserSignaturesInformation allSignatures = check docuSignClient->/accounts/[accountId]/users/[userId]/signatures();
    UserSignature[]? userSignatures = allSignatures.userSignatures;
    test:assertNotEquals(userSignatures, ());
    boolean signatureFound = false;
    if userSignatures is UserSignature[] {
        foreach UserSignature userSignature in userSignatures {
            if userSignature.signatureId == signatureId {
                signatureFound = true;
                break;
            }
        }
    }
    test:assertTrue(signatureFound, "Retrieved signatures does not contain the created signature");
    error? userSignature = docuSignClient->/accounts/[accountId]/users/[userId]/signatures/[signatureId].delete();
    test:assertEquals(userSignature, ());
}

@test:Config {
    groups: ["account"]
}
function testGetAccountInformation() returns error? {
    AccountInformation response = check docuSignClient->/accounts/[accountId]();
    test:assertEquals(response.accountIdGuid, accountId);
}

@test:Config {
    groups: ["billing"]
}
function testGetBillingInvoices() returns error? {
    BillingInvoicesResponse expectedResponse = {};
    BillingInvoicesResponse response = check docuSignClient->/accounts/[accountId]/billing_invoices("2023-12-01", "2024-01-31");
    test:assertEquals(response, expectedResponse);
}

@test:Config {
    groups: ["billing"]
}
function testGetPastDueInvoices() returns error? {
    BillingInvoicesSummary expectedResponse = {
        pastDueBalance: "$0.00",
        accountBalance: "$0.00",
        currencyCode: "USD",
        paymentAllowed: "false"
    };
    BillingInvoicesSummary|error response = check docuSignClient->/accounts/[accountId]/billing_invoices_past_due();
    test:assertEquals(response, expectedResponse);
}

@test:Config {
    groups: ["account"]
}
function testPutUserSignature() returns error? {
    string base64Encoded = array:toBase64(check io:fileReadBytes("tests/resources/signature.png"));
    string signatureName = "test signature";
    UserSignaturesInformation payload = {
        userSignatures: [
            {
                imageBase64: base64Encoded,
                signatureName: signatureName
            }
        ]
    };
    UserSignaturesInformation response = check docuSignClient->/accounts/[accountId]/users/[userId]/signatures.post(payload);
    UserSignature[]? signatures = response.userSignatures;
    if signatures is () {
        return error("signatures are null");
    }
    test:assertEquals(signatures[0].signatureName, signatureName);
    string? signatureId = signatures[0].signatureId;
    if signatureId is () {
        return error("signatureId is null");
    }
    payload.userSignatures[0].signatureName = "updated signature";
    UserSignatureDefinition updatedPayload = {
        signatureName: "updated signature"
    };
    UserSignature getSignature = check docuSignClient->/accounts/[accountId]/users/[userId]/signatures/[signatureId].put(updatedPayload);
    test:assertEquals(getSignature.signatureName, updatedPayload.signatureName);
}

@test:Config {
    groups: ["billing"]
}
function testGetBillingPayments() returns error? {
    BillingPaymentsResponse response = check docuSignClient->/accounts/[accountId]/billing_payments("2023-12-01", "2024-01-31");
    test:assertEquals(response, {});
}

@test:Config {
    groups: ["account"]
}
function testCreateEnvelope() returns error? {
    string expectedStatus = "created";
    EnvelopeSummary response = check docuSignClient->/accounts/[accountId]/envelopes.post({});
    test:assertEquals(response.status, expectedStatus);
}

@test:Config {
    groups: ["account"]
}
function testGetEnvelopeDetails() returns error? {
    string expectedStatus = "created";
    EnvelopeSummary response = check docuSignClient->/accounts/[accountId]/envelopes.post({});
    test:assertEquals(response.status, expectedStatus);
    string? envelopeId = response.envelopeId;
    if envelopeId is () {
        return error("envelopeId is null");
    }
    Envelope getEnvelope = check docuSignClient->/accounts/[accountId]/envelopes/[envelopeId]();
    test:assertEquals(getEnvelope.envelopeId, response.envelopeId);
}

@test:Config {
    groups: ["account"]
}
function testUpdateEnvelope() returns error? {
    EnvelopeSummary response = check docuSignClient->/accounts/[accountId]/envelopes.post({});
    string? envelopeId = response.envelopeId;
    if envelopeId is () {
        return error("envelopeId is null");
    }
    EnvelopeUpdateSummary updatedEnv = check docuSignClient->/accounts/[accountId]/envelopes/[envelopeId].put({});
    test:assertEquals(updatedEnv.envelopeId, envelopeId);
}

@test:Config{}
function testGetRecipients() returns error? {
    EnvelopeSummary response = check docuSignClient->/accounts/[accountId]/envelopes.post({});
    string? envelopeId = response.envelopeId;
    if envelopeId is () {
        return error("envelopeId is null");
    }
    EnvelopeRecipients actualResponse = check docuSignClient->/accounts/[accountId]/envelopes/[envelopeId]/recipients();
    test:assertEquals(actualResponse.recipientCount, "0");
}

@test:Config{}
function testGetDocGenFormFields() returns error? {
    EnvelopeSummary envelope = check docuSignClient->/accounts/[accountId]/envelopes.post({});
    string? envelopeId = envelope.envelopeId;
    if envelopeId is () {
        return error("envelopeId is null");
    }
    DocGenFormFieldResponse response = check docuSignClient->/accounts/[accountId]/envelopes/[envelopeId]/docGenFormFields();
    test:assertEquals(response, {});
}
