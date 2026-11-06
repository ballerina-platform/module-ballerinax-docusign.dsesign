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

import ballerina/os;
import ballerina/test;

final boolean isLiveServer = os:getEnv("IS_LIVE_SERVER") == "true";
final string serviceUrl = isLiveServer ? "https://demo.docusign.net/restapi" : "http://localhost:9090";

final string accountId = isLiveServer ? os:getEnv("DOCUSIGN_ACCOUNT_ID") : "2b6f1c9e-4d3a-4f8b-9c1e-7a5d3b2e1f00";
final string userId = isLiveServer ? os:getEnv("DOCUSIGN_USER_ID") : "4c9a1c2e-8f0b-4e5a-9d1c-7a6b2f3e1d01";
final string templateId = isLiveServer ? os:getEnv("DOCUSIGN_TEMPLATE_ID") : "d4e5f6a7-b8c9-4d0e-9f1a-2b3c4d5e6f70";

// Created in @BeforeSuite rather than at module init: the OAuth 2.0 refresh-token grant fetches
// a token when the client is constructed, and the mock STS listener is only up once tests start.
Client docusign = test:mock(Client);

@test:BeforeSuite
function initClient() returns error? {
    if isLiveServer {
        docusign = check new ({
            auth: {
                clientId: os:getEnv("DOCUSIGN_CLIENT_ID"),
                clientSecret: os:getEnv("DOCUSIGN_CLIENT_SECRET"),
                refreshToken: os:getEnv("DOCUSIGN_REFRESH_TOKEN"),
                refreshUrl: "https://account-d.docusign.com/oauth/token"
            }
        }, serviceUrl);
        return;
    }
    // Mock mode exercises the OAuth 2.0 refresh-token grant against the mock STS in
    // sts_mock_service.bal, as the live client does against DocuSign's account server.
    docusign = check new ({
        auth: {
            clientId: "mock-client-id",
            clientSecret: "mock-client-secret",
            refreshToken: "mock-refresh-token",
            refreshUrl: "http://localhost:9444/oauth2/token"
        }
    }, serviceUrl);
}

