# Send documents for esignatures with DocuSign

This guide illustrates the process of integrating DocuSign APIs to send documents to add digital signatures. The example covers steps to send a document for signature, including document preparation, recipient setup, and envelope creation.

## Prerequisites

Follow the guidelines in the [Setup guide](https://github.com/ballerina-platform/module-ballerinax-docusign.dsesign?tab=readme-ov-file#setup-guide) to get access to DocuSign APIs.

### Configuration

Configure DocuSign API credentials in Config.toml in the example directory. For the developer (demo) environment, use `https://account-d.docusign.com/oauth/token` as the refresh URL and `https://demo.docusign.net/restapi` as the service URL. For the developer (demo) environment, use `https://account-d.docusign.com/oauth/token` as the refresh URL and `https://demo.docusign.net/restapi` as the service URL.

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
