// Copyright (c) 2025, WSO2 LLC. (http://www.wso2.com).
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

import ballerina/data.jsondata;
import ballerina/http;
import ballerina/mime;

# The DocuSign REST API provides you with a powerful, convenient, and simple Web services API for interacting with DocuSign.
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config =  {}, string serviceUrl = "https://www.docusign.net/restapi") returns error? {
        http:ClientConfiguration httpClientConfig = {httpVersion: config.httpVersion, http1Settings: config.http1Settings, http2Settings: config.http2Settings, timeout: config.timeout, forwarded: config.forwarded, followRedirects: config.followRedirects, poolConfig: config.poolConfig, cache: config.cache, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, cookieConfig: config.cookieConfig, responseLimits: config.responseLimits, secureSocket: config.secureSocket, proxy: config.proxy, socketConfig: config.socketConfig, validation: config.validation, laxDataBinding: config.laxDataBinding};
        self.clientEp = check new (serviceUrl, httpClientConfig);
    }

    # Retrieves the available REST API versions.
    #
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get service_information(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/service_information`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Lists resources for REST version specified
    #
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Creates new accounts.
    #
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts(NewAccountDefinition payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Retrieves the account information for the specified account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId](map<string|string[]> headers = {}, *AccountsGetAccountQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Deletes the specified account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId](map<string|string[]> headers = {}, *AccountsDeleteAccountQueries queries) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Gets list of recurring and usage charges for the account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/billing_charges(map<string|string[]> headers = {}, *BillingChargesGetAccountBillingChargesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_charges`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Get a List of Billing Invoices
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/billing_invoices(map<string|string[]> headers = {}, *BillingInvoicesGetBillingInvoicesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_invoices`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Retrieves a billing invoice.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + invoiceId - The ID of the invoice
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/billing_invoices/[string invoiceId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_invoices/${getEncodedUri(invoiceId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Get a list of past due invoices.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/billing_invoices_past_due(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_invoices_past_due`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Gets payment information for one or more payments.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/billing_payments(map<string|string[]> headers = {}, *BillingPaymentsGetPaymentListQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_payments`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Posts a payment to a past due invoice.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/billing_payments(BillingPaymentRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_payments`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Gets billing payment information for a specific payment.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + paymentId - The ID of the payment
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/billing_payments/[string paymentId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_payments/${getEncodedUri(paymentId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Get Account Billing Plan
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/billing_plan(map<string|string[]> headers = {}, *BillingPlanGetBillingPlanQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_plan`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates an account billing plan.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/billing_plan(BillingPlanInformation payload, map<string|string[]> headers = {}, *BillingPlanPutBillingPlanQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_plan`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Get credit card information
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/billing_plan/credit_card(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_plan/credit_card`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Returns downgrade plan information for the specified account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/billing_plan/downgrade(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_plan/downgrade`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Queues downgrade billing plan request for an account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/billing_plan/downgrade(DowngradeBillingPlanInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_plan/downgrade`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Reserved: Purchase additional envelopes.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/billing_plan/purchased_envelopes(PurchasedEnvelopesInformation payload, map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_plan/purchased_envelopes`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Gets a list of brands.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/brands(map<string|string[]> headers = {}, *BrandsGetBrandsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Creates one or more brand profiles for an account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/brands(Brand payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Deletes one or more brand profiles.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/brands(BrandsRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Gets information about a brand.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + brandId - The ID of the brand
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/brands/[string brandId](map<string|string[]> headers = {}, *BrandGetBrandQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates an existing brand.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + brandId - The ID of the brand
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/brands/[string brandId](Brand payload, map<string|string[]> headers = {}, *BrandPutBrandQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes a brand.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + brandId - The ID of the brand
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/brands/[string brandId](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Exports a brand.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + brandId - The ID of the brand
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/brands/[string brandId]/file(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}/file`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Gets a brand logo.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + brandId - The ID of the brand
    # + logoType - The type of logo. Valid values are:
    # - `primary` 
    # - `secondary` 
    # - `email`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/brands/[string brandId]/logos/[string logoType](map<string|string[]> headers = {}) returns byte[]|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}/logos/${getEncodedUri(logoType)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates a brand logo.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + brandId - The ID of the brand
    # + logoType - The type of logo. Valid values are:
    # - `primary` 
    # - `secondary` 
    # - `email`
    # + headers - Headers to be sent with the request 
    # + payload - Brand logo binary Stream. Supported formats: JPG, GIF, PNG. Maximum file size: 300 KB. Recommended dimensions: 296 x 76 pixels (larger images will be resized). Changes may take up to one hour to display in all places 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/brands/[string brandId]/logos/[string logoType](record {byte[] fileContent; string fileName;} payload, map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}/logos/${getEncodedUri(logoType)}`;
        http:Request request = new;
        request.setPayload(payload, "image/png");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes a brand logo.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + brandId - The ID of the brand
    # + logoType - The type of logo. Valid values are:
    # - `primary` 
    # - `secondary` 
    # - `email`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/brands/[string brandId]/logos/[string logoType](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}/logos/${getEncodedUri(logoType)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Returns metadata about the branding resources for an account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + brandId - The ID of the brand
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/brands/[string brandId]/resources(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}/resources`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Returns a branding resource file.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + brandId - The ID of the brand
    # + resourceContentType - The type of brand resource file to return. Valid values are:
    # - `sending`
    # - `signing`
    # - `email`
    # - `signing_captive`
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/brands/[string brandId]/resources/[string resourceContentType](map<string|string[]> headers = {}, *BrandResourcesGetBrandResourcesQueries queries) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}/resources/${getEncodedUri(resourceContentType)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates a branding resource file.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + brandId - The ID of the brand
    # + resourceContentType - The type of brand resource file that you are updating. Valid values are:
    # - `sending`
    # - `signing`
    # - `email`
    # - `signing_captive`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/brands/[string brandId]/resources/[string resourceContentType](ResourcesresourceContentTypeBody payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}/resources/${getEncodedUri(resourceContentType)}`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(check jsondata:toJson(payload).ensureType());
        request.setBodyParts(bodyParts);
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Returns a list of bulk send batch summaries. 
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/bulk_send_batch(map<string|string[]> headers = {}, *BulkSendV2BatchGetBulkSendBatchesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_batch`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Gets the status of a specific bulk send batch.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + bulkSendBatchId - The batch ID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/bulk_send_batch/[string bulkSendBatchId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_batch/${getEncodedUri(bulkSendBatchId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates the name of a bulk send batch.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + bulkSendBatchId - The batch ID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/bulk_send_batch/[string bulkSendBatchId](BulkSendBatchRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_batch/${getEncodedUri(bulkSendBatchId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Applies a bulk action to all envelopes from a specified bulk send.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + bulkAction - The action to apply. Valid values:
    # * `resend`
    # * `correct`
    # * `void`
    # + bulkSendBatchId - The batch ID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/bulk_send_batch/[string bulkSendBatchId]/[string bulkAction](BulkSendBatchActionRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_batch/${getEncodedUri(bulkSendBatchId)}/${getEncodedUri(bulkAction)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Gets envelopes from a specific bulk send batch.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + bulkSendBatchId - The batch ID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/bulk_send_batch/[string bulkSendBatchId]/envelopes(map<string|string[]> headers = {}, *BulkSendV2EnvelopesGetBulkSendBatchEnvelopesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_batch/${getEncodedUri(bulkSendBatchId)}/envelopes`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Gets bulk send lists.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/bulk_send_lists(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_lists`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Creates a bulk send list.
    #
    # + accountId - The ID of the account
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/bulk_send_lists(BulkSendingList payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_lists`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Gets a specific bulk send list.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + bulkSendListId - The GUID of the bulk send list. This property is created after you post a new bulk send list
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/bulk_send_lists/[string bulkSendListId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_lists/${getEncodedUri(bulkSendListId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates a bulk send list.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + bulkSendListId - The GUID of the bulk send list. This property is created after you post a new bulk send list
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/bulk_send_lists/[string bulkSendListId](BulkSendingList payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_lists/${getEncodedUri(bulkSendListId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes a bulk send list.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + bulkSendListId - The GUID of the bulk send list. This property is created after you post a new bulk send list
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/bulk_send_lists/[string bulkSendListId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_lists/${getEncodedUri(bulkSendListId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Creates a bulk send request.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + bulkSendListId - The GUID of the bulk send list. This property is created after you post a new bulk send list
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/bulk_send_lists/[string bulkSendListId]/send(BulkSendRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_lists/${getEncodedUri(bulkSendListId)}/send`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Creates a bulk send test.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + bulkSendListId - The GUID of the bulk send list. This property is created after you post a new bulk send list
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/bulk_send_lists/[string bulkSendListId]/test(BulkSendRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_lists/${getEncodedUri(bulkSendListId)}/test`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Deletes the signature for one or more captive recipient records.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + recipientPart - Signature is the only supported value. 
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/captive_recipients/[string recipientPart](CaptiveRecipientInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/captive_recipients/${getEncodedUri(recipientPart)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Initiate a new chunked upload.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/chunked_uploads(ChunkedUploadRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/chunked_uploads`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Retrieves metadata about a chunked upload.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + chunkedUploadId - The ID of the chunked upload. 
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/chunked_uploads/[string chunkedUploadId](map<string|string[]> headers = {}, *ChunkedUploadsGetChunkedUploadQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/chunked_uploads/${getEncodedUri(chunkedUploadId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Commit a chunked upload.
    #
    # + accountId - (Required) The external account number (int) or account ID GUID
    # + chunkedUploadId - (Required) The ID of the chunked upload to commit
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/chunked_uploads/[string chunkedUploadId](map<string|string[]> headers = {}, *ChunkedUploadsPutChunkedUploadsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/chunked_uploads/${getEncodedUri(chunkedUploadId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes a chunked upload.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + chunkedUploadId - The ID of the chunked upload. 
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/chunked_uploads/[string chunkedUploadId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/chunked_uploads/${getEncodedUri(chunkedUploadId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Add a chunk to an existing chunked upload.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + chunkedUploadId - The ID of the chunked upload. 
    # + chunkedUploadPartSeq - The sequence or order of the part in the chunked upload. By default, the sequence of the first part that is uploaded as part of the Create request is `0`.
    # **Note:** You can add parts out of order. However, the chunked upload must consist of a contiguous series of one or more parts before you can successfully commit it
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/chunked_uploads/[string chunkedUploadId]/[string chunkedUploadPartSeq](ChunkedUploadRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/chunked_uploads/${getEncodedUri(chunkedUploadId)}/${getEncodedUri(chunkedUploadPartSeq)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Get Connect configuration information.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/connect(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates a specified Connect configuration.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/connect(ConnectCustomConfiguration payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Creates a Connect configuration.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/connect(ConnectCustomConfiguration payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Gets the details about a Connect configuration.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + connectId - The ID of the custom Connect configuration being accessed
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/connect/[string connectId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/${getEncodedUri(connectId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Deletes the specified Connect configuration.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + connectId - The ID of the custom Connect configuration being accessed
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/connect/[string connectId](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/${getEncodedUri(connectId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Returns all users from the configured Connect service.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + connectId - The ID of the custom Connect configuration being accessed
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/connect/[string connectId]/all/users(map<string|string[]> headers = {}, *ConnectGetConnectAllUsersQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/${getEncodedUri(connectId)}/all/users`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Returns users from the configured Connect service.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + connectId - The ID of the custom Connect configuration being accessed
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/connect/[string connectId]/users(map<string|string[]> headers = {}, *ConnectGetConnectUsersQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/${getEncodedUri(connectId)}/users`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Republishes Connect information for the specified envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/connect/envelopes/[string envelopeId]/retry_queue(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/envelopes/${getEncodedUri(envelopeId)}/retry_queue`;
        http:Request request = new;
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Submits a batch of historical envelopes for republish to a webhook.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/connect/envelopes/publish/historical(ConnectHistoricalEnvelopeRepublish payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/envelopes/publish/historical`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Republishes Connect information for multiple envelopes.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/connect/envelopes/retry_queue(ConnectFailureFilter payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/envelopes/retry_queue`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Gets the Connect failure log information.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/connect/failures(map<string|string[]> headers = {}, *ConnectFailuresGetConnectLogsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/failures`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Deletes a Connect failure log entry.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + failureId - The ID of the Connect post failure. Use `all` to delete all failures for the account
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/connect/failures/[string failureId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/failures/${getEncodedUri(failureId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Gets the Connect log.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/connect/logs(map<string|string[]> headers = {}, *ConnectLogGetConnectLogsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/logs`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Deletes a list of Connect log entries.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/connect/logs(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/logs`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Gets a Connect log entry.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + logId - The ID of the Connect log entry
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/connect/logs/[string logId](map<string|string[]> headers = {}, *ConnectLogGetConnectLogQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/logs/${getEncodedUri(logId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Deletes a specified Connect log entry.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + logId - The ID of the Connect log entry
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/connect/logs/[string logId](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/logs/${getEncodedUri(logId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Retrieves the Connect OAuth information for the account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/connect/oauth(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/oauth`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates the existing Connect OAuth configuration for the account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/connect/oauth(ConnectOAuthConfig payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/oauth`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Set up Connect OAuth for the specified account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/connect/oauth(ConnectOAuthConfig payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/oauth`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Delete the Connect OAuth configuration.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/connect/oauth(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/oauth`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Gets the default Electronic Record and Signature Disclosure for an account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/consumer_disclosure(map<string|string[]> headers = {}, *ConsumerDisclosureGetConsumerDisclosureQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/consumer_disclosure`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Gets the Electronic Record and Signature Disclosure for an account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + langCode - The code for the signer language version of the disclosure that you want to retrieve. The following languages are supported:
    # - Arabic (`ar`)
    # - Bulgarian (`bg`)
    # - Czech (`cs`)
    # - Chinese Simplified (`zh_CN`)
    # - Chinese Traditional (`zh_TW`)
    # - Croatian (`hr`)
    # - Danish (`da`)
    # - Dutch (`nl`)
    # - English US (`en`)
    # - English UK (`en_GB`)
    # - Estonian (`et`)
    # - Farsi (`fa`)
    # - Finnish (`fi`)
    # - French (`fr`)
    # - French Canadian (`fr_CA`)
    # - German (`de`)
    # - Greek (`el`)
    # - Hebrew (`he`)
    # - Hindi (`hi`)
    # - Hungarian (`hu`)
    # - Bahasa Indonesian (`id`)
    # - Italian (`it`)
    # - Japanese (`ja`)
    # - Korean (`ko`)
    # - Latvian (`lv`)
    # - Lithuanian (`lt`)
    # - Bahasa Melayu (`ms`)
    # - Norwegian (`no`)
    # - Polish (`pl`)
    # - Portuguese (`pt`)
    # - Portuguese Brazil (`pt_BR`)
    # - Romanian (`ro`)
    # - Russian (`ru`)
    # - Serbian (`sr`)
    # - Slovak (`sk`)
    # - Slovenian (`sl`)
    # - Spanish (`es`)
    # - Spanish Latin America (`es_MX`)
    # - Swedish (`sv`)
    # - Thai (`th`)
    # - Turkish (`tr`)
    # - Ukrainian (`uk`)
    # - Vietnamese (`vi`)
    # Additionally, you can automatically detect the browser language being used by the viewer and display the disclosure in that language by setting the value to `browser`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/consumer_disclosure/[string langCode](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/consumer_disclosure/${getEncodedUri(langCode)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates the Electronic Record and Signature Disclosure for an account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + langCode - The code for the signer language version of the disclosure that you want to update. The following languages are supported:
    # - Arabic (`ar`)
    # - Bulgarian (`bg`)
    # - Czech (`cs`)
    # - Chinese Simplified (`zh_CN`)
    # - Chinese Traditional (`zh_TW`)
    # - Croatian (`hr`)
    # - Danish (`da`)
    # - Dutch (`nl`)
    # - English US (`en`)
    # - English UK (`en_GB`)
    # - Estonian (`et`)
    # - Farsi (`fa`)
    # - Finnish (`fi`)
    # - French (`fr`)
    # - French Canadian (`fr_CA`)
    # - German (`de`)
    # - Greek (`el`)
    # - Hebrew (`he`)
    # - Hindi (`hi`)
    # - Hungarian (`hu`)
    # - Bahasa Indonesian (`id`)
    # - Italian (`it`)
    # - Japanese (`ja`)
    # - Korean (`ko`)
    # - Latvian (`lv`)
    # - Lithuanian (`lt`)
    # - Bahasa Melayu (`ms`)
    # - Norwegian (`no`)
    # - Polish (`pl`)
    # - Portuguese (`pt`)
    # - Portuguese Brazil (`pt_BR`)
    # - Romanian (`ro`)
    # - Russian (`ru`)
    # - Serbian (`sr`)
    # - Slovak (`sk`)
    # - Slovenian (`sl`)
    # - Spanish (`es`)
    # - Spanish Latin America (`es_MX`)
    # - Swedish (`sv`)
    # - Thai (`th`)
    # - Turkish (`tr`)
    # - Ukrainian (`uk`)
    # - Vietnamese (`vi`)
    # Additionally, you can automatically detect the browser language being used by the viewer and display the disclosure in that language by setting the value to `browser`
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/consumer_disclosure/[string langCode](ConsumerDisclosure payload, map<string|string[]> headers = {}, *ConsumerDisclosurePutConsumerDisclosureQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/consumer_disclosure/${getEncodedUri(langCode)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Updates one or more contacts.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/contacts(ContactModRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/contacts`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Add contacts to a contacts list.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/contacts(ContactModRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/contacts`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Deletes multiple contacts from an account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/contacts(ContactModRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/contacts`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Gets one or more contacts.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + contactId - The ID of a contact person in the account's address book.
    # **Note:** To return all contacts, omit this parameter. It is not required
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/contacts/[string contactId](map<string|string[]> headers = {}, *ContactsGetContactByIdQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/contacts/${getEncodedUri(contactId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Deletes a contact.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + contactId - The ID of a contact person in the account's address book
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/contacts/[string contactId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/contacts/${getEncodedUri(contactId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Gets a list of custom fields.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/custom_fields(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/custom_fields`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Creates an account custom field.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/custom_fields(CustomField payload, map<string|string[]> headers = {}, *AccountCustomFieldsPostAccountCustomFieldsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/custom_fields`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Updates an account custom field.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + customFieldId - The ID of the custom field
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/custom_fields/[string customFieldId](CustomField payload, map<string|string[]> headers = {}, *AccountCustomFieldsPutAccountCustomFieldsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/custom_fields/${getEncodedUri(customFieldId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes an account custom field.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + customFieldId - The ID of the custom field
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/custom_fields/[string customFieldId](map<string|string[]> headers = {}, *AccountCustomFieldsDeleteAccountCustomFieldsQueries queries) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/custom_fields/${getEncodedUri(customFieldId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Search for specific sets of envelopes by using search filters.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes(map<string|string[]> headers = {}, *EnvelopesGetEnvelopesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Creates an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/envelopes(EnvelopeDefinition payload, map<string|string[]> headers = {}, *EnvelopesPostEnvelopesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Gets the status of a single envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId](map<string|string[]> headers = {}, *EnvelopesGetEnvelopeQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Send, void, or modify a draft envelope. Purge documents from a completed envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + payload - A container used to send documents to recipients. The envelope carries information about the sender and timestamps to indicate the progress of the delivery procedure. It can contain collections of Documents, Tabs and Recipients 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId](Envelope payload, map<string|string[]> headers = {}, *EnvelopesPutEnvelopeQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Returns a list of envelope attachments associated with a specified envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/attachments(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/attachments`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Adds one or more envelope attachments to a draft or in-process envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/attachments(EnvelopeAttachmentsRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/attachments`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes one or more envelope attachments from a draft envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/attachments(EnvelopeAttachmentsRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/attachments`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Retrieves an envelope attachment from an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + attachmentId - The unique identifier for the attachment
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/attachments/[string attachmentId](map<string|string[]> headers = {}) returns byte[]|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/attachments/${getEncodedUri(attachmentId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates an envelope attachment in a draft or in-process envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + attachmentId - The unique identifier for the attachment
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/attachments/[string attachmentId](Attachment payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/attachments/${getEncodedUri(attachmentId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Gets the envelope audit events for an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/audit_events(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/audit_events`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Gets a PDF transcript of all of the comments in an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/comments/transcript(map<string|string[]> headers = {}, *CommentsGetCommentsTranscriptQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/comments/transcript`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Gets the custom field information for the specified envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/custom_fields(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/custom_fields`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates envelope custom fields in an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/custom_fields(EnvelopeCustomFields payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/custom_fields`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Creates envelope custom fields for an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/custom_fields(EnvelopeCustomFields payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/custom_fields`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Deletes envelope custom fields for draft and in-process envelopes.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/custom_fields(EnvelopeCustomFields payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/custom_fields`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Returns form fields for an envelope
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/docGenFormFields(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/docGenFormFields`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates form fields for an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/docGenFormFields(DocGenFormFieldRequest payload, map<string|string[]> headers = {}, *DocGenFormFieldsPutEnvelopeDocGenFormFieldsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/docGenFormFields`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Gets a list of documents in an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents(map<string|string[]> headers = {}, *DocumentsGetDocumentsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Adds one or more documents to an existing envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents(EnvelopeDefinition payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes documents from a draft envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents(EnvelopeDefinition payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Retrieves a single document or all documents from an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The ID of the document to retrieve. Alternatively, you can use one of the following special keywords:
    # - `combined`: Retrieves all of the documents as a single PDF file.
    # When the query parameter `certificate` is **true,** the certificate of completion is included in the PDF file.
    # When the query parameter `certificate` is **false,** the certificate of completion is not included in the PDF file.
    # - `archive`: Retrieves a ZIP archive that contains all of the PDF documents and the certificate of completion.
    # - `certificate`: Retrieves only the certificate of completion as a PDF file.
    # - `portfolio`: Retrieves the envelope documents as a [PDF portfolio](https://helpx.adobe.com/acrobat/using/overview-pdf-portfolios.html)
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId](map<string|string[]> headers = {}, *DocumentsGetDocumentQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Adds or replaces a document in an existing envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + request - Updated document content 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId](http:Request request, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}`;
        // TODO: Update the request as needed;
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Gets the custom document fields from an  existing envelope document.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/fields(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/fields`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates existing custom document fields in an existing envelope document.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/fields(EnvelopeDocumentFields payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/fields`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Creates custom document fields in an existing envelope document.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/fields(EnvelopeDocumentFields payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/fields`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Deletes custom document fields from an existing envelope document.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/fields(EnvelopeDocumentFields payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/fields`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Retrieves the HTML definition used to generate a dynamically sized responsive document.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The GUID of the document.
    # Example: c671747c-xxxx-xxxx-xxxx-4a4a48e23744
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/html_definitions(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/html_definitions`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Returns document page images based on input.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/pages(map<string|string[]> headers = {}, *PagesGetPageImagesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/pages`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Deletes a page from a document in an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + pageNumber - The page number being accessed
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/pages/[string pageNumber](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/pages/${getEncodedUri(pageNumber)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Gets a page image from an envelope for display.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + pageNumber - The page number being accessed
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/pages/[string pageNumber]/page_image(map<string|string[]> headers = {}, *PagesGetPageImageQueries queries) returns byte[]|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/pages/${getEncodedUri(pageNumber)}/page_image`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Rotates page image from an envelope for display.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + pageNumber - The page number being accessed
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/pages/[string pageNumber]/page_image(PageRequest payload, map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/pages/${getEncodedUri(pageNumber)}/page_image`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Returns tabs on the specified page.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + pageNumber - The page number being accessed
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/pages/[string pageNumber]/tabs(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/pages/${getEncodedUri(pageNumber)}/tabs`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Creates a preview of the responsive version of a document.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/responsive_html_preview(DocumentHtmlDefinition payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/responsive_html_preview`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Returns the tabs on a document.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/tabs(map<string|string[]> headers = {}, *TabsGetDocumentTabsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/tabs`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates the tabs for document.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + payload - A list of tabs, which are represented graphically as symbols on documents at the time of signing. Tabs show recipients where to sign, initial, or enter data. They may also display data to the recipients 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/tabs(Tabs payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/tabs`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Adds tabs to a document in an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + payload - A list of tabs, which are represented graphically as symbols on documents at the time of signing. Tabs show recipients where to sign, initial, or enter data. They may also display data to the recipients 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/tabs(Tabs payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/tabs`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Deletes tabs from a document in an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + payload - A list of tabs, which are represented graphically as symbols on documents at the time of signing. Tabs show recipients where to sign, initial, or enter data. They may also display data to the recipients 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/tabs(Tabs payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/tabs`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Gets the templates associated with a document in an existing envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/templates(map<string|string[]> headers = {}, *TemplatesGetDocumentTemplatesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/templates`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Adds templates to a document in an  envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/templates(DocumentTemplateList payload, map<string|string[]> headers = {}, *TemplatesPostDocumentTemplatesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/templates`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Deletes a template from a document in an existing envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/templates/[string templateId](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/templates/${getEncodedUri(templateId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Gets the email setting overrides for an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/email_settings(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/email_settings`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates the email setting overrides for an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + payload - A complex type that contains email settings 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/email_settings(EmailSettings payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/email_settings`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Adds email setting overrides to an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + payload - A complex type that contains email settings 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/email_settings(EmailSettings payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/email_settings`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Deletes the email setting overrides for an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/email_settings(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/email_settings`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Returns envelope tab data for an existing envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/form_data(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/form_data`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Gets the Original HTML Definition used to generate the Responsive HTML for the envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/html_definitions(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/html_definitions`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Gets envelope lock information.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/'lock(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/lock`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates an envelope lock.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/'lock(LockRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/lock`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Locks an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/'lock(LockRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/lock`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Deletes an envelope lock.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/'lock(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/lock`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Gets envelope notification information.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/notification(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/notification`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Sets envelope notifications for an existing envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/notification(EnvelopeNotificationRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/notification`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Gets the status of recipients for an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients(map<string|string[]> headers = {}, *RecipientsGetRecipientsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates recipients in a draft envelope or corrects recipient information for an in-process envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients(EnvelopeRecipients payload, map<string|string[]> headers = {}, *RecipientsPutRecipientsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Adds one or more recipients to an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients(EnvelopeRecipients payload, map<string|string[]> headers = {}, *RecipientsPostRecipientsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Deletes recipients from an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients(EnvelopeRecipients payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Deletes a recipient from an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Gets the default Electronic Record and Signature Disclosure for an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/consumer_disclosure(map<string|string[]> headers = {}, *ConsumerDisclosureGetConsumerDisclosureEnvelopeIdRecipientIdQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/consumer_disclosure`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Gets the Electronic Record and Signature Disclosure for a specific envelope recipient.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + langCode - (Optional) The code for the signer language version of the disclosure that you want to retrieve, as a path parameter. The following languages are supported:
    # - Arabic (`ar`)
    # - Bulgarian (`bg`)
    # - Czech (`cs`)
    # - Chinese Simplified (`zh_CN`)
    # - Chinese Traditional (`zh_TW`)
    # - Croatian (`hr`)
    # - Danish (`da`)
    # - Dutch (`nl`)
    # - English US (`en`)
    # - English UK (`en_GB`)
    # - Estonian (`et`)
    # - Farsi (`fa`)
    # - Finnish (`fi`)
    # - French (`fr`)
    # - French Canadian (`fr_CA`)
    # - German (`de`)
    # - Greek (`el`)
    # - Hebrew (`he`)
    # - Hindi (`hi`)
    # - Hungarian (`hu`)
    # - Bahasa Indonesian (`id`)
    # - Italian (`it`)
    # - Japanese (`ja`)
    # - Korean (`ko`)
    # - Latvian (`lv`)
    # - Lithuanian (`lt`)
    # - Bahasa Melayu (`ms`)
    # - Norwegian (`no`)
    # - Polish (`pl`)
    # - Portuguese (`pt`)
    # - Portuguese Brazil (`pt_BR`)
    # - Romanian (`ro`)
    # - Russian (`ru`)
    # - Serbian (`sr`)
    # - Slovak (`sk`)
    # - Slovenian (`sl`)
    # - Spanish (`es`)
    # - Spanish Latin America (`es_MX`)
    # - Swedish (`sv`)
    # - Thai (`th`)
    # - Turkish (`tr`)
    # - Ukrainian (`uk`) 
    # - Vietnamese (`vi`)
    # Additionally, you can automatically detect the browser language being used by the viewer and display the disclosure in that language by setting the value to `browser`
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/consumer_disclosure/[string langCode](map<string|string[]> headers = {}, *ConsumerDisclosureGetConsumerDisclosureEnvelopeIdRecipientIdLangCodeQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/consumer_disclosure/${getEncodedUri(langCode)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Returns document visibility for a recipient
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/document_visibility(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/document_visibility`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates document visibility for a recipient
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/document_visibility(DocumentVisibilityList payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/document_visibility`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Creates a resource token for a sender to request ID Evidence data. 
    #
    # + accountId - The account ID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + recipientId - The `recipientIdGuid`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/identity_proof_token(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/identity_proof_token`;
        http:Request request = new;
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Gets the initials image for a user.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/initials_image(map<string|string[]> headers = {}, *RecipientsGetRecipientInitialsImageQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/initials_image`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Sets the initials image for an accountless signer.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/initials_image(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/initials_image`;
        http:Request request = new;
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Gets signature information for a signer or sign-in-person recipient.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/signature(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/signature`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Retrieve signature image information for a signer/sign-in-person recipient.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/signature_image(map<string|string[]> headers = {}, *RecipientsGetRecipientSignatureImageQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/signature_image`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Sets the signature image for an accountless signer.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/signature_image(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/signature_image`;
        http:Request request = new;
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Gets the tabs information for a signer or sign-in-person recipient in an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/tabs(map<string|string[]> headers = {}, *RecipientsGetRecipientTabsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/tabs`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates the tabs for a recipient.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/tabs(EnvelopeRecipientTabs payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/tabs`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Adds tabs for a recipient.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/tabs(EnvelopeRecipientTabs payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/tabs`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Deletes the tabs associated with a recipient.
    # 
    # **Note:** It is an error to delete a tab that has the
    # `templateLocked` property set to true.
    # This property corresponds to the **Restrict changes** option in the web app.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/tabs(EnvelopeRecipientTabs payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/tabs`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Create the link to the page for manually reviewing IDs.
    #
    # + accountId - A value that identifies your account. This value is automatically generated by DocuSign for any account you create. Copy the value from the API Account ID field in the [AppsI and Keys](https://support.docusign.com/s/document-item?bundleId=pik1583277475390&topicId=pmp1583277397015.html) page
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + recipientId - A GUID value that DocuSign assigns to identify each recipient in an envelope. This value is globally unique for all recipients, not just those in your account.
    # The specified recipient must belong to a workflow that allows the [manual review](https://support.docusign.com/s/document-item?bundleId=pik1583277475390&topicId=eya1583277454804.html) of IDs. In addition, the status of the automatic verification for this recipient must return `Failed` and the value of the `vendorFailureStatusCode` field must be `MANUAL_REVIEW_STARTED` as shown in the following extract of a response to the [GET ENVELOPE](/docs/esign-rest-api/reference/envelopes/envelopes/get/) method:
    # <p>
    # ```
    # "recipientAuthenticationStatus": {
    #        "identityVerificationResult": { 
    #              "status": "Failed",
    #              "eventTimestamp": "2020-09-04T16:59:42.8045667Z",
    #              "vendorFailureStatusCode": "MANUAL_REVIEW_STARTED"
    #         }
    #   }
    # ```
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/views/identity_manual_review(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/views/identity_manual_review`;
        http:Request request = new;
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Updates document visibility for recipients
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/document_visibility(DocumentVisibilityList payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/document_visibility`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Creates a preview of the responsive versions of all of the documents in an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/responsive_html_preview(DocumentHtmlDefinition payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/responsive_html_preview`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Reserved for DocuSign.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/tabs_blob(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/tabs_blob`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Reserved for DocuSign.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/tabs_blob(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/tabs_blob`;
        http:Request request = new;
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Get List of Templates used in an Envelope
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/templates(map<string|string[]> headers = {}, *TemplatesGetEnvelopeTemplatesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/templates`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Adds templates to an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/templates(DocumentTemplateList payload, map<string|string[]> headers = {}, *TemplatesPostEnvelopeTemplatesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/templates`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Returns a URL to the envelope correction UI.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/views/correct(CorrectViewRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/views/correct`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Revokes the correction view URL to the Envelope UI.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/views/correct(CorrectViewRequest payload, map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/views/correct`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Returns a URL to the edit view UI.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/views/edit(ReturnUrlRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/views/edit`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Returns a URL to the recipient view UI.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The ID of the draft envelope or template to preview
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/views/recipient(RecipientViewRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/views/recipient`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Creates an envelope recipient preview.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/views/recipient_preview(RecipientPreviewRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/views/recipient_preview`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Returns a URL to the sender view UI.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/views/sender(ReturnUrlRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/views/sender`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Returns a URL to the shared recipient view UI for an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/views/shared(RecipientViewRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/views/shared`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Returns the workflow definition for an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/workflow(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates the workflow definition for an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/workflow(Workflow payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Delete the workflow definition for an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/workflow(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Returns the scheduled sending rules for an envelope's workflow definition.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/workflow/scheduledSending(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/scheduledSending`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates the scheduled sending rules for an envelope's workflow.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + payload - An object that describes the settings for scheduled sending 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/workflow/scheduledSending(ScheduledSending payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/scheduledSending`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes the scheduled sending rules for the envelope's workflow.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/workflow/scheduledSending(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/scheduledSending`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Adds a new step to an envelope's workflow.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/workflow/steps(WorkflowStep payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/steps`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Returns a specified workflow step for a specified template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + workflowStepId - The ID of the workflow step
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/workflow/steps/[string workflowStepId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/steps/${getEncodedUri(workflowStepId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates the specified workflow step for an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + workflowStepId - The ID of the workflow step
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/workflow/steps/[string workflowStepId](WorkflowStep payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/steps/${getEncodedUri(workflowStepId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes a workflow step from an envelope's workflow definition.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + workflowStepId - The ID of the workflow step
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/workflow/steps/[string workflowStepId](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/steps/${getEncodedUri(workflowStepId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Returns the delayed routing rules for an envelope's workflow step definition.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + workflowStepId - The ID of the workflow step
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/workflow/steps/[string workflowStepId]/delayedRouting(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/steps/${getEncodedUri(workflowStepId)}/delayedRouting`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates the delayed routing rules for an envelope's workflow step definition.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + workflowStepId - The ID of the workflow step
    # + headers - Headers to be sent with the request 
    # + payload - A complex element that specifies the delayed routing settings for the workflow step 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/workflow/steps/[string workflowStepId]/delayedRouting(DelayedRouting payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/steps/${getEncodedUri(workflowStepId)}/delayedRouting`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes the delayed routing rules for the specified envelope workflow step.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + workflowStepId - The ID of the workflow step
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/workflow/steps/[string workflowStepId]/delayedRouting(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/steps/${getEncodedUri(workflowStepId)}/delayedRouting`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Gets envelope statuses for a set of envelopes.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/status(EnvelopeIdsRequest payload, map<string|string[]> headers = {}, *EnvelopesPutStatusQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/status`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Gets envelope transfer rules.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/transfer_rules(map<string|string[]> headers = {}, *EnvelopeTransferRulesGetEnvelopeTransferRulesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/transfer_rules`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Changes the status of multiple envelope transfer rules.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/transfer_rules(EnvelopeTransferRuleInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/transfer_rules`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Creates an envelope transfer rule.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/transfer_rules(EnvelopeTransferRuleRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/transfer_rules`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Changes the status of an envelope transfer rule.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeTransferRuleId - The ID of the envelope transfer rule. The system generates this ID when the rule is first created
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/transfer_rules/[string envelopeTransferRuleId](EnvelopeTransferRule payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/transfer_rules/${getEncodedUri(envelopeTransferRuleId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes an envelope transfer rule.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + envelopeTransferRuleId - The ID of the envelope transfer rule. The system generates this ID when the rule is first created
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/transfer_rules/[string envelopeTransferRuleId](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/transfer_rules/${getEncodedUri(envelopeTransferRuleId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Retrieves the list of favorite templates for the account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/favorite_templates(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/favorite_templates`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Set one or more templates as account favorites.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/favorite_templates(FavoriteTemplatesInfo payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/favorite_templates`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Remove one or more templates from the account favorites.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/favorite_templates(FavoriteTemplatesInfo payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/favorite_templates`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Returns a list of the account's folders.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/folders(map<string|string[]> headers = {}, *FoldersGetFoldersQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/folders`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Gets information about items in a specified folder. 
    #
    # + accountId - The external account number (int) or account ID GUID
    # + folderId - The ID of the folder
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/folders/[string folderId](map<string|string[]> headers = {}, *FoldersGetFolderItemsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/folders/${getEncodedUri(folderId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Moves a set of envelopes from their current folder to another folder.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + folderId - The ID of the folder
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/folders/[string folderId](FoldersRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/folders/${getEncodedUri(folderId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Gets information about groups associated with the account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/groups(map<string|string[]> headers = {}, *GroupsGetGroupsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates the group information for a group.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/groups(GroupInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Creates one or more groups for the account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/groups(GroupInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Deletes an existing user group.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/groups(GroupInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Gets the brand information for a group.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + groupId - The ID of the group
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/groups/[string groupId]/brands(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups/${getEncodedUri(groupId)}/brands`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Adds an existing brand to a group.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + groupId - The ID of the group being accessed
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/groups/[string groupId]/brands(BrandsRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups/${getEncodedUri(groupId)}/brands`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes brand information from a group.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + groupId - The ID of the group
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/groups/[string groupId]/brands(BrandsRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups/${getEncodedUri(groupId)}/brands`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Gets a list of users in a group.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + groupId - The ID of the group being accessed
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/groups/[string groupId]/users(map<string|string[]> headers = {}, *GroupsGetGroupUsersQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups/${getEncodedUri(groupId)}/users`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Adds one or more users to an existing group.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + groupId - The ID of the group being accessed
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/groups/[string groupId]/users(UserInfoList payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups/${getEncodedUri(groupId)}/users`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes one or more users from a group
    #
    # + accountId - The external account number (int) or account ID GUID
    # + groupId - The ID of the group being accessed
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/groups/[string groupId]/users(UserInfoList payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups/${getEncodedUri(groupId)}/users`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Retrieves the Identity Verification workflows available to an account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/identity_verification(map<string|string[]> headers = {}, *AccountIdentityVerificationGetAccountIdentityVerificationQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/identity_verification`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # List payment gateway accounts
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/payment_gateway_accounts(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/payment_gateway_accounts`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Gets a list of permission profiles.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/permission_profiles(map<string|string[]> headers = {}, *PermissionProfilesGetPermissionProfilesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/permission_profiles`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Creates a new permission profile for an account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/permission_profiles(PermissionProfile payload, map<string|string[]> headers = {}, *PermissionProfilesPostPermissionProfilesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/permission_profiles`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Returns a permission profile for an account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + permissionProfileId - The ID of the permission profile.
    # Use [AccountPermissionProfiles: list](/docs/esign-rest-api/reference/accounts/accountpermissionprofiles/list/)
    # to get a list of permission profiles and their IDs.
    # You can also download a CSV file of all permission profiles
    # and their IDs from the **Settings > Permission Profiles** page
    # of your eSignature account page
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/permission_profiles/[string permissionProfileId](map<string|string[]> headers = {}, *PermissionProfilesGetPermissionProfileQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/permission_profiles/${getEncodedUri(permissionProfileId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates a permission profile.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + permissionProfileId - The ID of the permission profile.
    # Use [AccountPermissionProfiles: list](/docs/esign-rest-api/reference/accounts/accountpermissionprofiles/list/)
    # to get a list of permission profiles and their IDs.
    # You can also download a CSV file of all permission profiles
    # and their IDs from the **Settings > Permission Profiles** page
    # of your eSignature account page
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/permission_profiles/[string permissionProfileId](PermissionProfile payload, map<string|string[]> headers = {}, *PermissionProfilesPutPermissionProfilesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/permission_profiles/${getEncodedUri(permissionProfileId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes a permission profile from an account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + permissionProfileId - The ID of the permission profile.
    # Use [AccountPermissionProfiles: list](/docs/esign-rest-api/reference/accounts/accountpermissionprofiles/list/)
    # to get a list of permission profiles and their IDs.
    # You can also download a CSV file of all permission profiles
    # and their IDs from the **Settings > Permission Profiles** page
    # of your eSignature account page
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/permission_profiles/[string permissionProfileId](map<string|string[]> headers = {}, *PermissionProfilesDeletePermissionProfilesQueries queries) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/permission_profiles/${getEncodedUri(permissionProfileId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Returns a list of PowerForms.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/powerforms(map<string|string[]> headers = {}, *PowerFormsGetPowerFormsListQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/powerforms`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Creates a new PowerForm
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + payload - Information about any PowerForms that are included in the envelope 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/powerforms(PowerForm payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/powerforms`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Deletes one or more PowerForms.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/powerforms(PowerFormsRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/powerforms`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Returns a single PowerForm.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + powerFormId - The ID of the PowerForm
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/powerforms/[string powerFormId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/powerforms/${getEncodedUri(powerFormId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates an existing PowerForm.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + powerFormId - The ID of the PowerForm
    # + headers - Headers to be sent with the request 
    # + payload - Information about any PowerForms that are included in the envelope 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/powerforms/[string powerFormId](PowerForm payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/powerforms/${getEncodedUri(powerFormId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes a PowerForm.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + powerFormId - The ID of the PowerForm
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/powerforms/[string powerFormId](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/powerforms/${getEncodedUri(powerFormId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Returns the data that users entered in a PowerForm.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + powerFormId - The ID of the PowerForm
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/powerforms/[string powerFormId]/form_data(map<string|string[]> headers = {}, *PowerFormsGetPowerFormFormDataQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/powerforms/${getEncodedUri(powerFormId)}/form_data`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Gets PowerForm senders.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/powerforms/senders(map<string|string[]> headers = {}, *PowerFormsGetPowerFormsSendersQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/powerforms/senders`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Gets the recipient names associated with an email address.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/recipient_names(map<string|string[]> headers = {}, *RecipientNamesGetRecipientNamesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/recipient_names`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Returns available seals for specified account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/seals(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/seals`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Deprecated. Use Envelopes: listStatusChanges.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + searchFolderId - Specifies the envelope group that is searched by the request. These are logical groupings, not actual folder names. Valid values are: drafts, awaiting_my_signature, completed, out_for_signature
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/search_folders/[string searchFolderId](map<string|string[]> headers = {}, *SearchFoldersGetSearchFolderContentsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/search_folders/${getEncodedUri(searchFolderId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Gets account settings information.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/settings(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates the account settings for an account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/settings(AccountSettingsInformation payload, map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Gets the BCC email archive configurations for an account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/settings/bcc_email_archives(map<string|string[]> headers = {}, *BCCEmailArchiveGetBCCEmailArchiveListQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/bcc_email_archives`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Creates a BCC email archive configuration.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + payload - Boolean that specifies whether BCC for Email Archive is enabled for the account. BCC for Email Archive allows you to set up an archive email address so that a BCC copy of an envelope is sent only to that address 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/settings/bcc_email_archives(BccEmailArchive payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/bcc_email_archives`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Gets a BCC email archive configuration and its history.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + bccEmailArchiveId - The ID of the BCC email archive configuration
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/settings/bcc_email_archives/[string bccEmailArchiveId](map<string|string[]> headers = {}, *BCCEmailArchiveGetBCCEmailArchiveHistoryListQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/bcc_email_archives/${getEncodedUri(bccEmailArchiveId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Deletes a BCC email archive configuration.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + bccEmailArchiveId - The ID of the BCC email archive configuration
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/settings/bcc_email_archives/[string bccEmailArchiveId](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/bcc_email_archives/${getEncodedUri(bccEmailArchiveId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Returns the configuration information for the eNote eOriginal integration.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/settings/enote_configuration(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/enote_configuration`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates configuration information for the eNote eOriginal integration.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/settings/enote_configuration(ENoteConfiguration payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/enote_configuration`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes configuration information for the eNote eOriginal integration.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/settings/enote_configuration(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/enote_configuration`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Gets the envelope purge configuration for an account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/settings/envelope_purge_configuration(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/envelope_purge_configuration`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Sets the envelope purge configuration for an account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/settings/envelope_purge_configuration(EnvelopePurgeConfiguration payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/envelope_purge_configuration`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Gets envelope notification defaults.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/settings/notification_defaults(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/notification_defaults`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates envelope notification default settings.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/settings/notification_defaults(NotificationDefaults1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/notification_defaults`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Gets the password rules for an account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/settings/password_rules(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/password_rules`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates the password rules for an account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/settings/password_rules(AccountPasswordRules1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/password_rules`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Returns tab settings list for specified account
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/settings/tabs(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/tabs`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Modifies tab settings for specified account
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + payload - Account-wide tab settings 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/settings/tabs(TabAccountSettings payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/tabs`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Reserved: Gets the shared item status for one or more users.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/shared_access(map<string|string[]> headers = {}, *SharedAccessGetSharedAccessQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/shared_access`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Reserved: Sets the shared access information for users.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/shared_access(AccountSharedAccess payload, map<string|string[]> headers = {}, *SharedAccessPutSharedAccessQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/shared_access`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Gets the available signature providers for an account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/signatureProviders(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatureProviders`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Returns a list of stamps available in the account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/signatures(map<string|string[]> headers = {}, *AccountSignaturesGetAccountSignaturesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatures`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates an account stamp.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/signatures(AccountSignaturesInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatures`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Adds or updates one or more account stamps.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/signatures(AccountSignaturesInformation payload, map<string|string[]> headers = {}, *AccountSignaturesPostAccountSignaturesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatures`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Returns information about the specified stamp.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + signatureId - The ID of the account stamp
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/signatures/[string signatureId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatures/${getEncodedUri(signatureId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates an account stamp by ID.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + signatureId - The ID of the account stamp
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/signatures/[string signatureId](AccountSignatureDefinition payload, map<string|string[]> headers = {}, *AccountSignaturesPutAccountSignatureByIdQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatures/${getEncodedUri(signatureId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes an account stamp.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + signatureId - The ID of the account stamp
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/signatures/[string signatureId](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatures/${getEncodedUri(signatureId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Returns the image for an account stamp.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + imageType - Specificies the type of image. Valid values:
    # - `stamp_image`
    # - `signature_image`
    # - `initials_image`
    # + signatureId - The ID of the account stamp
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/signatures/[string signatureId]/[string imageType](map<string|string[]> headers = {}, *AccountSignaturesGetAccountSignatureImageQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatures/${getEncodedUri(signatureId)}/${getEncodedUri(imageType)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Sets a signature image, initials, or stamp.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + imageType - Specificies the type of image. Valid values:
    # - `stamp_image`
    # - `signature_image`
    # - `initials_image`
    # + signatureId - The ID of the account stamp
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/signatures/[string signatureId]/[string imageType](map<string|string[]> headers = {}, *AccountSignaturesPutAccountSignatureImageQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatures/${getEncodedUri(signatureId)}/${getEncodedUri(imageType)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes the image for a stamp.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + imageType - Specificies the type of image. Valid values:
    # - `stamp_image`
    # - `signature_image`
    # - `initials_image`
    # + signatureId - The ID of the account stamp
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/signatures/[string signatureId]/[string imageType](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatures/${getEncodedUri(signatureId)}/${getEncodedUri(imageType)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Gets a list of the Signing Groups in an account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/signing_groups(map<string|string[]> headers = {}, *SigningGroupsGetSigningGroupsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signing_groups`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates signing group names.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/signing_groups(SigningGroupInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signing_groups`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Creates a signing group. 
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/signing_groups(SigningGroupInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signing_groups`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Deletes one or more signing groups.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/signing_groups(SigningGroupInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signing_groups`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Gets information about a signing group. 
    #
    # + accountId - The external account number (int) or account ID GUID
    # + signingGroupId - The ID of the [signing group](https://support.docusign.com/s/document-item?bundleId=gav1643676262430&topicId=zgn1578456447934.html)
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/signing_groups/[string signingGroupId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signing_groups/${getEncodedUri(signingGroupId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates a signing group. 
    #
    # + accountId - The external account number (int) or account ID GUID
    # + signingGroupId - The ID of the [signing group](https://support.docusign.com/s/document-item?bundleId=gav1643676262430&topicId=zgn1578456447934.html)
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/signing_groups/[string signingGroupId](SigningGroup payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signing_groups/${getEncodedUri(signingGroupId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Gets a list of members in a Signing Group.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + signingGroupId - The ID of the [signing group](https://support.docusign.com/s/document-item?bundleId=gav1643676262430&topicId=zgn1578456447934.html).
    # **Note:** When you send an envelope to a signing group,
    # anyone in the group can open it and sign it with their own signature.
    # For this reason, DocuSign recommends that
    # you do not include non-signer recipients
    # (such as carbon copy recipients)
    # in the same signing group as signer recipients.
    # However, you could create a second signing group
    # for the non-signer recipients and change t
    # he default action of Needs to Sign to a different value,
    # such as Receives a Copy
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/signing_groups/[string signingGroupId]/users(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signing_groups/${getEncodedUri(signingGroupId)}/users`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Adds members to a signing group. 
    #
    # + accountId - The external account number (int) or account ID GUID
    # + signingGroupId - The ID of the [signing group](https://support.docusign.com/s/document-item?bundleId=gav1643676262430&topicId=zgn1578456447934.html).
    # **Note:** When you send an envelope to a signing group,
    # anyone in the group can open it and sign it with their own signature.
    # For this reason, DocuSign recommends that
    # you do not include non-signer recipients
    # (such as carbon copy recipients)
    # in the same signing group as signer recipients.
    # However, you could create a second signing group
    # for the non-signer recipients and change t
    # he default action of Needs to Sign to a different value,
    # such as Receives a Copy
    # + headers - Headers to be sent with the request 
    # + payload - A complex type that contains information about users in the signing group 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/signing_groups/[string signingGroupId]/users(SigningGroupUsers1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signing_groups/${getEncodedUri(signingGroupId)}/users`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes  one or more members from a signing group.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + signingGroupId - The ID of the [signing group](https://support.docusign.com/s/document-item?bundleId=gav1643676262430&topicId=zgn1578456447934.html).
    # **Note:** When you send an envelope to a signing group,
    # anyone in the group can open it and sign it with their own signature.
    # For this reason, DocuSign recommends that
    # you do not include non-signer recipients
    # (such as carbon copy recipients)
    # in the same signing group as signer recipients.
    # However, you could create a second signing group
    # for the non-signer recipients and change t
    # he default action of Needs to Sign to a different value,
    # such as Receives a Copy
    # + headers - Headers to be sent with the request 
    # + payload - A complex type that contains information about users in the signing group 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/signing_groups/[string signingGroupId]/users(SigningGroupUsers1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signing_groups/${getEncodedUri(signingGroupId)}/users`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Gets the supported languages for envelope recipients.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/supported_languages(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/supported_languages`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Gets a list of all account tabs.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/tab_definitions(map<string|string[]> headers = {}, *TabsGetTabDefinitionsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/tab_definitions`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Creates a custom tab.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/tab_definitions(TabMetadata payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/tab_definitions`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Gets custom tab information.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + customTabId - The DocuSign-generated custom tab ID for the custom tab to be applied. This can only be used when adding new tabs for a recipient. When used, the new tab inherits all the custom tab properties
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/tab_definitions/[string customTabId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/tab_definitions/${getEncodedUri(customTabId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates custom tab information.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + customTabId - The DocuSign-generated custom tab ID for the custom tab to be applied. This can only be used when adding new tabs for a recipient. When used, the new tab inherits all the custom tab properties
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/tab_definitions/[string customTabId](TabMetadata payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/tab_definitions/${getEncodedUri(customTabId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes custom tab information.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + customTabId - The DocuSign-generated custom tab ID for the custom tab to be applied. This can only be used when adding new tabs for a recipient. When used, the new tab inherits all the custom tab properties
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/tab_definitions/[string customTabId](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/tab_definitions/${getEncodedUri(customTabId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Gets the list of templates.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/templates(map<string|string[]> headers = {}, *TemplatesGetTemplatesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Creates one or more templates.
    #
    # + accountId - (Required) The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/templates(EnvelopeTemplate payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Gets a specific template associated with a specified account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId](map<string|string[]> headers = {}, *TemplatesGetTemplateQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates an existing template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId](EnvelopeTemplate payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Shares a template with a group.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + templatePart - Currently, the only defined part is **groups.**
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/[string templatePart](GroupInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/${getEncodedUri(templatePart)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Removes a member group's sharing permissions for a template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + templatePart - Currently, the only defined part is **groups.**
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/templates/[string templateId]/[string templatePart](GroupInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/${getEncodedUri(templatePart)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Gets the custom document fields from a template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/custom_fields(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/custom_fields`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates envelope custom fields in a template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/custom_fields(TemplateCustomFields1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/custom_fields`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Creates custom document fields in an existing template document.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/templates/[string templateId]/custom_fields(TemplateCustomFields1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/custom_fields`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Deletes envelope custom fields in a template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/templates/[string templateId]/custom_fields(TemplateCustomFields1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/custom_fields`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Gets a list of documents associated with a template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/documents(map<string|string[]> headers = {}, *DocumentsGetTemplateDocumentsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Adds documents to a template document.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/documents(EnvelopeDefinition payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes documents from a template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/templates/[string templateId]/documents(EnvelopeDefinition payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Gets PDF documents from a template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId](map<string|string[]> headers = {}, *DocumentsGetTemplateDocumentQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates a template document.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId](EnvelopeDefinition payload, map<string|string[]> headers = {}, *DocumentsPutTemplateDocumentQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Gets the custom document fields for a an existing template document.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/fields(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/fields`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates existing custom document fields in an existing template document.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/fields(DocumentFieldsInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/fields`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Creates custom document fields in an existing template document.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/fields(DocumentFieldsInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/fields`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Deletes custom document fields from an existing template document.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/fields(DocumentFieldsInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/fields`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Gets the Original HTML Definition used to generate the Responsive HTML for a given document in a template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/html_definitions(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/html_definitions`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Returns document page images based on input.
    #
    # + accountId - (Required) The external account number (int) or account ID GUID
    # + documentId - (Required) The ID of the document
    # + templateId - (Required) The ID of the template
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/pages(map<string|string[]> headers = {}, *PagesGetTemplatePageImagesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/pages`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Deletes a page from a document in an template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + pageNumber - The page number being accessed
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/pages/[string pageNumber](PageRequest payload, map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/pages/${getEncodedUri(pageNumber)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Gets a page image from a template for display.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + pageNumber - The page number being accessed
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/pages/[string pageNumber]/page_image(map<string|string[]> headers = {}, *PagesGetTemplatePageImageQueries queries) returns byte[]|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/pages/${getEncodedUri(pageNumber)}/page_image`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Rotates page image from a template for display.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + pageNumber - The page number being accessed
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/pages/[string pageNumber]/page_image(PageRequest payload, map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/pages/${getEncodedUri(pageNumber)}/page_image`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Returns tabs on the specified page.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + pageNumber - The page number being accessed
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/pages/[string pageNumber]/tabs(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/pages/${getEncodedUri(pageNumber)}/tabs`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Creates a preview of the responsive version of a template document.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/responsive_html_preview(DocumentHtmlDefinition payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/responsive_html_preview`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Returns tabs on a template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/tabs(map<string|string[]> headers = {}, *TabsGetTemplateDocumentTabsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/tabs`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates the tabs for a template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/tabs(TemplateTabs payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/tabs`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Adds tabs to a document in a template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/tabs(TemplateTabs payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/tabs`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Deletes tabs from a template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + documentId - The unique ID of the document within the envelope.
    # Unlike other IDs in the eSignature API,
    # you specify the `documentId` yourself.
    # Typically the first document has the ID
    # `1`, the second document `2`, and so on,
    # but you can use any numbering scheme
    # that fits within a 32-bit signed integer
    # (1 through 2147483647).
    # Tab objects have a `documentId` property
    # that specifies the document on which to place
    # the tab
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/tabs(TemplateTabs payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/tabs`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Gets the Original HTML Definition used to generate the Responsive HTML for the template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/html_definitions(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/html_definitions`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Gets template lock information.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/'lock(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/lock`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates a template lock.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/'lock(LockRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/lock`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Locks a template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/templates/[string templateId]/'lock(LockRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/lock`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Deletes a template lock.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/templates/[string templateId]/'lock(LockRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/lock`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Gets template notification information.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/notification(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/notification`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates the notification  structure for an existing template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/notification(TemplateNotificationRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/notification`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Gets recipient information from a template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/recipients(map<string|string[]> headers = {}, *RecipientsGetTemplateRecipientsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates recipients in a template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/recipients(TemplateRecipients1 payload, map<string|string[]> headers = {}, *RecipientsPutTemplateRecipientsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Adds tabs for a recipient.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/templates/[string templateId]/recipients(TemplateRecipients1 payload, map<string|string[]> headers = {}, *RecipientsPostTemplateRecipientsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Deletes recipients from a template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/templates/[string templateId]/recipients(TemplateRecipients1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Deletes the specified recipient file from a template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/templates/[string templateId]/recipients/[string recipientId](TemplateRecipients1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients/${getEncodedUri(recipientId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Returns document visibility for a template recipient
    #
    # + accountId - The external account number (int) or account ID GUID
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/recipients/[string recipientId]/document_visibility(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients/${getEncodedUri(recipientId)}/document_visibility`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates document visibility for a template recipient
    #
    # + accountId - The external account number (int) or account ID GUID
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/recipients/[string recipientId]/document_visibility(TemplateDocumentVisibilityList payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients/${getEncodedUri(recipientId)}/document_visibility`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Gets the tabs information for a signer or sign-in-person recipient in a template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/recipients/[string recipientId]/tabs(map<string|string[]> headers = {}, *RecipientsGetTemplateRecipientTabsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients/${getEncodedUri(recipientId)}/tabs`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates the tabs for a recipient.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/recipients/[string recipientId]/tabs(TemplateTabs payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients/${getEncodedUri(recipientId)}/tabs`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Adds tabs for a recipient.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/templates/[string templateId]/recipients/[string recipientId]/tabs(TemplateTabs payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients/${getEncodedUri(recipientId)}/tabs`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Deletes the tabs associated with a recipient in a template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/templates/[string templateId]/recipients/[string recipientId]/tabs(TemplateTabs payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients/${getEncodedUri(recipientId)}/tabs`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Updates document visibility for template recipients
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/recipients/document_visibility(TemplateDocumentVisibilityList payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients/document_visibility`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Creates a preview of the responsive versions of all of the documents associated with a template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/templates/[string templateId]/responsive_html_preview(DocumentHtmlDefinition payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/responsive_html_preview`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Gets a URL for a template edit view.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/templates/[string templateId]/views/edit(ReturnUrlRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/views/edit`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Creates a template recipient preview.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/templates/[string templateId]/views/recipient_preview(RecipientPreviewRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/views/recipient_preview`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Returns the workflow definition for a template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/workflow(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates the workflow definition for a template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/workflow(Workflow payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Delete the workflow definition for a template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/templates/[string templateId]/workflow(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Returns the scheduled sending rules for a template's workflow definition.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/workflow/scheduledSending(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/scheduledSending`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates the scheduled sending rules for a template's workflow definition.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + payload - An object that describes the settings for scheduled sending 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/workflow/scheduledSending(ScheduledSending payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/scheduledSending`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes the scheduled sending rules for the template's workflow.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/templates/[string templateId]/workflow/scheduledSending(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/scheduledSending`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Adds a new step to a template's workflow.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/templates/[string templateId]/workflow/steps(WorkflowStep payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/steps`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Returns a specified workflow step for a specified envelope.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + workflowStepId - The ID of the workflow step
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/workflow/steps/[string workflowStepId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/steps/${getEncodedUri(workflowStepId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates a specified workflow step for a template.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + workflowStepId - The ID of the workflow step
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/workflow/steps/[string workflowStepId](WorkflowStep payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/steps/${getEncodedUri(workflowStepId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes a workflow step from an template's workflow definition.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + workflowStepId - The ID of the workflow step
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/templates/[string templateId]/workflow/steps/[string workflowStepId](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/steps/${getEncodedUri(workflowStepId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Returns the delayed routing rules for a template's workflow step definition.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + workflowStepId - The ID of the workflow step
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/workflow/steps/[string workflowStepId]/delayedRouting(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/steps/${getEncodedUri(workflowStepId)}/delayedRouting`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates the delayed routing rules for a template's workflow step.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + workflowStepId - The ID of the workflow step
    # + headers - Headers to be sent with the request 
    # + payload - A complex element that specifies the delayed routing settings for the workflow step 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/workflow/steps/[string workflowStepId]/delayedRouting(DelayedRouting payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/steps/${getEncodedUri(workflowStepId)}/delayedRouting`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes the delayed routing rules for the specified template workflow step.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + templateId - The ID of the template
    # + workflowStepId - The ID of the workflow step
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/templates/[string templateId]/workflow/steps/[string workflowStepId]/delayedRouting(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/steps/${getEncodedUri(workflowStepId)}/delayedRouting`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Gets a list of unsupported file types.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/unsupported_file_types(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/unsupported_file_types`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Retrieves the list of users for the specified account.
    #
    # + accountId - (Required) The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/users(map<string|string[]> headers = {}, *UsersGetUsersQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Changes one or more users in the specified account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/users(UserInformationList payload, map<string|string[]> headers = {}, *UsersPutUsersQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Adds new users to the specified account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/users(NewUsersDefinition payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Closes one or more users in the account.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/users(UserInfoList payload, map<string|string[]> headers = {}, *UsersDeleteUsersQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Gets the user information for a specified user.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId](map<string|string[]> headers = {}, *UserGetUserQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates user information for the specified user.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/users/[string userId](UserInformation payload, map<string|string[]> headers = {}, *UserPutUserQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Creates a user authorization.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + userId - The ID of the principal user
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/users/[string userId]/authorization(UserAuthorizationCreateRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/authorization`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Returns the user authorization for a given authorization ID.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + authorizationId - The ID of the user authorization
    # + userId - The ID of the principal user
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/authorization/[string authorizationId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/authorization/${getEncodedUri(authorizationId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates the start or end date for a user authorization.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + authorizationId - The ID of the user authorization
    # + userId - The ID of the principal user
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/users/[string userId]/authorization/[string authorizationId](UserAuthorizationUpdateRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/authorization/${getEncodedUri(authorizationId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes the user authorization.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + authorizationId - The ID of the user authorization
    # + userId - The ID of the principal user
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/users/[string userId]/authorization/[string authorizationId](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/authorization/${getEncodedUri(authorizationId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Returns the authorizations for which the specified user is the principal user.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + userId - The ID of the principal user
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/authorizations(map<string|string[]> headers = {}, *UserAuthorizationsGetPrincipalUserAuthorizationsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/authorizations`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Create or update multiple user authorizations.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + userId - The ID of the principal user
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/users/[string userId]/authorizations(UserAuthorizationsRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/authorizations`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Delete multiple user authorizations.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + userId - The ID of the principal user
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/users/[string userId]/authorizations(UserAuthorizationsDeleteRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/authorizations`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Returns the authorizations for which the specified user is the agent user.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + userId - The user who is acting as the agent
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/authorizations/agent(map<string|string[]> headers = {}, *UserAgentAuthorizationsGetAgentUserAuthorizationsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/authorizations/agent`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Get the Cloud Storage Provider configuration for the specified user.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/cloud_storage(map<string|string[]> headers = {}, *CloudStorageGetCloudStorageProvidersQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/cloud_storage`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Configures the redirect URL information  for one or more cloud storage providers for the specified user.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/users/[string userId]/cloud_storage(CloudStorageProviders1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/cloud_storage`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Deletes the user authentication information for one or more cloud storage providers.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/users/[string userId]/cloud_storage(CloudStorageProviders1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/cloud_storage`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Gets the specified Cloud Storage Provider configuration for the User.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + serviceId - The ID of the service to access. 
    # Valid values are the service name ("Box") or the numerical serviceId ("4136")
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/cloud_storage/[string serviceId](map<string|string[]> headers = {}, *CloudStorageGetCloudStorageQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/cloud_storage/${getEncodedUri(serviceId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Deletes the user authentication information for the specified cloud storage provider.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + serviceId - The ID of the service to access. 
    # Valid values are the service name ("Box") or the numerical serviceId ("4136")
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/users/[string userId]/cloud_storage/[string serviceId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/cloud_storage/${getEncodedUri(serviceId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Retrieves a list of all the items in a specified folder from the specified cloud storage provider.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + serviceId - The ID of the service to access. 
    # Valid values are the service name ("Box") or the numerical serviceId ("4136")
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/cloud_storage/[string serviceId]/folders(map<string|string[]> headers = {}, *CloudStorageFolderGetCloudStorageFolderAllQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/cloud_storage/${getEncodedUri(serviceId)}/folders`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Gets a list of items from a cloud storage provider.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + folderId - The ID of the folder
    # + serviceId - The ID of the service to access. 
    # Valid values are the service name ("Box") or the numerical serviceId ("4136")
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/cloud_storage/[string serviceId]/folders/[string folderId](map<string|string[]> headers = {}, *CloudStorageFolderGetCloudStorageFolderQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/cloud_storage/${getEncodedUri(serviceId)}/folders/${getEncodedUri(folderId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Retrieves the custom user settings for a specified user.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/custom_settings(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/custom_settings`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Adds or updates custom user settings for the specified user.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/users/[string userId]/custom_settings(CustomSettingsInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/custom_settings`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes custom user settings for a specified user.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/users/[string userId]/custom_settings(CustomSettingsInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/custom_settings`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Retrieves the user profile for a specified user.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/profile(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/profile`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates the user profile information for the specified user.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/users/[string userId]/profile(UserProfile payload, map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/profile`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Retrieves the user profile image for the specified user.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/profile/image(map<string|string[]> headers = {}, *UserProfileImageGetUserProfileImageQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/profile/image`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates the user profile image for a specified user.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/users/[string userId]/profile/image(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/profile/image`;
        http:Request request = new;
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes the user profile image for the specified user.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/users/[string userId]/profile/image(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/profile/image`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Gets the user account settings for a specified user.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/settings(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/settings`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates the user account settings for a specified user.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/users/[string userId]/settings(UserSettingsInformation payload, map<string|string[]> headers = {}, *UserSettingsPutUserSettingsQueries queries) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/settings`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Retrieves a list of signature definitions for a user.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/signatures(map<string|string[]> headers = {}, *UserSignaturesGetUserSignaturesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/signatures`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Adds/updates a user signature.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/users/[string userId]/signatures(UserSignaturesInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/signatures`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Adds user Signature and initials images to a Signature.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/users/[string userId]/signatures(UserSignaturesInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/signatures`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Gets the user signature information for the specified user.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + signatureId - The ID of the account stamp
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/signatures/[string signatureId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/signatures/${getEncodedUri(signatureId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates the user signature for a specified user.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + signatureId - The ID of the account stamp
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/users/[string userId]/signatures/[string signatureId](UserSignatureDefinition payload, map<string|string[]> headers = {}, *UserSignaturesPutUserSignatureByIdQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/signatures/${getEncodedUri(signatureId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Removes removes signature information for the specified user.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + signatureId - The ID of the account stamp
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/users/[string userId]/signatures/[string signatureId](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/signatures/${getEncodedUri(signatureId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Retrieves the user initials image or the  user signature image for the specified user.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + imageType - Specificies the type of image. Valid values:
    # - `stamp_image`
    # - `signature_image`
    # - `initials_image`
    # + signatureId - The ID of the account stamp
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/signatures/[string signatureId]/[string imageType](map<string|string[]> headers = {}, *UserSignaturesGetUserSignatureImageQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/signatures/${getEncodedUri(signatureId)}/${getEncodedUri(imageType)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates the user signature image or user initials image for the specified user.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + imageType - Specificies the type of image. Valid values:
    # - `stamp_image`
    # - `signature_image`
    # - `initials_image`
    # + signatureId - The ID of the account stamp
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + request - Image content 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/users/[string userId]/signatures/[string signatureId]/[string imageType](http:Request request, map<string|string[]> headers = {}, *UserSignaturesPutUserSignatureImageQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/signatures/${getEncodedUri(signatureId)}/${getEncodedUri(imageType)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        // TODO: Update the request as needed;
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes the user initials image or the  user signature image for the specified user.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + imageType - Specificies the type of image. Valid values:
    # - `stamp_image`
    # - `signature_image`
    # - `initials_image`
    # + signatureId - The ID of the account stamp
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/users/[string userId]/signatures/[string signatureId]/[string imageType](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/signatures/${getEncodedUri(signatureId)}/${getEncodedUri(imageType)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Returns a URL to the DocuSign UI.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/views/console(ConsoleViewRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/views/console`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Get watermark information.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/watermark(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/watermark`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Update watermark information.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + payload - When **true,** the account has the watermark feature enabled, and the envelope is not complete, then the watermark for the account is added to the PDF documents. This option can remove the watermark.  
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/watermark(Watermark payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/watermark`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Get watermark preview.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + payload - When **true,** the account has the watermark feature enabled, and the envelope is not complete, then the watermark for the account is added to the PDF documents. This option can remove the watermark.  
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/watermark/preview(Watermark payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/watermark/preview`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # List Workspaces
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/workspaces(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Create a Workspace
    #
    # + accountId - The external account number (int) or account ID GUID
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/workspaces(Workspace payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Get Workspace
    #
    # + accountId - The external account number (int) or account ID GUID
    # + workspaceId - The ID of the workspace
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/workspaces/[string workspaceId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces/${getEncodedUri(workspaceId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Update Workspace
    #
    # + accountId - The external account number (int) or account ID GUID
    # + workspaceId - The ID of the workspace
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/workspaces/[string workspaceId](Workspace payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces/${getEncodedUri(workspaceId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Delete Workspace
    #
    # + accountId - The external account number (int) or account ID GUID
    # + workspaceId - The ID of the workspace
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/workspaces/[string workspaceId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces/${getEncodedUri(workspaceId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # List workspace folder contents
    #
    # + accountId - The external account number (int) or account ID GUID
    # + folderId - The ID of the folder
    # + workspaceId - The ID of the workspace
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/workspaces/[string workspaceId]/folders/[string folderId](map<string|string[]> headers = {}, *WorkspaceFolderGetWorkspaceFolderQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces/${getEncodedUri(workspaceId)}/folders/${getEncodedUri(folderId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Deletes files or sub-folders from a workspace.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + folderId - The ID of the folder
    # + workspaceId - The ID of the workspace
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/accounts/[string accountId]/workspaces/[string workspaceId]/folders/[string folderId](WorkspaceItemList payload, map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces/${getEncodedUri(workspaceId)}/folders/${getEncodedUri(folderId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    # Creates a workspace file.
    #
    # + accountId - The external account number (int) or account ID GUID
    # + folderId - The ID of the folder
    # + workspaceId - The ID of the workspace
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/accounts/[string accountId]/workspaces/[string workspaceId]/folders/[string folderId]/files(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces/${getEncodedUri(workspaceId)}/folders/${getEncodedUri(folderId)}/files`;
        http:Request request = new;
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Gets a workspace file
    #
    # + accountId - The external account number (int) or account ID GUID
    # + fileId - The ID of the file
    # + folderId - The ID of the folder
    # + workspaceId - The ID of the workspace
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/workspaces/[string workspaceId]/folders/[string folderId]/files/[string fileId](map<string|string[]> headers = {}, *WorkspaceFileGetWorkspaceFileQueries queries) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces/${getEncodedUri(workspaceId)}/folders/${getEncodedUri(folderId)}/files/${getEncodedUri(fileId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Update workspace file or folder metadata
    #
    # + accountId - The external account number (int) or account ID GUID
    # + fileId - The ID of the file
    # + folderId - The ID of the folder
    # + workspaceId - The ID of the workspace
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/accounts/[string accountId]/workspaces/[string workspaceId]/folders/[string folderId]/files/[string fileId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces/${getEncodedUri(workspaceId)}/folders/${getEncodedUri(folderId)}/files/${getEncodedUri(fileId)}`;
        http:Request request = new;
        return self.clientEp->put(resourcePath, request, headers);
    }

    # List File Pages
    #
    # + accountId - The external account number (int) or account ID GUID
    # + fileId - The ID of the file
    # + folderId - The ID of the folder
    # + workspaceId - The ID of the workspace
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/[string accountId]/workspaces/[string workspaceId]/folders/[string folderId]/files/[string fileId]/pages(map<string|string[]> headers = {}, *WorkspaceFilePagesGetWorkspaceFilePagesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces/${getEncodedUri(workspaceId)}/folders/${getEncodedUri(folderId)}/files/${getEncodedUri(fileId)}/pages`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Retrieves the account provisioning information for the account.
    #
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/accounts/provisioning(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/provisioning`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Gets a list of available billing plans.
    #
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/billing_plans(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/billing_plans`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Gets billing plan details.
    #
    # + billingPlanId - The ID of the billing plan being accessed
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/billing_plans/[string billingPlanId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/billing_plans/${getEncodedUri(billingPlanId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Gets settings for a  notary user.
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/current_user/notary(map<string|string[]> headers = {}, *NotaryGetNotaryQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/current_user/notary`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates notary information for the current user.
    #
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/current_user/notary(Notary1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/current_user/notary`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Registers the current user as a notary.
    #
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/current_user/notary(Notary1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/current_user/notary`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Gets notary jurisdictions for a user.
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/current_user/notary/journals(map<string|string[]> headers = {}, *NotaryJournalsGetNotaryJournalsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/current_user/notary/journals`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Returns a list of jurisdictions that the notary is registered in.
    #
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/current_user/notary/jurisdictions(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/current_user/notary/jurisdictions`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Creates a jurisdiction object.
    #
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function post v2\.1/current_user/notary/jurisdictions(NotaryJurisdiction1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/current_user/notary/jurisdictions`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Gets a jurisdiction object for the current user. The user must be a notary.
    #
    # + jurisdictionId - The ID of the jurisdiction.
    # The following jurisdictions
    # are supported:
    # -  `5 - California`
    # -  `6 - Colorado`
    # -  `9 - Florida`
    # -  `10 - Georgia`
    # -  `12 - Idaho`
    # -  `13 - Illinois`
    # -  `14 - Indiana`
    # -  `15 - Iowa`
    # -  `17 - Kentucky`
    # -  `23 - Minnesota`
    # -  `25 - Missouri`
    # -  `30 - New Jersey`
    # -  `32 - New York`
    # -  `33 - North Carolina`
    # -  `35 - Ohio`
    # -  `37 - Oregon`
    # -  `38 - Pennsylvania`
    # -  `40 - South Carolina`
    # -  `43 - Texas`
    # -  `44 - Utah`
    # -  `47 - Washington`
    # -  `48 - West Virginia`
    # -  `49 - Wisconsin`
    # -  `62 - Florida Commissioner of Deeds`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/current_user/notary/jurisdictions/[string jurisdictionId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/current_user/notary/jurisdictions/${getEncodedUri(jurisdictionId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Updates the jurisdiction information about a notary.
    #
    # + jurisdictionId - The ID of the jurisdiction.
    # The following jurisdictions
    # are supported:
    # -  `5 - California`
    # -  `6 - Colorado`
    # -  `9 - Florida`
    # -  `10 - Georgia`
    # -  `12 - Idaho`
    # -  `13 - Illinois`
    # -  `14 - Indiana`
    # -  `15 - Iowa`
    # -  `17 - Kentucky`
    # -  `23 - Minnesota`
    # -  `25 - Missouri`
    # -  `30 - New Jersey`
    # -  `32 - New York`
    # -  `33 - North Carolina`
    # -  `35 - Ohio`
    # -  `37 - Oregon`
    # -  `38 - Pennsylvania`
    # -  `40 - South Carolina`
    # -  `43 - Texas`
    # -  `44 - Utah`
    # -  `47 - Washington`
    # -  `48 - West Virginia`
    # -  `49 - Wisconsin`
    # -  `62 - Florida Commissioner of Deeds`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/current_user/notary/jurisdictions/[string jurisdictionId](NotaryJurisdiction1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/current_user/notary/jurisdictions/${getEncodedUri(jurisdictionId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Deletes the specified jurisdiction.
    #
    # + jurisdictionId - The ID of the jurisdiction.
    # The following jurisdictions
    # are supported:
    # -  `5 - California`
    # -  `6 - Colorado`
    # -  `9 - Florida`
    # -  `10 - Georgia`
    # -  `12 - Idaho`
    # -  `13 - Illinois`
    # -  `14 - Indiana`
    # -  `15 - Iowa`
    # -  `17 - Kentucky`
    # -  `23 - Minnesota`
    # -  `25 - Missouri`
    # -  `30 - New Jersey`
    # -  `32 - New York`
    # -  `33 - North Carolina`
    # -  `35 - Ohio`
    # -  `37 - Oregon`
    # -  `38 - Pennsylvania`
    # -  `40 - South Carolina`
    # -  `43 - Texas`
    # -  `44 - Utah`
    # -  `47 - Washington`
    # -  `48 - West Virginia`
    # -  `49 - Wisconsin`
    # -  `62 - Florida Commissioner of Deeds`
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/current_user/notary/jurisdictions/[string jurisdictionId](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/current_user/notary/jurisdictions/${getEncodedUri(jurisdictionId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Gets membership account password rules.
    #
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/current_user/password_rules(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/current_user/password_rules`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Gets the API request logging log files.
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/diagnostics/request_logs(map<string|string[]> headers = {}, *APIRequestLogGetRequestLogsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/diagnostics/request_logs`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Deletes the request log files.
    #
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function delete v2\.1/diagnostics/request_logs(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/diagnostics/request_logs`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Gets a request logging log file.
    #
    # + requestLogId - The ID of the log entry
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/diagnostics/request_logs/[string requestLogId](map<string|string[]> headers = {}) returns string|error {
        string resourcePath = string `/v2.1/diagnostics/request_logs/${getEncodedUri(requestLogId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Gets the API request logging settings.
    #
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function get v2\.1/diagnostics/settings(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/diagnostics/settings`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Enables or disables API request logging for troubleshooting.
    #
    # + headers - Headers to be sent with the request 
    # + return - A successful response or an error 
    resource isolated function put v2\.1/diagnostics/settings(DiagnosticsSettingsInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/diagnostics/settings`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }
}