// A draft envelope with one signer and one inline document, used as the fixture for every
// envelope-scoped test. Each test creates its own, so none depends on execution order.
function createDraftEnvelope(string status = "created") returns string|error {
    EnvelopeSummary summary = check docusign->createEnvelope(accountId, {
        emailSubject: "Ballerina connector test envelope",
        status,
        documents: [
            {
                documentId: "1",
                name: "agreement.txt",
                fileExtension: "txt",
                documentBase64: "VGhpcyBpcyBhIHRlc3QgYWdyZWVtZW50Lg=="
            }
        ],
        recipients: {
            signers: [
                {
                    recipientId: "1",
                    routingOrder: "1",
                    name: "John Smith",
                    email: "john.smith@example.com",
                    clientUserId: "1001"
                }
            ]
        }
    });
    string? envelopeId = summary.envelopeId;
    if envelopeId is () {
        return error("createEnvelope returned no envelopeId");
    }
    return envelopeId;
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetAccount() returns error? {
    AccountInformation account = check docusign->getAccount(accountId);
    test:assertTrue(account.accountName !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetAccountSettings() returns error? {
    AccountSettingsInformation settings = check docusign->getAccountSettings(accountId);
    test:assertTrue(settings.allowSigningGroups !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testListBrands() returns error? {
    AccountBrands brands = check docusign->listBrands(accountId);
    test:assertTrue(brands.brands !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testListUsers() returns error? {
    UserInformationList users = check docusign->listUsers(accountId);
    UserInformation[] list = users.users ?: [];
    test:assertTrue(list.length() > 0);
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetUser() returns error? {
    UserInformation user = check docusign->getUser(accountId, userId);
    test:assertEquals(user.userId, userId);
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetUserProfile() returns error? {
    UserProfile profile = check docusign->getUserProfile(accountId, userId);
    test:assertTrue(profile.userDetails !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testCreateEnvelope() returns error? {
    string envelopeId = check createDraftEnvelope();
    test:assertTrue(envelopeId.length() > 0);
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testListEnvelopes() returns error? {
    EnvelopesInformation envelopes = check docusign->listEnvelopes(accountId, fromDate = "2026-01-01");
    test:assertTrue(envelopes.resultSetSize !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetEnvelope() returns error? {
    string envelopeId = check createDraftEnvelope();
    Envelope envelope = check docusign->getEnvelope(accountId, envelopeId);
    test:assertEquals(envelope.envelopeId, envelopeId);
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testUpdateEnvelope() returns error? {
    string envelopeId = check createDraftEnvelope();
    EnvelopeUpdateSummary summary = check docusign->updateEnvelope(accountId, envelopeId, {
        emailSubject: "Ballerina connector test envelope (updated)"
    });
    test:assertEquals(summary.envelopeId, envelopeId);
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testListEnvelopeDocuments() returns error? {
    string envelopeId = check createDraftEnvelope();
    EnvelopeDocumentsResult documents = check docusign->listEnvelopeDocuments(accountId, envelopeId);
    EnvelopeDocument[] list = documents.envelopeDocuments ?: [];
    test:assertTrue(list.length() > 0);
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testListEnvelopeRecipients() returns error? {
    string envelopeId = check createDraftEnvelope();
    EnvelopeRecipients recipients = check docusign->listEnvelopeRecipients(accountId, envelopeId);
    Signer[] signers = recipients.signers ?: [];
    test:assertTrue(signers.length() > 0);
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testCreateEnvelopeRecipients() returns error? {
    string envelopeId = check createDraftEnvelope();
    EnvelopeRecipients recipients = check docusign->createEnvelopeRecipients(accountId, envelopeId, {
        carbonCopies: [
            {
                recipientId: "2",
                routingOrder: "2",
                name: "Mary Major",
                email: "mary.major@example.com"
            }
        ]
    });
    test:assertTrue(recipients.carbonCopies !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testListEnvelopeAuditEvents() returns error? {
    string envelopeId = check createDraftEnvelope();
    EnvelopeAuditEventResponse events = check docusign->listEnvelopeAuditEvents(accountId, envelopeId);
    EnvelopeAuditEvent[] list = events.auditEvents ?: [];
    test:assertTrue(list.length() > 0);
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testListEnvelopeCustomFields() returns error? {
    string envelopeId = check createDraftEnvelope();
    CustomFieldsEnvelope fields = check docusign->listEnvelopeCustomFields(accountId, envelopeId);
    test:assertTrue(fields.textCustomFields !is () || fields.listCustomFields !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testCreateEnvelopeSenderView() returns error? {
    string envelopeId = check createDraftEnvelope();
    EnvelopeViews view = check docusign->createEnvelopeSenderView(accountId, envelopeId, {
        returnUrl: "https://www.example.com/docusign/return"
    });
    test:assertTrue(view.url !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testCreateEnvelopeRecipientView() returns error? {
    // A recipient signing view can only be created for a sent envelope.
    string envelopeId = check createDraftEnvelope("sent");
    EnvelopeViews view = check docusign->createEnvelopeRecipientView(accountId, envelopeId, {
        returnUrl: "https://www.example.com/docusign/return",
        authenticationMethod: "none",
        clientUserId: "1001",
        userName: "John Smith",
        email: "john.smith@example.com"
    });
    test:assertTrue(view.url !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testCreateEnvelopeLock() returns error? {
    string envelopeId = check createDraftEnvelope();
    EnvelopeLocks envelopeLock = check docusign->createEnvelopeLock(accountId, envelopeId, {
        lockType: "edit",
        lockDurationInSeconds: "300",
        lockedByApp: "Ballerina Connector"
    });
    test:assertTrue(envelopeLock.lockToken !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetEnvelopeLock() returns error? {
    string envelopeId = check createDraftEnvelope();
    _ = check docusign->createEnvelopeLock(accountId, envelopeId, {lockType: "edit", lockDurationInSeconds: "300"});
    EnvelopeLocks envelopeLock = check docusign->getEnvelopeLock(accountId, envelopeId);
    test:assertTrue(envelopeLock.lockToken !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testDeleteEnvelopeLock() returns error? {
    string envelopeId = check createDraftEnvelope();
    EnvelopeLocks created = check docusign->createEnvelopeLock(accountId, envelopeId, {
        lockType: "edit",
        lockDurationInSeconds: "300"
    });
    string? lockToken = created.lockToken;
    test:assertTrue(lockToken !is ());
    EnvelopeLocks released = check docusign->deleteEnvelopeLock(accountId, envelopeId, {
        "X-DocuSign-Edit": string `{"LockToken": "${lockToken ?: ""}"}`
    });
    test:assertTrue(released.lockType !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testListTemplates() returns error? {
    EnvelopeTemplateResults templates = check docusign->listTemplates(accountId);
    test:assertTrue(templates.resultSetSize !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testCreateTemplate() returns error? {
    TemplateSummary summary = check docusign->createTemplate(accountId, {
        name: "Ballerina connector test template",
        emailSubject: "Please sign this document",
        documents: [
            {
                documentId: "1",
                name: "template.txt",
                fileExtension: "txt",
                documentBase64: "VGhpcyBpcyBhIHRlc3QgdGVtcGxhdGUu"
            }
        ],
        recipients: {
            signers: [{recipientId: "1", roleName: "Signer", routingOrder: "1"}]
        }
    });
    test:assertTrue(summary.templateId !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testGetTemplate() returns error? {
    EnvelopeTemplate template = check docusign->getTemplate(accountId, templateId);
    test:assertEquals(template.templateId, templateId);
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testListTemplateRecipients() returns error? {
    Recipients recipients = check docusign->listTemplateRecipients(accountId, templateId);
    test:assertTrue(recipients.signers !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testListGroups() returns error? {
    GroupInformation groups = check docusign->listGroups(accountId);
    Group[] list = groups.groups ?: [];
    test:assertTrue(list.length() > 0);
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testCreateGroups() returns error? {
    GroupInformation created = check docusign->createGroups(accountId, {
        groups: [{groupName: "Ballerina Connector Test Group"}]
    });
    Group[] list = created.groups ?: [];
    test:assertEquals(list.length(), 1);
    test:assertTrue(list[0].groupId !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testListFolders() returns error? {
    FoldersResponse folders = check docusign->listFolders(accountId);
    Folder[] list = folders.folders ?: [];
    test:assertTrue(list.length() > 0);
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testListCustomTabs() returns error? {
    TabMetadataList tabs = check docusign->listCustomTabs(accountId);
    test:assertTrue(tabs.tabs !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testCreateCustomTab() returns error? {
    TabMetadata tab = check docusign->createCustomTab(accountId, {
        name: "Ballerina Test Tab",
        tabLabel: "BallerinaTestTab",
        'type: "text",
        font: "helvetica",
        fontSize: "size11"
    });
    test:assertTrue(tab.customTabId !is ());
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function testDeleteCustomTab() returns error? {
    TabMetadata tab = check docusign->createCustomTab(accountId, {
        name: "Ballerina Test Tab To Delete",
        tabLabel: "BallerinaTestTabToDelete",
        'type: "text"
    });
    string? customTabId = tab.customTabId;
    if customTabId is () {
        return error("createCustomTab returned no customTabId");
    }
    check docusign->deleteCustomTab(accountId, customTabId);
}
