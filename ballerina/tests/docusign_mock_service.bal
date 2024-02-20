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

import ballerina/http;

listener http:Listener ep0 = new (9092, config = {host: "localhost"});

service /restapi on ep0 {
    resource isolated function get service_information() returns ServiceInformation|error {
        ServiceInformation response = {
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
        return response;
    }

    resource isolated function get v2\.1() returns ResourceInformation|error {
        ResourceInformation response = {
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
        return response;
    }

    resource isolated function get accounts/[string accountId]/billing_invoices(string? from_date = (), string? to_date = ()) returns BillingInvoicesResponse|error {
        return {};
    }

    resource isolated function get v2\.1/accounts/[string accountId]/billing_invoices_past_due() returns BillingInvoicesSummary|error {
        return {
            pastDueBalance: "$0.00",
            accountBalance: "$0.00",
            currencyCode: "USD",
            paymentAllowed: "false"
        };
    }

    resource isolated function post v2\.1/accounts(NewAccountDefinition payload) returns NewAccountSummary|error {
        NewAccountSummary response = {
            accountId: "123456"
        };
        return response;
    }


    resource isolated function get v2\.1/accounts/[string accountId](string? include_account_settings = ()) returns AccountInformation|error {
        AccountInformation response = {
            accountIdGuid: accountId,
            accountSettings: {
                accountName: "Test Account"
            }
        };
        return response;
    }

    resource isolated function get v2\.1/accounts/[string accountId]/billing_payments(string? from_date = (), string? to_date = ()) returns BillingPaymentsResponse|error {
        return {};
    }

    resource isolated function post v2\.1/accounts/[string accountId]/envelopes(EnvelopeDefinition payload, string? cdse_mode = (), string? change_routing_order = (), string? completed_documents_only = (), string? merge_roles_on_draft = ()) returns EnvelopeSummary|error {
        return {
            envelopeId: "12345",
            status: "created"
        };
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes(string? ac_status = (), string? block = (), string? cdse_mode = (), string? continuation_token = (), string? count = (), string? custom_field = (), string? email = (), string? envelope_ids = (), string? exclude = (), string? folder_ids = (), string? folder_types = (), string? from_date = (), string? from_to_status = (), string? include = (), string? include_purge_information = (), string? intersecting_folder_ids = (), string? last_queried_date = (), string? 'order = (), string? order_by = (), string? powerformids = (), string? query_budget = (), string? requester_date_format = (), string? search_mode = (), string? search_text = (), string? start_position = (), string? status = (), string? to_date = (), string? transaction_ids = (), string? user_filter = (), string? user_id = (), string? user_name = ()) returns EnvelopesInformation|error {
        return {};
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId](string? advanced_update = (), string? include = ()) returns Envelope|error {
        return {
            envelopeId: envelopeId
        };
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients(string? include_anchor_tab_locations = (), string? include_extended = (), string? include_metadata = (), string? include_tabs = ()) returns EnvelopeRecipients|error {
        return {
            recipientCount: "0"
        };
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/docGenFormFields() returns DocGenFormFieldResponse|error {
        return {};
    }

    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId](Envelope payload, string? advanced_update = (), string? resend_envelope = ()) returns EnvelopeUpdateSummary|error {
        return {
            envelopeId: envelopeId
        };
    }

    resource isolated function delete v2\.1/accounts/[string accountId](string? redact_user_data = ()) returns http:Response|error {
        http:Response response = new;
        response.statusCode = 204;
        return response;
    }

    resource isolated function get v2\.1/accounts/[string accountId]/billing_charges(string? include_charges = ()) returns BillingChargeResponse|error {
        BillingChargeResponse response = {
            billingChargeItems: [
                {
                    chargeName: "Test Charge",
                    chargeType: "envelopes",
                    chargeUnitOfMeasure: "USD"
                }
            ]
        };
        return response;
    }

    resource isolated function get v2\.1/accounts/[string accountId]/billing_invoices(string? from_date = (), string? to_date = ()) returns BillingInvoicesResponse|error {
        return {};
    }

    resource isolated function get v2\.1/accounts/[string accountId]/billing_invoices/[string invoiceId]() returns BillingInvoice|error {
        BillingInvoice response = {
            amount: "10.0",
            balance: "10.0",
            dueDate: "2022-01-01T00:00:00Z",
            invoiceId: "123456",
            invoiceNumber: "123456",
            invoiceUri: "https://api.example.com/restapi/v2.1/accounts/123456/invoices/123456"
        };
        return response;
    }

    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/signatures(string? stamp_type = ()) returns UserSignaturesInformation|error {
        UserSignaturesInformation response = {
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
        return response;
    }

    resource isolated function post v2\.1/accounts/[string accountId]/users/[string userId]/signatures(UserSignaturesInformation payload) returns UserSignaturesInformation|error {
        UserSignaturesInformation userSignInfo = {
            userSignatures: [
                {
                    signatureFont: (<UserSignature[]>payload.userSignatures)[0].signatureFont,
                    signatureId: "123456",
                    signatureInitials: (<UserSignature[]>payload.userSignatures)[0].signatureInitials,
                    signatureName: (<UserSignature[]>payload.userSignatures)[0].signatureName,
                    signatureType: (<UserSignature[]>payload.userSignatures)[0].signatureType
                }
            ]
        };
        return userSignInfo;
    }

    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/signatures/[string signatureId]() returns UserSignature|error {
        UserSignature userSign = {
            signatureName: "test signature"
        };
        return userSign;        
    }

    resource isolated function put v2\.1/accounts/[string accountId]/users/[string userId]/signatures/[string signatureId](UserSignature payload) returns UserSignature|error {
        UserSignature userSign = {
                signatureFont: (<UserSignature>payload).signatureFont,
                signatureId: (<UserSignature>payload).signatureId,
                signatureInitials: (<UserSignature>payload).signatureInitials,
                signatureName: (<UserSignature>payload).signatureName,
                signatureType: (<UserSignature>payload).signatureType
        };
        return userSign;
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/users/[string userId]/signatures/[string signatureId]() returns error? {
        return ();
    }

    resource isolated function post v2\.1/accounts/[string accountId]/users/[string userId]/signatures/batch(UserSignaturesInformation payload) returns UserSignaturesInformation|error {
        UserSignaturesInformation userSignInfo = {
            userSignatures: [
                {
                    signatureFont: (<UserSignature[]>payload.userSignatures)[0].signatureFont,
                    signatureId: (<UserSignature[]>payload.userSignatures)[0].signatureId,
                    signatureInitials: (<UserSignature[]>payload.userSignatures)[0].signatureInitials,
                    signatureName: (<UserSignature[]>payload.userSignatures)[0].signatureName,
                    signatureType: (<UserSignature[]>payload.userSignatures)[0].signatureType
                }
            ]
        };
        return userSignInfo;
    }
}
