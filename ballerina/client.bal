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

    resource isolated function get v2\.1(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function post v2\.1/accounts(NewAccountDefinition payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId](map<string|string[]> headers = {}, *AccountsGetAccountQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId](map<string|string[]> headers = {}, *AccountsDeleteAccountQueries queries) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/billing_charges(map<string|string[]> headers = {}, *BillingChargesGetAccountBillingChargesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_charges`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/billing_invoices(map<string|string[]> headers = {}, *BillingInvoicesGetBillingInvoicesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_invoices`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/billing_invoices/[string invoiceId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_invoices/${getEncodedUri(invoiceId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/billing_invoices_past_due(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_invoices_past_due`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/billing_payments(map<string|string[]> headers = {}, *BillingPaymentsGetPaymentListQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_payments`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/billing_payments(BillingPaymentRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_payments`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/billing_payments/[string paymentId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_payments/${getEncodedUri(paymentId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/billing_plan(map<string|string[]> headers = {}, *BillingPlanGetBillingPlanQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_plan`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/billing_plan(BillingPlanInformation payload, map<string|string[]> headers = {}, *BillingPlanPutBillingPlanQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_plan`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/billing_plan/credit_card(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_plan/credit_card`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/billing_plan/downgrade(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_plan/downgrade`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/billing_plan/downgrade(DowngradeBillingPlanInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_plan/downgrade`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/billing_plan/purchased_envelopes(PurchasedEnvelopesInformation payload, map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/billing_plan/purchased_envelopes`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/brands(map<string|string[]> headers = {}, *BrandsGetBrandsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/brands(Brand payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/brands(BrandsRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/brands/[string brandId](map<string|string[]> headers = {}, *BrandGetBrandQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/brands/[string brandId](Brand payload, map<string|string[]> headers = {}, *BrandPutBrandQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/brands/[string brandId](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/brands/[string brandId]/file(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}/file`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/brands/[string brandId]/logos/[string logoType](map<string|string[]> headers = {}) returns byte[]|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}/logos/${getEncodedUri(logoType)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/brands/[string brandId]/logos/[string logoType](record {byte[] fileContent; string fileName;} payload, map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}/logos/${getEncodedUri(logoType)}`;
        http:Request request = new;
        request.setPayload(payload, "image/png");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/brands/[string brandId]/logos/[string logoType](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}/logos/${getEncodedUri(logoType)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/brands/[string brandId]/resources(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}/resources`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/brands/[string brandId]/resources/[string resourceContentType](map<string|string[]> headers = {}, *BrandResourcesGetBrandResourcesQueries queries) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}/resources/${getEncodedUri(resourceContentType)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/brands/[string brandId]/resources/[string resourceContentType](ResourcesresourceContentTypeBody payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/brands/${getEncodedUri(brandId)}/resources/${getEncodedUri(resourceContentType)}`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(check jsondata:toJson(payload).ensureType());
        request.setBodyParts(bodyParts);
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/bulk_send_batch(map<string|string[]> headers = {}, *BulkSendV2BatchGetBulkSendBatchesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_batch`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/bulk_send_batch/[string bulkSendBatchId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_batch/${getEncodedUri(bulkSendBatchId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/bulk_send_batch/[string bulkSendBatchId](BulkSendBatchRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_batch/${getEncodedUri(bulkSendBatchId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/bulk_send_batch/[string bulkSendBatchId]/[string bulkAction](BulkSendBatchActionRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_batch/${getEncodedUri(bulkSendBatchId)}/${getEncodedUri(bulkAction)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/bulk_send_batch/[string bulkSendBatchId]/envelopes(map<string|string[]> headers = {}, *BulkSendV2EnvelopesGetBulkSendBatchEnvelopesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_batch/${getEncodedUri(bulkSendBatchId)}/envelopes`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/bulk_send_lists(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_lists`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/bulk_send_lists(BulkSendingList payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_lists`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/bulk_send_lists/[string bulkSendListId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_lists/${getEncodedUri(bulkSendListId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/bulk_send_lists/[string bulkSendListId](BulkSendingList payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_lists/${getEncodedUri(bulkSendListId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/bulk_send_lists/[string bulkSendListId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_lists/${getEncodedUri(bulkSendListId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/bulk_send_lists/[string bulkSendListId]/send(BulkSendRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_lists/${getEncodedUri(bulkSendListId)}/send`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/bulk_send_lists/[string bulkSendListId]/test(BulkSendRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/bulk_send_lists/${getEncodedUri(bulkSendListId)}/test`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/captive_recipients/[string recipientPart](CaptiveRecipientInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/captive_recipients/${getEncodedUri(recipientPart)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/chunked_uploads(ChunkedUploadRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/chunked_uploads`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/chunked_uploads/[string chunkedUploadId](map<string|string[]> headers = {}, *ChunkedUploadsGetChunkedUploadQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/chunked_uploads/${getEncodedUri(chunkedUploadId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/chunked_uploads/[string chunkedUploadId](map<string|string[]> headers = {}, *ChunkedUploadsPutChunkedUploadsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/chunked_uploads/${getEncodedUri(chunkedUploadId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/chunked_uploads/[string chunkedUploadId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/chunked_uploads/${getEncodedUri(chunkedUploadId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/chunked_uploads/[string chunkedUploadId]/[string chunkedUploadPartSeq](ChunkedUploadRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/chunked_uploads/${getEncodedUri(chunkedUploadId)}/${getEncodedUri(chunkedUploadPartSeq)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/connect(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/connect(ConnectCustomConfiguration payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/connect(ConnectCustomConfiguration payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/connect/[string connectId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/${getEncodedUri(connectId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/connect/[string connectId](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/${getEncodedUri(connectId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/connect/[string connectId]/all/users(map<string|string[]> headers = {}, *ConnectGetConnectAllUsersQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/${getEncodedUri(connectId)}/all/users`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/connect/[string connectId]/users(map<string|string[]> headers = {}, *ConnectGetConnectUsersQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/${getEncodedUri(connectId)}/users`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/connect/envelopes/[string envelopeId]/retry_queue(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/envelopes/${getEncodedUri(envelopeId)}/retry_queue`;
        http:Request request = new;
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/connect/envelopes/publish/historical(ConnectHistoricalEnvelopeRepublish payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/envelopes/publish/historical`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/connect/envelopes/retry_queue(ConnectFailureFilter payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/envelopes/retry_queue`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/connect/failures(map<string|string[]> headers = {}, *ConnectFailuresGetConnectLogsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/failures`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/connect/failures/[string failureId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/failures/${getEncodedUri(failureId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/connect/logs(map<string|string[]> headers = {}, *ConnectLogGetConnectLogsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/logs`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/connect/logs(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/logs`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/connect/logs/[string logId](map<string|string[]> headers = {}, *ConnectLogGetConnectLogQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/logs/${getEncodedUri(logId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/connect/logs/[string logId](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/logs/${getEncodedUri(logId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/connect/oauth(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/oauth`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/connect/oauth(ConnectOAuthConfig payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/oauth`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/connect/oauth(ConnectOAuthConfig payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/oauth`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/connect/oauth(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/connect/oauth`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/consumer_disclosure(map<string|string[]> headers = {}, *ConsumerDisclosureGetConsumerDisclosureQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/consumer_disclosure`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/consumer_disclosure/[string langCode](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/consumer_disclosure/${getEncodedUri(langCode)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/consumer_disclosure/[string langCode](ConsumerDisclosure payload, map<string|string[]> headers = {}, *ConsumerDisclosurePutConsumerDisclosureQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/consumer_disclosure/${getEncodedUri(langCode)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/contacts(ContactModRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/contacts`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/contacts(ContactModRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/contacts`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/contacts(ContactModRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/contacts`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/contacts/[string contactId](map<string|string[]> headers = {}, *ContactsGetContactByIdQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/contacts/${getEncodedUri(contactId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/contacts/[string contactId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/contacts/${getEncodedUri(contactId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/custom_fields(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/custom_fields`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/custom_fields(CustomField payload, map<string|string[]> headers = {}, *AccountCustomFieldsPostAccountCustomFieldsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/custom_fields`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/custom_fields/[string customFieldId](CustomField payload, map<string|string[]> headers = {}, *AccountCustomFieldsPutAccountCustomFieldsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/custom_fields/${getEncodedUri(customFieldId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/custom_fields/[string customFieldId](map<string|string[]> headers = {}, *AccountCustomFieldsDeleteAccountCustomFieldsQueries queries) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/custom_fields/${getEncodedUri(customFieldId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes(map<string|string[]> headers = {}, *EnvelopesGetEnvelopesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/envelopes(EnvelopeDefinition payload, map<string|string[]> headers = {}, *EnvelopesPostEnvelopesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId](map<string|string[]> headers = {}, *EnvelopesGetEnvelopeQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId](Envelope payload, map<string|string[]> headers = {}, *EnvelopesPutEnvelopeQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/attachments(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/attachments`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/attachments(EnvelopeAttachmentsRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/attachments`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/attachments(EnvelopeAttachmentsRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/attachments`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/attachments/[string attachmentId](map<string|string[]> headers = {}) returns byte[]|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/attachments/${getEncodedUri(attachmentId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/attachments/[string attachmentId](Attachment payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/attachments/${getEncodedUri(attachmentId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/audit_events(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/audit_events`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/comments/transcript(map<string|string[]> headers = {}, *CommentsGetCommentsTranscriptQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/comments/transcript`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/custom_fields(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/custom_fields`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/custom_fields(EnvelopeCustomFields payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/custom_fields`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/custom_fields(EnvelopeCustomFields payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/custom_fields`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/custom_fields(EnvelopeCustomFields payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/custom_fields`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/docGenFormFields(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/docGenFormFields`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/docGenFormFields(DocGenFormFieldRequest payload, map<string|string[]> headers = {}, *DocGenFormFieldsPutEnvelopeDocGenFormFieldsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/docGenFormFields`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents(map<string|string[]> headers = {}, *DocumentsGetDocumentsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents(EnvelopeDefinition payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents(EnvelopeDefinition payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId](map<string|string[]> headers = {}, *DocumentsGetDocumentQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId](http:Request request, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}`;
        // TODO: Update the request as needed;
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/fields(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/fields`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/fields(EnvelopeDocumentFields payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/fields`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/fields(EnvelopeDocumentFields payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/fields`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/fields(EnvelopeDocumentFields payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/fields`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/html_definitions(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/html_definitions`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/pages(map<string|string[]> headers = {}, *PagesGetPageImagesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/pages`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/pages/[string pageNumber](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/pages/${getEncodedUri(pageNumber)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/pages/[string pageNumber]/page_image(map<string|string[]> headers = {}, *PagesGetPageImageQueries queries) returns byte[]|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/pages/${getEncodedUri(pageNumber)}/page_image`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/pages/[string pageNumber]/page_image(PageRequest payload, map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/pages/${getEncodedUri(pageNumber)}/page_image`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/pages/[string pageNumber]/tabs(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/pages/${getEncodedUri(pageNumber)}/tabs`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/responsive_html_preview(DocumentHtmlDefinition payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/responsive_html_preview`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/tabs(map<string|string[]> headers = {}, *TabsGetDocumentTabsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/tabs`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/tabs(Tabs payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/tabs`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/tabs(Tabs payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/tabs`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/tabs(Tabs payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/tabs`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/templates(map<string|string[]> headers = {}, *TemplatesGetDocumentTemplatesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/templates`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/templates(DocumentTemplateList payload, map<string|string[]> headers = {}, *TemplatesPostDocumentTemplatesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/templates`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents/[string documentId]/templates/[string templateId](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/documents/${getEncodedUri(documentId)}/templates/${getEncodedUri(templateId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/email_settings(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/email_settings`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/email_settings(EmailSettings payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/email_settings`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/email_settings(EmailSettings payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/email_settings`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/email_settings(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/email_settings`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/form_data(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/form_data`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/html_definitions(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/html_definitions`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/'lock(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/lock`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/'lock(LockRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/lock`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/'lock(LockRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/lock`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/'lock(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/lock`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/notification(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/notification`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/notification(EnvelopeNotificationRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/notification`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients(map<string|string[]> headers = {}, *RecipientsGetRecipientsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients(EnvelopeRecipients payload, map<string|string[]> headers = {}, *RecipientsPutRecipientsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients(EnvelopeRecipients payload, map<string|string[]> headers = {}, *RecipientsPostRecipientsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients(EnvelopeRecipients payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/consumer_disclosure(map<string|string[]> headers = {}, *ConsumerDisclosureGetConsumerDisclosureEnvelopeIdRecipientIdQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/consumer_disclosure`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/consumer_disclosure/[string langCode](map<string|string[]> headers = {}, *ConsumerDisclosureGetConsumerDisclosureEnvelopeIdRecipientIdLangCodeQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/consumer_disclosure/${getEncodedUri(langCode)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/document_visibility(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/document_visibility`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/document_visibility(DocumentVisibilityList payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/document_visibility`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/identity_proof_token(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/identity_proof_token`;
        http:Request request = new;
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/initials_image(map<string|string[]> headers = {}, *RecipientsGetRecipientInitialsImageQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/initials_image`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/initials_image(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/initials_image`;
        http:Request request = new;
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/signature(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/signature`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/signature_image(map<string|string[]> headers = {}, *RecipientsGetRecipientSignatureImageQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/signature_image`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/signature_image(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/signature_image`;
        http:Request request = new;
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/tabs(map<string|string[]> headers = {}, *RecipientsGetRecipientTabsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/tabs`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/tabs(EnvelopeRecipientTabs payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/tabs`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/tabs(EnvelopeRecipientTabs payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/tabs`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/tabs(EnvelopeRecipientTabs payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/tabs`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/[string recipientId]/views/identity_manual_review(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/${getEncodedUri(recipientId)}/views/identity_manual_review`;
        http:Request request = new;
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients/document_visibility(DocumentVisibilityList payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/recipients/document_visibility`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/responsive_html_preview(DocumentHtmlDefinition payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/responsive_html_preview`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/tabs_blob(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/tabs_blob`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/tabs_blob(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/tabs_blob`;
        http:Request request = new;
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/templates(map<string|string[]> headers = {}, *TemplatesGetEnvelopeTemplatesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/templates`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/templates(DocumentTemplateList payload, map<string|string[]> headers = {}, *TemplatesPostEnvelopeTemplatesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/templates`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/views/correct(CorrectViewRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/views/correct`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/views/correct(CorrectViewRequest payload, map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/views/correct`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/views/edit(ReturnUrlRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/views/edit`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/views/recipient(RecipientViewRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/views/recipient`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/views/recipient_preview(RecipientPreviewRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/views/recipient_preview`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/views/sender(ReturnUrlRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/views/sender`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/views/shared(RecipientViewRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/views/shared`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/workflow(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/workflow(Workflow payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/workflow(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/workflow/scheduledSending(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/scheduledSending`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/workflow/scheduledSending(ScheduledSending payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/scheduledSending`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/workflow/scheduledSending(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/scheduledSending`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/workflow/steps(WorkflowStep payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/steps`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/workflow/steps/[string workflowStepId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/steps/${getEncodedUri(workflowStepId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/workflow/steps/[string workflowStepId](WorkflowStep payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/steps/${getEncodedUri(workflowStepId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/workflow/steps/[string workflowStepId](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/steps/${getEncodedUri(workflowStepId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/workflow/steps/[string workflowStepId]/delayedRouting(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/steps/${getEncodedUri(workflowStepId)}/delayedRouting`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/workflow/steps/[string workflowStepId]/delayedRouting(DelayedRouting payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/steps/${getEncodedUri(workflowStepId)}/delayedRouting`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/workflow/steps/[string workflowStepId]/delayedRouting(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/${getEncodedUri(envelopeId)}/workflow/steps/${getEncodedUri(workflowStepId)}/delayedRouting`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/status(EnvelopeIdsRequest payload, map<string|string[]> headers = {}, *EnvelopesPutStatusQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/status`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/envelopes/transfer_rules(map<string|string[]> headers = {}, *EnvelopeTransferRulesGetEnvelopeTransferRulesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/transfer_rules`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/transfer_rules(EnvelopeTransferRuleInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/transfer_rules`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/envelopes/transfer_rules(EnvelopeTransferRuleRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/transfer_rules`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/envelopes/transfer_rules/[string envelopeTransferRuleId](EnvelopeTransferRule payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/transfer_rules/${getEncodedUri(envelopeTransferRuleId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/envelopes/transfer_rules/[string envelopeTransferRuleId](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/envelopes/transfer_rules/${getEncodedUri(envelopeTransferRuleId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/favorite_templates(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/favorite_templates`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/favorite_templates(FavoriteTemplatesInfo payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/favorite_templates`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/favorite_templates(FavoriteTemplatesInfo payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/favorite_templates`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/folders(map<string|string[]> headers = {}, *FoldersGetFoldersQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/folders`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/folders/[string folderId](map<string|string[]> headers = {}, *FoldersGetFolderItemsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/folders/${getEncodedUri(folderId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/folders/[string folderId](FoldersRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/folders/${getEncodedUri(folderId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/groups(map<string|string[]> headers = {}, *GroupsGetGroupsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/groups(GroupInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/groups(GroupInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/groups(GroupInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/groups/[string groupId]/brands(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups/${getEncodedUri(groupId)}/brands`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/groups/[string groupId]/brands(BrandsRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups/${getEncodedUri(groupId)}/brands`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/groups/[string groupId]/brands(BrandsRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups/${getEncodedUri(groupId)}/brands`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/groups/[string groupId]/users(map<string|string[]> headers = {}, *GroupsGetGroupUsersQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups/${getEncodedUri(groupId)}/users`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/groups/[string groupId]/users(UserInfoList payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups/${getEncodedUri(groupId)}/users`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/groups/[string groupId]/users(UserInfoList payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/groups/${getEncodedUri(groupId)}/users`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/identity_verification(map<string|string[]> headers = {}, *AccountIdentityVerificationGetAccountIdentityVerificationQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/identity_verification`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/payment_gateway_accounts(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/payment_gateway_accounts`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/permission_profiles(map<string|string[]> headers = {}, *PermissionProfilesGetPermissionProfilesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/permission_profiles`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/permission_profiles(PermissionProfile payload, map<string|string[]> headers = {}, *PermissionProfilesPostPermissionProfilesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/permission_profiles`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/permission_profiles/[string permissionProfileId](map<string|string[]> headers = {}, *PermissionProfilesGetPermissionProfileQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/permission_profiles/${getEncodedUri(permissionProfileId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/permission_profiles/[string permissionProfileId](PermissionProfile payload, map<string|string[]> headers = {}, *PermissionProfilesPutPermissionProfilesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/permission_profiles/${getEncodedUri(permissionProfileId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/permission_profiles/[string permissionProfileId](map<string|string[]> headers = {}, *PermissionProfilesDeletePermissionProfilesQueries queries) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/permission_profiles/${getEncodedUri(permissionProfileId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/powerforms(map<string|string[]> headers = {}, *PowerFormsGetPowerFormsListQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/powerforms`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/powerforms(PowerForm payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/powerforms`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/powerforms(PowerFormsRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/powerforms`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/powerforms/[string powerFormId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/powerforms/${getEncodedUri(powerFormId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/powerforms/[string powerFormId](PowerForm payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/powerforms/${getEncodedUri(powerFormId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/powerforms/[string powerFormId](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/powerforms/${getEncodedUri(powerFormId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/powerforms/[string powerFormId]/form_data(map<string|string[]> headers = {}, *PowerFormsGetPowerFormFormDataQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/powerforms/${getEncodedUri(powerFormId)}/form_data`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/powerforms/senders(map<string|string[]> headers = {}, *PowerFormsGetPowerFormsSendersQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/powerforms/senders`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/recipient_names(map<string|string[]> headers = {}, *RecipientNamesGetRecipientNamesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/recipient_names`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/seals(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/seals`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/search_folders/[string searchFolderId](map<string|string[]> headers = {}, *SearchFoldersGetSearchFolderContentsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/search_folders/${getEncodedUri(searchFolderId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/settings(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/settings(AccountSettingsInformation payload, map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/settings/bcc_email_archives(map<string|string[]> headers = {}, *BCCEmailArchiveGetBCCEmailArchiveListQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/bcc_email_archives`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/settings/bcc_email_archives(BccEmailArchive payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/bcc_email_archives`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/settings/bcc_email_archives/[string bccEmailArchiveId](map<string|string[]> headers = {}, *BCCEmailArchiveGetBCCEmailArchiveHistoryListQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/bcc_email_archives/${getEncodedUri(bccEmailArchiveId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/settings/bcc_email_archives/[string bccEmailArchiveId](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/bcc_email_archives/${getEncodedUri(bccEmailArchiveId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/settings/enote_configuration(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/enote_configuration`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/settings/enote_configuration(ENoteConfiguration payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/enote_configuration`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/settings/enote_configuration(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/enote_configuration`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/settings/envelope_purge_configuration(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/envelope_purge_configuration`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/settings/envelope_purge_configuration(EnvelopePurgeConfiguration payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/envelope_purge_configuration`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/settings/notification_defaults(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/notification_defaults`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/settings/notification_defaults(NotificationDefaults1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/notification_defaults`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/settings/password_rules(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/password_rules`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/settings/password_rules(AccountPasswordRules1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/password_rules`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/settings/tabs(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/tabs`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/settings/tabs(TabAccountSettings payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/settings/tabs`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/shared_access(map<string|string[]> headers = {}, *SharedAccessGetSharedAccessQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/shared_access`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/shared_access(AccountSharedAccess payload, map<string|string[]> headers = {}, *SharedAccessPutSharedAccessQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/shared_access`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/signatureProviders(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatureProviders`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/signatures(map<string|string[]> headers = {}, *AccountSignaturesGetAccountSignaturesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatures`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/signatures(AccountSignaturesInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatures`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/signatures(AccountSignaturesInformation payload, map<string|string[]> headers = {}, *AccountSignaturesPostAccountSignaturesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatures`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/signatures/[string signatureId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatures/${getEncodedUri(signatureId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/signatures/[string signatureId](AccountSignatureDefinition payload, map<string|string[]> headers = {}, *AccountSignaturesPutAccountSignatureByIdQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatures/${getEncodedUri(signatureId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/signatures/[string signatureId](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatures/${getEncodedUri(signatureId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/signatures/[string signatureId]/[string imageType](map<string|string[]> headers = {}, *AccountSignaturesGetAccountSignatureImageQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatures/${getEncodedUri(signatureId)}/${getEncodedUri(imageType)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/signatures/[string signatureId]/[string imageType](map<string|string[]> headers = {}, *AccountSignaturesPutAccountSignatureImageQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatures/${getEncodedUri(signatureId)}/${getEncodedUri(imageType)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/signatures/[string signatureId]/[string imageType](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signatures/${getEncodedUri(signatureId)}/${getEncodedUri(imageType)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/signing_groups(map<string|string[]> headers = {}, *SigningGroupsGetSigningGroupsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signing_groups`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/signing_groups(SigningGroupInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signing_groups`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/signing_groups(SigningGroupInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signing_groups`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/signing_groups(SigningGroupInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signing_groups`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/signing_groups/[string signingGroupId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signing_groups/${getEncodedUri(signingGroupId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/signing_groups/[string signingGroupId](SigningGroup payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signing_groups/${getEncodedUri(signingGroupId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/signing_groups/[string signingGroupId]/users(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signing_groups/${getEncodedUri(signingGroupId)}/users`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/signing_groups/[string signingGroupId]/users(SigningGroupUsers1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signing_groups/${getEncodedUri(signingGroupId)}/users`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/signing_groups/[string signingGroupId]/users(SigningGroupUsers1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/signing_groups/${getEncodedUri(signingGroupId)}/users`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/supported_languages(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/supported_languages`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/tab_definitions(map<string|string[]> headers = {}, *TabsGetTabDefinitionsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/tab_definitions`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/tab_definitions(TabMetadata payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/tab_definitions`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/tab_definitions/[string customTabId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/tab_definitions/${getEncodedUri(customTabId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/tab_definitions/[string customTabId](TabMetadata payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/tab_definitions/${getEncodedUri(customTabId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/tab_definitions/[string customTabId](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/tab_definitions/${getEncodedUri(customTabId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/templates(map<string|string[]> headers = {}, *TemplatesGetTemplatesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/templates(EnvelopeTemplate payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId](map<string|string[]> headers = {}, *TemplatesGetTemplateQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId](EnvelopeTemplate payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/[string templatePart](GroupInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/${getEncodedUri(templatePart)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/templates/[string templateId]/[string templatePart](GroupInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/${getEncodedUri(templatePart)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/custom_fields(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/custom_fields`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/custom_fields(TemplateCustomFields1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/custom_fields`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/templates/[string templateId]/custom_fields(TemplateCustomFields1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/custom_fields`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/templates/[string templateId]/custom_fields(TemplateCustomFields1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/custom_fields`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/documents(map<string|string[]> headers = {}, *DocumentsGetTemplateDocumentsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/documents(EnvelopeDefinition payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/templates/[string templateId]/documents(EnvelopeDefinition payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId](map<string|string[]> headers = {}, *DocumentsGetTemplateDocumentQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId](EnvelopeDefinition payload, map<string|string[]> headers = {}, *DocumentsPutTemplateDocumentQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/fields(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/fields`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/fields(DocumentFieldsInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/fields`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/fields(DocumentFieldsInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/fields`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/fields(DocumentFieldsInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/fields`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/html_definitions(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/html_definitions`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/pages(map<string|string[]> headers = {}, *PagesGetTemplatePageImagesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/pages`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/pages/[string pageNumber](PageRequest payload, map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/pages/${getEncodedUri(pageNumber)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/pages/[string pageNumber]/page_image(map<string|string[]> headers = {}, *PagesGetTemplatePageImageQueries queries) returns byte[]|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/pages/${getEncodedUri(pageNumber)}/page_image`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/pages/[string pageNumber]/page_image(PageRequest payload, map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/pages/${getEncodedUri(pageNumber)}/page_image`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/pages/[string pageNumber]/tabs(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/pages/${getEncodedUri(pageNumber)}/tabs`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/responsive_html_preview(DocumentHtmlDefinition payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/responsive_html_preview`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/tabs(map<string|string[]> headers = {}, *TabsGetTemplateDocumentTabsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/tabs`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/tabs(TemplateTabs payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/tabs`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/tabs(TemplateTabs payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/tabs`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/templates/[string templateId]/documents/[string documentId]/tabs(TemplateTabs payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/documents/${getEncodedUri(documentId)}/tabs`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/html_definitions(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/html_definitions`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/'lock(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/lock`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/'lock(LockRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/lock`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/templates/[string templateId]/'lock(LockRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/lock`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/templates/[string templateId]/'lock(LockRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/lock`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/notification(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/notification`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/notification(TemplateNotificationRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/notification`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/recipients(map<string|string[]> headers = {}, *RecipientsGetTemplateRecipientsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/recipients(TemplateRecipients1 payload, map<string|string[]> headers = {}, *RecipientsPutTemplateRecipientsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/templates/[string templateId]/recipients(TemplateRecipients1 payload, map<string|string[]> headers = {}, *RecipientsPostTemplateRecipientsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/templates/[string templateId]/recipients(TemplateRecipients1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/templates/[string templateId]/recipients/[string recipientId](TemplateRecipients1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients/${getEncodedUri(recipientId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/recipients/[string recipientId]/document_visibility(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients/${getEncodedUri(recipientId)}/document_visibility`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/recipients/[string recipientId]/document_visibility(TemplateDocumentVisibilityList payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients/${getEncodedUri(recipientId)}/document_visibility`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/recipients/[string recipientId]/tabs(map<string|string[]> headers = {}, *RecipientsGetTemplateRecipientTabsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients/${getEncodedUri(recipientId)}/tabs`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/recipients/[string recipientId]/tabs(TemplateTabs payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients/${getEncodedUri(recipientId)}/tabs`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/templates/[string templateId]/recipients/[string recipientId]/tabs(TemplateTabs payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients/${getEncodedUri(recipientId)}/tabs`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/templates/[string templateId]/recipients/[string recipientId]/tabs(TemplateTabs payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients/${getEncodedUri(recipientId)}/tabs`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/recipients/document_visibility(TemplateDocumentVisibilityList payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/recipients/document_visibility`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/templates/[string templateId]/responsive_html_preview(DocumentHtmlDefinition payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/responsive_html_preview`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/templates/[string templateId]/views/edit(ReturnUrlRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/views/edit`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/templates/[string templateId]/views/recipient_preview(RecipientPreviewRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/views/recipient_preview`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/workflow(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/workflow(Workflow payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/templates/[string templateId]/workflow(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/workflow/scheduledSending(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/scheduledSending`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/workflow/scheduledSending(ScheduledSending payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/scheduledSending`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/templates/[string templateId]/workflow/scheduledSending(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/scheduledSending`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/templates/[string templateId]/workflow/steps(WorkflowStep payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/steps`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/workflow/steps/[string workflowStepId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/steps/${getEncodedUri(workflowStepId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/workflow/steps/[string workflowStepId](WorkflowStep payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/steps/${getEncodedUri(workflowStepId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/templates/[string templateId]/workflow/steps/[string workflowStepId](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/steps/${getEncodedUri(workflowStepId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/templates/[string templateId]/workflow/steps/[string workflowStepId]/delayedRouting(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/steps/${getEncodedUri(workflowStepId)}/delayedRouting`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/templates/[string templateId]/workflow/steps/[string workflowStepId]/delayedRouting(DelayedRouting payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/steps/${getEncodedUri(workflowStepId)}/delayedRouting`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/templates/[string templateId]/workflow/steps/[string workflowStepId]/delayedRouting(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/templates/${getEncodedUri(templateId)}/workflow/steps/${getEncodedUri(workflowStepId)}/delayedRouting`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/unsupported_file_types(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/unsupported_file_types`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/users(map<string|string[]> headers = {}, *UsersGetUsersQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/users(UserInformationList payload, map<string|string[]> headers = {}, *UsersPutUsersQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/users(NewUsersDefinition payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/users(UserInfoList payload, map<string|string[]> headers = {}, *UsersDeleteUsersQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId](map<string|string[]> headers = {}, *UserGetUserQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/users/[string userId](UserInformation payload, map<string|string[]> headers = {}, *UserPutUserQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/users/[string userId]/authorization(UserAuthorizationCreateRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/authorization`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/authorization/[string authorizationId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/authorization/${getEncodedUri(authorizationId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/users/[string userId]/authorization/[string authorizationId](UserAuthorizationUpdateRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/authorization/${getEncodedUri(authorizationId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/users/[string userId]/authorization/[string authorizationId](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/authorization/${getEncodedUri(authorizationId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/authorizations(map<string|string[]> headers = {}, *UserAuthorizationsGetPrincipalUserAuthorizationsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/authorizations`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/users/[string userId]/authorizations(UserAuthorizationsRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/authorizations`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/users/[string userId]/authorizations(UserAuthorizationsDeleteRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/authorizations`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/authorizations/agent(map<string|string[]> headers = {}, *UserAgentAuthorizationsGetAgentUserAuthorizationsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/authorizations/agent`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/cloud_storage(map<string|string[]> headers = {}, *CloudStorageGetCloudStorageProvidersQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/cloud_storage`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/users/[string userId]/cloud_storage(CloudStorageProviders1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/cloud_storage`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/users/[string userId]/cloud_storage(CloudStorageProviders1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/cloud_storage`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/cloud_storage/[string serviceId](map<string|string[]> headers = {}, *CloudStorageGetCloudStorageQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/cloud_storage/${getEncodedUri(serviceId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/users/[string userId]/cloud_storage/[string serviceId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/cloud_storage/${getEncodedUri(serviceId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/cloud_storage/[string serviceId]/folders(map<string|string[]> headers = {}, *CloudStorageFolderGetCloudStorageFolderAllQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/cloud_storage/${getEncodedUri(serviceId)}/folders`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/cloud_storage/[string serviceId]/folders/[string folderId](map<string|string[]> headers = {}, *CloudStorageFolderGetCloudStorageFolderQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/cloud_storage/${getEncodedUri(serviceId)}/folders/${getEncodedUri(folderId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/custom_settings(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/custom_settings`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/users/[string userId]/custom_settings(CustomSettingsInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/custom_settings`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/users/[string userId]/custom_settings(CustomSettingsInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/custom_settings`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/profile(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/profile`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/users/[string userId]/profile(UserProfile payload, map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/profile`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/profile/image(map<string|string[]> headers = {}, *UserProfileImageGetUserProfileImageQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/profile/image`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/users/[string userId]/profile/image(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/profile/image`;
        http:Request request = new;
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/users/[string userId]/profile/image(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/profile/image`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/settings(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/settings`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/users/[string userId]/settings(UserSettingsInformation payload, map<string|string[]> headers = {}, *UserSettingsPutUserSettingsQueries queries) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/settings`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/signatures(map<string|string[]> headers = {}, *UserSignaturesGetUserSignaturesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/signatures`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/users/[string userId]/signatures(UserSignaturesInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/signatures`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/users/[string userId]/signatures(UserSignaturesInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/signatures`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/signatures/[string signatureId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/signatures/${getEncodedUri(signatureId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/users/[string userId]/signatures/[string signatureId](UserSignatureDefinition payload, map<string|string[]> headers = {}, *UserSignaturesPutUserSignatureByIdQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/signatures/${getEncodedUri(signatureId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/users/[string userId]/signatures/[string signatureId](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/signatures/${getEncodedUri(signatureId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/users/[string userId]/signatures/[string signatureId]/[string imageType](map<string|string[]> headers = {}, *UserSignaturesGetUserSignatureImageQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/signatures/${getEncodedUri(signatureId)}/${getEncodedUri(imageType)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/users/[string userId]/signatures/[string signatureId]/[string imageType](http:Request request, map<string|string[]> headers = {}, *UserSignaturesPutUserSignatureImageQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/signatures/${getEncodedUri(signatureId)}/${getEncodedUri(imageType)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        // TODO: Update the request as needed;
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/users/[string userId]/signatures/[string signatureId]/[string imageType](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/signatures/${getEncodedUri(signatureId)}/${getEncodedUri(imageType)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/views/console(ConsoleViewRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/views/console`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/watermark(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/watermark`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/watermark(Watermark payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/watermark`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/watermark/preview(Watermark payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/watermark/preview`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/workspaces(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/workspaces(Workspace payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/workspaces/[string workspaceId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces/${getEncodedUri(workspaceId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/workspaces/[string workspaceId](Workspace payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces/${getEncodedUri(workspaceId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/workspaces/[string workspaceId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces/${getEncodedUri(workspaceId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/workspaces/[string workspaceId]/folders/[string folderId](map<string|string[]> headers = {}, *WorkspaceFolderGetWorkspaceFolderQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces/${getEncodedUri(workspaceId)}/folders/${getEncodedUri(folderId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function delete v2\.1/accounts/[string accountId]/workspaces/[string workspaceId]/folders/[string folderId](WorkspaceItemList payload, map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces/${getEncodedUri(workspaceId)}/folders/${getEncodedUri(folderId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->delete(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/accounts/[string accountId]/workspaces/[string workspaceId]/folders/[string folderId]/files(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces/${getEncodedUri(workspaceId)}/folders/${getEncodedUri(folderId)}/files`;
        http:Request request = new;
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/workspaces/[string workspaceId]/folders/[string folderId]/files/[string fileId](map<string|string[]> headers = {}, *WorkspaceFileGetWorkspaceFileQueries queries) returns error? {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces/${getEncodedUri(workspaceId)}/folders/${getEncodedUri(folderId)}/files/${getEncodedUri(fileId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/accounts/[string accountId]/workspaces/[string workspaceId]/folders/[string folderId]/files/[string fileId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces/${getEncodedUri(workspaceId)}/folders/${getEncodedUri(folderId)}/files/${getEncodedUri(fileId)}`;
        http:Request request = new;
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/accounts/[string accountId]/workspaces/[string workspaceId]/folders/[string folderId]/files/[string fileId]/pages(map<string|string[]> headers = {}, *WorkspaceFilePagesGetWorkspaceFilePagesQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/${getEncodedUri(accountId)}/workspaces/${getEncodedUri(workspaceId)}/folders/${getEncodedUri(folderId)}/files/${getEncodedUri(fileId)}/pages`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/accounts/provisioning(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/accounts/provisioning`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/billing_plans(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/billing_plans`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/billing_plans/[string billingPlanId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/billing_plans/${getEncodedUri(billingPlanId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/current_user/notary(map<string|string[]> headers = {}, *NotaryGetNotaryQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/current_user/notary`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/current_user/notary(Notary1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/current_user/notary`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function post v2\.1/current_user/notary(Notary1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/current_user/notary`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/current_user/notary/journals(map<string|string[]> headers = {}, *NotaryJournalsGetNotaryJournalsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/current_user/notary/journals`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/current_user/notary/jurisdictions(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/current_user/notary/jurisdictions`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function post v2\.1/current_user/notary/jurisdictions(NotaryJurisdiction1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/current_user/notary/jurisdictions`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    resource isolated function get v2\.1/current_user/notary/jurisdictions/[string jurisdictionId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/current_user/notary/jurisdictions/${getEncodedUri(jurisdictionId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/current_user/notary/jurisdictions/[string jurisdictionId](NotaryJurisdiction1 payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/current_user/notary/jurisdictions/${getEncodedUri(jurisdictionId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    resource isolated function delete v2\.1/current_user/notary/jurisdictions/[string jurisdictionId](map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/current_user/notary/jurisdictions/${getEncodedUri(jurisdictionId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/current_user/password_rules(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/current_user/password_rules`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/diagnostics/request_logs(map<string|string[]> headers = {}, *APIRequestLogGetRequestLogsQueries queries) returns http:Response|error {
        string resourcePath = string `/v2.1/diagnostics/request_logs`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function delete v2\.1/diagnostics/request_logs(map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/v2.1/diagnostics/request_logs`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    resource isolated function get v2\.1/diagnostics/request_logs/[string requestLogId](map<string|string[]> headers = {}) returns string|error {
        string resourcePath = string `/v2.1/diagnostics/request_logs/${getEncodedUri(requestLogId)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function get v2\.1/diagnostics/settings(map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/diagnostics/settings`;
        return self.clientEp->get(resourcePath, headers);
    }

    resource isolated function put v2\.1/diagnostics/settings(DiagnosticsSettingsInformation payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/v2.1/diagnostics/settings`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }
}
