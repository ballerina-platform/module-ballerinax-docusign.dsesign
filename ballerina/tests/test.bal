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
        serviceUrl = "http://localhost:9092/restapi"
    );
}

@test:Config {
    groups: ["account"]
}
function testServiceInfo() returns error? {
    ServiceInformation expectedResponse = {
        buildBranch: "main",
        buildBranchDeployedDateTime: "2022-01-01T00:00:00Z",
        buildSHA: "abcdef123456",
        buildVersion: "1.0.0",
        linkedSites: ["site1", "site2"],
        serviceVersions: [
            {
                version: "v1",
                versionUrl: "https://api.example.com/restapi/v1"
                
            },
            {
                version: "v2",
                versionUrl: "https://api.example.com/restapi/v1"
            }
        ]
    };
    ServiceInformation response = check docuSignClient->/service_information;
    test:assertEquals(response, expectedResponse);
}

@test:Config {
    groups: ["account"]
}
function testVersion() returns error? {
    ResourceInformation expectedResponse = {
        resources: [
            {
                name: "Accounts",
                originalValue: "/restapi/v2.1/accounts"
            },
            {
                name: "Accounts",
                originalValue: "/restapi/v2.1/accounts"
            }
        ]
    };
    ResourceInformation response = check docuSignClient->/v2\.1;
    test:assertEquals(response, expectedResponse);
}

// Test case for post accounts
@test:Config {
    groups: ["account"]
}
function testPostAccounts() returns error? {
    NewAccountSummary expectedResponse = {
        accountId: "123456"
    };
    NewAccountDefinition newAccount = {accountName: "Test Account"};
    NewAccountSummary response = check docuSignClient->/accounts.post(newAccount);
    test:assertEquals(response, expectedResponse);
}

// Test case for get accounts/[string accountId]
@test:Config {
    groups: ["account"]
}
function testGetAccountInformation() returns error? {
    string accountId = "123456";
    AccountInformation expectedResponse = {
        accountSettings: {
            accountName: "Test Account"
        }
    };
    AccountInformation response = check docuSignClient->/accounts/[accountId]("true");
    test:assertEquals(response, expectedResponse);
}

// Test case for delete accounts/[string accountId]
@test:Config {
    groups: ["account"]
}
function testDeleteAccount() returns error? {
    string accountId = "123456";
    error? response = docuSignClient->/accounts/[accountId].delete("true");
    test:assertEquals(response, ());
}

// Test case for get accounts/[string accountId]/billing_charges
@test:Config {
    groups: ["billing"]
}
function testGetBillingCharges() returns error? {
    BillingChargeResponse expectedResponse = {
        billingChargeItems: [
            {
                chargeName: "Test Charge",
                chargeType: "envelopes",
                chargeUnitOfMeasure: "USD"
            }
        ]
    };
    string accountId = "123456";
    BillingChargeResponse response = check docuSignClient->/accounts/[accountId]/billing_charges("envelopes");
    test:assertEquals(response, expectedResponse);
}

// Test case for get accounts/[string accountId]/billing_invoices
@test:Config {
    groups: ["billing"]
}
function testGetBillingInvoices() returns error? {
    BillingInvoice billingInvoice = {
        amount: "10.0",
        balance: "10.0",
        dueDate: "2022-01-01T00:00:00Z",
        invoiceId: "123456",
        invoiceNumber: "123456",
        invoiceUri: "https://api.example.com/restapi/v2.1/accounts/123456/invoices/123456"
    };
    BillingInvoicesResponse expectedResponse = {
        billingInvoices: [
            billingInvoice
        ]
    };
    string accountId = "123456";
    BillingInvoicesResponse response = check docuSignClient->/accounts/[accountId]/billing_invoices("2022-01-01", "2022-12-31");
    test:assertEquals(response, expectedResponse);
}

// Test case for get accounts/[string accountId]/billing_invoices/[string invoiceId]
@test:Config {
    groups: ["billing"]
}
function testGetBillingInvoice() returns error? {
    string accountId = "123456";
    string invoiceId = "78910";

    BillingInvoice expectedResponse = {
        amount: "10.0",
        balance: "10.0",
        dueDate: "2022-01-01T00:00:00Z",
        invoiceId: "123456",
        invoiceNumber: "123456",
        invoiceUri: "https://api.example.com/restapi/v2.1/accounts/123456/invoices/123456"
    };
    BillingInvoice response = check docuSignClient->/accounts/[accountId]/billing_invoices/[invoiceId]();
    test:assertEquals(response, expectedResponse);
}

