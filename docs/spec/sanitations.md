# Sanitations for OpenAPI specification

_Authors_: @Nuvindu \
_Reviewers_: @shafreenAnfar @ThisaruGuruge \
_Created_: 2024/02/14 \
_Updated_: 2024/02/14 \
_Edition_: Swan Lake

## Introduction

The Ballerina DocuSign eSignature connector facilitates integration with the [DocuSign eSignature API](https://developers.docusign.com/docs/esign-rest-api/reference) through the generation of client code using the [OpenAPI specification](https://github.com/ballerina-platform/module-ballerinax-docusign.dsesign/blob/main/docs/spec/esignature.rest.swagger-v2.1.json). To enhance usability, the following modifications have been applied to the original specification.

1. File Division
To address code point limit issues during client code generation, the original specification has been divided into two files. 

2. Response Descriptions
Previously, all responses for resource functions were labeled with a generic "Successful Response". This has been revised to "A successful response or an error".

## OpenAPI cli command

```bash
bal openapi -i docs/spec/esignature.rest.swagger-v2.1-1.json --mode client -o ballerina
```
