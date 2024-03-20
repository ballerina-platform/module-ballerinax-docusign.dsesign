# Create digital signatures with DocuSign

## Introduction

This guide demonstrates how to utilize the DocuSign API in Ballerina to create a digital signature. In this example, there are steps to add a user signature, retrieve signature information, and obtain the details about all the signatures.

## Prerequisites

Follow the guidelines in the [Setup guide](https://github.com/ballerina-platform/module-ballerinax-docusign.dsesign?tab=readme-ov-file#setup-guide) to get access to DocuSign APIs.

### Configuration

Configure DocuSign API credentials in Config.toml in the example directory.

```toml
accountId = "<ACCOUNT_ID>"
userId = "<USER_ID>"
clientId = "<CLIENT_ID>"
clientSecret = "<CLIENT_SECRET>"
refreshToken = "<REFRESH_TOKEN>"
refreshUrl = "<REFRESH_URL>"
```

## Run the example

Execute the following command to run the example.

```ballerina
bal run
```
