# Sanitations for OpenAPI specification

_Authors_: @Nuvindu @DimuthuMadushan \
_Reviewers_: @shafreenAnfar @ThisaruGuruge \
_Created_: 2024/02/14 \
_Updated_: 2026/09/23 \
_Edition_: Swan Lake

## Introduction

The Ballerina DocuSign eSignature connector facilitates integration with the [DocuSign eSignature API](https://developers.docusign.com/docs/esign-rest-api/reference) through the generation of client code using the [OpenAPI specification](https://github.com/docusign/OpenAPI-Specifications/blob/master/esignature.rest.swagger-v2.1.json) (`esignature.rest.swagger-v2.1.json` on the `master` branch, as of commit `22a381c4`, 2026-06-24). This version of the specification is not yet in [wso2/api-specs](https://github.com/wso2/api-specs/tree/main/openapi/docusign/esign/v2.1), whose copy still matches the specification used for connector version 1.0.1. To enhance usability, the following modifications have been applied to the original specification.

1. Response descriptions
Previously, all responses for resource functions were labeled with a generic "Successful Response". This has been revised to "A successful response or an error".

2. Parameter redefinition
The path parameter `langCode` has been redefined as `languageCode` to eliminate conflicts with an existing query parameter with the same name, `langCode`.
This applies to `GET /v2.1/accounts/{accountId}/envelopes/{envelopeId}/recipients/{recipientId}/consumer_disclosure/{languageCode}` and is made in `docs/spec/openapi.json` itself, so client generation reproduces it.

3. Documentation reference correction
An invalid reference in the documentation related to the `DateTime.Parse()` function has been modified. It has been identified as a function in the DocuSign eSignature client. Therefore, it is clarified not to be recognized as a specific client function, providing accurate documentation for developers.
The two occurrences (the `from_date` and `to_date` parameters of `listEnvelopes`) read `['DateTime.Parse()']` in `docs/spec/openapi.json`.

4. Parameter reference correction
A correction has been made to address an invalid parameter reference outside of the function definition for the `certificate` query parameter. As the `certificate` is only a special value for the `documentId` query parameter, the incorrect documentation has been modified
The `documentId` description of `getEnvelopeDocument` reads "When the `certificate` query parameter is ..." in `docs/spec/openapi.json`.

5. Avoid path segments with backslashes
To prevent errors associated with backslashes in the resource path, the functions in the format, `get v2\.1/accounts/.../` have been modified as `get accounts/.../` to avoid broken paths in the API calls.
Since 2.0.0 the client uses remote methods named after the operation IDs, so no resource path is exposed and this change is no longer needed.

6. Response media types
402 operations declare an empty `produces: []`, which overrides the document-level `produces: ["application/json"]`. On conversion to OpenAPI 3.0 their responses became `*/*`, so the generated client returned an untyped `http:Response` for them. The empty `produces` arrays have been removed so these operations inherit `application/json` and return their typed records. Operations that declare a real media type (`image/gif`, `image/png`, `application/pdf`, `application/octet-stream`, `text/plain`) are unchanged.

7. Security scheme
The specification declares an empty `securityDefinitions`, so the generated `ConnectionConfig` carried no `auth` field. An `oAuth2` scheme (authorization code flow, `https://account.docusign.com/oauth/auth` and `https://account.docusign.com/oauth/token`) and a document-level `security` requirement have been added, which gives the client `http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth`.

8. Documentation formatting
Unbalanced backticks in the descriptions of `AccountSettingsInformation.enableAutoNav` (`EnableAutoNavByDSAdmin`), `BillingPlanInformation.renewalStatus` (`queued_for_downgrade`) and `PowerForm.limitUseIntervalUnits` (`hours`) have been closed. Code spans that Ballerina reads as name references have been reworded: "the `combine_same_order_recipients` query parameter" (`RecipientUpdateResponse.combined`), "the `event=Send` / `event=Save` query string" (`EnvelopeViewSettings.sendButtonAction`) and "For `TableRow` fields" (document generation form fields).

9. Retained `recipient_names` operation
`GET /v2.1/accounts/{accountId}/recipient_names` (`listRecipientNames`) is no longer in the DocuSign specification. It has been carried over, together with its `recipientNamesResponse` definition, from the specification used for connector version 1.0.1 so that the connector does not drop a published operation.

## OpenAPI cli command

The following command was used to generate the Ballerina client from the OpenAPI specification. The command should be executed from the repository root directory.

```bash
bal openapi -i docs/spec/aligned_ballerina_openapi.json --mode client --client-methods remote --license docs/license.txt -o ballerina
```
