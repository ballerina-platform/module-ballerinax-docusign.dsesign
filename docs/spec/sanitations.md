# Sanitations for OpenAPI specification

_Authors_: @Nuvindu \
_Reviewers_: @shafreenAnfar @ThisaruGuruge \
_Created_: 2024/02/14 \
_Updated_: 2024/02/19 \
_Edition_: Swan Lake

## Introduction

The Ballerina DocuSign eSignature connector facilitates integration with the [DocuSign eSignature API](https://developers.docusign.com/docs/esign-rest-api/reference) through the generation of client code using the [OpenAPI specification](https://github.com/ballerina-platform/module-ballerinax-docusign.dsesign/blob/main/docs/spec/openapi.json). To enhance usability, the following modifications have been applied to the original specification.

1. Response descriptions
Previously, all responses for resource functions were labeled with a generic "Successful Response". This has been revised to "A successful response or an error".

2. Parameter redefinition
The path parameter `langCode` has been redefined as `languageCode` to eliminate conflicts with an existing query parameter with the same name, `langCode`.

3. Documentation reference correction
An invalid reference in the documentation related to the `DateTime.Parse()` function has been modified. It has been identified as a function in the DocuSign eSignature client. Therefore, it is clarified not to be recognized as a specific client function, providing accurate documentation for developers.

4. Parameter reference correction
A correction has been made to address an invalid parameter reference outside of the function definition for the `certificate` query parameter. As the `certificate` is only a special value for the `documentId` query parameter, the incorrect documentation has been modified

5. Avoid path segments with backslashes
To prevent errors associated with backslashes in the resource path, the functions in the format, `get v2\.1/accounts/.../` have been modified as `get accounts/.../` to avoid broken paths in the API calls.

## OpenAPI cli command

```bash
bal openapi -i docs/spec/openapi.json --mode client -o ballerina
```
