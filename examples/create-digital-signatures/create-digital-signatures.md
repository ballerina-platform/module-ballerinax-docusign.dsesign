# Create digital signatures with DocuSign

## Introduction

This guide demonstrates how to utilize the DocuSign API in Ballerina to create a digital signature. In this example, there are steps to add a user signature, retrieve signature information, and obtain the details about all the signatures.

## Prerequisites

Follow the guidelines in the [Setup guide](https://github.com/ballerina-platform/module-ballerinax-docusign.dsesign?tab=readme-ov-file#setup-guide) to get access to DocuSign APIs.

### Configuration

Configure DocuSign API credentials in Config.toml in the example directory. For the developer (demo) environment, use `https://account-d.docusign.com/oauth/token` as the refresh URL and `https://demo.docusign.net/restapi` as the service URL.

```toml
accountId = "<ACCOUNT_ID>"
userId = "<USER_ID>"
clientId = "<CLIENT_ID>"
clientSecret = "<CLIENT_SECRET>"
refreshToken = "<REFRESH_TOKEN>"
refreshUrl = "<REFRESH_URL>"
serviceUrl = "<SERVICE_URL>"
```

## Run the example

Execute the following command to run the example.

```bash
bal run
```
