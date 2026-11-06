# Changelog

This file contains all the notable changes done to the Ballerina DocuSign eSignature connector through the releases.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0]

### Added

- Envelope sharing: `listEnvelopeShares`, `createEnvelopeShares`, `updateEnvelopeShares`, `deleteEnvelopeShares`, `getEnvelopeShare`, `updateEnvelopeShare` and `deleteEnvelopeShare`.
- `listSharedEnvelopes` to list the envelopes shared with the current user.
- Connect HMAC secrets: `listConnectSecrets`, `createConnectSecret` and `deleteConnectSecret`.
- Template auto-match: `updateTemplatesAutoMatch` and `applyTemplatesAutoMatch`.

### Changed

- **Breaking:** The client now exposes remote methods named after each operation instead of resource methods. For example, `docusign->/accounts/[accountId]/envelopes.post(envelope)` becomes `docusign->createEnvelope(accountId, envelope)`, and `docusign->/accounts/[accountId]/envelopes(from_date = "...")` becomes `docusign->listEnvelopes(accountId, fromDate = "...")`. Query parameters are passed as named arguments with camel-case names.
- **Breaking:** The client initializer is now `init(ConnectionConfig config, string serviceUrl = "https://www.docusign.net/restapi")`. Pass the configuration first and the service URL second, for example `new ({auth: {...}}, "https://demo.docusign.net/restapi")`.
- **Breaking:** `ConnectionConfig.auth` is now a required `http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig`, replacing the optional `http:ClientAuthConfig?`.
- **Breaking:** The record `DowngradRequestBillingInfoResponse` is renamed `DowngradeRequestBillingInfoResponse`, and `Resources_resourceContentType_body` is renamed `UpdateBrandResourceRequest`.
- **Breaking:** Records that no operation takes or returns (for example `Envelopes`, `Users`, `Templates` and the other per-resource-group descriptors) are no longer generated. `ConnectionConfig` now uses `http:ClientHttp1Settings` and `http:ProxyConfig` directly, so the connector-local `ClientHttp1Settings` and `ProxyConfig` records are removed.
- **Breaking:** `createEnvelopeSenderView`, `createEnvelopeEditView` and `createEnvelopeCorrectView` now take an `EnvelopeViewRequest`, and `createTemplateEditView` takes a `TemplateViewRequest`, replacing `ReturnUrlRequest` and `CorrectViewRequest`. `ReturnUrlRequest` is removed.
- **Breaking:** `listGroupUsers` now returns `GroupUsersResponse` instead of `UsersResponse`.
- `createRecipientProofFileToken` and `listEnvelopeAuditEvents` accept new optional query parameters.
- The connector now supports the DocuSign eSignature REST API v2.1 as of the 26.1.02.00 release.

For earlier releases, see the [GitHub releases](https://github.com/ballerina-platform/module-ballerinax-docusign.dsesign/releases).
