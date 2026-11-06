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

import ballerina/http;

listener http:Listener ep0 = new (9090);

service / on ep0 {
    resource function delete v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/'lock() returns EnvelopeLocks|ErrorDetailsBadRequest {
        return {lockType: "edit", lockToken: "0cc7a5f2-1c3f-4a2e-b7e4-3f5e8d7c2a10", lockDurationInSeconds: "0", lockedByApp: "Ballerina Connector", lockedByUser: {userId: "4c9a1c2e-8f0b-4e5a-9d1c-7a6b2f3e1d01", userName: "Jane Doe", email: "jane.doe@example.com"}};
    }

    resource function delete v2\.1/accounts/[string accountId]/tab_definitions/[string customTabId]() returns http:Ok|ErrorDetailsBadRequest {
        return http:OK;
    }

    resource function get v2\.1/accounts/[string accountId](@http:Query {name: "include_account_settings"} string? includeAccountSettings) returns AccountInformation|ErrorDetailsBadRequest {
        return {accountIdGuid: accountId, accountName: "Acme Corporation", planName: "Business Pro", currencyCode: "USD", createdDate: "2024-01-15T10:22:31.0000000Z", seatsAllowed: "25", seatsInUse: "7", billingPeriodEnvelopesSent: "142", billingPeriodEnvelopesAllowed: "unlimited", canUpgrade: "true"};
    }

    resource function get v2\.1/accounts/[string accountId]/brands(@http:Query {name: "exclude_distributor_brand"} string? excludeDistributorBrand, @http:Query {name: "include_logos"} string? includeLogos) returns AccountBrands|ErrorDetailsBadRequest {
        return {senderBrandIdDefault: "b7c2e8f1-4d3a-4a8e-9b1f-2c6d5e4f3a21", brands: [{brandId: "b7c2e8f1-4d3a-4a8e-9b1f-2c6d5e4f3a21", brandName: "Acme Default", brandCompany: "Acme Corporation", defaultBrandLanguage: "en", brandLanguages: ["en"], isSendingDefault: true, isSigningDefault: true}]};
    }

    resource function get v2\.1/accounts/[string accountId]/envelopes(@http:Query {name: "ac_status"} string? acStatus, string? block, @http:Query {name: "cdse_mode"} string? cdseMode, @http:Query {name: "continuation_token"} string? continuationToken, string? count, @http:Query {name: "custom_field"} string? customField, string? email, @http:Query {name: "envelope_ids"} string? envelopeIds, string? exclude, @http:Query {name: "folder_ids"} string? folderIds, @http:Query {name: "folder_types"} string? folderTypes, @http:Query {name: "from_date"} string? fromDate, @http:Query {name: "from_to_status"} string? fromToStatus, string? include, @http:Query {name: "include_purge_information"} string? includePurgeInformation, @http:Query {name: "intersecting_folder_ids"} string? intersectingFolderIds, @http:Query {name: "last_queried_date"} string? lastQueriedDate, string? 'order, @http:Query {name: "order_by"} string? orderBy, string? powerformids, @http:Query {name: "query_budget"} string? queryBudget, @http:Query {name: "requester_date_format"} string? requesterDateFormat, @http:Query {name: "search_mode"} string? searchMode, @http:Query {name: "search_text"} string? searchText, @http:Query {name: "start_position"} string? startPosition, string? status, @http:Query {name: "to_date"} string? toDate, @http:Query {name: "transaction_ids"} string? transactionIds, @http:Query {name: "user_filter"} string? userFilter, @http:Query {name: "user_id"} string? userId, @http:Query {name: "user_name"} string? userName) returns EnvelopesInformation|ErrorDetailsBadRequest {
        return {resultSetSize: "2", totalSetSize: "2", startPosition: "0", endPosition: "1", envelopes: [{envelopeId: "93be49ab-afa0-4adf-933c-f752070d71ec", status: "sent", emailSubject: "Please sign the service agreement", createdDateTime: "2026-09-20T08:15:02.0000000Z", sentDateTime: "2026-09-20T08:15:04.0000000Z"}, {envelopeId: "5b2f3a1c-7e4d-4c9b-8a1f-0d6e2c3b4a59", status: "completed", emailSubject: "NDA for review", createdDateTime: "2026-09-18T14:02:11.0000000Z", sentDateTime: "2026-09-18T14:02:13.0000000Z"}]};
    }

    resource function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId](@http:Query {name: "advanced_update"} string? advancedUpdate, string? include) returns Envelope|ErrorDetailsBadRequest {
        return {envelopeId: envelopeId, status: "sent", emailSubject: "Please sign the service agreement", createdDateTime: "2026-09-20T08:15:02.0000000Z", sentDateTime: "2026-09-20T08:15:04.0000000Z", envelopeUri: string `/envelopes/${envelopeId}`, documentsUri: string `/envelopes/${envelopeId}/documents`, recipientsUri: string `/envelopes/${envelopeId}/recipients`, sender: {userId: "4c9a1c2e-8f0b-4e5a-9d1c-7a6b2f3e1d01", userName: "Jane Doe", email: "jane.doe@example.com"}};
    }

    resource function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/'lock() returns EnvelopeLocks|ErrorDetailsBadRequest {
        return {lockType: "edit", lockToken: "0cc7a5f2-1c3f-4a2e-b7e4-3f5e8d7c2a10", lockDurationInSeconds: "300", lockedUntilDateTime: "2026-09-20T08:20:04.0000000Z", lockedByApp: "Ballerina Connector", lockedByUser: {userId: "4c9a1c2e-8f0b-4e5a-9d1c-7a6b2f3e1d01", userName: "Jane Doe", email: "jane.doe@example.com"}};
    }

    resource function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/audit_events() returns EnvelopeAuditEventResponse|ErrorDetailsBadRequest {
        return {auditEvents: [{eventFields: [{name: "logTime", value: "2026-09-20T08:15:04.0000000Z"}, {name: "Action", value: "Sent"}, {name: "UserName", value: "Jane Doe"}, {name: "EnvelopeStatus", value: "sent"}]}]};
    }

    resource function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/custom_fields() returns CustomFieldsEnvelope|ErrorDetailsBadRequest {
        return {textCustomFields: [{fieldId: "10732094", name: "Contract Number", value: "CN-2026-0042", show: "true", required: "false"}], listCustomFields: [{fieldId: "10732095", name: "Department", value: "Legal", listItems: ["Legal", "Sales", "Finance"], show: "true", required: "false"}]};
    }

    resource function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/documents(@http:Query {name: "documents_by_userid"} string? documentsByUserid, @http:Query {name: "include_docgen_formfields"} string? includeDocgenFormfields, @http:Query {name: "include_metadata"} string? includeMetadata, @http:Query {name: "include_tabs"} string? includeTabs, @http:Query {name: "recipient_id"} string? recipientId, @http:Query {name: "shared_user_id"} string? sharedUserId) returns EnvelopeDocumentsResult|ErrorDetailsBadRequest {
        return {envelopeId: envelopeId, envelopeDocuments: [{documentId: "1", name: "Service Agreement.pdf", 'type: "content", 'order: "1", uri: string `/envelopes/${envelopeId}/documents/1`}, {documentId: "certificate", name: "Summary", 'type: "summary", 'order: "999", uri: string `/envelopes/${envelopeId}/documents/certificate`}]};
    }

    resource function get v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients(@http:Query {name: "include_anchor_tab_locations"} string? includeAnchorTabLocations, @http:Query {name: "include_extended"} string? includeExtended, @http:Query {name: "include_metadata"} string? includeMetadata, @http:Query {name: "include_tabs"} string? includeTabs) returns EnvelopeRecipients|ErrorDetailsBadRequest {
        return {recipientCount: "2", currentRoutingOrder: "1", signers: [{recipientId: "1", name: "John Smith", email: "john.smith@example.com", routingOrder: "1", status: "sent"}], carbonCopies: [{recipientId: "2", name: "Mary Major", email: "mary.major@example.com", routingOrder: "2", status: "created"}]};
    }

    resource function get v2\.1/accounts/[string accountId]/folders(string? count, string? include, @http:Query {name: "include_items"} string? includeItems, @http:Query {name: "start_position"} string? startPosition, @http:Query {name: "sub_folder_depth"} string? subFolderDepth, string? template, @http:Query {name: "user_filter"} string? userFilter) returns FoldersResponse|ErrorDetailsBadRequest {
        return {resultSetSize: "2", totalSetSize: "2", startPosition: "0", endPosition: "1", folders: [{folderId: "9b1c8e2a-3f4d-4b5a-8c7e-1d2f3a4b5c6d", name: "Inbox", 'type: "inbox", itemCount: "12"}, {folderId: "2a3b4c5d-6e7f-4a8b-9c0d-1e2f3a4b5c6d", name: "Sent Items", 'type: "sentitems", itemCount: "31"}]};
    }

    resource function get v2\.1/accounts/[string accountId]/groups(string? count, @http:Query {name: "group_type"} string? groupType, @http:Query {name: "include_usercount"} string? includeUsercount, @http:Query {name: "search_text"} string? searchText, @http:Query {name: "start_position"} string? startPosition) returns GroupInformation|ErrorDetailsBadRequest {
        return {resultSetSize: "2", totalSetSize: "2", startPosition: "0", endPosition: "1", groups: [{groupId: "8631245", groupName: "Administrators", groupType: "adminGroup", usersCount: "2"}, {groupId: "8631246", groupName: "Legal Team", groupType: "customGroup", usersCount: "5"}]};
    }

    resource function get v2\.1/accounts/[string accountId]/settings() returns AccountSettingsInformation|ErrorDetailsBadRequest {
        return {allowEnvelopeCorrect: "true", enableSequentialSigningAPI: "true", allowSigningGroups: "true", enableAutoNav: "true", enableSignerAttachments: "true", allowBulkSend: "true", signDateFormat: "M/d/yyyy"};
    }

    resource function get v2\.1/accounts/[string accountId]/tab_definitions(@http:Query {name: "custom_tab_only"} string? customTabOnly) returns TabMetadataList|ErrorDetailsBadRequest {
        return {tabs: [{customTabId: "a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d", name: "Employee ID", tabLabel: "EmployeeId", 'type: "text", font: "helvetica", fontSize: "size11", editable: "true", required: "true", shared: "true", createdByDisplayName: "Jane Doe"}]};
    }

    resource function get v2\.1/accounts/[string accountId]/templates(string? count, @http:Query {name: "created_from_date"} string? createdFromDate, @http:Query {name: "created_to_date"} string? createdToDate, @http:Query {name: "folder_ids"} string? folderIds, @http:Query {name: "folder_types"} string? folderTypes, @http:Query {name: "from_date"} string? fromDate, string? include, @http:Query {name: "is_deleted_template_only"} string? isDeletedTemplateOnly, @http:Query {name: "is_download"} string? isDownload, @http:Query {name: "modified_from_date"} string? modifiedFromDate, @http:Query {name: "modified_to_date"} string? modifiedToDate, string? 'order, @http:Query {name: "order_by"} string? orderBy, @http:Query {name: "search_fields"} string? searchFields, @http:Query {name: "search_text"} string? searchText, @http:Query {name: "shared_by_me"} string? sharedByMe, @http:Query {name: "start_position"} string? startPosition, @http:Query {name: "template_ids"} string? templateIds, @http:Query {name: "to_date"} string? toDate, @http:Query {name: "used_from_date"} string? usedFromDate, @http:Query {name: "used_to_date"} string? usedToDate, @http:Query {name: "user_filter"} string? userFilter, @http:Query {name: "user_id"} string? userId) returns EnvelopeTemplateResults|ErrorDetailsBadRequest {
        return {resultSetSize: "1", totalSetSize: "1", startPosition: "0", endPosition: "0", envelopeTemplates: [{templateId: "d4e5f6a7-b8c9-4d0e-9f1a-2b3c4d5e6f70", name: "Standard NDA", description: "Mutual non-disclosure agreement", emailSubject: "Please sign the NDA", shared: "false", created: "2026-03-02T11:40:00.0000000Z", lastModified: "2026-08-14T09:12:45.0000000Z", pageCount: "3", owner: {userId: "4c9a1c2e-8f0b-4e5a-9d1c-7a6b2f3e1d01", userName: "Jane Doe", email: "jane.doe@example.com"}}]};
    }

    resource function get v2\.1/accounts/[string accountId]/templates/[string templateId](string? include) returns EnvelopeTemplate|ErrorDetailsBadRequest {
        return {templateId: templateId, name: "Standard NDA", description: "Mutual non-disclosure agreement", emailSubject: "Please sign the NDA", shared: "false", created: "2026-03-02T11:40:00.0000000Z", lastModified: "2026-08-14T09:12:45.0000000Z", pageCount: "3", uri: string `/templates/${templateId}`, owner: {userId: "4c9a1c2e-8f0b-4e5a-9d1c-7a6b2f3e1d01", userName: "Jane Doe", email: "jane.doe@example.com"}};
    }

    resource function get v2\.1/accounts/[string accountId]/templates/[string templateId]/recipients(@http:Query {name: "include_anchor_tab_locations"} string? includeAnchorTabLocations, @http:Query {name: "include_extended"} string? includeExtended, @http:Query {name: "include_tabs"} string? includeTabs) returns Recipients|ErrorDetailsBadRequest {
        return {recipientCount: "1", signers: [{recipientId: "1", roleName: "Signer", routingOrder: "1"}]};
    }

    resource function get v2\.1/accounts/[string accountId]/users(@http:Query {name: "additional_info"} string? additionalInfo, @http:Query {name: "alternate_admins_only"} string? alternateAdminsOnly, string? count, @http:Query {name: "domain_users_only"} string? domainUsersOnly, string? email, @http:Query {name: "email_substring"} string? emailSubstring, @http:Query {name: "group_id"} string? groupId, @http:Query {name: "include_usersettings_for_csv"} string? includeUsersettingsForCsv, @http:Query {name: "login_status"} string? loginStatus, @http:Query {name: "not_group_id"} string? notGroupId, @http:Query {name: "start_position"} string? startPosition, string? status, @http:Query {name: "user_name_substring"} string? userNameSubstring) returns UserInformationList|ErrorDetailsBadRequest {
        return {resultSetSize: "2", totalSetSize: "2", startPosition: "0", endPosition: "1", users: [{userId: "4c9a1c2e-8f0b-4e5a-9d1c-7a6b2f3e1d01", userName: "Jane Doe", email: "jane.doe@example.com", userStatus: "active", permissionProfileName: "DS Admin"}, {userId: "7e8f9a0b-1c2d-4e3f-8a4b-5c6d7e8f9a0b", userName: "John Smith", email: "john.smith@example.com", userStatus: "active", permissionProfileName: "DS Sender"}]};
    }

    resource function get v2\.1/accounts/[string accountId]/users/[string userId](@http:Query {name: "additional_info"} string? additionalInfo, string? email) returns UserInformation|ErrorDetailsBadRequest {
        return {userId: userId, userName: "Jane Doe", firstName: "Jane", lastName: "Doe", email: "jane.doe@example.com", userStatus: "active", permissionProfileId: "12876043", permissionProfileName: "DS Admin", defaultAccountId: accountId};
    }

    resource function get v2\.1/accounts/[string accountId]/users/[string userId]/profile() returns UserProfile|ErrorDetailsBadRequest {
        return {companyName: "Acme Corporation", title: "Contracts Manager", displayProfile: "true", address: {address1: "221 Main Street", city: "San Francisco", stateOrProvince: "CA", postalCode: "94105", country: "US"}, userDetails: {userId: userId, userName: "Jane Doe", email: "jane.doe@example.com"}};
    }

    resource function post v2\.1/accounts/[string accountId]/envelopes(@http:Query {name: "cdse_mode"} string? cdseMode, @http:Query {name: "change_routing_order"} string? changeRoutingOrder, @http:Query {name: "completed_documents_only"} string? completedDocumentsOnly, @http:Query {name: "merge_roles_on_draft"} string? mergeRolesOnDraft, @http:Payload EnvelopeDefinition|xml payload) returns EnvelopeSummary|ErrorDetailsBadRequest {
        return {envelopeId: "93be49ab-afa0-4adf-933c-f752070d71ec", status: payload is EnvelopeDefinition ? (payload.status ?: "created") : "created", statusDateTime: "2026-09-20T08:15:04.0000000Z", uri: string `/envelopes/${"93be49ab-afa0-4adf-933c-f752070d71ec"}`};
    }

    resource function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/'lock(@http:Payload LockRequest|xml payload) returns EnvelopeLocks|ErrorDetailsBadRequest {
        return {lockType: payload is LockRequest ? (payload.lockType ?: "edit") : "edit", lockToken: "0cc7a5f2-1c3f-4a2e-b7e4-3f5e8d7c2a10", lockDurationInSeconds: payload is LockRequest ? (payload.lockDurationInSeconds ?: "300") : "300", lockedUntilDateTime: "2026-09-20T08:20:04.0000000Z", lockedByApp: "Ballerina Connector", lockedByUser: {userId: "4c9a1c2e-8f0b-4e5a-9d1c-7a6b2f3e1d01", userName: "Jane Doe", email: "jane.doe@example.com"}};
    }

    resource function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/recipients(@http:Query {name: "resend_envelope"} string? resendEnvelope, @http:Payload EnvelopeRecipients|xml payload) returns EnvelopeRecipients|ErrorDetailsBadRequest {
        if payload is EnvelopeRecipients {
            return payload;
        }
        return {recipientCount: "1", signers: [{recipientId: "3", name: "Alex Kim", email: "alex.kim@example.com", routingOrder: "1", status: "created"}]};
    }

    resource function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/views/recipient(@http:Payload RecipientViewRequest|xml payload) returns EnvelopeViews|ErrorDetailsBadRequest {
        return {url: string `https://demo.docusign.net/Signing/MTRedeem/v1/4b5c6d7e?slt=${envelopeId}`};
    }

    resource function post v2\.1/accounts/[string accountId]/envelopes/[string envelopeId]/views/sender(@http:Payload EnvelopeViewRequest|xml payload) returns EnvelopeViews|ErrorDetailsBadRequest {
        return {url: string `https://appdemo.docusign.com/prepare/${envelopeId}/add-fields`};
    }

    resource function post v2\.1/accounts/[string accountId]/groups(@http:Payload GroupInformation|xml payload) returns GroupInformation|ErrorDetailsBadRequest {
        Group[] requested = payload is GroupInformation ? (payload.groups ?: []) : [];
        Group[] created = from Group g in requested select {groupId: "8631247", groupName: g.groupName ?: "New Group", groupType: "customGroup", usersCount: "0"};
        return {resultSetSize: created.length().toString(), groups: created};
    }

    resource function post v2\.1/accounts/[string accountId]/tab_definitions(@http:Payload TabMetadata|xml payload) returns TabMetadata|ErrorDetailsBadRequest {
        TabMetadata tab = payload is TabMetadata ? payload.clone() : {};
        tab.customTabId = "a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d";
        tab.createdByDisplayName = "Jane Doe";
        return tab;
    }

    resource function post v2\.1/accounts/[string accountId]/templates(@http:Payload EnvelopeTemplate|xml payload) returns TemplateSummary|ErrorDetailsBadRequest {
        return {templateId: "d4e5f6a7-b8c9-4d0e-9f1a-2b3c4d5e6f70", name: payload is EnvelopeTemplate ? (payload.name ?: "Untitled") : "Untitled", uri: "/templates/d4e5f6a7-b8c9-4d0e-9f1a-2b3c4d5e6f70"};
    }

    resource function put v2\.1/accounts/[string accountId]/envelopes/[string envelopeId](@http:Query {name: "advanced_update"} string? advancedUpdate, @http:Query {name: "resend_envelope"} string? resendEnvelope, @http:Payload Envelope|xml payload) returns EnvelopeUpdateSummary|ErrorDetailsBadRequest {
        return {envelopeId: envelopeId, purgeState: "unpurged"};
    }
}

// Service-mode response types. `bal openapi --mode client` collapses 4XX/5XX
// to `error` and never emits these, so they are defined here for the mock only.
public type ErrorDetailsBadRequest record {|
    *http:BadRequest;
    ErrorDetails body;
|};
