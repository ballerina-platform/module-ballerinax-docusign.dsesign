# Send documents for esignatures with DocuSign

This guide illustrates the process of integrating DocuSign APIs to send documents to add digital signatures. The example covers steps to send a document for signature, including document preparation, recipient setup, and envelope creation.

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
