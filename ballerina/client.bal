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
import ballerina/mime;

# The DocuSign REST API provides you with a powerful, convenient, and simple Web services API for interacting with DocuSign.
public isolated client class Client {
    final http:Client clientEp;

    # Gets invoked to initialize the `connector`.
    #
    # + config - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ConnectionConfig config = {}, string serviceUrl = "https://www.docusign.net/restapi") returns error? {
        http:ClientConfiguration httpClientConfig = {httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.auth is http:ClientAuthConfig {
                httpClientConfig.auth = check config.auth.ensureType(http:ClientAuthConfig);
            }
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }

    # Retrieves the available REST API versions.
    #
    # + return - A successful response or an error.
    resource isolated function get service_information() returns ServiceInformation|error {
        string resourcePath = string `/service_information`;
        ServiceInformation response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Lists resources for REST version specified
    #
    # + return - A successful response or an error.
    resource isolated function get ["v2.1"]() returns ResourceInformation|error {
        string resourcePath = string `/v2.1`;
        ResourceInformation response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Creates new accounts.
    #
    # + return - A successful response or an error.
    resource isolated function post accounts(NewAccountDefinition payload) returns NewAccountSummary|error {
        string resourcePath = string `/v2.1/accounts`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        NewAccountSummary response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Retrieves the account information for the specified account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + include_account_settings - When **true,** includes account settings in the response. The default value is **false.**
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId](string? include_account_settings = ()) returns AccountInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}`;
        map<anydata> queryParam = {"include_account_settings": include_account_settings};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AccountInformation response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Deletes the specified account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId](string? redact_user_data = ()) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}`;
        map<anydata> queryParam = {"redact_user_data": redact_user_data};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        return self.clientEp->delete(resourcePath);
    }

    # Gets list of recurring and usage charges for the account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + include_charges - Specifies which billing charges to return.
    # Valid values are:
    # * envelopes
    # * seats
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/billing_charges(string? include_charges = ()) returns BillingChargeResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_charges`;
        map<anydata> queryParam = {"include_charges": include_charges};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        BillingChargeResponse response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Get a List of Billing Invoices
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + from_date - Specifies the date/time of the earliest invoice in the account to retrieve.
    # + to_date - Specifies the date/time of the latest invoice in the account to retrieve.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/billing_invoices(string? from_date = (), string? to_date = ()) returns BillingInvoicesResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_invoices`;
        map<anydata> queryParam = {"from_date": from_date, "to_date": to_date};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        BillingInvoicesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Retrieves a billing invoice.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + invoiceId - The ID of the invoice.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/billing_invoices/[string invoiceId]() returns BillingInvoice|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_invoices/${getEncodedUri(invoiceId)}`;
        BillingInvoice response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Get a list of past due invoices.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/billing_invoices_past_due() returns BillingInvoicesSummary|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_invoices_past_due`;
        BillingInvoicesSummary response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Gets payment information for one or more payments.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + from_date - Specifies the date/time of the earliest payment in the account to retrieve.
    # + to_date - Specifies the date/time of the latest payment in the account to retrieve.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/billing_payments(string? from_date = (), string? to_date = ()) returns BillingPaymentsResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_payments`;
        map<anydata> queryParam = {"from_date": from_date, "to_date": to_date};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        BillingPaymentsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Posts a payment to a past due invoice.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/billing_payments(BillingPaymentRequest payload) returns BillingPaymentResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_payments`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        BillingPaymentResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Gets billing payment information for a specific payment.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + paymentId - The ID of the payment.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/billing_payments/[string paymentId]() returns BillingPaymentItem|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_payments/${getEncodedUri(paymentId)}`;
        BillingPaymentItem response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Get Account Billing Plan
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + include_credit_card_information - When **true,** payment information including credit card information will show in the return.
    # + include_metadata - When **true,** the `canUpgrade` and `renewalStatus` properties are included the response and an array of `supportedCountries` is added to the `billingAddress` information. 
    # + include_successor_plans - When **true,** excludes successor information from the response.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/billing_plan(string? include_credit_card_information = (), string? include_downgrade_information = (), string? include_metadata = (), string? include_successor_plans = (), string? include_tax_exempt_id = ()) returns AccountBillingPlanResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_plan`;
        map<anydata> queryParam = {"include_credit_card_information": include_credit_card_information, "include_downgrade_information": include_downgrade_information, "include_metadata": include_metadata, "include_successor_plans": include_successor_plans, "include_tax_exempt_id": include_tax_exempt_id};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AccountBillingPlanResponse response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates an account billing plan.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + preview_billing_plan - When **true,** updates the account using a preview billing plan.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/billing_plan(BillingPlanInformation payload, string? preview_billing_plan = ()) returns BillingPlanUpdateResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_plan`;
        map<anydata> queryParam = {"preview_billing_plan": preview_billing_plan};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        BillingPlanUpdateResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Get credit card information
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/billing_plan/credit_card() returns CreditCardInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_plan/credit_card`;
        CreditCardInformation response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Returns downgrade plan information for the specified account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/billing_plan/downgrade() returns DowngradRequestBillingInfoResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_plan/downgrade`;
        DowngradRequestBillingInfoResponse response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Queues downgrade billing plan request for an account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/billing_plan/downgrade(DowngradeBillingPlanInformation payload) returns DowngradePlanUpdateResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_plan/downgrade`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        DowngradePlanUpdateResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Reserved: Purchase additional envelopes.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/billing_plan/purchased_envelopes(PurchasedEnvelopesInformation payload) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_plan/purchased_envelopes`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request);
    }

    # Gets a list of brands.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + exclude_distributor_brand - When **true,** excludes distributor brand information from the response set.
    # + include_logos - When **true,** returns the logos associated with the brand.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/brands(string? exclude_distributor_brand = (), string? include_logos = ()) returns AccountBrands|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands`;
        map<anydata> queryParam = {"exclude_distributor_brand": exclude_distributor_brand, "include_logos": include_logos};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AccountBrands response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Creates one or more brand profiles for an account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/brands(Brand payload) returns AccountBrands|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        AccountBrands response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Deletes one or more brand profiles.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/brands(BrandsRequest payload) returns AccountBrands|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        AccountBrands response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Gets information about a brand.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + brandId - The ID of the brand.
    # + include_external_references - When **true,** the landing pages and links associated with the brand are included in the response.
    # + include_logos - When **true,** the URIs for the logos associated with the brand are included in the response.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/brands/[string brandId](string? include_external_references = (), string? include_logos = ()) returns Brand|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}`;
        map<anydata> queryParam = {"include_external_references": include_external_references, "include_logos": include_logos};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Brand response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates an existing brand.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + brandId - The ID of the brand.
    # + replace_brand - When **true,** replaces the brand instead of updating it. The only unchanged value is the brand ID. The request body must be XML. The default value is **false.**
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/brands/[string brandId](Brand payload, string? replace_brand = ()) returns Brand|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}`;
        map<anydata> queryParam = {"replace_brand": replace_brand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Brand response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Deletes a brand.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + brandId - The ID of the brand.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/brands/[string brandId]() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}`;
        return self.clientEp->delete(resourcePath);
    }

    # Exports a brand.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + brandId - The ID of the brand.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/brands/[string brandId]/file() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}/file`;
        return self.clientEp->get(resourcePath);
    }

    # Gets a brand logo.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + brandId - The ID of the brand.
    # + logoType - The type of logo. Valid values are:
    # - `primary` 
    # - `secondary` 
    # - `email`
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/brands/[string brandId]/logos/[string logoType]() returns byte[]|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}/logos/${getEncodedUri(logoType)}`;
        byte[] response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates a brand logo.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + brandId - The ID of the brand.
    # + logoType - The type of logo. Valid values are:
    # - `primary` 
    # - `secondary` 
    # - `email`
    # + payload - Brand logo binary Stream. Supported formats: JPG, GIF, PNG. Maximum file size: 300 KB. Recommended dimensions: 296 x 76 pixels (larger images will be resized). Changes may take up to one hour to display in all places
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/brands/[string brandId]/logos/[string logoType](byte[] payload) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}/logos/${getEncodedUri(logoType)}`;
        http:Request request = new;
        request.setPayload(payload, "image/png");
        return self.clientEp->put(resourcePath, request);
    }

    # Deletes a brand logo.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + brandId - The ID of the brand.
    # + logoType - The type of logo. Valid values are:
    # - `primary` 
    # - `secondary` 
    # - `email`
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/brands/[string brandId]/logos/[string logoType]() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}/logos/${getEncodedUri(logoType)}`;
        return self.clientEp->delete(resourcePath);
    }

    # Returns metadata about the branding resources for an account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + brandId - The ID of the brand.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/brands/[string brandId]/resources() returns BrandResourcesList|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}/resources`;
        BrandResourcesList response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Returns a branding resource file.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + brandId - The ID of the brand.
    # + resourceContentType - The type of brand resource file to return. Valid values are:
    # - `sending`
    # - `signing`
    # - `email`
    # - `signing_captive`
    # + langcode - The ISO 3166-1 alpha-2 codes for the languages that the brand supports.
    # + return_master - Specifies which resource file data to return. When **true,** only the master resource file is returned. When **false,** only the elements that you modified are returned.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/brands/[string brandId]/resources/[string resourceContentType](string? langcode = (), string? return_master = ()) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}/resources/${getEncodedUri(resourceContentType)}`;
        map<anydata> queryParam = {"langcode": langcode, "return_master": return_master};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        return self.clientEp->get(resourcePath);
    }

    # Updates a branding resource file.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + brandId - The ID of the brand.
    # + resourceContentType - The type of brand resource file that you are updating. Valid values are:
    # - `sending`
    # - `signing`
    # - `email`
    # - `signing_captive`
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/brands/[string brandId]/resources/[string resourceContentType](Resources_resourceContentType_body payload) returns BrandResources|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}/resources/${getEncodedUri(resourceContentType)}`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        BrandResources response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Returns a list of bulk send batch summaries. 
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + batch_ids - A comma-separated list of batch IDs to query.
    # + count - The maximum number of results to return.
    # Use `start_position` to specify the number of results to skip.
    # Valid values: `1` to `100`<br>
    # Default: `100`
    # + from_date - The start date for a date range in UTC DateTime format.
    # **Note:** If this property is null, no date filtering is applied.
    # + search_text - Use this parameter to search for specific text.
    # + start_position - The zero-based index of the
    # result from which to start returning results.
    # Use with `count` to limit the number
    # of results.
    # The default value is `0`.
    # + status - The kind of results to collect. Must be one of:
    # - all
    # - failed
    # - sent
    # - queued
    # + to_date - The end of a search date range in UTC DateTime format. When you use this parameter, only templates created up to this date and time are returned.
    # **Note:** If this property is null, the value defaults to the current date.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/bulk_send_batch(string? batch_ids = (), string? count = (), string? from_date = (), string? search_text = (), string? start_position = (), string? status = (), string? to_date = (), string? user_id = ()) returns BulkSendBatchSummaries|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_batch`;
        map<anydata> queryParam = {"batch_ids": batch_ids, "count": count, "from_date": from_date, "search_text": search_text, "start_position": start_position, "status": status, "to_date": to_date, "user_id": user_id};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        BulkSendBatchSummaries response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Gets the status of a specific bulk send batch.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + bulkSendBatchId - The batch ID.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/bulk_send_batch/[string bulkSendBatchId]() returns BulkSendBatchStatus|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_batch/${getEncodedUri(bulkSendBatchId)}`;
        BulkSendBatchStatus response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates the name of a bulk send batch.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + bulkSendBatchId - The batch ID.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/bulk_send_batch/[string bulkSendBatchId](BulkSendBatchRequest payload) returns BulkSendBatchStatus|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_batch/${getEncodedUri(bulkSendBatchId)}`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        BulkSendBatchStatus response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Applies a bulk action to all envelopes from a specified bulk send.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + bulkAction - The action to apply. Valid values:
    # * `resend`
    # * `correct`
    # * `void`
    # + bulkSendBatchId - The batch ID.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/bulk_send_batch/[string bulkSendBatchId]/[string bulkAction](BulkSendBatchActionRequest payload) returns BulkSendBatchStatus|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_batch/${getEncodedUri(bulkSendBatchId)}/${getEncodedUri(bulkAction)}`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        BulkSendBatchStatus response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Gets envelopes from a specific bulk send batch.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + bulkSendBatchId - The batch ID.
    # + count - The maximum number of results to return.
    # Use `start_position` to specify the number of results to skip.
    # Valid values: `1` to `1000`
    # + include - When `recipients`, only envelopes with recipient nodes will be included in the response.
    # + 'order - The order in which to sort the results. Valid values are:
    # - Descending order: `desc` (default)
    # - Ascending order: `asc`
    # + order_by - The envelope attribute used to sort the results. Valid values are:
    # - `created` (default)
    # - `completed`
    # - `last_modified`
    # - `sent`
    # - `status`
    # - `subject`
    # - `status_changed`
    # + search_text - Use this parameter to search for specific text.
    # + start_position - The zero-based index of the
    # result from which to start returning results.
    # Use with `count` to limit the number
    # of results.
    # The default value is `0`.
    # + status - Comma-separated list of envelope statuses.
    # Note that `any` should not be included with other statuses. In other words, `any` is a valid parameter value, but `any,sent` is not.
    # Use the value `deliveryfailure` to get all envelopes with `AuthFailed` and `AutoResponded` status. This value is specific to bulk sending.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/bulk_send_batch/[string bulkSendBatchId]/envelopes(string? count = (), string? include = (), string? 'order = (), string? order_by = (), string? search_text = (), string? start_position = (), string? status = ()) returns EnvelopesInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_batch/${getEncodedUri(bulkSendBatchId)}/envelopes`;
        map<anydata> queryParam = {"count": count, "include": include, "order": 'order, "order_by": order_by, "search_text": search_text, "start_position": start_position, "status": status};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        EnvelopesInformation response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Gets bulk send lists.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/bulk_send_lists() returns BulkSendingListSummaries|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_lists`;
        BulkSendingListSummaries response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Creates a bulk send list.
    #
    # + accountId - The ID of the account.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/bulk_send_lists(BulkSendingList payload) returns BulkSendingList|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_lists`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        BulkSendingList response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Gets a specific bulk send list.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + bulkSendListId - The GUID of the bulk send list. This property is created after you post a new bulk send list.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/bulk_send_lists/[string bulkSendListId]() returns BulkSendingList|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_lists/${getEncodedUri(bulkSendListId)}`;
        BulkSendingList response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates a bulk send list.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + bulkSendListId - The GUID of the bulk send list. This property is created after you post a new bulk send list.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/bulk_send_lists/[string bulkSendListId](BulkSendingList payload) returns BulkSendingList|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_lists/${getEncodedUri(bulkSendListId)}`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        BulkSendingList response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Deletes a bulk send list.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + bulkSendListId - The GUID of the bulk send list. This property is created after you post a new bulk send list.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/bulk_send_lists/[string bulkSendListId]() returns BulkSendingListSummaries|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_lists/${getEncodedUri(bulkSendListId)}`;
        BulkSendingListSummaries response = check self.clientEp->delete(resourcePath);
        return response;
    }

    # Creates a bulk send request.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + bulkSendListId - The GUID of the bulk send list. This property is created after you post a new bulk send list.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/bulk_send_lists/[string bulkSendListId]/send(BulkSendRequest payload) returns BulkSendResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_lists/${getEncodedUri(bulkSendListId)}/send`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        BulkSendResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Creates a bulk send test.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + bulkSendListId - The GUID of the bulk send list. This property is created after you post a new bulk send list.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/bulk_send_lists/[string bulkSendListId]/test(BulkSendRequest payload) returns BulkSendTestResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_lists/${getEncodedUri(bulkSendListId)}/test`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        BulkSendTestResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Deletes the signature for one or more captive recipient records.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + recipientPart - Signature is the only supported value. 
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/captive_recipients/[string recipientPart](CaptiveRecipientInformation payload) returns CaptiveRecipientInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/captive_recipients/${getEncodedUri(recipientPart)}`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        CaptiveRecipientInformation response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Initiate a new chunked upload.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/chunked_uploads(ChunkedUploadRequest payload) returns ChunkedUploadResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/chunked_uploads`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        ChunkedUploadResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Retrieves metadata about a chunked upload.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + chunkedUploadId - The ID of the chunked upload. 
    # + include - (Optional) This parameter enables you to include additional attribute data in the response. The valid value for this method is `checksum`, which returns an SHA256 checksum of the content of the chunked upload in the response. You can use compare this checksum against your own checksum of the original content to verify that there are no missing parts before you attempt to commit the chunked upload.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/chunked_uploads/[string chunkedUploadId](string? include = ()) returns ChunkedUploadResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/chunked_uploads/${getEncodedUri(chunkedUploadId)}`;
        map<anydata> queryParam = {"include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ChunkedUploadResponse response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Commit a chunked upload.
    #
    # + accountId - (Required) The external account number (int) or account ID GUID.
    # + chunkedUploadId - (Required) The ID of the chunked upload to commit.
    # + action - (Required) You must use this query parameter with the value `commit`, which affirms the request to validate and prepare the chunked upload for use with other API calls.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/chunked_uploads/[string chunkedUploadId](string? action = ()) returns ChunkedUploadResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/chunked_uploads/${getEncodedUri(chunkedUploadId)}`;
        map<anydata> queryParam = {"action": action};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        ChunkedUploadResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Deletes a chunked upload.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + chunkedUploadId - The ID of the chunked upload. 
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/chunked_uploads/[string chunkedUploadId]() returns ChunkedUploadResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/chunked_uploads/${getEncodedUri(chunkedUploadId)}`;
        ChunkedUploadResponse response = check self.clientEp->delete(resourcePath);
        return response;
    }

    # Add a chunk to an existing chunked upload.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + chunkedUploadId - The ID of the chunked upload. 
    # + chunkedUploadPartSeq - The sequence or order of the part in the chunked upload. By default, the sequence of the first part that is uploaded as part of the Create request is `0`.
    # **Note:** You can add parts out of order. However, the chunked upload must consist of a contiguous series of one or more parts before you can successfully commit it.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/chunked_uploads/[string chunkedUploadId]/[string chunkedUploadPartSeq](ChunkedUploadRequest payload) returns ChunkedUploadResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/chunked_uploads/${getEncodedUri(chunkedUploadId)}/${getEncodedUri(chunkedUploadPartSeq)}`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        ChunkedUploadResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Get Connect configuration information.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/connect() returns ConnectConfigResults|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect`;
        ConnectConfigResults response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates a specified Connect configuration.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/connect(ConnectCustomConfiguration payload) returns ConnectCustomConfiguration|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        ConnectCustomConfiguration response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Creates a Connect configuration.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/connect(ConnectCustomConfiguration payload) returns ConnectCustomConfiguration|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        ConnectCustomConfiguration response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Gets the details about a Connect configuration.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + connectId - The ID of the custom Connect configuration being accessed.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/connect/[string connectId]() returns ConnectConfigResults|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/${getEncodedUri(connectId)}`;
        ConnectConfigResults response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Deletes the specified Connect configuration.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + connectId - The ID of the custom Connect configuration being accessed.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/connect/[string connectId]() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/${getEncodedUri(connectId)}`;
        return self.clientEp->delete(resourcePath);
    }

    # Returns all users from the configured Connect service.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + connectId - The ID of the custom Connect configuration being accessed.
    # + count - The maximum number of results to return.
    # + email_substring - Filters returned user records by full email address or a substring of email address.
    # + start_position - The position within the total result set from which to start returning values. The value **thumbnail** may be used to return the page image.
    # + status - The status of the item.
    # + user_name_substring - Filters results based on a full or partial user name.
    # **Note:** When you enter a partial user name, you do not use a wildcard character.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/connect/[string connectId]/all/users(string? count = (), string? domain_users_only = (), string? email_substring = (), string? start_position = (), string? status = (), string? user_name_substring = ()) returns IntegratedConnectUserInfoList|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/${getEncodedUri(connectId)}/all/users`;
        map<anydata> queryParam = {"count": count, "domain_users_only": domain_users_only, "email_substring": email_substring, "start_position": start_position, "status": status, "user_name_substring": user_name_substring};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        IntegratedConnectUserInfoList response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Returns users from the configured Connect service.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + connectId - The ID of the custom Connect configuration being accessed.
    # + count - The maximum number of results to return.
    # Use `start_position` to specify the number of results to skip.
    # + email_substring - Filters returned user records by full email address or a substring of email address.
    # + start_position - The zero-based index of the
    # result from which to start returning results.
    # Use with `count` to limit the number
    # of results.
    # The default value is `0`.
    # + status - Filters the results by user status.
    # You can specify a comma-separated
    # list of the following statuses:
    # * ActivationRequired 
    # * ActivationSent 
    # * Active
    # * Closed 
    # * Disabled
    # + user_name_substring - Filters results based on a full or partial user name.
    # **Note:** When you enter a partial user name, you do not use a wildcard character.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/connect/[string connectId]/users(string? count = (), string? email_substring = (), string? list_included_users = (), string? start_position = (), string? status = (), string? user_name_substring = ()) returns IntegratedUserInfoList|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/${getEncodedUri(connectId)}/users`;
        map<anydata> queryParam = {"count": count, "email_substring": email_substring, "list_included_users": list_included_users, "start_position": start_position, "status": status, "user_name_substring": user_name_substring};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        IntegratedUserInfoList response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Republishes Connect information for the specified envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/connect/envelopes/[string envelopeId]/retry_queue() returns ConnectFailureResults|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/envelopes/${getEncodedUri(envelopeId)}/retry_queue`;
        http:Request request = new;
        ConnectFailureResults response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Submits a batch of historical envelopes for republish to a webhook.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/connect/envelopes/publish/historical(ConnectHistoricalEnvelopeRepublish payload) returns EnvelopePublishTransaction|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/envelopes/publish/historical`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopePublishTransaction response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Republishes Connect information for multiple envelopes.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/connect/envelopes/retry_queue(ConnectFailureFilter payload) returns ConnectFailureResults|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/envelopes/retry_queue`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        ConnectFailureResults response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Gets the Connect failure log information.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + from_date - The start date for a date range in UTC DateTime format.
    # **Note:** If this property is null, no date filtering is applied.
    # + to_date - The end of a search date range in UTC DateTime format. When you use this parameter, only templates created up to this date and time are returned.
    # **Note:** If this property is null, the value defaults to the current date.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/connect/failures(string? from_date = (), string? to_date = ()) returns ConnectLogs|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/failures`;
        map<anydata> queryParam = {"from_date": from_date, "to_date": to_date};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ConnectLogs response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Deletes a Connect failure log entry.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + failureId - The ID of the Connect post failure. Use `all` to delete all failures for the account.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/connect/failures/[string failureId]() returns ConnectDeleteFailureResult|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/failures/${getEncodedUri(failureId)}`;
        ConnectDeleteFailureResult response = check self.clientEp->delete(resourcePath);
        return response;
    }

    # Gets the Connect log.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + from_date - The start date for a date range in UTC DateTime format.
    # **Note:** If this property is null, no date filtering is applied.
    # + to_date - The end of a search date range in UTC DateTime format. When you use this parameter, only templates created up to this date and time are returned.
    # **Note:** If this property is null, the value defaults to the current date.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/connect/logs(string? from_date = (), string? to_date = ()) returns ConnectLogs|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/logs`;
        map<anydata> queryParam = {"from_date": from_date, "to_date": to_date};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ConnectLogs response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Deletes a list of Connect log entries.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/connect/logs() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/logs`;
        return self.clientEp->delete(resourcePath);
    }

    # Gets a Connect log entry.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + logId - The ID of the Connect log entry.
    # + additional_info - When **true,** the response includes the `connectDebugLog` information.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/connect/logs/[string logId](string? additional_info = ()) returns ConnectLog|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/logs/${getEncodedUri(logId)}`;
        map<anydata> queryParam = {"additional_info": additional_info};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ConnectLog response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Deletes a specified Connect log entry.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + logId - The ID of the Connect log entry.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/connect/logs/[string logId]() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/logs/${getEncodedUri(logId)}`;
        return self.clientEp->delete(resourcePath);
    }

    # Retrieves the Connect OAuth information for the account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/connect/oauth() returns ConnectOAuthConfig|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/oauth`;
        ConnectOAuthConfig response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates the existing Connect OAuth configuration for the account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/connect/oauth(ConnectOAuthConfig payload) returns ConnectOAuthConfig|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/oauth`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        ConnectOAuthConfig response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Set up Connect OAuth for the specified account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/connect/oauth(ConnectOAuthConfig payload) returns ConnectOAuthConfig|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/oauth`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        ConnectOAuthConfig response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Delete the Connect OAuth configuration.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/connect/oauth() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/oauth`;
        return self.clientEp->delete(resourcePath);
    }

    # Gets the default Electronic Record and Signature Disclosure for an account.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # Additionally, you can automatically detect the browser language being used by the viewer and display the disclosure in that language by setting the value to `browser`.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/consumer_disclosure(string? langCode = ()) returns AccountConsumerDisclosures|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/consumer_disclosure`;
        map<anydata> queryParam = {"langCode": langCode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AccountConsumerDisclosures response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Gets the Electronic Record and Signature Disclosure for an account.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # Additionally, you can automatically detect the browser language being used by the viewer and display the disclosure in that language by setting the value to `browser`.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/consumer_disclosure/[string langCode]() returns AccountConsumerDisclosures|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/consumer_disclosure/${getEncodedUri(langCode)}`;
        AccountConsumerDisclosures response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates the Electronic Record and Signature Disclosure for an account.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # Additionally, you can automatically detect the browser language being used by the viewer and display the disclosure in that language by setting the value to `browser`.
    # + include_metadata - (Optional) When true, the response includes metadata indicating which properties are editable.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/consumer_disclosure/[string langCode](ConsumerDisclosure payload, string? include_metadata = ()) returns ConsumerDisclosure|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/consumer_disclosure/${getEncodedUri(langCode)}`;
        map<anydata> queryParam = {"include_metadata": include_metadata};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        ConsumerDisclosure response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Updates one or more contacts.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/contacts(ContactModRequest payload) returns ContactUpdateResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/contacts`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        ContactUpdateResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Add contacts to a contacts list.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/contacts(ContactModRequest payload) returns ContactUpdateResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/contacts`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        ContactUpdateResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Deletes multiple contacts from an account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/contacts(ContactModRequest payload) returns ContactUpdateResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/contacts`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        ContactUpdateResponse response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Gets one or more contacts.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + contactId - The ID of a contact person in the account's address book.
    # **Note:** To return all contacts, omit this parameter. It is not required.
    # + cloud_provider - (Optional) The cloud provider from which to retrieve the contacts. Valid values are:
    # - `rooms`
    # - `docusignCore` (default)
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/contacts/[string contactId](string? cloud_provider = ()) returns ContactGetResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/contacts/${getEncodedUri(contactId)}`;
        map<anydata> queryParam = {"cloud_provider": cloud_provider};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ContactGetResponse response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Deletes a contact.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + contactId - The ID of a contact person in the account's address book.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/contacts/[string contactId]() returns ContactUpdateResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/contacts/${getEncodedUri(contactId)}`;
        ContactUpdateResponse response = check self.clientEp->delete(resourcePath);
        return response;
    }

    # Gets a list of custom fields.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/custom_fields() returns AccountCustomFields|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/custom_fields`;
        AccountCustomFields response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Creates an account custom field.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + apply_to_templates - (Optional) When **true,** the new custom field is applied to all of the templates on the account.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/custom_fields(CustomField payload, string? apply_to_templates = ()) returns AccountCustomFields|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/custom_fields`;
        map<anydata> queryParam = {"apply_to_templates": apply_to_templates};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        AccountCustomFields response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Updates an account custom field.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + customFieldId - The ID of the custom field.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/custom_fields/[string customFieldId](CustomField payload, string? apply_to_templates = ()) returns AccountCustomFields|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/custom_fields/${getEncodedUri(customFieldId)}`;
        map<anydata> queryParam = {"apply_to_templates": apply_to_templates};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        AccountCustomFields response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Deletes an account custom field.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + customFieldId - The ID of the custom field.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/custom_fields/[string customFieldId](string? apply_to_templates = ()) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/custom_fields/${getEncodedUri(customFieldId)}`;
        map<anydata> queryParam = {"apply_to_templates": apply_to_templates};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        return self.clientEp->delete(resourcePath);
    }

    # Search for specific sets of envelopes by using search filters.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + ac_status - Specifies the Authoritative Copy Status for the envelopes. Valid values: Unknown, Original, Transferred, AuthoritativeCopy, AuthoritativeCopyExportPending, AuthoritativeCopyExported, DepositPending, Deposited, DepositedEO, or DepositFailed.
    # + block - Reserved for DocuSign.
    # + cdse_mode - Reserved for DocuSign.
    # + continuation_token - Reserved for DocuSign.
    # + count - The maximum number of results to return.
    # Use `start_position` to specify the number of results to skip.
    # + custom_field - Optional. Specifies an envelope custom field name and value searched for in the envelopes. Format: `custom_envelope_field_name=desired_value`
    # Example: If you have an envelope custom field named "Region" and you want to search for all envelopes where the value is "West" you would use set this parameter to `Region=West`. 
    # + email - Limit results to envelopes
    # sent by the account user
    # with this email address.
    # `user_name` must be given as well,
    # and both `email` and `user_name`
    # must refer to an existing account user.
    # + envelope_ids - Comma separated list of `envelopeId` values.
    # + exclude - Excludes information from the response. Enter  as a comma-separated list (e.g., `folders,powerforms`). Valid values are:
    # - `recipients`
    # - `powerforms`
    # - `folders`
    # + folder_ids - Returns the envelopes from specific folders. Enter as a comma-separated list of either valid folder Guids or the following values: 
    # - `awaiting_my_signature`
    # - `completed`
    # - `draft`
    # - `drafts`
    # - `expiring_soon`
    # - `inbox`
    # - `out_for_signature`
    # - `recyclebin`
    # - `sentitems`
    # - `waiting_for_others`
    # + folder_types - A comma-separated list of folder types you want to retrieve envelopes from. Valid values are: 
    # - `normal`
    # - `inbox`
    # - `sentitems`
    # - `draft`
    # - `templates`
    # + from_date - Specifies the date and time
    # to start looking for status changes.
    # This parameter is required
    # unless `envelopeIds` or `transactionIds`
    # are set.
    # Although you can use any date format
    # supported by the .NET system library's
    # ['DateTime.Parse()'][msoft] function,
    # DocuSign recommends
    # using [ISO 8601][] format dates
    # with an explicit time zone offset
    # If you do not provide
    # a time zone offset,
    # the method uses the server's time zone.
    # For example, the following dates and times refer to the same instant:
    # * `2017-05-02T01:44Z`
    # * `2017-05-01T21:44-04:00`
    # * `2017-05-01T18:44-07:00`
    # [msoft]: https://docs.microsoft.com/en-us/dotnet/api/system.datetime.parse?redirectedfrom=MSDN&view=net-5.0#overloads
    # [ISO 8601]: https://en.wikipedia.org/wiki/ISO_8601
    # + from_to_status - This is the status type checked for in the `from_date`/`to_date` period. If `changed` is specified, then envelopes that changed status during the period are found. If for example, `created` is specified, then envelopes created during the period are found. Default is `changed`. 
    # Possible values are: Voided, Changed, Created, Deleted, Sent, Delivered, Signed, Completed, Declined, TimedOut and Processing.
    # + include - Specifies additional information to return  about the envelopes.
    # Use a comma-separated list, such as `folders, recipients` to specify information.
    # Valid values are:
    # - `custom_fields`: The custom fields associated with the envelope.
    # - `documents`: The documents associated with the envelope.
    # - `attachments`: The attachments associated with the envelope.
    # - `extensions`: Information about the email settings associated with the envelope.
    # - `folders`: The folders where the envelope exists.
    # - `recipients`: The recipients associated with the envelope.
    # - `payment_tabs`: The payment tabs associated with the envelope.
    # + include_purge_information - When **true,** information about envelopes that have been deleted is included in the response.
    # + intersecting_folder_ids - A comma-separated list of folders that you want want to get envelopes from. Valid values are: 
    # - `normal`
    # - `inbox`
    # - `sentitems`
    # - `draft`
    # - `templates`
    # + last_queried_date - Returns envelopes that were modified prior to the specified date and time. 
    # Example: `2020-05-09T21:56:12.2500000Z`
    # + 'order - Returns envelopes in either ascending (`asc`) or descending (`desc`) order.
    # + order_by - Sorts results according to a specific property. Valid values are:
    # - `last_modified`
    # - `action_required`
    # - `created`
    # - `completed`
    # - `envelope_name`
    # - `expire`
    # - `sent`
    # - `signer_list`
    # - `status`
    # - `subject`
    # - `user_name`
    # - `status_changed`
    # - `last_modified`
    # + powerformids - A comma-separated list of `PowerFormId` values.
    # + query_budget - The time in seconds that the query should run before returning data.
    # + search_text - Free text search criteria that you can use to filter the list of envelopes that is returned.
    # + start_position - The zero-based index of the
    # result from which to start returning results.
    # Use with `count` to limit the number
    # of results.
    # The default value is `0`.
    # + status - A comma-separated list of current envelope statuses to included in the response. Possible values are:
    # * `completed`
    # * `created`
    # * `declined`
    # * `deleted`
    # * `delivered`
    # * `processing`
    # * `sent`
    # * `signed`
    # * `timedout`
    # * `voided`
    # The `any` value is equivalent to any status.
    # + to_date - Specifies the date and time
    # to stop looking for status changes.
    # The default is the current date and time.
    # Although you can use any date format
    # supported by the .NET system library's
    # ['DateTime.Parse()']msoft] function,
    # DocuSign recommends
    # using [ISO 8601][] format dates
    # with an explicit time zone offset
    # If you do not provide
    # a time zone offset,
    # the method uses the server's time zone.
    # For example, the following dates and times refer to the same instant:
    # * `2017-05-02T01:44Z`
    # * `2017-05-01T21:44-04:00`
    # * `2017-05-01T18:44-07:00`
    # [msoft]: https://docs.microsoft.com/en-us/dotnet/api/system.datetime.parse?redirectedfrom=MSDN&view=net-5.0#overloads
    # [ISO 8601]: https://en.wikipedia.org/wiki/ISO_8601
    # + transaction_ids - If included in the query string, this is a comma separated list of envelope `transactionId`s. 
    # If included in the `request_body`, this is a list of envelope `transactionId`s. 
    # ###### Note: `transactionId`s are only valid in the DocuSign system for seven days.
    # + user_filter - Returns envelopes where the current user is the recipient, the sender, or the recipient only. (For example, `user_filter=sender`.) Valid values are:
    # - `sender`
    # - `recipient`
    # - `recipient_only`
    # + user_id - The ID of the user who created the envelopes to be retrieved. Note that an account can have multiple users, and any user with account access can retrieve envelopes by user_id from the account.
    # + user_name - Limit results to envelopes
    # sent by the account user
    # with this user name.
    # `email` must be given as well,
    # and both `email` and `user_name`
    # must refer to an existing account user.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes(string? ac_status = (), string? block = (), string? cdse_mode = (), string? continuation_token = (), string? count = (), string? custom_field = (), string? email = (), string? envelope_ids = (), string? exclude = (), string? folder_ids = (), string? folder_types = (), string? from_date = (), string? from_to_status = (), string? include = (), string? include_purge_information = (), string? intersecting_folder_ids = (), string? last_queried_date = (), string? 'order = (), string? order_by = (), string? powerformids = (), string? query_budget = (), string? requester_date_format = (), string? search_mode = (), string? search_text = (), string? start_position = (), string? status = (), string? to_date = (), string? transaction_ids = (), string? user_filter = (), string? user_id = (), string? user_name = ()) returns EnvelopesInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes`;
        map<anydata> queryParam = {"ac_status": ac_status, "block": block, "cdse_mode": cdse_mode, "continuation_token": continuation_token, "count": count, "custom_field": custom_field, "email": email, "envelope_ids": envelope_ids, "exclude": exclude, "folder_ids": folder_ids, "folder_types": folder_types, "from_date": from_date, "from_to_status": from_to_status, "include": include, "include_purge_information": include_purge_information, "intersecting_folder_ids": intersecting_folder_ids, "last_queried_date": last_queried_date, "order": 'order, "order_by": order_by, "powerformids": powerformids, "query_budget": query_budget, "requester_date_format": requester_date_format, "search_mode": search_mode, "search_text": search_text, "start_position": start_position, "status": status, "to_date": to_date, "transaction_ids": transaction_ids, "user_filter": user_filter, "user_id": user_id, "user_name": user_name};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        EnvelopesInformation response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Creates an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + cdse_mode - Reserved for DocuSign.
    # + change_routing_order - When true, users can define the routing order of recipients while sending documents for signature.
    # + completed_documents_only - Reserved for DocuSign.
    # + merge_roles_on_draft - When **true,** template roles will be merged, and empty recipients will be removed. This parameter applies when you create a draft envelope with multiple templates. (To create a draft envelope, the `status` field is set to `created`.)
    # **Note:** DocuSign recommends that this parameter should be set to **true** whenever you create a draft envelope with multiple templates.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/envelopes(EnvelopeDefinition payload, string? cdse_mode = (), string? change_routing_order = (), string? completed_documents_only = (), string? merge_roles_on_draft = ()) returns EnvelopeSummary|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes`;
        map<anydata> queryParam = {"cdse_mode": cdse_mode, "change_routing_order": change_routing_order, "completed_documents_only": completed_documents_only, "merge_roles_on_draft": merge_roles_on_draft};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeSummary response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Gets the status of a single envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + advanced_update - When **true,** envelope information can be added or modified.
    # + include - Specifies additional information about the envelope to return. Enter a comma-separated list, such as `tabs,recipients`. Valid values are:
    # - `custom_fields`: The custom fields associated with the envelope.
    # - `documents`: The documents associated with the envelope.
    # - `attachments`: The attachments associated with the envelope.
    # - `extensions`: The email settings associated with the envelope.
    # - `folders`: The folder where the envelope exists.
    # - `recipients`: The recipients associated with the envelope.
    # - `powerform`: The PowerForms associated with the envelope.
    # - `tabs`: The tabs associated with the envelope.
    # - `payment_tabs`: The payment tabs associated with the envelope.
    # - `workflow`: The workflow definition associated with the envelope.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId](string? advanced_update = (), string? include = ()) returns Envelope|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}`;
        map<anydata> queryParam = {"advanced_update": advanced_update, "include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Envelope response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Send, void, or modify a draft envelope. Purge documents from a completed envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + advanced_update - When **true,** allows the caller to update recipients, tabs, custom fields, notification, email settings and other envelope attributes.
    # + resend_envelope - When **true,**
    # sends the specified envelope again.
    # + payload - A container used to send documents to recipients. The envelope carries information about the sender and timestamps to indicate the progress of the delivery procedure. It can contain collections of Documents, Tabs and Recipients.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/envelopes/[string envelopeId](Envelope payload, string? advanced_update = (), string? resend_envelope = ()) returns EnvelopeUpdateSummary|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}`;
        map<anydata> queryParam = {"advanced_update": advanced_update, "resend_envelope": resend_envelope};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeUpdateSummary response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Returns a list of envelope attachments associated with a specified envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/attachments() returns EnvelopeAttachmentsResult|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/attachments`;
        EnvelopeAttachmentsResult response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Adds one or more envelope attachments to a draft or in-process envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/envelopes/[string envelopeId]/attachments(EnvelopeAttachmentsRequest payload) returns EnvelopeAttachmentsResult|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/attachments`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeAttachmentsResult response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Deletes one or more envelope attachments from a draft envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/envelopes/[string envelopeId]/attachments(EnvelopeAttachmentsRequest payload) returns EnvelopeAttachmentsResult|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/attachments`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeAttachmentsResult response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Retrieves an envelope attachment from an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + attachmentId - The unique identifier for the attachment.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/attachments/[string attachmentId]() returns byte[]|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/attachments/${getEncodedUri(attachmentId)}`;
        byte[] response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates an envelope attachment in a draft or in-process envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + attachmentId - The unique identifier for the attachment.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/envelopes/[string envelopeId]/attachments/[string attachmentId](Attachment payload) returns EnvelopeAttachmentsResult|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/attachments/${getEncodedUri(attachmentId)}`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeAttachmentsResult response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Gets the envelope audit events for an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/audit_events() returns EnvelopeAuditEventResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/audit_events`;
        EnvelopeAuditEventResponse response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Gets a PDF transcript of all of the comments in an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + encoding - (Optional) The encoding to use for the file.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/comments/transcript(string? encoding = ()) returns byte[]|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/comments/transcript`;
        map<anydata> queryParam = {"encoding": encoding};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        byte[] response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Gets the custom field information for the specified envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/custom_fields() returns CustomFieldsEnvelope|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/custom_fields`;
        CustomFieldsEnvelope response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates envelope custom fields in an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/envelopes/[string envelopeId]/custom_fields(EnvelopeCustomFields payload) returns EnvelopeCustomFields|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/custom_fields`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeCustomFields response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Creates envelope custom fields for an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/envelopes/[string envelopeId]/custom_fields(EnvelopeCustomFields payload) returns EnvelopeCustomFields|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/custom_fields`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeCustomFields response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Deletes envelope custom fields for draft and in-process envelopes.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/envelopes/[string envelopeId]/custom_fields(EnvelopeCustomFields payload) returns EnvelopeCustomFields|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/custom_fields`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeCustomFields response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Returns form fields for an envelope
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/docGenFormFields() returns DocGenFormFieldResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/docGenFormFields`;
        DocGenFormFieldResponse response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates form fields for an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + update_docgen_formfields_only - When **true,** only the form fields are updated.
    # When **false** or omitted,
    # the documents are updated as well.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/envelopes/[string envelopeId]/docGenFormFields(DocGenFormFieldRequest payload, string? update_docgen_formfields_only = ()) returns DocGenFormFieldResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/docGenFormFields`;
        map<anydata> queryParam = {"update_docgen_formfields_only": update_docgen_formfields_only};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        DocGenFormFieldResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Gets a list of documents in an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + documents_by_userid - When **true,** allows recipients to get documents by their user id. For example, if a user is included in two different routing orders with different visibilities, using this parameter returns all of the documents from both routing orders.
    # + include_docgen_formfields - Reserved for DocuSign.
    # + include_metadata - When **true,** the response includes metadata that indicates which properties the sender can edit.
    # + include_tabs - When **true,** information about the tabs, including prefill tabs, associated with the documents are included in the response.
    # + recipient_id - Allows the sender to retrieve the documents as one of the recipients that they control. The `documents_by_userid` parameter must be set to **false** for this to work.
    # + shared_user_id - The ID of a shared user that you want to impersonate in order to
    # retrieve their view of the list of documents. This parameter is
    # used in the context of a shared inbox (i.e., when you share
    # envelopes from one user to another through the DocuSign Admin console).
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/documents(string? documents_by_userid = (), string? include_docgen_formfields = (), string? include_metadata = (), string? include_tabs = (), string? recipient_id = (), string? shared_user_id = ()) returns EnvelopeDocumentsResult|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents`;
        map<anydata> queryParam = {"documents_by_userid": documents_by_userid, "include_docgen_formfields": include_docgen_formfields, "include_metadata": include_metadata, "include_tabs": include_tabs, "recipient_id": recipient_id, "shared_user_id": shared_user_id};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        EnvelopeDocumentsResult response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Adds one or more documents to an existing envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/envelopes/[string envelopeId]/documents(EnvelopeDefinition payload) returns EnvelopeDocumentsResult|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeDocumentsResult response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Deletes documents from a draft envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/envelopes/[string envelopeId]/documents(EnvelopeDefinition payload) returns EnvelopeDocumentsResult|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeDocumentsResult response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Retrieves a single document or all documents from an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + documentId - The ID of the document to retrieve. Alternatively, you can use one of the following special keywords:
    # - `combined`: Retrieves all of the documents as a single PDF file.
    # - `archive`: Retrieves a ZIP archive that contains all of the PDF documents and the certificate of completion.
    # - `certificate`: Retrieves only the certificate of completion as a PDF file.
    # - `portfolio`: Retrieves the envelope documents as a [PDF portfolio](https://helpx.adobe.com/acrobat/using/overview-pdf-portfolios.html).
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + certificate - Used only when the `documentId` parameter is the special keyword `combined`.
    # When **true,** the certificate of completion is included in the combined PDF file.
    # When **false,** (the default) the certificate of completion is not included in the combined PDF file.
    # + documents_by_userid - When **true,** allows recipients to get documents by their user id. For example, if a user is included in two different routing orders with different visibilities, using this parameter returns all of the documents from both routing orders.
    # + encoding - Reserved for DocuSign.
    # + encrypt - When **true,** the PDF bytes returned in the response are encrypted for all the key managers configured on your DocuSign account. You can decrypt the documents by using the Key Manager DecryptDocument API method. For more information about Key Manager, see the DocuSign Security Appliance Installation Guide that your organization received from DocuSign.
    # + language - Specifies the language for the Certificate of Completion in the response. The supported languages are: Chinese Simplified (zh_CN), Chinese Traditional (zh_TW), Dutch (nl), English US (en), French (fr), German (de), Italian (it), Japanese (ja), Korean (ko), Portuguese (pt), Portuguese (Brazil) (pt_BR), Russian (ru), Spanish (es). 
    # + recipient_id - Allows the sender to retrieve the documents as one of the recipients that they control. The `documents_by_userid` parameter must be set to **false** for this functionality to work.
    # + shared_user_id - The ID of a shared user that you want to impersonate in order to
    # retrieve their view of the list of documents. This parameter is
    # used in the context of a shared inbox (i.e., when you share
    # envelopes from one user to another through the DocuSign Admin console).
    # + show_changes - When **true,** any changed fields for the returned PDF are highlighted in yellow and optional signatures or initials outlined in red. The account must have the **Highlight Data Changes** feature enabled.
    # + watermark - When **true,** the account has the watermark feature enabled, and the envelope is not complete, then the watermark for the account is added to the PDF documents. This option can remove the watermark. 
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId](string? certificate = (), string? documents_by_userid = (), string? encoding = (), string? encrypt = (), string? language = (), string? recipient_id = (), string? shared_user_id = (), string? show_changes = (), string? watermark = ()) returns byte[]|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}`;
        map<anydata> queryParam = {"certificate": certificate, "documents_by_userid": documents_by_userid, "encoding": encoding, "encrypt": encrypt, "language": language, "recipient_id": recipient_id, "shared_user_id": shared_user_id, "show_changes": show_changes, "watermark": watermark};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        byte[] response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Adds or replaces a document in an existing envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + request - Updated document content.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId](http:Request request) returns EnvelopeDocument|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}`;
        // TODO: Update the request as needed;
        EnvelopeDocument response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Gets the custom document fields from an  existing envelope document.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/fields() returns EnvelopeDocumentFields|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/fields`;
        EnvelopeDocumentFields response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates existing custom document fields in an existing envelope document.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/fields(EnvelopeDocumentFields payload) returns EnvelopeDocumentFields|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/fields`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeDocumentFields response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Creates custom document fields in an existing envelope document.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/fields(EnvelopeDocumentFields payload) returns EnvelopeDocumentFields|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/fields`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeDocumentFields response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Deletes custom document fields from an existing envelope document.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/fields(EnvelopeDocumentFields payload) returns EnvelopeDocumentFields|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/fields`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeDocumentFields response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Retrieves the HTML definition used to generate a dynamically sized responsive document.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + documentId - The GUID of the document.
    # Example: c671747c-xxxx-xxxx-xxxx-4a4a48e23744
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/html_definitions() returns DocumentHtmlDefinitionOriginals|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/html_definitions`;
        DocumentHtmlDefinitionOriginals response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Returns document page images based on input.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + count - The maximum number of results to return.
    # + dpi - The number of dots per inch (DPI) for the resulting images. Valid values are 1-310 DPI. The default value is 94.
    # + max_height - Sets the maximum height of the returned images in pixels.
    # + max_width - Sets the maximum width of the returned images in pixels.
    # + nocache - When **true,** using cache is disabled and image information is retrieved from a database. **True** is the default value. 
    # + show_changes - When **true,** changes display in the user interface.
    # + start_position - The position within the total result set from which to start returning values. The value **thumbnail** may be used to return the page image.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/pages(string? count = (), string? dpi = (), string? max_height = (), string? max_width = (), string? nocache = (), string? show_changes = (), string? start_position = ()) returns PageImages|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/pages`;
        map<anydata> queryParam = {"count": count, "dpi": dpi, "max_height": max_height, "max_width": max_width, "nocache": nocache, "show_changes": show_changes, "start_position": start_position};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PageImages response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Deletes a page from a document in an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + pageNumber - The page number being accessed.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/pages/[string pageNumber]() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/pages/${getEncodedUri(pageNumber)}`;
        return self.clientEp->delete(resourcePath);
    }

    # Gets a page image from an envelope for display.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + pageNumber - The page number being accessed.
    # + dpi - Sets the dots per inch (DPI) for the returned image.
    # + max_height - Sets the maximum height for the page image in pixels. The DPI is recalculated based on this setting.
    # + max_width - Sets the maximum width for the page image in pixels. The DPI is recalculated based on this setting.
    # + show_changes - When **true,** changes display in the user interface.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/pages/[string pageNumber]/page_image(string? dpi = (), string? max_height = (), string? max_width = (), string? show_changes = ()) returns byte[]|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/pages/${getEncodedUri(pageNumber)}/page_image`;
        map<anydata> queryParam = {"dpi": dpi, "max_height": max_height, "max_width": max_width, "show_changes": show_changes};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        byte[] response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Rotates page image from an envelope for display.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + pageNumber - The page number being accessed.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/pages/[string pageNumber]/page_image(PageRequest payload) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/pages/${getEncodedUri(pageNumber)}/page_image`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request);
    }

    # Returns tabs on the specified page.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + pageNumber - The page number being accessed.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/pages/[string pageNumber]/tabs() returns EnvelopeDocumentTabs|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/pages/${getEncodedUri(pageNumber)}/tabs`;
        EnvelopeDocumentTabs response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Creates a preview of the responsive version of a document.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/responsive_html_preview(DocumentHtmlDefinition payload) returns DocumentHtmlDefinitions|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/responsive_html_preview`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        DocumentHtmlDefinitions response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Returns the tabs on a document.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + include_metadata - When **true,** the response includes metadata indicating which properties are editable.
    # + page_numbers - Filters for tabs that occur on the pages that you specify. Enter as a comma-separated list of page GUIDs.
    # Example: `page_numbers=2,6`
    # Note: You can only enter individual page numbers, and not a page range.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/tabs(string? include_metadata = (), string? page_numbers = ()) returns EnvelopeDocumentTabs|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/tabs`;
        map<anydata> queryParam = {"include_metadata": include_metadata, "page_numbers": page_numbers};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        EnvelopeDocumentTabs response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates the tabs for document.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + payload - A list of tabs, which are represented graphically as symbols on documents at the time of signing. Tabs show recipients where to sign, initial, or enter data. They may also display data to the recipients.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/tabs(Tabs payload) returns Tabs|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/tabs`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Tabs response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Adds tabs to a document in an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + payload - A list of tabs, which are represented graphically as symbols on documents at the time of signing. Tabs show recipients where to sign, initial, or enter data. They may also display data to the recipients.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/tabs(Tabs payload) returns Tabs|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/tabs`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Tabs response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Deletes tabs from a document in an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + payload - A list of tabs, which are represented graphically as symbols on documents at the time of signing. Tabs show recipients where to sign, initial, or enter data. They may also display data to the recipients.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/tabs(Tabs payload) returns Tabs|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/tabs`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Tabs response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Gets the templates associated with a document in an existing envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + include - A comma-separated list that limits the results.
    # Valid values are:
    # * `applied`
    # * `matched`
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/templates(string? include = ()) returns TemplateInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/templates`;
        map<anydata> queryParam = {"include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TemplateInformation response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Adds templates to a document in an  envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + preserve_template_recipient - If omitted or set to false (the default),
    # envelope recipients _will be removed_
    # if the template being applied
    # includes only  tabs positioned via anchor text for the recipient,
    # and none of the documents include the anchor text. 
    # When **true,** the recipients _will be preserved_ after the template is applied.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/templates(DocumentTemplateList payload, string? preserve_template_recipient = ()) returns DocumentTemplateList|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/templates`;
        map<anydata> queryParam = {"preserve_template_recipient": preserve_template_recipient};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        DocumentTemplateList response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Deletes a template from a document in an existing envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/templates/[string templateId]() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/templates/${getEncodedUri(templateId)}`;
        return self.clientEp->delete(resourcePath);
    }

    # Gets the email setting overrides for an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/email_settings() returns EmailSettings|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/email_settings`;
        EmailSettings response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates the email setting overrides for an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + payload - A complex type that contains email settings.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/envelopes/[string envelopeId]/email_settings(EmailSettings payload) returns EmailSettings|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/email_settings`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EmailSettings response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Adds email setting overrides to an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + payload - A complex type that contains email settings.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/envelopes/[string envelopeId]/email_settings(EmailSettings payload) returns EmailSettings|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/email_settings`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EmailSettings response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Deletes the email setting overrides for an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/envelopes/[string envelopeId]/email_settings() returns EmailSettings|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/email_settings`;
        EmailSettings response = check self.clientEp->delete(resourcePath);
        return response;
    }

    # Returns envelope tab data for an existing envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/form_data() returns EnvelopeFormData|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/form_data`;
        EnvelopeFormData response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Gets the Original HTML Definition used to generate the Responsive HTML for the envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/html_definitions() returns DocumentHtmlDefinitionOriginals|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/html_definitions`;
        DocumentHtmlDefinitionOriginals response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Gets envelope lock information.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/'lock() returns EnvelopeLocks|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/lock`;
        EnvelopeLocks response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates an envelope lock.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/envelopes/[string envelopeId]/'lock(LockRequest payload) returns EnvelopeLocks|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/lock`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeLocks response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Locks an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/envelopes/[string envelopeId]/'lock(LockRequest payload) returns EnvelopeLocks|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/lock`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeLocks response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Deletes an envelope lock.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/envelopes/[string envelopeId]/'lock() returns EnvelopeLocks|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/lock`;
        EnvelopeLocks response = check self.clientEp->delete(resourcePath);
        return response;
    }

    # Gets envelope notification information.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/notification() returns Notification|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/notification`;
        Notification response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Sets envelope notifications for an existing envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/envelopes/[string envelopeId]/notification(EnvelopeNotificationRequest payload) returns Notification|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/notification`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Notification response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Gets the status of recipients for an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + include_anchor_tab_locations - When **true** and `include_tabs` value is set to **true,** all tabs with anchor tab properties are included in the response. 
    # + include_extended - When **true,** the extended properties are included in the response. 
    # + include_metadata - Boolean value that specifies whether to include metadata associated with the recipients (for envelopes only, not templates).
    # + include_tabs - When **true,** the tab information associated with the recipient is included in the response.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/recipients(string? include_anchor_tab_locations = (), string? include_extended = (), string? include_metadata = (), string? include_tabs = ()) returns EnvelopeRecipients|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients`;
        map<anydata> queryParam = {"include_anchor_tab_locations": include_anchor_tab_locations, "include_extended": include_extended, "include_metadata": include_metadata, "include_tabs": include_tabs};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        EnvelopeRecipients response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates recipients in a draft envelope or corrects recipient information for an in-process envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + combine_same_order_recipients - When **true,** recipients are combined or merged with matching recipients. Recipient matching occurs as part of [template matching](https://support.docusign.com/s/document-item?bundleId=jux1643235969954&topicId=fxo1578456612662.html), and is based on Recipient Role and Routing Order.
    # + offline_signing - Indicates if offline signing is enabled for the recipient when a network connection is unavailable. 
    # + resend_envelope - When **true,**
    # forces the envelope to be resent
    # if it would not be resent otherwise.
    # Ordinarily, if the recipient's routing order
    # is before or the same as the envelope's next recipient,
    # the envelope is not resent.
    # Setting this query parameter
    # to **false** has no effect and is the same as omitting
    # it altogether.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/envelopes/[string envelopeId]/recipients(EnvelopeRecipients payload, string? combine_same_order_recipients = (), string? offline_signing = (), string? resend_envelope = ()) returns RecipientsUpdateSummary|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients`;
        map<anydata> queryParam = {"combine_same_order_recipients": combine_same_order_recipients, "offline_signing": offline_signing, "resend_envelope": resend_envelope};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        RecipientsUpdateSummary response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Adds one or more recipients to an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + resend_envelope - When **true,**
    # forces the envelope to be resent
    # if it would not be resent otherwise.
    # Ordinarily, if the recipient's routing order
    # is before or the same as the envelope's next recipient,
    # the envelope is not resent.
    # Setting this query parameter
    # to **false** has no effect and is the same as omitting
    # it altogether.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/envelopes/[string envelopeId]/recipients(EnvelopeRecipients payload, string? resend_envelope = ()) returns EnvelopeRecipients|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients`;
        map<anydata> queryParam = {"resend_envelope": resend_envelope};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeRecipients response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Deletes recipients from an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/envelopes/[string envelopeId]/recipients(EnvelopeRecipients payload) returns EnvelopeRecipients|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeRecipients response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Deletes a recipient from an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # a `recipientId` of `1`.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]() returns EnvelopeRecipients|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}`;
        EnvelopeRecipients response = check self.clientEp->delete(resourcePath);
        return response;
    }

    # Gets the default Electronic Record and Signature Disclosure for an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # a `recipientId` of `1`.
    # + langCode - (Optional) The code for the signer language version of the disclosure that you want to retrieve. The following languages are supported:
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
    # Additionally, you can automatically detect the browser language being used by the viewer and display the disclosure in that language by setting the value to `browser`.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/consumer_disclosure(string? langCode = ()) returns ConsumerDisclosure|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/consumer_disclosure`;
        map<anydata> queryParam = {"langCode": langCode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ConsumerDisclosure response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Gets the Electronic Record and Signature Disclosure for a specific envelope recipient.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # Additionally, you can automatically detect the browser language being used by the viewer and display the disclosure in that language by setting the value to `browser`.
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`.
    # + languageCode - (Optional) The code for the signer language version of the disclosure that you want to retrieve, as a query parameter. The following languages are supported:
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
    # Additionally, you can automatically detect the browser language being used by the viewer and display the disclosure in that language by setting the value to `browser`.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/consumer_disclosure/[string languageCode](string? langCode = ()) returns ConsumerDisclosure|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/consumer_disclosure/${getEncodedUri(langCode)}`;
        map<anydata> queryParam = {"langCode": langCode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ConsumerDisclosure response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Returns document visibility for a recipient
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # a `recipientId` of `1`.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/document_visibility() returns DocumentVisibilityList|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/document_visibility`;
        DocumentVisibilityList response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates document visibility for a recipient
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # a `recipientId` of `1`.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/document_visibility(DocumentVisibilityList payload) returns DocumentVisibilityList|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/document_visibility`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        DocumentVisibilityList response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Creates a resource token for a sender to request ID Evidence data. 
    #
    # + accountId - The account ID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + recipientId - The `recipientIdGuid`.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/identity_proof_token() returns IdEvidenceResourceToken|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/identity_proof_token`;
        http:Request request = new;
        IdEvidenceResourceToken response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Gets the initials image for a user.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # a `recipientId` of `1`.
    # + include_chrome - The added line and identifier around the initial image. Note: Older envelopes might only have chromed images. If getting the non-chromed image fails, try getting the chromed image.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/initials_image(string? include_chrome = ()) returns byte[]|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/initials_image`;
        map<anydata> queryParam = {"include_chrome": include_chrome};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        byte[] response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Sets the initials image for an accountless signer.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # a `recipientId` of `1`.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/initials_image() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/initials_image`;
        http:Request request = new;
        return self.clientEp->put(resourcePath, request);
    }

    # Gets signature information for a signer or sign-in-person recipient.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # a `recipientId` of `1`.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/signature() returns UserSignature|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/signature`;
        UserSignature response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Retrieve signature image information for a signer/sign-in-person recipient.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # a `recipientId` of `1`.
    # + include_chrome - When **true,** the response includes the chromed version of the signature image.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/signature_image(string? include_chrome = ()) returns byte[]|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/signature_image`;
        map<anydata> queryParam = {"include_chrome": include_chrome};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        byte[] response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Sets the signature image for an accountless signer.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # a `recipientId` of `1`.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/signature_image() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/signature_image`;
        http:Request request = new;
        return self.clientEp->put(resourcePath, request);
    }

    # Gets the tabs information for a signer or sign-in-person recipient in an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # a `recipientId` of `1`.
    # + include_anchor_tab_locations - When **true,** all tabs with anchor tab properties are included in the response. The default value is **false.**
    # + include_metadata - When **true,** the response includes metadata indicating which properties are editable.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/tabs(string? include_anchor_tab_locations = (), string? include_metadata = ()) returns EnvelopeRecipientTabs|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/tabs`;
        map<anydata> queryParam = {"include_anchor_tab_locations": include_anchor_tab_locations, "include_metadata": include_metadata};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        EnvelopeRecipientTabs response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates the tabs for a recipient.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # a `recipientId` of `1`.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/tabs(EnvelopeRecipientTabs payload) returns EnvelopeRecipientTabs|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/tabs`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeRecipientTabs response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Adds tabs for a recipient.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # a `recipientId` of `1`.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/tabs(EnvelopeRecipientTabs payload) returns EnvelopeRecipientTabs|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/tabs`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeRecipientTabs response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Deletes the tabs associated with a recipient.
    #
    # **Note:** It is an error to delete a tab that has the
    # `templateLocked` property set to true.
    # This property corresponds to the **Restrict changes** option in the web app.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # a `recipientId` of `1`.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/tabs(EnvelopeRecipientTabs payload) returns EnvelopeRecipientTabs|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/tabs`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeRecipientTabs response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Create the link to the page for manually reviewing IDs.
    #
    # + accountId - A value that identifies your account. This value is automatically generated by DocuSign for any account you create. Copy the value from the API Account ID field in the [AppsI and Keys](https://support.docusign.com/s/document-item?bundleId=pik1583277475390&topicId=pmp1583277397015.html) page.
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
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/views/identity_manual_review() returns ViewUrl|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/views/identity_manual_review`;
        http:Request request = new;
        ViewUrl response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Updates document visibility for recipients
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/envelopes/[string envelopeId]/recipients/document_visibility(DocumentVisibilityList payload) returns DocumentVisibilityList|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/document_visibility`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        DocumentVisibilityList response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Creates a preview of the responsive versions of all of the documents in an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/envelopes/[string envelopeId]/responsive_html_preview(DocumentHtmlDefinition payload) returns DocumentHtmlDefinitions|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/responsive_html_preview`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        DocumentHtmlDefinitions response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Reserved for DocuSign.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/tabs_blob() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/tabs_blob`;
        return self.clientEp->get(resourcePath);
    }

    # Reserved for DocuSign.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/envelopes/[string envelopeId]/tabs_blob() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/tabs_blob`;
        http:Request request = new;
        return self.clientEp->put(resourcePath, request);
    }

    # Get List of Templates used in an Envelope
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + include - The possible value is `matching_applied`, which returns template matching information for the template.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/templates(string? include = ()) returns TemplateInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/templates`;
        map<anydata> queryParam = {"include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TemplateInformation response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Adds templates to an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + preserve_template_recipient - If omitted or set to false (the default),
    # envelope recipients _will be removed_
    # if the template being applied
    # includes only  tabs positioned via anchor text for the recipient,
    # and none of the documents include the anchor text. 
    # When **true,** the recipients _will be preserved_ after the template is applied.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/envelopes/[string envelopeId]/templates(DocumentTemplateList payload, string? preserve_template_recipient = ()) returns DocumentTemplateList|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/templates`;
        map<anydata> queryParam = {"preserve_template_recipient": preserve_template_recipient};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        DocumentTemplateList response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Returns a URL to the envelope correction UI.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/envelopes/[string envelopeId]/views/correct(CorrectViewRequest payload) returns EnvelopeViews|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/views/correct`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeViews response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Revokes the correction view URL to the Envelope UI.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/envelopes/[string envelopeId]/views/correct(CorrectViewRequest payload) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/views/correct`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request);
    }

    # Returns a URL to the edit view UI.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/envelopes/[string envelopeId]/views/edit(ReturnUrlRequest payload) returns EnvelopeViews|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/views/edit`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeViews response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Returns a URL to the recipient view UI.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The ID of the draft envelope or template to preview.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/envelopes/[string envelopeId]/views/recipient(RecipientViewRequest payload) returns EnvelopeViews|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/views/recipient`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeViews response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Creates an envelope recipient preview.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/envelopes/[string envelopeId]/views/recipient_preview(RecipientPreviewRequest payload) returns ViewUrl|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/views/recipient_preview`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        ViewUrl response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Returns a URL to the sender view UI.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/envelopes/[string envelopeId]/views/sender(ReturnUrlRequest payload) returns EnvelopeViews|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/views/sender`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeViews response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Returns a URL to the shared recipient view UI for an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/envelopes/[string envelopeId]/views/shared(RecipientViewRequest payload) returns ViewUrl|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/views/shared`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        ViewUrl response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Returns the workflow definition for an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/workflow() returns Workflow|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow`;
        Workflow response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates the workflow definition for an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/envelopes/[string envelopeId]/workflow(Workflow payload) returns Workflow|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Workflow response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Delete the workflow definition for an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/envelopes/[string envelopeId]/workflow() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow`;
        return self.clientEp->delete(resourcePath);
    }

    # Returns the scheduled sending rules for an envelope's workflow definition.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/workflow/scheduledSending() returns ScheduledSending|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/scheduledSending`;
        ScheduledSending response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates the scheduled sending rules for an envelope's workflow.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + payload - An object that describes the settings for scheduled sending.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/envelopes/[string envelopeId]/workflow/scheduledSending(ScheduledSending payload) returns ScheduledSending|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/scheduledSending`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        ScheduledSending response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Deletes the scheduled sending rules for the envelope's workflow.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/envelopes/[string envelopeId]/workflow/scheduledSending() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/scheduledSending`;
        return self.clientEp->delete(resourcePath);
    }

    # Adds a new step to an envelope's workflow.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/envelopes/[string envelopeId]/workflow/steps(WorkflowStep payload) returns WorkflowStep|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/steps`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        WorkflowStep response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Returns a specified workflow step for a specified template.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + workflowStepId - The ID of the workflow step.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/workflow/steps/[string workflowStepId]() returns WorkflowStep|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/steps/${getEncodedUri(workflowStepId)}`;
        WorkflowStep response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates the specified workflow step for an envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + workflowStepId - The ID of the workflow step.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/envelopes/[string envelopeId]/workflow/steps/[string workflowStepId](WorkflowStep payload) returns WorkflowStep|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/steps/${getEncodedUri(workflowStepId)}`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        WorkflowStep response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Deletes a workflow step from an envelope's workflow definition.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + workflowStepId - The ID of the workflow step.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/envelopes/[string envelopeId]/workflow/steps/[string workflowStepId]() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/steps/${getEncodedUri(workflowStepId)}`;
        return self.clientEp->delete(resourcePath);
    }

    # Returns the delayed routing rules for an envelope's workflow step definition.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + workflowStepId - The ID of the workflow step.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/[string envelopeId]/workflow/steps/[string workflowStepId]/delayedRouting() returns DelayedRouting|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/steps/${getEncodedUri(workflowStepId)}/delayedRouting`;
        DelayedRouting response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates the delayed routing rules for an envelope's workflow step definition.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + workflowStepId - The ID of the workflow step.
    # + payload - A complex element that specifies the delayed routing settings for the workflow step.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/envelopes/[string envelopeId]/workflow/steps/[string workflowStepId]/delayedRouting(DelayedRouting payload) returns DelayedRouting|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/steps/${getEncodedUri(workflowStepId)}/delayedRouting`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        DelayedRouting response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Deletes the delayed routing rules for the specified envelope workflow step.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeId - The envelope's GUID. 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    # + workflowStepId - The ID of the workflow step.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/envelopes/[string envelopeId]/workflow/steps/[string workflowStepId]/delayedRouting() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/steps/${getEncodedUri(workflowStepId)}/delayedRouting`;
        return self.clientEp->delete(resourcePath);
    }

    # Gets envelope statuses for a set of envelopes.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + ac_status - Specifies the Authoritative Copy Status for the envelopes. Valid values: 
    # - `Unknown`
    # - `Original`
    # - `Transferred`
    # - `AuthoritativeCopy`
    # - `AuthoritativeCopyExportPending`
    # - `AuthoritativeCopyExported`
    # - `DepositPending`
    # - `Deposited`
    # - `DepositedEO`
    # - `DepositFailed`
    # + block - When **true,** removes any results that match one of the provided `transaction_ids`.
    # + count - The maximum number of results to return.
    # Use `start_position` to specify the number of results to skip.
    # + email - The email address of the sender.
    # + envelope_ids - The envelope IDs to include in the results.
    # The value of this property can be:
    # - A comma-separated list of envelope IDs
    # - The special value `request_body`. In this case, the method uses the envelope IDs in the request body.
    # + from_date - The date/time setting that specifies when the request begins checking for status changes for envelopes in the account. This is required unless parameters `envelope_ids` and/or `transaction_Ids` are provided.
    # **Note:** This parameter must be set to a valid  `DateTime`, or  `envelope_ids` and/or `transaction_ids` must be specified.
    # + from_to_status - The envelope status that you are checking for. Possible values are:
    # - `Changed` (default)
    # - `Completed`
    # - `Created`
    # - `Declined`
    # - `Deleted`
    # - `Delivered`
    # - `Processing`
    # - `Sent`
    # - `Signed`
    # - `TimedOut`
    # - `Voided`
    # For example, if you specify `Changed`, this method
    # returns a list of envelopes that changed status
    # during the `from_date` to `to_date` time period. 
    # + start_position - The zero-based index of the
    # result from which to start returning results.
    # Use with `count` to limit the number
    # of results.
    # The default value is `0`.
    # + status - A comma-separated list of envelope status to search for. Possible values are:
    # - `completed`
    # - `created`
    # - `declined`
    # - `deleted`
    # - `delivered`
    # - `processing`
    # - `sent`
    # - `signed`
    # - `template`
    # - `voided`
    # + to_date - Optional date/time setting
    # that specifies the last date/time 
    # or envelope status changes in the result set. 
    # The default value is the time that you call the method. 
    # + transaction_ids - The transaction IDs to include in the results. Note that transaction IDs are valid for seven days.
    # The value of this property can be:
    # - A list of comma-separated transaction IDs
    # - The special value `request_body`. In this case, this method uses the transaction IDs in the request body.
    # + user_name - Limits results to envelopes
    # sent by the account user
    # with this user name.
    # `email` must be given as well,
    # and both `email` and `user_name`
    # must refer to an existing account user.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/envelopes/status(EnvelopeIdsRequest payload, string? ac_status = (), string? block = (), string? count = (), string? email = (), string? envelope_ids = (), string? from_date = (), string? from_to_status = (), string? start_position = (), string? status = (), string? to_date = (), string? transaction_ids = (), string? user_name = ()) returns EnvelopesInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/status`;
        map<anydata> queryParam = {"ac_status": ac_status, "block": block, "count": count, "email": email, "envelope_ids": envelope_ids, "from_date": from_date, "from_to_status": from_to_status, "start_position": start_position, "status": status, "to_date": to_date, "transaction_ids": transaction_ids, "user_name": user_name};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopesInformation response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Gets envelope transfer rules.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + count - The maximum number of results to return.
    # Use `start_position` to specify the number of results to skip.
    # + start_position - The zero-based index of the
    # result from which to start returning results.
    # Use with `count` to limit the number
    # of results.
    # The default value is `0`.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/envelopes/transfer_rules(string? count = (), string? start_position = ()) returns EnvelopeTransferRuleInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/transfer_rules`;
        map<anydata> queryParam = {"count": count, "start_position": start_position};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        EnvelopeTransferRuleInformation response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Changes the status of multiple envelope transfer rules.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/envelopes/transfer_rules(EnvelopeTransferRuleInformation payload) returns EnvelopeTransferRuleInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/transfer_rules`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeTransferRuleInformation response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Creates an envelope transfer rule.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/envelopes/transfer_rules(EnvelopeTransferRuleRequest payload) returns EnvelopeTransferRuleInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/transfer_rules`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeTransferRuleInformation response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Changes the status of an envelope transfer rule.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeTransferRuleId - The ID of the envelope transfer rule. The system generates this ID when the rule is first created.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/envelopes/transfer_rules/[string envelopeTransferRuleId](EnvelopeTransferRule payload) returns EnvelopeTransferRule|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/transfer_rules/${getEncodedUri(envelopeTransferRuleId)}`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeTransferRule response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Deletes an envelope transfer rule.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + envelopeTransferRuleId - The ID of the envelope transfer rule. The system generates this ID when the rule is first created.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/envelopes/transfer_rules/[string envelopeTransferRuleId]() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/transfer_rules/${getEncodedUri(envelopeTransferRuleId)}`;
        return self.clientEp->delete(resourcePath);
    }

    # Retrieves the list of favorite templates for the account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/favorite_templates() returns FavoriteTemplatesInfo|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/favorite_templates`;
        FavoriteTemplatesInfo response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Set one or more templates as account favorites.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/favorite_templates(FavoriteTemplatesInfo payload) returns FavoriteTemplatesInfo|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/favorite_templates`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        FavoriteTemplatesInfo response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Remove one or more templates from the account favorites.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/favorite_templates(FavoriteTemplatesInfo payload) returns FavoriteTemplatesInfo|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/favorite_templates`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        FavoriteTemplatesInfo response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Returns a list of the account's folders.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + count - The maximum number of results to return.
    # + include - A comma-separated list of folder types to include in the response.
    # Valid values are:
    # - `envelope_folders`: Returns a list of envelope folders. (Default)
    # - `template_folders`: Returns a list of template folders. 
    # - `shared_template_folders`: Returns a list of shared template folders.
    # + include_items - Indicates whether folder items are included in the response. If this parameter is omitted, the default is false.
    # + start_position - The zero-based index of the
    # result from which to start returning results.
    # The default value is `0`.
    # + sub_folder_depth - If missing or any value other than `-1`, the returned list contains only the top-level folders.
    # A value of `-1` returns the complete folder hierarchy.
    # + template - This parameter is deprecated as of version 2.1. Use `include` instead.
    # + user_filter - Narrows down the resulting folder list by the following values:
    # - `all`: Returns all templates owned or shared with the user. (default)
    # - `owned_by_me`: Returns only  templates the user owns.
    # - `shared_with_me`: Returns only templates that are shared with the user.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/folders(string? count = (), string? include = (), string? include_items = (), string? start_position = (), string? sub_folder_depth = (), string? template = (), string? user_filter = ()) returns FoldersResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/folders`;
        map<anydata> queryParam = {"count": count, "include": include, "include_items": include_items, "start_position": start_position, "sub_folder_depth": sub_folder_depth, "template": template, "user_filter": user_filter};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        FoldersResponse response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Gets information about items in a specified folder. 
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + folderId - The ID of the folder.
    # + from_date - Reserved for DocuSign.
    # + include_items - Indicates whether folder items are included in the response. If this parameter is omitted, the default is false.
    # + owner_email - Reserved for DocuSign.
    # + owner_name - Reserved for DocuSign.
    # + search_text - Reserved for DocuSign.
    # + start_position - Reserved for DocuSign.
    # + status - Reserved for DocuSign.
    # + to_date - Reserved for DocuSign.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/folders/[string folderId](string? from_date = (), string? include_items = (), string? owner_email = (), string? owner_name = (), string? search_text = (), string? start_position = (), string? status = (), string? to_date = ()) returns FolderItemsResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/folders/${getEncodedUri(folderId)}`;
        map<anydata> queryParam = {"from_date": from_date, "include_items": include_items, "owner_email": owner_email, "owner_name": owner_name, "search_text": search_text, "start_position": start_position, "status": status, "to_date": to_date};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        FolderItemsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Moves a set of envelopes from their current folder to another folder.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + folderId - The ID of the folder.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/folders/[string folderId](FoldersRequest payload) returns FoldersResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/folders/${getEncodedUri(folderId)}`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        FoldersResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Gets information about groups associated with the account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + count - The maximum number of results to return.
    # Use `start_position` to specify the number of results to skip.
    # Valid values: `1` to `100`
    # + group_type - The type of group to return. Valid values:
    # * `AdminGroup`
    # * `CustomGroup`
    # * `EveryoneGroup`
    # + include_usercount - When **true,** every group returned in the response includes a `userCount` property that contains the total number of users in the group. The default is **true.**
    # + search_text - Filters the results of a GET request based on the text that you specify.
    # + start_position - The zero-based index of the
    # result from which to start returning results.
    # Use with `count` to limit the number
    # of results.
    # The default value is `0`.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/groups(string? count = (), string? group_type = (), string? include_usercount = (), string? search_text = (), string? start_position = ()) returns GroupInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups`;
        map<anydata> queryParam = {"count": count, "group_type": group_type, "include_usercount": include_usercount, "search_text": search_text, "start_position": start_position};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        GroupInformation response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates the group information for a group.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/groups(GroupInformation payload) returns GroupInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        GroupInformation response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Creates one or more groups for the account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/groups(GroupInformation payload) returns GroupInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        GroupInformation response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Deletes an existing user group.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/groups(GroupInformation payload) returns GroupInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        GroupInformation response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Gets the brand information for a group.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + groupId - The ID of the group.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/groups/[string groupId]/brands() returns GroupBrands|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups/${getEncodedUri(groupId)}/brands`;
        GroupBrands response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Adds an existing brand to a group.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + groupId - The ID of the group being accessed.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/groups/[string groupId]/brands(BrandsRequest payload) returns GroupBrands|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups/${getEncodedUri(groupId)}/brands`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        GroupBrands response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Deletes brand information from a group.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + groupId - The ID of the group.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/groups/[string groupId]/brands(BrandsRequest payload) returns GroupBrands|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups/${getEncodedUri(groupId)}/brands`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        GroupBrands response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Gets a list of users in a group.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + groupId - The ID of the group being accessed.
    # + count - The maximum number of results to return.
    # Use `start_position` to specify the number of results to skip.
    # Valid values: `1` to `100`
    # + start_position - The zero-based index of the
    # result from which to start returning results.
    # Use with `count` to limit the number
    # of results.
    # The default value is `0`.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/groups/[string groupId]/users(string? count = (), string? start_position = ()) returns UsersResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups/${getEncodedUri(groupId)}/users`;
        map<anydata> queryParam = {"count": count, "start_position": start_position};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        UsersResponse response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Adds one or more users to an existing group.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + groupId - The ID of the group being accessed.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/groups/[string groupId]/users(UserInfoList payload) returns UsersResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups/${getEncodedUri(groupId)}/users`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        UsersResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Deletes one or more users from a group
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + groupId - The ID of the group being accessed.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/groups/[string groupId]/users(UserInfoList payload) returns UsersResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups/${getEncodedUri(groupId)}/users`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        UsersResponse response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Retrieves the Identity Verification workflows available to an account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + identity_verification_workflow_status - Filters the workflows returned according to status. Valid values:
    # - `active`: Only active workflows are returned. This is the default.
    # - `deactivated`: Only deactivated workflows are returned.
    # - `all`: All workflows are returned.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/identity_verification(string? identity_verification_workflow_status = ()) returns AccountIdentityVerificationResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/identity_verification`;
        map<anydata> queryParam = {"identity_verification_workflow_status": identity_verification_workflow_status};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AccountIdentityVerificationResponse response = check self.clientEp->get(resourcePath);
        return response;
    }

    # List payment gateway accounts
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/payment_gateway_accounts() returns PaymentGatewayAccountsInfo|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/payment_gateway_accounts`;
        PaymentGatewayAccountsInfo response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Gets a list of permission profiles.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + include - A comma-separated list of additional properties to return in the response. Valid values are:
    # - `user_count`: The total number of users associated with the permission profile.
    # - `closed_users`: Includes closed users in the `user_count`.
    # - `account_management`: The account management settings.
    # - `metadata`: Metadata indicating whether the properties associated with the account permission profile are editable.
    # Example: `user_count,closed_users`
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/permission_profiles(string? include = ()) returns PermissionProfileInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/permission_profiles`;
        map<anydata> queryParam = {"include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PermissionProfileInformation response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Creates a new permission profile for an account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + include - A comma-separated list of additional properties to return in the response. The only valid value for this request is `metadata`, which returns metadata indicating whether the properties associated with the account permission profile are editable.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/permission_profiles(PermissionProfile payload, string? include = ()) returns PermissionProfile|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/permission_profiles`;
        map<anydata> queryParam = {"include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        PermissionProfile response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Returns a permission profile for an account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + permissionProfileId - The ID of the permission profile.
    # Use [AccountPermissionProfiles: list](/docs/esign-rest-api/reference/accounts/accountpermissionprofiles/list/)
    # to get a list of permission profiles and their IDs.
    # You can also download a CSV file of all permission profiles
    # and their IDs from the **Settings > Permission Profiles** page
    # of your eSignature account page.
    # + include - A comma-separated list of additional properties to return in the response. The only valid value for this request is `metadata`, which returns metadata indicating whether the properties associated with the account permission profile are editable.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/permission_profiles/[string permissionProfileId](string? include = ()) returns PermissionProfile|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/permission_profiles/${getEncodedUri(permissionProfileId)}`;
        map<anydata> queryParam = {"include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PermissionProfile response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates a permission profile.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + permissionProfileId - The ID of the permission profile.
    # Use [AccountPermissionProfiles: list](/docs/esign-rest-api/reference/accounts/accountpermissionprofiles/list/)
    # to get a list of permission profiles and their IDs.
    # You can also download a CSV file of all permission profiles
    # and their IDs from the **Settings > Permission Profiles** page
    # of your eSignature account page.
    # + include - A comma-separated list of additional properties to return in the response. The only valid value for this request is `metadata`, which returns metadata indicating whether the properties associated with the account permission profile are editable.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/permission_profiles/[string permissionProfileId](PermissionProfile payload, string? include = ()) returns PermissionProfile|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/permission_profiles/${getEncodedUri(permissionProfileId)}`;
        map<anydata> queryParam = {"include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        PermissionProfile response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Deletes a permission profile from an account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + permissionProfileId - The ID of the permission profile.
    # Use [AccountPermissionProfiles: list](/docs/esign-rest-api/reference/accounts/accountpermissionprofiles/list/)
    # to get a list of permission profiles and their IDs.
    # You can also download a CSV file of all permission profiles
    # and their IDs from the **Settings > Permission Profiles** page
    # of your eSignature account page.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/permission_profiles/[string permissionProfileId](string? move_users_to = ()) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/permission_profiles/${getEncodedUri(permissionProfileId)}`;
        map<anydata> queryParam = {"move_users_to": move_users_to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        return self.clientEp->delete(resourcePath);
    }

    # Returns a list of PowerForms.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + from_date - The start date for a date range.
    # **Note:** If no value is provided, no date filtering is applied.
    # + 'order - The order in which to sort the results.
    # Valid values are: 
    # * `asc`: Ascending order.
    # * `desc`: Descending order. 
    # + order_by - The file attribute to use to sort the results.
    # Valid values are:
    # - `sender`
    # - `auth`
    # - `used`
    # - `remaining`
    # - `lastused`
    # - `status`
    # - `type`
    # - `templatename`
    # - `created`
    # + search_fields - A comma-separated list of additional properties to include in a search.
    # - `sender`: Include sender name and email in the search.
    # - `recipients`: Include recipient names and emails in the search.
    # - `envelope`: Include envelope information in the search.
    # + search_text - Use this parameter to search for specific text.
    # + to_date - The end date for a date range.
    # **Note:** If no value is provided, this property defaults to the current date.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/powerforms(string? from_date = (), string? 'order = (), string? order_by = (), string? search_fields = (), string? search_text = (), string? to_date = ()) returns PowerFormsResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/powerforms`;
        map<anydata> queryParam = {"from_date": from_date, "order": 'order, "order_by": order_by, "search_fields": search_fields, "search_text": search_text, "to_date": to_date};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PowerFormsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Creates a new PowerForm
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + payload - Information about any PowerForms that are included in the envelope.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/powerforms(PowerForm payload) returns PowerForm|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/powerforms`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        PowerForm response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Deletes one or more PowerForms.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/powerforms(PowerFormsRequest payload) returns PowerFormsResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/powerforms`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        PowerFormsResponse response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Returns a single PowerForm.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + powerFormId - The ID of the PowerForm.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/powerforms/[string powerFormId]() returns PowerForm|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/powerforms/${getEncodedUri(powerFormId)}`;
        PowerForm response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates an existing PowerForm.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + powerFormId - The ID of the PowerForm.
    # + payload - Information about any PowerForms that are included in the envelope.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/powerforms/[string powerFormId](PowerForm payload) returns PowerForm|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/powerforms/${getEncodedUri(powerFormId)}`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        PowerForm response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Deletes a PowerForm.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + powerFormId - The ID of the PowerForm.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/powerforms/[string powerFormId]() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/powerforms/${getEncodedUri(powerFormId)}`;
        return self.clientEp->delete(resourcePath);
    }

    # Returns the data that users entered in a PowerForm.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + powerFormId - The ID of the PowerForm.
    # + data_layout - The layout in which to return the PowerForm data. Valid values are:
    # - `Native`
    # - `Csv_Classic`
    # - `Csv_One_Envelope_Per_Line`
    # - `Xml_Classic`
    # + from_date - The start date for a date range in UTC DateTime format.
    # **Note:** If this property is null, no date filtering is applied.
    # + to_date - The end date of a date range in UTC DateTime format. The default value is `UtcNow`.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/powerforms/[string powerFormId]/form_data(string? data_layout = (), string? from_date = (), string? to_date = ()) returns PowerFormsFormDataResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/powerforms/${getEncodedUri(powerFormId)}/form_data`;
        map<anydata> queryParam = {"data_layout": data_layout, "from_date": from_date, "to_date": to_date};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PowerFormsFormDataResponse response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Gets PowerForm senders.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + start_position - The position within the total result set from which to start returning values. The value **thumbnail** may be used to return the page image.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/powerforms/senders(string? start_position = ()) returns PowerFormSendersResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/powerforms/senders`;
        map<anydata> queryParam = {"start_position": start_position};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PowerFormSendersResponse response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Gets the recipient names associated with an email address.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + email - (Required) The email address for which you want to retrieve recipient names.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/recipient_names(string? email = ()) returns RecipientNamesResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/recipient_names`;
        map<anydata> queryParam = {"email": email};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        RecipientNamesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Returns available seals for specified account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/seals() returns AccountSealProviders|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/seals`;
        AccountSealProviders response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Deprecated. Use Envelopes: listStatusChanges.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + searchFolderId - Specifies the envelope group that is searched by the request. These are logical groupings, not actual folder names. Valid values are: drafts, awaiting_my_signature, completed, out_for_signature.
    # + all - Specifies that all envelopes that match the criteria are returned.
    # + count - The maximum number of results to return.
    # Use `start_position` to specify the number of results to skip.
    # Valid values: `1` to `100`
    # + from_date - Specifies the start of the date range to return. If no value is provided, the default search is the previous 30 days.
    # + include_recipients - When **true,** the recipient information is returned in the response.
    # + 'order - Specifies the order in which the list is returned. Valid values are: `asc` for ascending order, and `desc` for descending order.
    # + order_by - Specifies the property used to sort the list. Valid values are: `action_required`, `created`, `completed`, `sent`, `signer_list`, `status`, or `subject`.
    # + start_position - The zero-based index of the
    # result from which to start returning results.
    # Use with `count` to limit the number
    # of results.
    # The default value is `0`.
    # + to_date - Specifies the end of the date range to return.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/search_folders/[string searchFolderId](string? all = (), string? count = (), string? from_date = (), string? include_recipients = (), string? 'order = (), string? order_by = (), string? start_position = (), string? to_date = ()) returns FolderItemResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/search_folders/${getEncodedUri(searchFolderId)}`;
        map<anydata> queryParam = {"all": all, "count": count, "from_date": from_date, "include_recipients": include_recipients, "order": 'order, "order_by": order_by, "start_position": start_position, "to_date": to_date};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        FolderItemResponse response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Gets account settings information.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/settings() returns AccountSettingsInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings`;
        AccountSettingsInformation response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates the account settings for an account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/settings(AccountSettingsInformation payload) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request);
    }

    # Gets the BCC email archive configurations for an account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + count - The maximum number of results to return.
    # Use `start_position` to specify the number of results to skip.
    # + start_position - The zero-based index of the
    # result from which to start returning results.
    # Use with `count` to limit the number
    # of results.
    # The default value is `0`.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/settings/bcc_email_archives(string? count = (), string? start_position = ()) returns BccEmailArchiveList|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/bcc_email_archives`;
        map<anydata> queryParam = {"count": count, "start_position": start_position};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        BccEmailArchiveList response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Creates a BCC email archive configuration.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + payload - Boolean that specifies whether BCC for Email Archive is enabled for the account. BCC for Email Archive allows you to set up an archive email address so that a BCC copy of an envelope is sent only to that address.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/settings/bcc_email_archives(BccEmailArchive payload) returns BccEmailArchive|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/bcc_email_archives`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        BccEmailArchive response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Gets a BCC email archive configuration and its history.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + bccEmailArchiveId - The ID of the BCC email archive configuration.
    # + count - The maximum number of results to return.
    # Use `start_position` to specify the number of items to skip.
    # + start_position - The zero-based index of the
    # result from which to start returning results.
    # Use with `count` to limit the number
    # of results.
    # The default value is `0`.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/settings/bcc_email_archives/[string bccEmailArchiveId](string? count = (), string? start_position = ()) returns BccEmailArchiveHistoryList|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/bcc_email_archives/${getEncodedUri(bccEmailArchiveId)}`;
        map<anydata> queryParam = {"count": count, "start_position": start_position};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        BccEmailArchiveHistoryList response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Deletes a BCC email archive configuration.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + bccEmailArchiveId - The ID of the BCC email archive configuration.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/settings/bcc_email_archives/[string bccEmailArchiveId]() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/bcc_email_archives/${getEncodedUri(bccEmailArchiveId)}`;
        return self.clientEp->delete(resourcePath);
    }

    # Returns the configuration information for the eNote eOriginal integration.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/settings/enote_configuration() returns ENoteConfiguration|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/enote_configuration`;
        ENoteConfiguration response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates configuration information for the eNote eOriginal integration.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/settings/enote_configuration(ENoteConfiguration payload) returns ENoteConfiguration|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/enote_configuration`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        ENoteConfiguration response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Deletes configuration information for the eNote eOriginal integration.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/settings/enote_configuration() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/enote_configuration`;
        return self.clientEp->delete(resourcePath);
    }

    # Gets the envelope purge configuration for an account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/settings/envelope_purge_configuration() returns EnvelopePurgeConfiguration|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/envelope_purge_configuration`;
        EnvelopePurgeConfiguration response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Sets the envelope purge configuration for an account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/settings/envelope_purge_configuration(EnvelopePurgeConfiguration payload) returns EnvelopePurgeConfiguration|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/envelope_purge_configuration`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopePurgeConfiguration response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Gets envelope notification defaults.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/settings/notification_defaults() returns NotificationDefaults|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/notification_defaults`;
        NotificationDefaults response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates envelope notification default settings.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/settings/notification_defaults(NotificationDefaults payload) returns NotificationDefaults|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/notification_defaults`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        NotificationDefaults response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Gets the password rules for an account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/settings/password_rules() returns AccountPasswordRules|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/password_rules`;
        AccountPasswordRules response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates the password rules for an account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/settings/password_rules(AccountPasswordRules payload) returns AccountPasswordRules|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/password_rules`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        AccountPasswordRules response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Returns tab settings list for specified account
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/settings/tabs() returns TabAccountSettings|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/tabs`;
        TabAccountSettings response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Modifies tab settings for specified account
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + payload - Account-wide tab settings.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/settings/tabs(TabAccountSettings payload) returns TabAccountSettings|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/tabs`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        TabAccountSettings response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Reserved: Gets the shared item status for one or more users.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + count - The maximum number of results to return.
    # Use `start_position` to specify the number of results to skip.
    # Default: `1000`
    # + envelopes_not_shared_user_status - This query parameter works in conjunction with `user_ids`. When you specify one of the following user statuses, the query limits the results to only users that match the specified status:
    # - `ActivationRequired`: Membership Activation required
    # - `ActivationSent`: Membership activation sent to user
    # - `Active`: User Membership is active
    # - `Closed`: User Membership is closed
    # - `Disabled`: User Membership is disabled
    # + folder_ids - A comma-separated list of folder IDs for which to return shared item information. If `item_type` is set to `folders`, at least one folder ID is required.
    # + item_type - Specifies the type of shared item being requested. Valid values:
    # - `envelopes`: Get information about envelope sharing between users.
    # - `templates`: Get information about template sharing among users and groups.
    # - `folders`: Get information about folder sharing among users and groups.
    # + search_text - Filter user names based on the specified string. The wild-card '*' (asterisk) can be used in the string.
    # + shared - A comma-separated list of sharing filters that specifies which users appear in the response. 
    # - `not_shared`: The response lists users who do not share items of `item_type` with the current user.
    # - `shared_to`: The response lists users in `user_list` who are sharing items to current user.
    # - `shared_from`: The response lists users in `user_list` who are sharing items from the current user.
    # - `shared_to_and_from`: The response lists users in `user_list` who are sharing items to and from the current user.
    # If the current user does not have administrative privileges, only the `shared_to` option is valid.
    # + start_position - The zero-based index of the
    # result from which to start returning results.
    # Use with `count` to limit the number
    # of results.
    # The default value is `0`.
    # + user_ids - A comma-separated list of user IDs for whom the shared item information is being requested.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/shared_access(string? count = (), string? envelopes_not_shared_user_status = (), string? folder_ids = (), string? item_type = (), string? search_text = (), string? shared = (), string? start_position = (), string? user_ids = ()) returns AccountSharedAccess|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/shared_access`;
        map<anydata> queryParam = {"count": count, "envelopes_not_shared_user_status": envelopes_not_shared_user_status, "folder_ids": folder_ids, "item_type": item_type, "search_text": search_text, "shared": shared, "start_position": start_position, "user_ids": user_ids};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AccountSharedAccess response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Reserved: Sets the shared access information for users.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + item_type - Specifies the type of shared item being set:
    # - `envelopes`: Set envelope sharing between users.
    # - `templates`: Set information about template sharing among users and groups.
    # - `folders`: Get information about folder sharing among users and groups.
    # + preserve_existing_shared_access - When **true,** preserve the existing shared access settings.
    # + user_ids - A comma-separated list of IDs for users whose shared item access is being set.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/shared_access(AccountSharedAccess payload, string? item_type = (), string? preserve_existing_shared_access = (), string? user_ids = ()) returns AccountSharedAccess|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/shared_access`;
        map<anydata> queryParam = {"item_type": item_type, "preserve_existing_shared_access": preserve_existing_shared_access, "user_ids": user_ids};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        AccountSharedAccess response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Gets the available signature providers for an account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/signatureProviders() returns AccountSignatureProviders|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatureProviders`;
        AccountSignatureProviders response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Returns a list of stamps available in the account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + stamp_format - The format of the stamp to return. Valid values:
    # - `NameDateHanko`
    # - `NameHanko`
    # - `PlaceholderHanko`
    # + stamp_name - The name associated with the stamps to return. This value can be a Japanese surname (up to 5 characters) or a purchase order ID.
    # + stamp_type - The type of the stamps to return. Valid values:
    # - `name_stamp`
    # - `stamp`
    # - `signature`
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/signatures(string? stamp_format = (), string? stamp_name = (), string? stamp_type = ()) returns AccountSignaturesInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatures`;
        map<anydata> queryParam = {"stamp_format": stamp_format, "stamp_name": stamp_name, "stamp_type": stamp_type};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AccountSignaturesInformation response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates an account stamp.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/signatures(AccountSignaturesInformation payload) returns AccountSignaturesInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatures`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        AccountSignaturesInformation response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Adds or updates one or more account stamps.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/signatures(AccountSignaturesInformation payload, string? decode_only = ()) returns AccountSignaturesInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatures`;
        map<anydata> queryParam = {"decode_only": decode_only};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        AccountSignaturesInformation response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Returns information about the specified stamp.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + signatureId - The ID of the account stamp.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/signatures/[string signatureId]() returns AccountSignature|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatures/${getEncodedUri(signatureId)}`;
        AccountSignature response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates an account stamp by ID.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + signatureId - The ID of the account stamp.
    # + close_existing_signature - When **true,** closes the current signature.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/signatures/[string signatureId](AccountSignatureDefinition payload, string? close_existing_signature = ()) returns AccountSignature|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatures/${getEncodedUri(signatureId)}`;
        map<anydata> queryParam = {"close_existing_signature": close_existing_signature};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        AccountSignature response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Deletes an account stamp.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + signatureId - The ID of the account stamp.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/signatures/[string signatureId]() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatures/${getEncodedUri(signatureId)}`;
        return self.clientEp->delete(resourcePath);
    }

    # Returns the image for an account stamp.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + imageType - Specificies the type of image. Valid values:
    # - `stamp_image`
    # - `signature_image`
    # - `initials_image`
    # + signatureId - The ID of the account stamp.
    # + include_chrome - When **true,** the chrome (or frame containing the added line and identifier) is included with the signature image.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/signatures/[string signatureId]/[string imageType](string? include_chrome = ()) returns byte[]|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatures/${getEncodedUri(signatureId)}/${getEncodedUri(imageType)}`;
        map<anydata> queryParam = {"include_chrome": include_chrome};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        byte[] response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Sets a signature image, initials, or stamp.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + imageType - Specificies the type of image. Valid values:
    # - `stamp_image`
    # - `signature_image`
    # - `initials_image`
    # + signatureId - The ID of the account stamp.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/signatures/[string signatureId]/[string imageType](string? transparent_png = ()) returns AccountSignature|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatures/${getEncodedUri(signatureId)}/${getEncodedUri(imageType)}`;
        map<anydata> queryParam = {"transparent_png": transparent_png};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        AccountSignature response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Deletes the image for a stamp.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + imageType - Specificies the type of image. Valid values:
    # - `stamp_image`
    # - `signature_image`
    # - `initials_image`
    # + signatureId - The ID of the account stamp.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/signatures/[string signatureId]/[string imageType]() returns AccountSignature|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatures/${getEncodedUri(signatureId)}/${getEncodedUri(imageType)}`;
        AccountSignature response = check self.clientEp->delete(resourcePath);
        return response;
    }

    # Gets a list of the Signing Groups in an account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + group_type - Filters by the type of signing group. Valid values:
    # * `sharedSigningGroup`
    # * `privateSigningGroup`
    # * `systemSigningGroup`
    # + include_users - When **true,** the response includes the signing group members. 
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/signing_groups(string? group_type = (), string? include_users = ()) returns SigningGroupInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signing_groups`;
        map<anydata> queryParam = {"group_type": group_type, "include_users": include_users};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SigningGroupInformation response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates signing group names.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/signing_groups(SigningGroupInformation payload) returns SigningGroupInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signing_groups`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        SigningGroupInformation response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Creates a signing group. 
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/signing_groups(SigningGroupInformation payload) returns SigningGroupInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signing_groups`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        SigningGroupInformation response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Deletes one or more signing groups.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/signing_groups(SigningGroupInformation payload) returns SigningGroupInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signing_groups`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        SigningGroupInformation response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Gets information about a signing group. 
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + signingGroupId - The ID of the [signing group](https://support.docusign.com/s/document-item?bundleId=gav1643676262430&topicId=zgn1578456447934.html).
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/signing_groups/[string signingGroupId]() returns SigningGroup|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signing_groups/${getEncodedUri(signingGroupId)}`;
        SigningGroup response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates a signing group. 
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + signingGroupId - The ID of the [signing group](https://support.docusign.com/s/document-item?bundleId=gav1643676262430&topicId=zgn1578456447934.html).
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/signing_groups/[string signingGroupId](SigningGroup payload) returns SigningGroup|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signing_groups/${getEncodedUri(signingGroupId)}`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        SigningGroup response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Gets a list of members in a Signing Group.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # such as Receives a Copy.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/signing_groups/[string signingGroupId]/users() returns SigningGroupUsers|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signing_groups/${getEncodedUri(signingGroupId)}/users`;
        SigningGroupUsers response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Adds members to a signing group. 
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # such as Receives a Copy.
    # + payload - A complex type that contains information about users in the signing group.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/signing_groups/[string signingGroupId]/users(SigningGroupUsers payload) returns SigningGroupUsers|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signing_groups/${getEncodedUri(signingGroupId)}/users`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        SigningGroupUsers response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Deletes  one or more members from a signing group.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # such as Receives a Copy.
    # + payload - A complex type that contains information about users in the signing group.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/signing_groups/[string signingGroupId]/users(SigningGroupUsers payload) returns SigningGroupUsers|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signing_groups/${getEncodedUri(signingGroupId)}/users`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        SigningGroupUsers response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Gets the supported languages for envelope recipients.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/supported_languages() returns SupportedLanguages|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/supported_languages`;
        SupportedLanguages response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Gets a list of all account tabs.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + custom_tab_only - When **true,** only custom tabs are returned in the response. 
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/tab_definitions(string? custom_tab_only = ()) returns TabMetadataList|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/tab_definitions`;
        map<anydata> queryParam = {"custom_tab_only": custom_tab_only};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TabMetadataList response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Creates a custom tab.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/tab_definitions(TabMetadata payload) returns TabMetadata|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/tab_definitions`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        TabMetadata response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Gets custom tab information.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + customTabId - The DocuSign-generated custom tab ID for the custom tab to be applied. This can only be used when adding new tabs for a recipient. When used, the new tab inherits all the custom tab properties.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/tab_definitions/[string customTabId]() returns TabMetadata|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/tab_definitions/${getEncodedUri(customTabId)}`;
        TabMetadata response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates custom tab information.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + customTabId - The DocuSign-generated custom tab ID for the custom tab to be applied. This can only be used when adding new tabs for a recipient. When used, the new tab inherits all the custom tab properties.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/tab_definitions/[string customTabId](TabMetadata payload) returns TabMetadata|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/tab_definitions/${getEncodedUri(customTabId)}`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        TabMetadata response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Deletes custom tab information.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + customTabId - The DocuSign-generated custom tab ID for the custom tab to be applied. This can only be used when adding new tabs for a recipient. When used, the new tab inherits all the custom tab properties.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/tab_definitions/[string customTabId]() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/tab_definitions/${getEncodedUri(customTabId)}`;
        return self.clientEp->delete(resourcePath);
    }

    # Gets the list of templates.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + count - The maximum number of results to return.
    # Use `start_position` to specify the number of results to skip.
    # + created_from_date - Lists templates created on or after this date.
    # + created_to_date - Lists templates modified before this date.
    # + folder_ids - A comma-separated list of folder ID GUIDs.
    # + folder_types - The type of folder to return templates for. Possible values are:
    # - `templates`: Templates in the **My Templates** folder.
    # Templates in the **Shared Templates**  and **All Template** folders (if the request ID from and Admin) are excluded.
    # - `templates_root`: Templates in the root level of the **My Templates** folder, but not in an actual folder. Note that the **My Templates** folder is not a real folder.
    # - `recylebin`: Templates that have been deleted.
    # + from_date - Start of the search date range. Only returns templates created on or after this date/time. If no value is specified, there is no limit on the earliest date created.
    # + include - A comma-separated list
    # of additional template attributes
    # to include in the response.
    # Valid values are:
    # - `powerforms`: Includes details about the PowerForms associated with the templates.
    # - `documents`: Includes information about template documents.
    # - `folders`: Includes information about the folder that holds the template.
    # - `favorite_template_status`: Includes the template `favoritedByMe` property. **Note:** You can mark a template as a favorite only in eSignature v2.1.
    # - `advanced_templates`: Includes information about advanced templates.
    # - `recipients`: Includes information about template recipients.
    # - `custom_fields`: Includes information about template custom fields.
    # - `notifications`: Includes information about the notification settings for templates.
    # + is_deleted_template_only - When **true,** retrieves templates that have been permanently deleted. The default is **false.**
    # **Note:** After you delete a template, you can see it in the `Deleted` bin in the UI for 24 hours. After 24 hours, the template is permanently deleted.
    # + is_download - When **true,** downloads the templates listed in `template_ids` as a collection of JSON definitions in a single zip file.
    # The `Content-Disposition` header is set in the response. The value of the header provides the filename of the file.
    # The default is **false.**
    # **Note:** This parameter only works when you specify a list of templates in the `template_ids` parameter.
    # + modified_from_date - Lists templates modified on or after this date.
    # + modified_to_date - Lists templates modified before this date.
    # + 'order - Specifies the sort order of the search results.
    # Valid values are:
    # - `asc`: Ascending (A to Z)
    # - `desc`: Descending (Z to A)
    # + order_by - Specifies how the search results are listed.
    # Valid values are:
    # - `name`: template name
    # - `modified`: date/time template was last modified
    # - `used`: date/time the template was last used.
    # + search_fields - A comma-separated list of additional template properties to search.
    # - `sender`: Include sender name and email in the search.
    # - `recipients`: Include recipient names and emails in the search.
    # - `envelope`: Not used in template searches.
    # + search_text - The text to use to search the names of templates.
    # Limit: 48 characters.
    # + shared_by_me - When **true,** the response only includes templates shared by the user. When **false,** the response only returns template not shared by the user. If not specified, templates are returned whether or not they have been shared by the user.
    # + start_position - The zero-based index of the
    # result from which to start returning results.
    # Use with `count` to limit the number
    # of results.
    # The default value is `0`.
    # + template_ids - A comma-separated list of template IDs to download. This value is valid only when `is_download` is **true.**
    # + to_date - The end of a search date range in UTC DateTime format. When you use this parameter, only templates created up to this date and time are returned.
    # **Note:** If this property is null, the value defaults to the current date.
    # + used_from_date - Start of the search date range. Only returns templates used or edited on or after this date/time. If no value is specified, there is no limit on the earliest date used.
    # + used_to_date - End of the search date range. Only returns templates used or edited up to this date/time. If no value is provided, this defaults to the current date.
    # + user_filter - Filters the templates in the response. Valid values are: 
    # - `owned_by_me`: Results include only templates owned by the user.
    # - `shared_with_me`: Results include only templates shared with the user.  
    # - `all`:  Results include all templates owned or shared with the user.
    # + user_id - The ID of the user.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/templates(string? count = (), string? created_from_date = (), string? created_to_date = (), string? folder_ids = (), string? folder_types = (), string? from_date = (), string? include = (), string? is_deleted_template_only = (), string? is_download = (), string? modified_from_date = (), string? modified_to_date = (), string? 'order = (), string? order_by = (), string? search_fields = (), string? search_text = (), string? shared_by_me = (), string? start_position = (), string? template_ids = (), string? to_date = (), string? used_from_date = (), string? used_to_date = (), string? user_filter = (), string? user_id = ()) returns EnvelopeTemplateResults|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates`;
        map<anydata> queryParam = {"count": count, "created_from_date": created_from_date, "created_to_date": created_to_date, "folder_ids": folder_ids, "folder_types": folder_types, "from_date": from_date, "include": include, "is_deleted_template_only": is_deleted_template_only, "is_download": is_download, "modified_from_date": modified_from_date, "modified_to_date": modified_to_date, "order": 'order, "order_by": order_by, "search_fields": search_fields, "search_text": search_text, "shared_by_me": shared_by_me, "start_position": start_position, "template_ids": template_ids, "to_date": to_date, "used_from_date": used_from_date, "used_to_date": used_to_date, "user_filter": user_filter, "user_id": user_id};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        EnvelopeTemplateResults response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Creates one or more templates.
    #
    # + accountId - (Required) The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/templates(EnvelopeTemplate payload) returns TemplateSummary|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        TemplateSummary response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Gets a specific template associated with a specified account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + include - A comma-separated list
    # of additional template attributes
    # to include in the response.
    # Valid values are:
    # - `powerforms`: Includes information about PowerForms.
    # - `tabs`: Includes information about tabs.
    # - `documents`: Includes information about documents.
    # - `favorite_template_status`: : Includes the template `favoritedByMe` property in the response. **Note:** You can mark a template as a favorite only in eSignature v2.1.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/templates/[string templateId](string? include = ()) returns EnvelopeTemplate|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}`;
        map<anydata> queryParam = {"include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        EnvelopeTemplate response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates an existing template.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/templates/[string templateId](EnvelopeTemplate payload) returns TemplateUpdateSummary|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        TemplateUpdateSummary response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Shares a template with a group.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + templatePart - Currently, the only defined part is **groups.**
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/templates/[string templateId]/[string templatePart](GroupInformation payload) returns GroupInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/${getEncodedUri(templatePart)}`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        GroupInformation response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Removes a member group's sharing permissions for a template.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + templatePart - Currently, the only defined part is **groups.**
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/templates/[string templateId]/[string templatePart](GroupInformation payload) returns GroupInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/${getEncodedUri(templatePart)}`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        GroupInformation response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Gets the custom document fields from a template.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/templates/[string templateId]/custom_fields() returns CustomFields|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/custom_fields`;
        CustomFields response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates envelope custom fields in a template.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/templates/[string templateId]/custom_fields(TemplateCustomFields payload) returns CustomFields|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/custom_fields`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        CustomFields response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Creates custom document fields in an existing template document.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/templates/[string templateId]/custom_fields(TemplateCustomFields payload) returns CustomFields|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/custom_fields`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        CustomFields response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Deletes envelope custom fields in a template.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/templates/[string templateId]/custom_fields(TemplateCustomFields payload) returns CustomFields|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/custom_fields`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        CustomFields response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Gets a list of documents associated with a template.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + include_tabs - Reserved for DocuSign.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/templates/[string templateId]/documents(string? include_tabs = ()) returns TemplateDocumentsResult|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents`;
        map<anydata> queryParam = {"include_tabs": include_tabs};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TemplateDocumentsResult response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Adds documents to a template document.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/templates/[string templateId]/documents(EnvelopeDefinition payload) returns TemplateDocumentsResult|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        TemplateDocumentsResult response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Deletes documents from a template.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/templates/[string templateId]/documents(EnvelopeDefinition payload) returns TemplateDocumentsResult|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        TemplateDocumentsResult response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Gets PDF documents from a template.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + templateId - The ID of the template.
    # + encrypt - When **true,** the PDF bytes returned in the response are encrypted for all the key managers configured on your DocuSign account. You can decrypt the documents by using the Key Manager DecryptDocument API method. For more information about Key Manager, see the DocuSign Security Appliance Installation Guide that your organization received from DocuSign.
    # + show_changes - When **true,** any document fields that a recipient changed are highlighted in yellow in the returned PDF document, and optional signatures or initials are outlined in red.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/templates/[string templateId]/documents/[string documentId](string? encrypt = (), string? file_type = (), string? show_changes = ()) returns byte[]|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}`;
        map<anydata> queryParam = {"encrypt": encrypt, "file_type": file_type, "show_changes": show_changes};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        byte[] response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates a template document.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/templates/[string templateId]/documents/[string documentId](EnvelopeDefinition payload, string? is_envelope_definition = ()) returns EnvelopeDocument|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}`;
        map<anydata> queryParam = {"is_envelope_definition": is_envelope_definition};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeDocument response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Gets the custom document fields for a an existing template document.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/fields() returns DocumentFieldsInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/fields`;
        DocumentFieldsInformation response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates existing custom document fields in an existing template document.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/fields(DocumentFieldsInformation payload) returns DocumentFieldsInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/fields`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        DocumentFieldsInformation response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Creates custom document fields in an existing template document.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/fields(DocumentFieldsInformation payload) returns DocumentFieldsInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/fields`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        DocumentFieldsInformation response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Deletes custom document fields from an existing template document.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/fields(DocumentFieldsInformation payload) returns DocumentFieldsInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/fields`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        DocumentFieldsInformation response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Gets the Original HTML Definition used to generate the Responsive HTML for a given document in a template.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/html_definitions() returns DocumentHtmlDefinitionOriginals|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/html_definitions`;
        DocumentHtmlDefinitionOriginals response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Returns document page images based on input.
    #
    # + accountId - (Required) The external account number (int) or account ID GUID.
    # + documentId - (Required) The ID of the document.
    # + templateId - (Required) The ID of the template.
    # + count - The maximum number of results to return.
    # + dpi - The number of dots per inch (DPI) for the resulting images. Valid values are 1-310 DPI. The default value is 94.
    # + max_height - Sets the maximum height of the returned images in pixels.
    # + max_width - Sets the maximum width of the returned images in pixels.
    # + nocache - When **true,** using cache is disabled and image information is retrieved from a database. **True** is the default value. 
    # + show_changes - When **true,** changes display in the user interface.
    # + start_position - The position within the total result set from which to start returning values. The value **thumbnail** may be used to return the page image.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/pages(string? count = (), string? dpi = (), string? max_height = (), string? max_width = (), string? nocache = (), string? show_changes = (), string? start_position = ()) returns PageImages|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/pages`;
        map<anydata> queryParam = {"count": count, "dpi": dpi, "max_height": max_height, "max_width": max_width, "nocache": nocache, "show_changes": show_changes, "start_position": start_position};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PageImages response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Deletes a page from a document in an template.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + pageNumber - The page number being accessed.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/pages/[string pageNumber](PageRequest payload) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/pages/${getEncodedUri(pageNumber)}`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request);
    }

    # Gets a page image from a template for display.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + pageNumber - The page number being accessed.
    # + templateId - The ID of the template.
    # + dpi - The number of dots per inch (DPI) for the resulting images. Valid values are 1-310 DPI. The default value is 94.
    # + max_height - Sets the maximum height of the returned images in pixels.
    # + max_width - Sets the maximum width of the returned images in pixels.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/pages/[string pageNumber]/page_image(string? dpi = (), string? max_height = (), string? max_width = (), string? show_changes = ()) returns byte[]|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/pages/${getEncodedUri(pageNumber)}/page_image`;
        map<anydata> queryParam = {"dpi": dpi, "max_height": max_height, "max_width": max_width, "show_changes": show_changes};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        byte[] response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Rotates page image from a template for display.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + pageNumber - The page number being accessed.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/pages/[string pageNumber]/page_image(PageRequest payload) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/pages/${getEncodedUri(pageNumber)}/page_image`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request);
    }

    # Returns tabs on the specified page.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + pageNumber - The page number being accessed.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/pages/[string pageNumber]/tabs() returns TemplateDocumentTabs|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/pages/${getEncodedUri(pageNumber)}/tabs`;
        TemplateDocumentTabs response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Creates a preview of the responsive version of a template document.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/responsive_html_preview(DocumentHtmlDefinition payload) returns DocumentHtmlDefinitions|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/responsive_html_preview`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        DocumentHtmlDefinitions response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Returns tabs on a template.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + templateId - The ID of the template.
    # + page_numbers - Filters for tabs that occur on the pages that you specify. Enter as a comma-separated list of page Guids.
    # Example: `page_numbers=2,6`
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/tabs(string? page_numbers = ()) returns TemplateDocumentTabs|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/tabs`;
        map<anydata> queryParam = {"page_numbers": page_numbers};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TemplateDocumentTabs response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates the tabs for a template.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/tabs(TemplateTabs payload) returns Tabs|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/tabs`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Tabs response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Adds tabs to a document in a template.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/tabs(TemplateTabs payload) returns Tabs|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/tabs`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Tabs response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Deletes tabs from a template.
    #
    # + accountId - The external account number (int) or account ID GUID.
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
    # the tab.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/tabs(TemplateTabs payload) returns Tabs|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/tabs`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Tabs response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Gets the Original HTML Definition used to generate the Responsive HTML for the template.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/templates/[string templateId]/html_definitions() returns DocumentHtmlDefinitionOriginals|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/html_definitions`;
        DocumentHtmlDefinitionOriginals response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Gets template lock information.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/templates/[string templateId]/'lock() returns LockInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/lock`;
        LockInformation response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates a template lock.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/templates/[string templateId]/'lock(LockRequest payload) returns LockInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/lock`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        LockInformation response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Locks a template.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/templates/[string templateId]/'lock(LockRequest payload) returns LockInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/lock`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        LockInformation response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Deletes a template lock.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/templates/[string templateId]/'lock(LockRequest payload) returns LockInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/lock`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        LockInformation response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Gets template notification information.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/templates/[string templateId]/notification() returns Notification|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/notification`;
        Notification response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates the notification  structure for an existing template.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/templates/[string templateId]/notification(TemplateNotificationRequest payload) returns Notification|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/notification`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Notification response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Gets recipient information from a template.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + include_anchor_tab_locations - When **true** and `include_tabs` is set to **true,** all tabs with anchor tab properties are included in the response. 
    # + include_extended - When **true,** the extended properties are included in the response. 
    # + include_tabs - When **true,** the tab information associated with the recipient is included in the response.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/templates/[string templateId]/recipients(string? include_anchor_tab_locations = (), string? include_extended = (), string? include_tabs = ()) returns Recipients|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients`;
        map<anydata> queryParam = {"include_anchor_tab_locations": include_anchor_tab_locations, "include_extended": include_extended, "include_tabs": include_tabs};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Recipients response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates recipients in a template.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + resend_envelope - When **true,**
    # resends the envelope to the recipients
    # that you specify in the request body.
    # Use this parameter to resend the envelope
    # to a recipient
    # who deleted the original email notification.
    # **Note:** Correcting an envelope is a different process.
    # DocuSign always resends an envelope when you correct it,
    # regardless of the value that you enter here.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/templates/[string templateId]/recipients(TemplateRecipients payload, string? resend_envelope = ()) returns RecipientsUpdateSummary|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients`;
        map<anydata> queryParam = {"resend_envelope": resend_envelope};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        RecipientsUpdateSummary response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Adds tabs for a recipient.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + resend_envelope - When **true,**
    # resends the envelope to the recipients
    # that you specify in the request body.
    # Use this parameter to resend the envelope
    # to a recipient
    # who deleted the original email notification.
    # **Note:** Correcting an envelope is a different process.
    # DocuSign always resends an envelope when you correct it,
    # regardless of the value that you enter here.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/templates/[string templateId]/recipients(TemplateRecipients payload, string? resend_envelope = ()) returns Recipients|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients`;
        map<anydata> queryParam = {"resend_envelope": resend_envelope};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Recipients response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Deletes recipients from a template.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/templates/[string templateId]/recipients(TemplateRecipients payload) returns Recipients|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Recipients response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Deletes the specified recipient file from a template.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/templates/[string templateId]/recipients/[string recipientId](TemplateRecipients payload) returns Recipients|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients/${getEncodedUri(recipientId)}`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Recipients response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Returns document visibility for a template recipient
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/templates/[string templateId]/recipients/[string recipientId]/document_visibility() returns DocumentVisibilityList|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients/${getEncodedUri(recipientId)}/document_visibility`;
        DocumentVisibilityList response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates document visibility for a template recipient
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/templates/[string templateId]/recipients/[string recipientId]/document_visibility(TemplateDocumentVisibilityList payload) returns TemplateDocumentVisibilityList|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients/${getEncodedUri(recipientId)}/document_visibility`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        TemplateDocumentVisibilityList response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Gets the tabs information for a signer or sign-in-person recipient in a template.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`.
    # + templateId - The ID of the template.
    # + include_anchor_tab_locations - When **true,** all tabs with anchor tab properties are included in the response. The default value is **false.**
    # + include_metadata - When **true,** the response includes metadata indicating which properties are editable.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/templates/[string templateId]/recipients/[string recipientId]/tabs(string? include_anchor_tab_locations = (), string? include_metadata = ()) returns Tabs|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients/${getEncodedUri(recipientId)}/tabs`;
        map<anydata> queryParam = {"include_anchor_tab_locations": include_anchor_tab_locations, "include_metadata": include_metadata};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Tabs response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates the tabs for a recipient.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/templates/[string templateId]/recipients/[string recipientId]/tabs(TemplateTabs payload) returns Tabs|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients/${getEncodedUri(recipientId)}/tabs`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Tabs response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Adds tabs for a recipient.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/templates/[string templateId]/recipients/[string recipientId]/tabs(TemplateTabs payload) returns Tabs|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients/${getEncodedUri(recipientId)}/tabs`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Tabs response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Deletes the tabs associated with a recipient in a template.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + recipientId - A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/templates/[string templateId]/recipients/[string recipientId]/tabs(TemplateTabs payload) returns Tabs|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients/${getEncodedUri(recipientId)}/tabs`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Tabs response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Updates document visibility for template recipients
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/templates/[string templateId]/recipients/document_visibility(TemplateDocumentVisibilityList payload) returns TemplateDocumentVisibilityList|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients/document_visibility`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        TemplateDocumentVisibilityList response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Creates a preview of the responsive versions of all of the documents associated with a template.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/templates/[string templateId]/responsive_html_preview(DocumentHtmlDefinition payload) returns DocumentHtmlDefinitions|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/responsive_html_preview`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        DocumentHtmlDefinitions response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Gets a URL for a template edit view.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/templates/[string templateId]/views/edit(ReturnUrlRequest payload) returns ViewUrl|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/views/edit`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        ViewUrl response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Creates a template recipient preview.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/templates/[string templateId]/views/recipient_preview(RecipientPreviewRequest payload) returns ViewUrl|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/views/recipient_preview`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        ViewUrl response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Returns the workflow definition for a template.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/templates/[string templateId]/workflow() returns Workflow|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow`;
        Workflow response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates the workflow definition for a template.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/templates/[string templateId]/workflow(Workflow payload) returns Workflow|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Workflow response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Delete the workflow definition for a template.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/templates/[string templateId]/workflow() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow`;
        return self.clientEp->delete(resourcePath);
    }

    # Returns the scheduled sending rules for a template's workflow definition.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/templates/[string templateId]/workflow/scheduledSending() returns ScheduledSending|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/scheduledSending`;
        ScheduledSending response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates the scheduled sending rules for a template's workflow definition.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + payload - An object that describes the settings for scheduled sending.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/templates/[string templateId]/workflow/scheduledSending(ScheduledSending payload) returns ScheduledSending|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/scheduledSending`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        ScheduledSending response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Deletes the scheduled sending rules for the template's workflow.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/templates/[string templateId]/workflow/scheduledSending() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/scheduledSending`;
        return self.clientEp->delete(resourcePath);
    }

    # Adds a new step to a template's workflow.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/templates/[string templateId]/workflow/steps(WorkflowStep payload) returns WorkflowStep|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/steps`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        WorkflowStep response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Returns a specified workflow step for a specified envelope.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + workflowStepId - The ID of the workflow step.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/templates/[string templateId]/workflow/steps/[string workflowStepId]() returns WorkflowStep|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/steps/${getEncodedUri(workflowStepId)}`;
        WorkflowStep response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates a specified workflow step for a template.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + workflowStepId - The ID of the workflow step.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/templates/[string templateId]/workflow/steps/[string workflowStepId](WorkflowStep payload) returns WorkflowStep|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/steps/${getEncodedUri(workflowStepId)}`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        WorkflowStep response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Deletes a workflow step from an template's workflow definition.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + workflowStepId - The ID of the workflow step.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/templates/[string templateId]/workflow/steps/[string workflowStepId]() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/steps/${getEncodedUri(workflowStepId)}`;
        return self.clientEp->delete(resourcePath);
    }

    # Returns the delayed routing rules for a template's workflow step definition.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + workflowStepId - The ID of the workflow step.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/templates/[string templateId]/workflow/steps/[string workflowStepId]/delayedRouting() returns DelayedRouting|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/steps/${getEncodedUri(workflowStepId)}/delayedRouting`;
        DelayedRouting response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates the delayed routing rules for a template's workflow step.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + workflowStepId - The ID of the workflow step.
    # + payload - A complex element that specifies the delayed routing settings for the workflow step.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/templates/[string templateId]/workflow/steps/[string workflowStepId]/delayedRouting(DelayedRouting payload) returns DelayedRouting|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/steps/${getEncodedUri(workflowStepId)}/delayedRouting`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        DelayedRouting response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Deletes the delayed routing rules for the specified template workflow step.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + templateId - The ID of the template.
    # + workflowStepId - The ID of the workflow step.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/templates/[string templateId]/workflow/steps/[string workflowStepId]/delayedRouting() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/steps/${getEncodedUri(workflowStepId)}/delayedRouting`;
        return self.clientEp->delete(resourcePath);
    }

    # Gets a list of unsupported file types.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/unsupported_file_types() returns FileTypeList|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/unsupported_file_types`;
        FileTypeList response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Retrieves the list of users for the specified account.
    #
    # + accountId - (Required) The external account number (int) or account ID GUID.
    # + additional_info - When **true,** the custom settings information is returned for each user in the account. If this parameter is omitted, the default behavior is **false.**
    # + count - The maximum number of results to return.
    # Use `start_position` to specify the number of results to skip.
    # Valid values: `1` to `100`
    # + email - Filters results based on the email address associated with the user that you want to return.
    # **Note:** You can use either this parameter or the `email_substring` parameter, but not both. For older accounts, this parameter might return multiple users who are associated with a single email address. 
    # + email_substring - Filters results based on a fragment of an email address. For example, you could enter `gmail` to return all users who have Gmail addresses.
    # **Note:** You do not use a wildcard character with this parameter. You can use either this parameter or the `email` parameter, but not both. 
    # + group_id - Filters results based on one or more group IDs.
    # + include_usersettings_for_csv - When **true,** the response includes the `userSettings` object data in CSV format.
    # + login_status - When **true,** the response includes the login status of each user.
    # + not_group_id - Return user records excluding the specified group IDs.
    # + start_position - The zero-based index of the
    # result from which to start returning results.
    # Use with `count` to limit the number
    # of results.
    # The default value is `0`.
    # + status - Filters results by user account status.
    # A comma-separated list of any of the following:
    # * `ActivationRequired`
    # * `ActivationSent`
    # * `Active`
    # * `Closed`
    # * `Disabled`
    # + user_name_substring - Filters the user records returned by the user name or a sub-string of user name.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/users(string? additional_info = (), string? alternate_admins_only = (), string? count = (), string? domain_users_only = (), string? email = (), string? email_substring = (), string? group_id = (), string? include_usersettings_for_csv = (), string? login_status = (), string? not_group_id = (), string? start_position = (), string? status = (), string? user_name_substring = ()) returns UserInformationList|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users`;
        map<anydata> queryParam = {"additional_info": additional_info, "alternate_admins_only": alternate_admins_only, "count": count, "domain_users_only": domain_users_only, "email": email, "email_substring": email_substring, "group_id": group_id, "include_usersettings_for_csv": include_usersettings_for_csv, "login_status": login_status, "not_group_id": not_group_id, "start_position": start_position, "status": status, "user_name_substring": user_name_substring};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        UserInformationList response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Changes one or more users in the specified account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/users(UserInformationList payload, string? allow_all_languages = ()) returns UserInformationList|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users`;
        map<anydata> queryParam = {"allow_all_languages": allow_all_languages};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        UserInformationList response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Adds new users to the specified account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/users(NewUsersDefinition payload) returns NewUsersSummary|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        NewUsersSummary response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Closes one or more users in the account.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + delete - A list of groups to remove the user from.
    # A comma-separated list of the following:
    # - `Groups`
    # - `PermissionSet`
    # - `SigningGroupsEmail`
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/users(UserInfoList payload, string? delete = ()) returns UsersResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users`;
        map<anydata> queryParam = {"delete": delete};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        UsersResponse response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Gets the user information for a specified user.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    # + additional_info - Setting this parameter has no effect in this operation.
    # + email - Setting this parameter has no effect in this operation.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/users/[string userId](string? additional_info = (), string? email = ()) returns UserInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}`;
        map<anydata> queryParam = {"additional_info": additional_info, "email": email};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        UserInformation response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates user information for the specified user.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/users/[string userId](UserInformation payload, string? allow_all_languages = ()) returns UserInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}`;
        map<anydata> queryParam = {"allow_all_languages": allow_all_languages};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        UserInformation response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Creates a user authorization.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + userId - The ID of the principal user.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/users/[string userId]/authorization(UserAuthorizationCreateRequest payload) returns UserAuthorization|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/authorization`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        UserAuthorization response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Returns the user authorization for a given authorization ID.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + authorizationId - The ID of the user authorization.
    # + userId - The ID of the principal user.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/users/[string userId]/authorization/[string authorizationId]() returns UserAuthorization|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/authorization/${getEncodedUri(authorizationId)}`;
        UserAuthorization response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates the start or end date for a user authorization.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + authorizationId - The ID of the user authorization.
    # + userId - The ID of the principal user.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/users/[string userId]/authorization/[string authorizationId](UserAuthorizationUpdateRequest payload) returns UserAuthorization|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/authorization/${getEncodedUri(authorizationId)}`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        UserAuthorization response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Deletes the user authorization.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + authorizationId - The ID of the user authorization.
    # + userId - The ID of the principal user.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/users/[string userId]/authorization/[string authorizationId]() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/authorization/${getEncodedUri(authorizationId)}`;
        return self.clientEp->delete(resourcePath);
    }

    # Returns the authorizations for which the specified user is the principal user.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + userId - The ID of the principal user.
    # + active_only - When **true,** return only active authorizations. The default value is **true.**
    # + count - The maximum number of results to return.
    # + email_substring - Filters returned user records by full email address or a substring of email address.
    # + include_closed_users - When **true,** returns active and scheduled authorizations of closed users. The default value is **true.** This value is only applied when `active_only` is **false.**
    # + permissions - Filters results by authorization permission. Valid values:
    # * `Send`
    # * `Manage`
    # * `Sign`
    # + start_position - The position within the total result set from which to start returning values. The value **thumbnail** may be used to return the page image.
    # + user_name_substring - Filters results based on a full or partial user name.
    # **Note:** When you enter a partial user name, you do not use a wildcard character.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/users/[string userId]/authorizations(string? active_only = (), string? count = (), string? email_substring = (), string? include_closed_users = (), string? permissions = (), string? start_position = (), string? user_name_substring = ()) returns UserAuthorizations|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/authorizations`;
        map<anydata> queryParam = {"active_only": active_only, "count": count, "email_substring": email_substring, "include_closed_users": include_closed_users, "permissions": permissions, "start_position": start_position, "user_name_substring": user_name_substring};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        UserAuthorizations response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Create or update multiple user authorizations.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + userId - The ID of the principal user.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/users/[string userId]/authorizations(UserAuthorizationsRequest payload) returns UserAuthorizationsResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/authorizations`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        UserAuthorizationsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Delete multiple user authorizations.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + userId - The ID of the principal user.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/users/[string userId]/authorizations(UserAuthorizationsDeleteRequest payload) returns UserAuthorizationsDeleteResponse|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/authorizations`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        UserAuthorizationsDeleteResponse response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Returns the authorizations for which the specified user is the agent user.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + userId - The user who is acting as the agent.
    # + active_only - When **true,** only active users are returned. The default value is **false.**
    # + count - The maximum number of results to return.
    # + email_substring - Filters returned user records by full email address or a substring of email address.
    # + include_closed_users - When **true,** returns active and scheduled authorizations of closed users. The default value is **true.** This value is only applied when `active_only` is **false.**
    # + start_position - The position within the total result set from which to start returning values. The value **thumbnail** may be used to return the page image.
    # + user_name_substring - Filters results based on a full or partial user name.
    # **Note:** When you enter a partial user name, you do not use a wildcard character.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/users/[string userId]/authorizations/agent(string? active_only = (), string? count = (), string? email_substring = (), string? include_closed_users = (), string? permissions = (), string? start_position = (), string? user_name_substring = ()) returns UserAuthorizations|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/authorizations/agent`;
        map<anydata> queryParam = {"active_only": active_only, "count": count, "email_substring": email_substring, "include_closed_users": include_closed_users, "permissions": permissions, "start_position": start_position, "user_name_substring": user_name_substring};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        UserAuthorizations response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Get the Cloud Storage Provider configuration for the specified user.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    # + redirectUrl - The URL the user is redirected to after the cloud storage provider authenticates the user. Using this will append the redirectUrl to the authenticationUrl.
    # The redirectUrl is restricted to URLs in the docusign.com or docusign.net domains.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/users/[string userId]/cloud_storage(string? redirectUrl = ()) returns CloudStorageProviders|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/cloud_storage`;
        map<anydata> queryParam = {"redirectUrl": redirectUrl};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CloudStorageProviders response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Configures the redirect URL information  for one or more cloud storage providers for the specified user.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/users/[string userId]/cloud_storage(CloudStorageProviders payload) returns CloudStorageProviders|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/cloud_storage`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        CloudStorageProviders response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Deletes the user authentication information for one or more cloud storage providers.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/users/[string userId]/cloud_storage(CloudStorageProviders payload) returns CloudStorageProviders|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/cloud_storage`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        CloudStorageProviders response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Gets the specified Cloud Storage Provider configuration for the User.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + serviceId - The ID of the service to access. 
    # Valid values are the service name ("Box") or the numerical serviceId ("4136").
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    # + redirectUrl - The URL the user is redirected to after the cloud storage provider authenticates the user. Using this will append the redirectUrl to the authenticationUrl.
    # The redirectUrl is restricted to URLs in the docusign.com or docusign.net domains.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/users/[string userId]/cloud_storage/[string serviceId](string? redirectUrl = ()) returns CloudStorageProviders|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/cloud_storage/${getEncodedUri(serviceId)}`;
        map<anydata> queryParam = {"redirectUrl": redirectUrl};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CloudStorageProviders response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Deletes the user authentication information for the specified cloud storage provider.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + serviceId - The ID of the service to access. 
    # Valid values are the service name ("Box") or the numerical serviceId ("4136").
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/users/[string userId]/cloud_storage/[string serviceId]() returns CloudStorageProviders|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/cloud_storage/${getEncodedUri(serviceId)}`;
        CloudStorageProviders response = check self.clientEp->delete(resourcePath);
        return response;
    }

    # Retrieves a list of all the items in a specified folder from the specified cloud storage provider.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + serviceId - The ID of the service to access. 
    # Valid values are the service name ("Box") or the numerical serviceId ("4136").
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    # + cloud_storage_folder_path - A comma separated list of folder IDs included in the request. 
    # + count - The maximum number of results to return.
    # Use `start_position` to specify the number of results to skip.
    # Default: `25`
    # + 'order - The order in which to sort the results.
    # Valid values are: 
    # * `asc`: Ascending order.
    # * `desc`: Descending order. 
    # + order_by - The file attribute to use to sort the results.
    # Valid values are: 
    # * `modified`
    # * `name`
    # + search_text - Use this parameter to search for specific text.
    # + start_position - The zero-based index of the
    # result from which to start returning results.
    # Use with `count` to limit the number
    # of results.
    # The default value is `0`.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/users/[string userId]/cloud_storage/[string serviceId]/folders(string? cloud_storage_folder_path = (), string? count = (), string? 'order = (), string? order_by = (), string? search_text = (), string? start_position = ()) returns ExternalFolder|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/cloud_storage/${getEncodedUri(serviceId)}/folders`;
        map<anydata> queryParam = {"cloud_storage_folder_path": cloud_storage_folder_path, "count": count, "order": 'order, "order_by": order_by, "search_text": search_text, "start_position": start_position};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ExternalFolder response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Gets a list of items from a cloud storage provider.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + folderId - The ID of the folder.
    # + serviceId - The ID of the service to access. 
    # Valid values are the service name ("Box") or the numerical serviceId ("4136").
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    # + cloud_storage_folder_path - The file path to a cloud storage folder.
    # + cloud_storage_folderid_plain - A plain-text folder ID that you can use as an alternative to the existing folder id. This property is mainly used for rooms. Enter multiple folder IDs as a comma-separated list.
    # + count - The maximum number of results to return.
    # Use `start_position` to specify the number of results to skip.
    # Default: `25`
    # + 'order - The order in which to sort the results.
    # Valid values are: 
    # * `asc`: Ascending order.
    # * `desc`: Descending order. 
    # + order_by - The file attribute to use to sort the results.
    # Valid values are: 
    # * `modified`
    # * `name`
    # + search_text - Use this parameter to search for specific text.
    # + start_position - The zero-based index of the
    # result from which to start returning results.
    # Use with `count` to limit the number
    # of results.
    # The default value is `0`.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/users/[string userId]/cloud_storage/[string serviceId]/folders/[string folderId](string? cloud_storage_folder_path = (), string? cloud_storage_folderid_plain = (), string? count = (), string? 'order = (), string? order_by = (), string? search_text = (), string? start_position = ()) returns ExternalFolder|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/cloud_storage/${getEncodedUri(serviceId)}/folders/${getEncodedUri(folderId)}`;
        map<anydata> queryParam = {"cloud_storage_folder_path": cloud_storage_folder_path, "cloud_storage_folderid_plain": cloud_storage_folderid_plain, "count": count, "order": 'order, "order_by": order_by, "search_text": search_text, "start_position": start_position};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ExternalFolder response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Retrieves the custom user settings for a specified user.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/users/[string userId]/custom_settings() returns CustomSettingsInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/custom_settings`;
        CustomSettingsInformation response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Adds or updates custom user settings for the specified user.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/users/[string userId]/custom_settings(CustomSettingsInformation payload) returns CustomSettingsInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/custom_settings`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        CustomSettingsInformation response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Deletes custom user settings for a specified user.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/users/[string userId]/custom_settings(CustomSettingsInformation payload) returns CustomSettingsInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/custom_settings`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        CustomSettingsInformation response = check self.clientEp->delete(resourcePath, request);
        return response;
    }

    # Retrieves the user profile for a specified user.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/users/[string userId]/profile() returns UserProfile|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/profile`;
        UserProfile response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates the user profile information for the specified user.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/users/[string userId]/profile(UserProfile payload) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/profile`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request);
    }

    # Retrieves the user profile image for the specified user.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    # + encoding - Reserved for DocuSign.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/users/[string userId]/profile/image(string? encoding = ()) returns byte[]|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/profile/image`;
        map<anydata> queryParam = {"encoding": encoding};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        byte[] response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates the user profile image for a specified user.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/users/[string userId]/profile/image() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/profile/image`;
        http:Request request = new;
        return self.clientEp->put(resourcePath, request);
    }

    # Deletes the user profile image for the specified user.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/users/[string userId]/profile/image() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/profile/image`;
        return self.clientEp->delete(resourcePath);
    }

    # Gets the user account settings for a specified user.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/users/[string userId]/settings() returns UserSettingsInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/settings`;
        UserSettingsInformation response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates the user account settings for a specified user.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/users/[string userId]/settings(UserSettingsInformation payload, string? allow_all_languages = ()) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/settings`;
        map<anydata> queryParam = {"allow_all_languages": allow_all_languages};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request);
    }

    # Retrieves a list of signature definitions for a user.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    # + stamp_type - The type of stamps to return. Valid values are:
    # - `signature`: Returns information about signature images only. This is the default value.
    # - `stamp`: Returns information about eHanko and custom stamps only.
    # - null
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/users/[string userId]/signatures(string? stamp_type = ()) returns UserSignaturesInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/signatures`;
        map<anydata> queryParam = {"stamp_type": stamp_type};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        UserSignaturesInformation response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Adds/updates a user signature.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/users/[string userId]/signatures(UserSignaturesInformation payload) returns UserSignaturesInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/signatures`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        UserSignaturesInformation response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Adds user Signature and initials images to a Signature.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/users/[string userId]/signatures(UserSignaturesInformation payload) returns UserSignaturesInformation|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/signatures`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        UserSignaturesInformation response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Gets the user signature information for the specified user.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + signatureId - The ID of the account stamp.
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/users/[string userId]/signatures/[string signatureId]() returns UserSignature|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/signatures/${getEncodedUri(signatureId)}`;
        UserSignature response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates the user signature for a specified user.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + signatureId - The ID of the account stamp.
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    # + close_existing_signature - When **true,** closes the current signature.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/users/[string userId]/signatures/[string signatureId](UserSignatureDefinition payload, string? close_existing_signature = ()) returns UserSignature|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/signatures/${getEncodedUri(signatureId)}`;
        map<anydata> queryParam = {"close_existing_signature": close_existing_signature};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        UserSignature response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Removes removes signature information for the specified user.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + signatureId - The ID of the account stamp.
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/users/[string userId]/signatures/[string signatureId]() returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/signatures/${getEncodedUri(signatureId)}`;
        return self.clientEp->delete(resourcePath);
    }

    # Retrieves the user initials image or the  user signature image for the specified user.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + imageType - Specificies the type of image. Valid values:
    # - `stamp_image`
    # - `signature_image`
    # - `initials_image`
    # + signatureId - The ID of the account stamp.
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    # + include_chrome - When **true,** the chrome (or frame containing the added line and identifier) is included with the signature image.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/users/[string userId]/signatures/[string signatureId]/[string imageType](string? include_chrome = ()) returns byte[]|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/signatures/${getEncodedUri(signatureId)}/${getEncodedUri(imageType)}`;
        map<anydata> queryParam = {"include_chrome": include_chrome};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        byte[] response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates the user signature image or user initials image for the specified user.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + imageType - Specificies the type of image. Valid values:
    # - `stamp_image`
    # - `signature_image`
    # - `initials_image`
    # + signatureId - The ID of the account stamp.
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    # + request - Image content.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/users/[string userId]/signatures/[string signatureId]/[string imageType](http:Request request, string? transparent_png = ()) returns UserSignature|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/signatures/${getEncodedUri(signatureId)}/${getEncodedUri(imageType)}`;
        map<anydata> queryParam = {"transparent_png": transparent_png};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        // TODO: Update the request as needed;
        UserSignature response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Deletes the user initials image or the  user signature image for the specified user.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + imageType - Specificies the type of image. Valid values:
    # - `stamp_image`
    # - `signature_image`
    # - `initials_image`
    # + signatureId - The ID of the account stamp.
    # + userId - The ID of the user to access.
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/users/[string userId]/signatures/[string signatureId]/[string imageType]() returns UserSignature|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/signatures/${getEncodedUri(signatureId)}/${getEncodedUri(imageType)}`;
        UserSignature response = check self.clientEp->delete(resourcePath);
        return response;
    }

    # Returns a URL to the DocuSign UI.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/views/console(ConsoleViewRequest payload) returns EnvelopeViews|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/views/console`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        EnvelopeViews response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Get watermark information.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/watermark() returns Watermark|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/watermark`;
        Watermark response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Update watermark information.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + payload - When **true,** the account has the watermark feature enabled, and the envelope is not complete, then the watermark for the account is added to the PDF documents. This option can remove the watermark. 
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/watermark(Watermark payload) returns Watermark|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/watermark`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Watermark response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Get watermark preview.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + payload - When **true,** the account has the watermark feature enabled, and the envelope is not complete, then the watermark for the account is added to the PDF documents. This option can remove the watermark. 
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/watermark/preview(Watermark payload) returns Watermark|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/watermark/preview`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Watermark response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # List Workspaces
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/workspaces() returns WorkspaceList|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces`;
        WorkspaceList response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Create a Workspace
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/workspaces(Workspace payload) returns Workspace|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Workspace response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Get Workspace
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + workspaceId - The ID of the workspace.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/workspaces/[string workspaceId]() returns Workspace|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces/${getEncodedUri(workspaceId)}`;
        Workspace response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Update Workspace
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + workspaceId - The ID of the workspace.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/workspaces/[string workspaceId](Workspace payload) returns Workspace|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces/${getEncodedUri(workspaceId)}`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Workspace response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Delete Workspace
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + workspaceId - The ID of the workspace.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/workspaces/[string workspaceId]() returns Workspace|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces/${getEncodedUri(workspaceId)}`;
        Workspace response = check self.clientEp->delete(resourcePath);
        return response;
    }

    # List workspace folder contents
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + folderId - The ID of the folder.
    # + workspaceId - The ID of the workspace.
    # + count - The maximum number of results to return.
    # Use `start_position` to specify the number of results to skip.
    # + include_files - When **true,** the response includes file information (in addition to folder information). The default is **false.**
    # + include_sub_folders - When **true,** the response includes information about the sub-folders of the current folder. The default is **false.**
    # + include_thumbnails - When **true,** the response returns thumbnails.  The default is **false.**
    # + include_user_detail - When **true,** the response includes extended details about the user. The default is **false.**
    # + start_position - The zero-based index of the
    # result from which to start returning results.
    # Use with `count` to limit the number
    # of results.
    # The default value is `0`.
    # + workspace_user_id - If set, the response only includes results associated with the `userId` that you specify.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/workspaces/[string workspaceId]/folders/[string folderId](string? count = (), string? include_files = (), string? include_sub_folders = (), string? include_thumbnails = (), string? include_user_detail = (), string? start_position = (), string? workspace_user_id = ()) returns WorkspaceFolderContents|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces/${getEncodedUri(workspaceId)}/folders/${getEncodedUri(folderId)}`;
        map<anydata> queryParam = {"count": count, "include_files": include_files, "include_sub_folders": include_sub_folders, "include_thumbnails": include_thumbnails, "include_user_detail": include_user_detail, "start_position": start_position, "workspace_user_id": workspace_user_id};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        WorkspaceFolderContents response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Deletes files or sub-folders from a workspace.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + folderId - The ID of the folder.
    # + workspaceId - The ID of the workspace.
    # + return - A successful response or an error.
    resource isolated function delete accounts/[string accountId]/workspaces/[string workspaceId]/folders/[string folderId](WorkspaceItemList payload) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces/${getEncodedUri(workspaceId)}/folders/${getEncodedUri(folderId)}`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request);
    }

    # Creates a workspace file.
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + folderId - The ID of the folder.
    # + workspaceId - The ID of the workspace.
    # + return - A successful response or an error.
    resource isolated function post accounts/[string accountId]/workspaces/[string workspaceId]/folders/[string folderId]/files() returns WorkspaceItem|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces/${getEncodedUri(workspaceId)}/folders/${getEncodedUri(folderId)}/files`;
        http:Request request = new;
        WorkspaceItem response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Gets a workspace file
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + fileId - The ID of the file.
    # + folderId - The ID of the folder.
    # + workspaceId - The ID of the workspace.
    # + is_download - When **true,** the `Content-Disposition` header is set in the response. The value of the header provides the filename of the file. The default is **false.**
    # + pdf_version - When **true** the file is returned in PDF format.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/workspaces/[string workspaceId]/folders/[string folderId]/files/[string fileId](string? is_download = (), string? pdf_version = ()) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces/${getEncodedUri(workspaceId)}/folders/${getEncodedUri(folderId)}/files/${getEncodedUri(fileId)}`;
        map<anydata> queryParam = {"is_download": is_download, "pdf_version": pdf_version};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        return self.clientEp->get(resourcePath);
    }

    # Update workspace file or folder metadata
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + fileId - The ID of the file.
    # + folderId - The ID of the folder.
    # + workspaceId - The ID of the workspace.
    # + return - A successful response or an error.
    resource isolated function put accounts/[string accountId]/workspaces/[string workspaceId]/folders/[string folderId]/files/[string fileId]() returns WorkspaceItem|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces/${getEncodedUri(workspaceId)}/folders/${getEncodedUri(folderId)}/files/${getEncodedUri(fileId)}`;
        http:Request request = new;
        WorkspaceItem response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # List File Pages
    #
    # + accountId - The external account number (int) or account ID GUID.
    # + fileId - The ID of the file.
    # + folderId - The ID of the folder.
    # + workspaceId - The ID of the workspace.
    # + count - The maximum number of results to return.
    # Use `start_position` to specify the number of results to skip.
    # + dpi - The number of dots per inch (DPI) for the resulting images. Valid values are 1-310 DPI. The default value is 94.
    # + max_height - Sets the maximum height of the returned images in pixels.
    # + max_width - Sets the maximum width of the returned images in pixels.
    # + start_position - The zero-based index of the
    # result from which to start returning results.
    # Use with `count` to limit the number
    # of results.
    # The default value is `0`.
    # + return - A successful response or an error.
    resource isolated function get accounts/[string accountId]/workspaces/[string workspaceId]/folders/[string folderId]/files/[string fileId]/pages(string? count = (), string? dpi = (), string? max_height = (), string? max_width = (), string? start_position = ()) returns PageImages|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces/${getEncodedUri(workspaceId)}/folders/${getEncodedUri(folderId)}/files/${getEncodedUri(fileId)}/pages`;
        map<anydata> queryParam = {"count": count, "dpi": dpi, "max_height": max_height, "max_width": max_width, "start_position": start_position};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PageImages response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Retrieves the account provisioning information for the account.
    #
    # + return - A successful response or an error.
    resource isolated function get accounts/provisioning() returns ProvisioningInformation|error {
        string resourcePath = string `/v2.1/accounts/provisioning`;
        ProvisioningInformation response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Gets a list of available billing plans.
    #
    # + return - A successful response or an error.
    resource isolated function get billing_plans() returns BillingPlansResponse|error {
        string resourcePath = string `/v2.1/billing_plans`;
        BillingPlansResponse response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Gets billing plan details.
    #
    # + billingPlanId - The ID of the billing plan being accessed.
    # + return - A successful response or an error.
    resource isolated function get billing_plans/[string billingPlanId]() returns BillingPlanResponse|error {
        string resourcePath = string `/v2.1/billing_plans/${getEncodedUri(billingPlanId)}`;
        BillingPlanResponse response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Gets settings for a  notary user.
    #
    # + include_jurisdictions - When **true,** the response will include a `jurisdiction` property that contains an array of all supported jurisdictions for the current user.
    # + return - A successful response or an error.
    resource isolated function get current_user/notary(string? include_jurisdictions = ()) returns NotaryResult|error {
        string resourcePath = string `/v2.1/current_user/notary`;
        map<anydata> queryParam = {"include_jurisdictions": include_jurisdictions};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        NotaryResult response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Updates notary information for the current user.
    #
    # + return - A successful response or an error.
    resource isolated function put current_user/notary(Notary payload) returns Notary|error {
        string resourcePath = string `/v2.1/current_user/notary`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Notary response = check self.clientEp->put(resourcePath, request);
        return response;
    }

    # Registers the current user as a notary.
    #
    # + return - A successful response or an error.
    resource isolated function post current_user/notary(Notary payload) returns Notary|error {
        string resourcePath = string `/v2.1/current_user/notary`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Notary response = check self.clientEp->post(resourcePath, request);
        return response;
    }

    # Gets notary jurisdictions for a user.
    #
    # + count - The maximum number of results to return.
    # + search_text - Use this parameter to search for specific text.
    # + start_position - The position within the total result set from which to start returning values. The value **thumbnail** may be used to return the page image.
    # + return - A successful response or an error.
    resource isolated function get current_user/notary/journals(string? count = (), string? search_text = (), string? start_position = ()) returns NotaryJournalList|error {
        string resourcePath = string `/v2.1/current_user/notary/journals`;
        map<anydata> queryParam = {"count": count, "search_text": search_text, "start_position": start_position};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        NotaryJournalList response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Returns a list of jurisdictions that the notary is registered in.
    #
    # + return - A successful response or an error.
    resource isolated function get current_user/notary/jurisdictions() returns NotaryJurisdictionList|error {
        string resourcePath = string `/v2.1/current_user/notary/jurisdictions`;
        NotaryJurisdictionList response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Creates a jurisdiction object.
    #
    # + return - A successful response or an error.
    resource isolated function post current_user/notary/jurisdictions(NotaryJurisdiction payload) returns NotaryJurisdiction|error {
        string resourcePath = string `/v2.1/current_user/notary/jurisdictions`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        NotaryJurisdiction response = check self.clientEp->post(resourcePath, request);
        return response;
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
    # + return - A successful response or an error.
    resource isolated function get current_user/notary/jurisdictions/[string jurisdictionId]() returns NotaryJurisdiction|error {
        string resourcePath = string `/v2.1/current_user/notary/jurisdictions/${getEncodedUri(jurisdictionId)}`;
        NotaryJurisdiction response = check self.clientEp->get(resourcePath);
        return response;
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
    # + return - A successful response or an error.
    resource isolated function put current_user/notary/jurisdictions/[string jurisdictionId](NotaryJurisdiction payload) returns NotaryJurisdiction|error {
        string resourcePath = string `/v2.1/current_user/notary/jurisdictions/${getEncodedUri(jurisdictionId)}`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        NotaryJurisdiction response = check self.clientEp->put(resourcePath, request);
        return response;
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
    # + return - A successful response or an error.
    resource isolated function delete current_user/notary/jurisdictions/[string jurisdictionId]() returns error? {
        string resourcePath = string `/v2.1/current_user/notary/jurisdictions/${getEncodedUri(jurisdictionId)}`;
        return self.clientEp->delete(resourcePath);
    }

    # Gets membership account password rules.
    #
    # + return - A successful response or an error.
    resource isolated function get current_user/password_rules() returns UserPasswordRules|error {
        string resourcePath = string `/v2.1/current_user/password_rules`;
        UserPasswordRules response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Gets the API request logging log files.
    #
    # + encoding - Reserved for DocuSign.
    # + return - A successful response or an error.
    resource isolated function get diagnostics/request_logs(string? encoding = ()) returns ApiRequestLogsResult|error {
        string resourcePath = string `/v2.1/diagnostics/request_logs`;
        map<anydata> queryParam = {"encoding": encoding};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ApiRequestLogsResult response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Deletes the request log files.
    #
    # + return - A successful response or an error.
    resource isolated function delete diagnostics/request_logs() returns error? {
        string resourcePath = string `/v2.1/diagnostics/request_logs`;
        return self.clientEp->delete(resourcePath);
    }

    # Gets a request logging log file.
    #
    # + requestLogId - The ID of the log entry.
    # + return - A successful response or an error.
    resource isolated function get diagnostics/request_logs/[string requestLogId]() returns byte[]|error {
        string resourcePath = string `/v2.1/diagnostics/request_logs/${getEncodedUri(requestLogId)}`;
        byte[] response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Gets the API request logging settings.
    #
    # + return - A successful response or an error.
    resource isolated function get diagnostics/settings() returns DiagnosticsSettingsInformation|error {
        string resourcePath = string `/v2.1/diagnostics/settings`;
        DiagnosticsSettingsInformation response = check self.clientEp->get(resourcePath);
        return response;
    }

    # Enables or disables API request logging for troubleshooting.
    #
    # + return - A successful response or an error.
    resource isolated function put diagnostics/settings(DiagnosticsSettingsInformation payload) returns DiagnosticsSettingsInformation|error {
        string resourcePath = string `/v2.1/diagnostics/settings`;
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        DiagnosticsSettingsInformation response = check self.clientEp->put(resourcePath, request);
        return response;
    }
}
