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

import ballerina/http;
import ballerina/mime;

# An API for an integrator to access the features of DocuSign Rooms
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://www.docusign.net/restapi") returns error? {
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
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }

    # Gets account information.
    #
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Account information successfully retrieved 
    resource isolated function get v2/accounts/[string accountId]() returns AccountSummary|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AccountSummary response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Gets information about or the contents of a document.
    #
    # + documentId - The ID of the document.
    # + includeContents - When **true,** includes the contents of the document in the `base64Contents` property of the response. The default value is **false.**
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Document successfully retrieved. 
    resource isolated function get v2/accounts/[string accountId]/documents/[int:Signed32 documentId](boolean includeContents = false) returns Document|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/documents/${getEncodedUri(documentId)}`;
        map<anydata> queryParam = {"includeContents": includeContents};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Document response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Deletes a specified document.
    #
    # + documentId - The ID of the document.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Document has been successfully deleted. 
    resource isolated function delete v2/accounts/[string accountId]/documents/[int:Signed32 documentId]() returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/documents/${getEncodedUri(documentId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }

    # Grants a user access to a document.
    #
    # + documentId - The ID of the document.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - User successfully granted access to document. 
    resource isolated function post v2/accounts/[string accountId]/documents/[int:Signed32 documentId]/users(DocumentUserForCreate payload) returns DocumentUser|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/documents/${getEncodedUri(documentId)}/users`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        DocumentUser response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }

    # Gets eSignature Permission Profiles.
    #
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Permission profiles successfully retrieved. 
    resource isolated function get v2/accounts/[string accountId]/esign_permission_profiles() returns ESignPermissionProfileList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/esign_permission_profiles`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ESignPermissionProfileList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Creates an external form fill session.
    #
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Created 
    resource isolated function post v2/accounts/[string accountId]/external_form_fill_sessions(ExternalFormFillSessionForCreate payload) returns ExternalFormFillSession|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/external_form_fill_sessions`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        ExternalFormFillSession response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }

    # Gets a field set.
    #
    # + fieldSetId - The ID of the field set.
    # Example: `4aef602b-xxxx-xxxx-xxxx-08d76696f678`
    # + fieldsCustomDataFilters - An comma-separated list that limits the fields to return:
    # - `IsRequiredOnCreate`: include fields that are required in room creation.
    # - `IsRequiredOnSubmit`: include fields that are required when submitting a room for review.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - FieldSet successfully retrieved. 
    resource isolated function get v2/accounts/[string accountId]/field_sets/[string fieldSetId](("None"|"IsRequiredOnCreate"|"IsRequiredOnSubmit")[]? fieldsCustomDataFilters = ()) returns FieldSet|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/field_sets/${getEncodedUri(fieldSetId)}`;
        map<anydata> queryParam = {"fieldsCustomDataFilters": fieldsCustomDataFilters};
        map<Encoding> queryParamEncoding = {"fieldsCustomDataFilters": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FieldSet response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Gets form groups.
    #
    # + count - The number of results to return. This value must be a number between `1` and `100` (default).
    # + startPosition - The starting zero-based index position of the results set. The default value is `0`.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Successfully retrieved Form Groups. 
    resource isolated function get v2/accounts/[string accountId]/form_groups(int:Signed32 count = 100, int:Signed32 startPosition = 0) returns FormGroupSummaryList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/form_groups`;
        map<anydata> queryParam = {"count": count, "startPosition": startPosition};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FormGroupSummaryList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Creates a form group.
    #
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Successfully created form group. 
    resource isolated function post v2/accounts/[string accountId]/form_groups(FormGroupForCreate payload) returns FormGroup|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/form_groups`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        FormGroup response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }

    # Gets a form group.
    #
    # + formGroupId - The ID of the form group.
    # Example: `7b879c89-xxxx-xxxx-xxxx-819d6a85e0a1`
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Successfully retrieved form group. 
    resource isolated function get v2/accounts/[string accountId]/form_groups/[string formGroupId]() returns FormGroup|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/form_groups/${getEncodedUri(formGroupId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FormGroup response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Renames a form group.
    #
    # + formGroupId - The ID of the form group.
    # Example: `7b879c89-xxxx-xxxx-xxxx-819d6a85e0a1`
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Successfully updated form group. 
    resource isolated function put v2/accounts/[string accountId]/form_groups/[string formGroupId](FormGroupForUpdate payload) returns FormGroup|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/form_groups/${getEncodedUri(formGroupId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        FormGroup response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }

    # Deletes a form group.
    #
    # + formGroupId - The ID of the form group.
    # Example: `7b879c89-xxxx-xxxx-xxxx-819d6a85e0a1`
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Successfully deleted form group. 
    resource isolated function delete v2/accounts/[string accountId]/form_groups/[string formGroupId]() returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/form_groups/${getEncodedUri(formGroupId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }

    # Gets the user's form group forms.
    #
    # + formGroupId - The ID of the form group.
    # Example: `7b879c89-xxxx-xxxx-xxxx-819d6a85e0a1`
    # + count - The number of results to return. 
    # Default value is 100 and max value is 100
    # + startPosition - The starting point of the list. The default is 0.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Successfully retrieved form group's forms. 
    resource isolated function get v2/accounts/[string accountId]/form_groups/[string formGroupId]/forms(int:Signed32 count = 100, int:Signed32 startPosition = 0) returns FormGroupFormList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/form_groups/${getEncodedUri(formGroupId)}/forms`;
        map<anydata> queryParam = {"count": count, "startPosition": startPosition};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FormGroupFormList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Removes a form from a form group.
    #
    # + formGroupId - The ID of the form group.
    # Example: `7b879c89-xxxx-xxxx-xxxx-819d6a85e0a1`
    # + formId - The ID of the form.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Form was successfully removed from the form group 
    resource isolated function post v2/accounts/[string accountId]/form_groups/[string formGroupId]/unassign_form/[string formId]() returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/form_groups/${getEncodedUri(formGroupId)}/unassign_form/${getEncodedUri(formId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }

    # Assigns a form to a form group.
    #
    # + formGroupId - The ID of the form group.
    # Example: `7b879c89-xxxx-xxxx-xxxx-819d6a85e0a1`
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Successfully assigned form to form group. 
    resource isolated function post v2/accounts/[string accountId]/form_groups/[string formGroupId]/assign_form(FormGroupFormToAssign payload) returns FormGroupFormToAssign|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/form_groups/${getEncodedUri(formGroupId)}/assign_form`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        FormGroupFormToAssign response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }

    # Grants an office access to a form group.
    #
    # + formGroupId - The ID of the form group.
    # Example: `7b879c89-xxxx-xxxx-xxxx-819d6a85e0a1`
    # + officeId - The ID of the office. This is the ID that the system generated when you created the office.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Office was successfully assigned to the form group 
    resource isolated function post v2/accounts/[string accountId]/form_groups/[string formGroupId]/grant_office_access/[int:Signed32 officeId]() returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/form_groups/${getEncodedUri(formGroupId)}/grant_office_access/${getEncodedUri(officeId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }

    # Revoke an office's access to a form group.
    #
    # + formGroupId - The ID of the form group.
    # Example: `7b879c89-xxxx-xxxx-xxxx-819d6a85e0a1`
    # + officeId - The ID of the office. This is the ID that the system generated when you created the office.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Office was successfully removed from the form group 
    resource isolated function post v2/accounts/[string accountId]/form_groups/[string formGroupId]/revoke_office_access/[int:Signed32 officeId]() returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/form_groups/${getEncodedUri(formGroupId)}/revoke_office_access/${getEncodedUri(officeId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }

    # Gets form libraries.
    #
    # + count - The number of results to return. This value must be a number between `1` and `100` (default).
    # + startPosition - The starting zero-based index position of the results set. The default value is `0`.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Successfully retrieved Form Libraries. 
    resource isolated function get v2/accounts/[string accountId]/form_libraries(int:Signed32 count = 100, int:Signed32 startPosition = 0) returns FormLibrarySummaryList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/form_libraries`;
        map<anydata> queryParam = {"count": count, "startPosition": startPosition};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FormLibrarySummaryList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Gets the forms in a form library.
    #
    # + formLibraryId - The ID of the form library.
    # Example: `402c6e2f-xxxx-xxxx-xxxx-ff3f249f6da9`
    # + count - The number of results to return. This value must be a number between `1` and `100` (default).
    # + startPosition - (Optional) The starting zero-based index position of the results set. The default value is `0`.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Successfully retrieved library forms. 
    resource isolated function get v2/accounts/[string accountId]/form_libraries/[string formLibraryId]/forms(int:Signed32 count = 100, int:Signed32 startPosition = 0) returns FormSummaryList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/form_libraries/${getEncodedUri(formLibraryId)}/forms`;
        map<anydata> queryParam = {"count": count, "startPosition": startPosition};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FormSummaryList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Gets all associations by provider.
    #
    # + providerId - The provider ID.
    # <!-- like nar, nwmls etc.. -->
    # + count - The total number of associations to be returned.
    # + startPosition - The starting position on the list.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Successfully retrieved Form Associations by provider type. 
    resource isolated function get v2/accounts/[string accountId]/form_providers/[string providerId]/associations(int:Signed32 count = 100, int:Signed32 startPosition = 0) returns FormProviderAssociationsSummaryList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/form_providers/${getEncodedUri(providerId)}/associations`;
        map<anydata> queryParam = {"count": count, "startPosition": startPosition};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FormProviderAssociationsSummaryList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Gets form details.
    #
    # + formId - The ID of the form.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Form based on FormId 
    resource isolated function get v2/accounts/[string accountId]/forms/[string formId]/details() returns FormDetails|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/forms/${getEncodedUri(formId)}/details`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FormDetails response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Gets countries.
    #
    # + return - Request was successful. 
    resource isolated function get v2/countries() returns GlobalCountries|error {
        string resourcePath = string `/v2/countries`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GlobalCountries response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Gets closing statuses.
    #
    # + return - Request was successful. 
    resource isolated function get v2/closing_statuses() returns GlobalClosingStatuses|error {
        string resourcePath = string `/v2/closing_statuses`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GlobalClosingStatuses response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Gets contact sides.
    #
    # + return - Request was successful. 
    resource isolated function get v2/contact_sides() returns GlobalContactSides|error {
        string resourcePath = string `/v2/contact_sides`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GlobalContactSides response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Gets financing types.
    #
    # + return - Request was successful. 
    resource isolated function get v2/financing_types() returns GlobalFinancingTypes|error {
        string resourcePath = string `/v2/financing_types`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GlobalFinancingTypes response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Gets origins of leads.
    #
    # + return - Request was successful. 
    resource isolated function get v2/origins_of_leads() returns GlobalOriginsOfLeads|error {
        string resourcePath = string `/v2/origins_of_leads`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GlobalOriginsOfLeads response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Gets property types.
    #
    # + return - Request was successful. 
    resource isolated function get v2/property_types() returns GlobalPropertyTypes|error {
        string resourcePath = string `/v2/property_types`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GlobalPropertyTypes response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Gets room contact types.
    #
    # + return - Request was successful. 
    resource isolated function get v2/room_contact_types() returns GlobalRoomContactTypes|error {
        string resourcePath = string `/v2/room_contact_types`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GlobalRoomContactTypes response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Gets seller decision types.
    #
    # + return - Request was successful. 
    resource isolated function get v2/seller_decision_types() returns GlobalSellerDecisionTypes|error {
        string resourcePath = string `/v2/seller_decision_types`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GlobalSellerDecisionTypes response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Gets special circumstance types.
    #
    # + return - Request was successful. 
    resource isolated function get v2/special_circumstance_types() returns GlobalSpecialCircumstanceTypes|error {
        string resourcePath = string `/v2/special_circumstance_types`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GlobalSpecialCircumstanceTypes response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Gets task date types.
    #
    # + return - Request was successful. 
    resource isolated function get v2/task_date_types() returns GlobalTaskDateTypes|error {
        string resourcePath = string `/v2/task_date_types`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GlobalTaskDateTypes response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Gets task responsibility types.
    #
    # + return - Request was successful. 
    resource isolated function get v2/task_responsibility_types() returns GlobalTaskResponsibilityTypes|error {
        string resourcePath = string `/v2/task_responsibility_types`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GlobalTaskResponsibilityTypes response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Retrieves the list of valid task statuses.
    #
    # + return - Request was successful. 
    resource isolated function get v2/task_statuses() returns GlobalTaskStatuses|error {
        string resourcePath = string `/v2/task_statuses`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GlobalTaskStatuses response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Gets transaction sides.
    #
    # + return - Request was successful. 
    resource isolated function get v2/transaction_sides() returns GlobalTransactionSides|error {
        string resourcePath = string `/v2/transaction_sides`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GlobalTransactionSides response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Gets states.
    #
    # + return - Request was successful. 
    resource isolated function get v2/states() returns GlobalStates|error {
        string resourcePath = string `/v2/states`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GlobalStates response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Gets valid currencies.
    #
    # + return - Request was successful. 
    resource isolated function get v2/currencies() returns GlobalCurrencies|error {
        string resourcePath = string `/v2/currencies`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GlobalCurrencies response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Gets time zones.
    #
    # + return - Request was successful. 
    resource isolated function get v2/time_zones() returns GlobalTimeZones|error {
        string resourcePath = string `/v2/time_zones`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GlobalTimeZones response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Gets offices.
    #
    # + count - The number of results to return. This value must be a number between `1` and `100` (default).
    # + startPosition - The starting zero-based index position of the results set from which to begin returning values. The default value is `0`.
    # + onlyAccessible - When **true,** the response only includes the offices that are accessible to the current user.
    # + search - Filters returned records by the specified string. The response only includes records containing this string in the office `name` field.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Offices successfully retrieved. 
    resource isolated function get v2/accounts/[string accountId]/offices(int:Signed32 count = 100, int:Signed32 startPosition = 0, boolean onlyAccessible = false, string? search = ()) returns OfficeSummaryList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/offices`;
        map<anydata> queryParam = {"count": count, "startPosition": startPosition, "onlyAccessible": onlyAccessible, "search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        OfficeSummaryList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Creates an office.
    #
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Office successfully created. 
    resource isolated function post v2/accounts/[string accountId]/offices(OfficeForCreate payload) returns Office|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/offices`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        Office response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }

    # Gets information about an office.
    #
    # + officeId - The ID of the office.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Office successfully retrieved. 
    resource isolated function get v2/accounts/[string accountId]/offices/[int:Signed32 officeId]() returns Office|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/offices/${getEncodedUri(officeId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Office response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Deletes an office.
    #
    # + officeId - The ID of the office.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Office successfully deleted. 
    resource isolated function delete v2/accounts/[string accountId]/offices/[int:Signed32 officeId]() returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/offices/${getEncodedUri(officeId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }

    # Retrieves the number and type of objects that reference an office.
    #
    # + officeId - The ID of the office.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Reference counts successfully retrieved. 
    resource isolated function get v2/accounts/[string accountId]/offices/[int:Signed32 officeId]/reference_counts() returns OfficeReferenceCountList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/offices/${getEncodedUri(officeId)}/reference_counts`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        OfficeReferenceCountList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Gets regions.
    #
    # + count - The number of results to return. This value must be a number between `1` and `100` (default).
    # + startPosition - The starting zero-based index position of the results set from which to begin returning values. The default value is `0`.
    # + managedOnly - When **true,** only the regions that the current user manages are returned. The default value is **false.**
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Regions successfully retrieved. 
    resource isolated function get v2/accounts/[string accountId]/regions(int:Signed32 count = 100, int:Signed32 startPosition = 0, boolean managedOnly = false) returns RegionSummaryList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/regions`;
        map<anydata> queryParam = {"count": count, "startPosition": startPosition, "managedOnly": managedOnly};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RegionSummaryList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Creates a region.
    #
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - The region was successfully created 
    resource isolated function post v2/accounts/[string accountId]/regions(Region payload) returns Region|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/regions`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        Region response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }

    # Gets information about a region.
    #
    # + regionId - The ID of the region.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - The region was found. 
    resource isolated function get v2/accounts/[string accountId]/regions/[int:Signed32 regionId]() returns Region|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/regions/${getEncodedUri(regionId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Region response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Deletes a region.
    #
    # + regionId - The ID of the region.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Region successfully deleted. 
    resource isolated function delete v2/accounts/[string accountId]/regions/[int:Signed32 regionId]() returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/regions/${getEncodedUri(regionId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }

    # Retrieves the number and type of objects that reference a region.
    #
    # + regionId - The ID of the region.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Reference counts successfully retrieved. 
    resource isolated function get v2/accounts/[string accountId]/regions/[int:Signed32 regionId]/reference_counts() returns RegionReferenceCountList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/regions/${getEncodedUri(regionId)}/reference_counts`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RegionReferenceCountList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Gets roles.
    #
    # + onlyAssignable - This parameter is deprecated. Use `filterContext` instead. Note that `filterContext=AssignableRolesBasedOnCompanyPermissions` is equivalent to `onlyAssignable=true`.
    # + filterContext - Filters the roles by the calling user's permissions. Valid values are:
    # - `AllRoles` (default): All roles are returned.
    # - `AssignableRolesBasedOnAllPermissions`: Only roles that the current user can assign to someone else are returned. In other words, given the permission set of the current user, only roles with a subset of those permissions (including the same exact permissions) will be returned.
    # - `AssignableRolesBasedOnCompanyPermissions`: Only roles that the current user can assign to someone else based on company permissions are returned. Other permissions are not taken into account. In other words, given the company permissions of the current user, only roles with a subset of those company permissions (including the same exact company permissions) will be returned.
    # + filter - A search filter that returns roles by the beginning of the role name. You can enter the beginning of the role name only to return all of the roles that begin with the text that you entered. 
    # For example, if your company has set up roles such as Manager Beginner, Manager Pro, Agent Expert, and Agent Superstar, you could enter `Manager` to return all of the Manager roles (Manager Beginner and Manager Pro).
    # **Note:** You do not enter a wildcard (*) at the end of the name fragment.
    # + startPosition - The starting zero-based index position of the result set. The default value is 0.
    # + count - The number of results to return. This value must be a number between `1` and `100` (default).
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Roles successfully retrieved. 
    resource isolated function get v2/accounts/[string accountId]/roles(boolean onlyAssignable = false, string? filterContext = (), string? filter = (), int:Signed32 startPosition = 0, int:Signed32 count = 100) returns RoleSummaryList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/roles`;
        map<anydata> queryParam = {"onlyAssignable": onlyAssignable, "filterContext": filterContext, "filter": filter, "startPosition": startPosition, "count": count};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RoleSummaryList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Creates a role.
    #
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Role successfully created. 
    resource isolated function post v2/accounts/[string accountId]/roles(RoleForCreate payload) returns Role|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/roles`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        Role response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }

    # Gets a role.
    #
    # + roleId - The ID of the role.
    # + includeIsAssigned - When **true,** the response includes the `isAssigned` property, which specifies whether the role is currently assigned to any users. The default is **false.**
    # + accountId - (Required) The globally unique identifier (GUID) for the account.
    # + return - Role successfully retrieved. 
    resource isolated function get v2/accounts/[string accountId]/roles/[int:Signed32 roleId](boolean includeIsAssigned = false) returns Role|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/roles/${getEncodedUri(roleId)}`;
        map<anydata> queryParam = {"includeIsAssigned": includeIsAssigned};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Role response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Updates a role.
    #
    # + roleId - The ID of the role.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Role successfully updated. 
    resource isolated function put v2/accounts/[string accountId]/roles/[int:Signed32 roleId](RoleForUpdate payload) returns Role|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/roles/${getEncodedUri(roleId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        Role response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }

    # Deletes a role.
    #
    # + roleId - The ID of the role to delete.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Role successfully deleted. 
    resource isolated function delete v2/accounts/[string accountId]/roles/[int:Signed32 roleId]() returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/roles/${getEncodedUri(roleId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }

    # Creates an envelope with the given documents. Returns the eSignature envelope ID of the envelope that was created.
    #
    # + roomId - The room ID.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Success 
    resource isolated function post v2/accounts/[string accountId]/rooms/[int:Signed32 roomId]/envelopes(EnvelopeForCreate payload) returns Envelope|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/envelopes`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        Envelope response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }

    # Gets a room's field data.
    #
    # + roomId - The ID of the room.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Field data successfully retrieved. 
    resource isolated function get v2/accounts/[string accountId]/rooms/[int:Signed32 roomId]/field_data() returns FieldData|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/field_data`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FieldData response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Updates a room's field data.
    #
    # + roomId - The ID of the room.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Field data successfully updated. 
    resource isolated function put v2/accounts/[string accountId]/rooms/[int:Signed32 roomId]/field_data(FieldDataForUpdate payload) returns FieldData|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/field_data`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        FieldData response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }

    # Gets a list of room folders accessible to the current user.
    #
    # + roomId - The ID of the room from which to retrieve folders.
    # + startPosition - The starting zero-based index position of the results set. When this property is used as a query parameter, the default value is `0`.
    # + count - The number of results. When this property is used as a request parameter specifying the number of results to return, the value must be a number between `1` and `100` (default).
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Room folders successfully retrieved. 
    resource isolated function get v2/accounts/[string accountId]/rooms/[int:Signed32 roomId]/room_folders(int:Signed32 startPosition = 0, int:Signed32 count = 100) returns RoomFolderList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/room_folders`;
        map<anydata> queryParam = {"startPosition": startPosition, "count": count};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RoomFolderList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Adds a form to a room.
    #
    # + roomId - The ID of the room.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Success 
    resource isolated function post v2/accounts/[string accountId]/rooms/[int:Signed32 roomId]/forms(FormForAdd payload) returns RoomDocument|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/forms`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        RoomDocument response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }

    # Gets a room's users.
    #
    # + roomId - The ID of the room.
    # + count - The number of results to return. This value must be a number between `1` and `100` (default).
    # + startPosition - The index position within the total result set from which to start returning values. The default value is `0`.
    # + filter - A search filter that returns users by the beginning of the user's first name, last name, or email address. You can enter the beginning of the name or email only to return all of the users whose names or email addresses begin with the text that you entered. 
    # **Note:** You do not enter a wildcard (*) at the end of the name or email fragment.
    # + sort - The order in which to return results. Valid values are:
    # - `firstNameAsc`: Sort on first name in ascending order. 
    # - `firstNameDesc`:  Sort on first name in descending order. 
    # - `lastNameAsc`: Sort on last name in ascending order. 
    # - `lastNameDesc`: Sort on last name in descending order. This is the default value.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - The room user was successfully retrieved. 
    resource isolated function get v2/accounts/[string accountId]/rooms/[int:Signed32 roomId]/users(int:Signed32 count = 100, int:Signed32 startPosition = 0, string? filter = (), string? sort = ()) returns RoomUsersResult|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/users`;
        map<anydata> queryParam = {"count": count, "startPosition": startPosition, "filter": filter, "sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RoomUsersResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Invites a user to a room.
    #
    # + roomId - The ID of the room.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Success 
    resource isolated function post v2/accounts/[string accountId]/rooms/[int:Signed32 roomId]/users(RoomInvite payload) returns RoomInviteResponse|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/users`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        RoomInviteResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }

    # Updates a room user.
    #
    # + roomId - The ID of the room.
    # + userId - The ID of the user to update.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - The room user was successfully updated. 
    resource isolated function put v2/accounts/[string accountId]/rooms/[int:Signed32 roomId]/users/[int:Signed32 userId](RoomUserForUpdate payload) returns RoomUser|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/users/${getEncodedUri(userId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        RoomUser response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }

    # Revokes the specified user's access to the room.
    #
    # + roomId - The ID of the room.
    # + userId - The ID of the user whose access you want to revoke.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - The room user's access was successfully revoked. 
    resource isolated function post v2/accounts/[string accountId]/rooms/[int:Signed32 roomId]/users/[int:Signed32 userId]/revoke_access(RoomUserRemovalDetail payload) returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/users/${getEncodedUri(userId)}/revoke_access`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }

    # Restores the specified user's access to the room.
    #
    # + roomId - The ID of the room.
    # + userId - The ID of the user to restore to the room.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - The room user's access was successfully restored. 
    resource isolated function post v2/accounts/[string accountId]/rooms/[int:Signed32 roomId]/users/[int:Signed32 userId]/restore_access() returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/users/${getEncodedUri(userId)}/restore_access`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }

    # Returns a list of rooms.
    #
    # + count - The number of results. When this property is used as a request parameter specifying the number of results to return, the value must be a number between 1 and 100 (default).
    # + startPosition - The index position within the total result set from which to start returning values. The default value is `0`.
    # + roomStatus - The status of the room. Valid values are:
    # - `active`: This is the default value.
    # - `pending`
    # - `open`: Includes both `active` and `pending` statuses.
    # - `closed`
    # To return rooms with multiple statuses, enter a comma-separated list of statuses. 
    # Example:
    # `closed,open`
    # + officeId - The ID of the office.
    # + fieldDataChangedStartDate - Starting date and time to filter rooms whose field data has changed after this date. Date and time is always given as UTC. If the time (`hh:mm:ss`) is omitted, it defaults to `00:00:00`.
    # Valid formats:
    # - `yyyy-mm-dd hh:mm:ss`
    # - `yyyy/mm/dd hh:mm:ss`
    # The default start date is the beginning of time.
    # + fieldDataChangedEndDate - Ending date and time to filter rooms whose field data has changed before this date. Date and time is always given as UTC. If the time (`hh:mm:ss`) is omitted, it defaults to `00:00:00`.
    # Valid formats:
    # - `yyyy-mm-dd hh:mm:ss`
    # - `yyyy/mm/dd hh:mm:ss`
    # If this query parameter is omitted, the default end date is now.
    # + roomClosedStartDate - Starting date and time to filter rooms that were closed this date. Date and time is always given as UTC. If the time (`hh:mm:ss`) is omitted, it defaults to `00:00:00`.
    # Valid formats:
    # - `yyyy-mm-dd hh:mm:ss`
    # - `yyyy/mm/dd hh:mm:ss`
    # The default start date is the beginning of time.
    # + roomClosedEndDate - Ending date and time to filter rooms that were closed before this date. Date and time is always given as UTC. If the time (`hh:mm:ss`) is omitted, it defaults to `00:00:00`.
    # Valid formats:
    # - `yyyy-mm-dd hh:mm:ss`
    # - `yyyy/mm/dd hh:mm:ss`
    # If this query parameter is omitted, the default end date is now.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Rooms successfully retrieved. 
    resource isolated function get v2/accounts/[string accountId]/rooms(int:Signed32 count = 100, int:Signed32 startPosition = 0, string? roomStatus = (), int:Signed32? officeId = (), string? fieldDataChangedStartDate = (), string? fieldDataChangedEndDate = (), string? roomClosedStartDate = (), string? roomClosedEndDate = ()) returns RoomSummaryList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms`;
        map<anydata> queryParam = {"count": count, "startPosition": startPosition, "roomStatus": roomStatus, "officeId": officeId, "fieldDataChangedStartDate": fieldDataChangedStartDate, "fieldDataChangedEndDate": fieldDataChangedEndDate, "roomClosedStartDate": roomClosedStartDate, "roomClosedEndDate": roomClosedEndDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RoomSummaryList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Creates a room.
    #
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Room successfully created. 
    resource isolated function post v2/accounts/[string accountId]/rooms(RoomForCreate payload) returns Room|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        Room response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }

    # Gets a room.
    #
    # + roomId - The ID of the room.
    # + includeFieldData - When **true,** the response includes the field data from the room. This is the information that appears on the room's **Details** tab.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Room successfully retrieved. 
    resource isolated function get v2/accounts/[string accountId]/rooms/[int:Signed32 roomId](boolean includeFieldData = false) returns Room|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}`;
        map<anydata> queryParam = {"includeFieldData": includeFieldData};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Room response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Deletes a room.
    #
    # + roomId - The ID of the room.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Room successfully deleted. 
    resource isolated function delete v2/accounts/[string accountId]/rooms/[int:Signed32 roomId]() returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }

    # Gets assignable room-level roles in v6.
    #
    # + roomId - The ID of the room.
    # + assigneeEmail - The email address of a specific member. Using this parameter returns only the roles that the current user can assign to the member with that email address.
    # + filter - A search filter that returns assignable roles by the beginning of the role name.
    # **Note:** You do not enter a wildcard (*) at the end of the name fragment.
    # + startPosition - The index position within the total result set from which to start returning values. The default value is `0`.
    # + count - The number of results to return. This value must be a number between `1` and `100` (default).
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Assignable roles successfully retrieved. 
    resource isolated function get v2/accounts/[string accountId]/rooms/[int:Signed32 roomId]/assignable_roles(string? assigneeEmail = (), string? filter = (), int:Signed32 startPosition = 0, int:Signed32 count = 100) returns AssignableRoles|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/assignable_roles`;
        map<anydata> queryParam = {"assigneeEmail": assigneeEmail, "filter": filter, "startPosition": startPosition, "count": count};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AssignableRoles response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Gets a list of documents in a room.
    #
    # + roomId - The ID of the room.
    # + count - The number of results to return. This value must be a number between `1` and `100` (default).
    # + startPosition - The index position within the total result set from which to start returning values. The default value is `0`.
    # + requireContentForDynamicDocuments - When **true,** dynamic documents without content will not be returned. The default value is **false.**
    # + roomFolderId - Filters results by `folderId`. If this property is not set, no filtering is applied.
    # + nameFilter - Filters results by `name`. If this property is not set, no filtering is applied.
    # + includeArchived - Filters results by `isArchived`. For example, when **true,** only documents with the property `isArchived=true` will be returned. If this property is not set, no filtering is applied.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Documents successfully retrieved. 
    resource isolated function get v2/accounts/[string accountId]/rooms/[int:Signed32 roomId]/documents(int:Signed32 count = 100, int:Signed32 startPosition = 0, boolean requireContentForDynamicDocuments = false, int:Signed32? roomFolderId = (), string? nameFilter = (), boolean includeArchived = true) returns RoomDocumentList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/documents`;
        map<anydata> queryParam = {"count": count, "startPosition": startPosition, "requireContentForDynamicDocuments": requireContentForDynamicDocuments, "roomFolderId": roomFolderId, "nameFilter": nameFilter, "includeArchived": includeArchived};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RoomDocumentList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Adds a document to a room.
    #
    # + roomId - The ID of the room.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Document successfully added. 
    resource isolated function post v2/accounts/[string accountId]/rooms/[int:Signed32 roomId]/documents(Document payload) returns RoomDocument|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/documents`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        RoomDocument response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }

    # Uploads the contents of a file as a document to a room.
    #
    # + roomId - The ID of the room.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Document successfully added. 
    resource isolated function post v2/accounts/[string accountId]/rooms/[int:Signed32 roomId]/documents/contents(Documents_contents_body payload) returns RoomDocument|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/documents/contents`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        RoomDocument response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }

    # Updates the picture for a room.
    #
    # + roomId - The ID of the room.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Picture successfully updated. 
    resource isolated function put v2/accounts/[string accountId]/rooms/[int:Signed32 roomId]/picture(RoomId_picture_body payload) returns RoomPicture|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/picture`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        RoomPicture response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }

    # Gets the field set for a room.
    #
    # + roomId - The ID of the room.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - FieldSet successfully retrieved. 
    resource isolated function get v2/accounts/[string accountId]/rooms/[int:Signed32 roomId]/field_set() returns FieldSet|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/field_set`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FieldSet response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Gets task lists for a room.
    #
    # + roomId - The ID of the room.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Task lists successfully retrieved. 
    resource isolated function get v2/accounts/[string accountId]/rooms/[int:Signed32 roomId]/task_lists() returns TaskListSummaryList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/task_lists`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TaskListSummaryList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Applies a task list to a room.
    #
    # + roomId - The ID of the room.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Task lists successfully created. 
    resource isolated function post v2/accounts/[string accountId]/rooms/[int:Signed32 roomId]/task_lists(TaskListForCreate payload) returns TaskList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/task_lists`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        TaskList response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }

    # Gets room templates.
    #
    # + officeId - The ID of the office for which the user wants to create a room. When you pass in a value for this parameter, only room templates that are valid for that office appear in the results. For users who are not Admins, the default is the ID of the user's default office.
    # However, you can specify a value if the user belongs to multiple offices.
    # If the user is an Admin, set the `forAdmin` search parameter to **true** instead and omit the `officeId` parameter. 
    # + onlyAssignable - When **true,** returns only the roles that the current user can assign to someone else. The default value is **false.**
    # + onlyEnabled - When true, only returns room templates that are not disabled.
    # + count - The number of results. When this property is used as a request parameter specifying the number of results to return, the value must be a number between `1` and `100` (default).
    # + startPosition - The index position within the total result set from which to start returning values. The default value is `0`.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Successfully retrieved room templates for the caller 
    resource isolated function get v2/accounts/[string accountId]/room_templates(int:Signed32? officeId = (), boolean onlyAssignable = false, boolean onlyEnabled = true, int:Signed32 count = 100, int:Signed32 startPosition = 0) returns RoomTemplatesSummaryList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/room_templates`;
        map<anydata> queryParam = {"officeId": officeId, "onlyAssignable": onlyAssignable, "onlyEnabled": onlyEnabled, "count": count, "startPosition": startPosition};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RoomTemplatesSummaryList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Deletes a task list from a room.
    #
    # + taskListId - The ID of the task list.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Task list successfully deleted. 
    resource isolated function delete v2/accounts/[string accountId]/task_lists/[int:Signed32 taskListId]() returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/task_lists/${getEncodedUri(taskListId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }

    # Gets task list templates.
    #
    # + startPosition - The starting zero-based index position from which to start returning values. The default is `0`.
    # + count - The number of results to return. This value must be a number between `1` and `100` (default).
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Successfully returned list of task list templates. 
    resource isolated function get v2/accounts/[string accountId]/task_list_templates(int:Signed32 startPosition = 0, int:Signed32 count = 100) returns TaskListTemplateList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/task_list_templates`;
        map<anydata> queryParam = {"startPosition": startPosition, "count": count};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TaskListTemplateList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Gets a list of users.
    #
    # + filter - Filters results by name and email address. This is a  "starts with" filter, which means that you can enter only the beginning of a name or email address. 
    # **Note:** You do not use a wildcard with this filter.
    # + sort - Specifies how to sort the results. Valid values are:
    # - `FirstNameAsc`
    # - `LastNameAsc`
    # - `EmailAsc`
    # - `FirstNameDesc`
    # - `LastNameDesc`
    # - `EmailDesc`
    # + defaultOfficeId - Filters for users who have this office ID as their default office ID.
    # + accessLevel - Filters for users who have the specified access level. A user's access level and role determine the types of resources and actions that are available to them.
    # Valid values are:
    # - Company: Users with this access level can administer resources across the company.
    # - Region: Users with this access level can administer offices and other resources within their regions. 
    # - Office: Users with this access level can administer resources within their offices.
    # - Contributor: Users with this access level can only administer their own resources.
    # **Note:** In requests, the values that you may use for this property depend on your permissions and whether you can add users at your access level or lower.
    # + titleId - This field is deprecated in Rooms Version 6.
    # + roleId - Filters for users who have the specified `roleId`.
    # + status - Filters for users who have the specified `status`.
    # Valid values are:
    # - `Active`: The user is active.
    # - `Pending`: The user has been invited but has not yet accepted the invitation.
    # + lockedOnly - When **true,** filters for users whose accounts are locked.
    # + startPosition - The starting zero-based index position within the result set from which to begin the response. The default is `0`. 
    # + count - The maximum number of users to return in the response. This value must be a number between `1` and `100` (default).
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - Users information successfully retrieved. 
    resource isolated function get v2/accounts/[string accountId]/users(string? filter = (), string? sort = (), int:Signed32? defaultOfficeId = (), string? accessLevel = (), int:Signed32? titleId = (), int:Signed32? roleId = (), string? status = (), boolean? lockedOnly = (), int:Signed32 startPosition = 0, int:Signed32 count = 100) returns UserSummaryList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/users`;
        map<anydata> queryParam = {"filter": filter, "sort": sort, "defaultOfficeId": defaultOfficeId, "accessLevel": accessLevel, "titleId": titleId, "roleId": roleId, "status": status, "lockedOnly": lockedOnly, "startPosition": startPosition, "count": count};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserSummaryList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Gets a user.
    #
    # + userId - The ID of the user.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - User information successfully retrieved. 
    resource isolated function get v2/accounts/[string accountId]/users/[int:Signed32 userId]() returns User|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        User response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }

    # Updates a user's default office.
    #
    # + userId - The ID of the user to update.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - User information successfully updated. 
    resource isolated function put v2/accounts/[string accountId]/users/[int:Signed32 userId](UserForUpdate payload) returns User|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        User response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }

    # Removes a user from a company account.
    #
    # + userId - The ID of the user to remove.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - The User was successfully removed. 
    resource isolated function delete v2/accounts/[string accountId]/users/[int:Signed32 userId]() returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }

    # Invites a user to a company account.
    #
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - User successfully invited. 
    resource isolated function post v2/accounts/[string accountId]/users/invite_user(UserToInvite payload) returns User|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/users/invite_user`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        User response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }

    # Reinvites a user to join a company account.
    #
    # + userId - The ID of the user to reinvite.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - User successfully reinvited. 
    resource isolated function post v2/accounts/[string accountId]/users/[int:Signed32 userId]/reinvite() returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/reinvite`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }

    # Adds a user to an office.
    #
    # + userId - The ID of the user to add.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - User successfully added to the office. 
    resource isolated function post v2/accounts/[string accountId]/users/[int:Signed32 userId]/add_to_office(DesignatedOffice payload) returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/add_to_office`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }

    # Removes a user from an office.
    #
    # + userId - The ID of the user to remove.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - User successfully removed from the office. 
    resource isolated function post v2/accounts/[string accountId]/users/[int:Signed32 userId]/remove_from_office(DesignatedOffice payload) returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/remove_from_office`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }

    # Adds a user to a region.
    #
    # + userId - The ID of the user to add.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - User successfully added to the region. 
    resource isolated function post v2/accounts/[string accountId]/users/[int:Signed32 userId]/add_to_region(DesignatedRegion payload) returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/add_to_region`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }

    # Removes a user from a region.
    #
    # + userId - The ID of the user to remove.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - User successfully removed from the region. 
    resource isolated function post v2/accounts/[string accountId]/users/[int:Signed32 userId]/remove_from_region(DesignatedRegion payload) returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/remove_from_region`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }

    # Locks a user's account.
    #
    # + userId - ID of the user to lock.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - User has been successfully locked out. 
    resource isolated function post v2/accounts/[string accountId]/users/[int:Signed32 userId]/'lock(LockedOutDetails payload) returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/lock`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json-patch+json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }

    # Unlocks  a user's account.
    #
    # + userId - The ID of the user to unlock.
    # + accountId - The globally unique identifier (GUID) for the account.
    # + return - User has been successfully unlocked. 
    resource isolated function post v2/accounts/[string accountId]/users/[int:Signed32 userId]/unlock() returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/unlock`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
