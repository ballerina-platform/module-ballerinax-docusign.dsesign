# Tests

The test suite covers 30 of the connector's operations across the main eSignature workflows: account and account-settings retrieval, user and user-profile lookup, envelope creation, retrieval, update and listing, envelope documents, recipients, custom fields and audit events, embedded sender and recipient views, envelope locks, templates and template recipients, groups, folders, brands, and custom tabs.

Every envelope-scoped test creates its own draft envelope, and each delete test creates the resource it deletes, so no test depends on another or on execution order.

## Running Tests

```bash
bal test
```

The test suite uses a mock server (`tests/mock_service.bal`, port 9090) that intercepts the API calls, and a mock security token service (`tests/sts_mock_service.bal`, port 9444) that answers the OAuth 2.0 refresh-token grant, so no real credentials are required.

To run the same tests against the DocuSign developer (demo) environment, set the following environment variables and run `bal test --groups live_tests`.

| Variable | Description |
|---|---|
| `IS_LIVE_SERVER` | Set to `true` to target `https://demo.docusign.net/restapi` instead of the mock server |
| `DOCUSIGN_CLIENT_ID` | Integration key |
| `DOCUSIGN_CLIENT_SECRET` | Secret key |
| `DOCUSIGN_REFRESH_TOKEN` | OAuth 2.0 refresh token |
| `DOCUSIGN_ACCOUNT_ID` | Account ID (GUID) |
| `DOCUSIGN_USER_ID` | ID of an existing user in the account |
| `DOCUSIGN_TEMPLATE_ID` | ID of an existing template in the account |