// Test case for get accounts/[string accountId]/billing_invoices_past_due
@test:Config {
    groups: ["billing"]
}
function testGetPastDueInvoices() returns error? {
    string accountId = "123456";
    BillingInvoicesSummary expectedResponse = {
        billingInvoices: [
            {
                amount: "10.0",
                balance: "10.0",
                dueDate: "2022-01-01T00:00:00Z",
                invoiceId: "123456",
                invoiceNumber: "123456",
                invoiceUri: "https://api.example.com/restapi/v2.1/accounts/123456/invoices/123456"
            }
        ]
    };
    BillingInvoicesSummary|error response = check docuSignClient->/accounts/[accountId]/billing_invoices_past_due();
    test:assertEquals(response, expectedResponse);
}

// Test case for get accounts/[string accountId]/billing_payments
@test:Config {
    groups: ["billing"]
}
function testGetBillingPayments() returns error? {
    BillingPaymentsResponse expectedResponse = {
        billingPayments: [
            {
                amount: "10.0",
                paymentId: "123456",
                paymentNumber: "123456"
            }
        ]
    };
    string accountId = "123456";
    BillingPaymentsResponse response = check docuSignClient->/accounts/[accountId]/billing_payments("2022-01-01", "2022-12-31");
    test:assertEquals(response, expectedResponse);
}

@test:Config {
    groups: ["account"]
}
function testUserSignInfo() returns error? {
    UserSignaturesInformation expectedResponse = {
        userSignatures: [
            {
                signatureFont: "Arial",
                signatureId: "123456",
                signatureInitials: "JD",
                signatureName: "John Doe",
                signatureType: "Electronic"
            }
        ]
    };
    UserSignaturesInformation response = check docuSignClient->/accounts/["accountId"]/users/["userId"]/signatures;
    test:assertEquals(response, expectedResponse);
}

@test:Config {
    groups: ["account"]
}
function testPostUserSignatures() returns error? {
    UserSignaturesInformation payload = {
        userSignatures: [
            {
                signatureFont: "Arial",
                signatureId: "123456",
                signatureInitials: "JD",
                signatureName: "John Doe",
                signatureType: "Electronic"
            }
        ]
    };
    UserSignaturesInformation expectedResponse = {
        userSignatures: [
            {
                signatureFont: "Arial",
                signatureId: "123456",
                signatureInitials: "JD",
                signatureName: "John Doe",
                signatureType: "Electronic"
            }
        ]
    };
    UserSignaturesInformation response = check docuSignClient->/accounts/["accountId"]/users/["userId"]/signatures.post(payload);
    
    test:assertEquals(response, expectedResponse);
}

// Test case for get accounts/[string accountId]/users/[string userId]/signatures/[string signatureId]
@test:Config {
    groups: ["account"]
}
function testGetUserSignature() returns error? {
    string signatureId = "123456";
    UserSignature expectedResponse = {
        signatureFont: "Arial",
        signatureId: signatureId,
        signatureInitials: "JD",
        signatureName: "John Doe",
        signatureType: "Electronic"
    };
    UserSignature response = check docuSignClient->/accounts/["accountId"]/users/["userId"]/signatures/[signatureId];
    test:assertEquals(response, expectedResponse);
}

// Test case for put accounts/[string accountId]/users/[string userId]/signatures/[string signatureId]
@test:Config {
    groups: ["account"]
}
function testPutUserSignature() returns error? {
    string signatureId = "123456";
    UserSignature payload = {
        signatureFont: "Arial",
        signatureId: signatureId,
        signatureInitials: "JD",
        signatureName: "John Doe",
        signatureType: "Electronic"
    };
    UserSignature expectedResponse = {
        signatureFont: "Arial",
        signatureId: signatureId,
        signatureInitials: "JD",
        signatureName: "John Doe",
        signatureType: "Electronic"
    };
    UserSignature response = check docuSignClient->/accounts/["accountId"]/users/["userId"]/signatures/["signatureId"].put(payload);
    test:assertEquals(response, expectedResponse);
}

// Test case for delete accounts/[string accountId]/users/[string userId]/signatures/[string signatureId]
@test:Config {
    groups: ["account"]
}
function testDeleteUserSignature() returns error? {
    string signatureId = "123456";
    error? response = check docuSignClient->/accounts/["accountId"]/users/["userId"]/signatures/[signatureId].delete();
    test:assertEquals(response, ());
}

