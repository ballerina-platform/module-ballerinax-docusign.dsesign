## Examples

The DocuSign eSignature connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-docusign.dsesign/tree/main/examples).

1. [Send documents for esignatures](https://github.com/ballerina-platform/module-ballerinax-docusign.dsesign/tree/main/examples/send-documents-for-esignatures) - Send an envelope with a document to a recipient to add their eSignature, then list the envelope's documents.

2. [Create digital signatures](https://github.com/ballerina-platform/module-ballerinax-docusign.dsesign/tree/main/examples/create-digital-signatures) - Add a signature image for a DocuSign user, then list the user's signatures and read one back.

## Prerequisites

1. Follow the [instructions](https://github.com/ballerina-platform/module-ballerinax-docusign.dsesign#setup-guide) to set up the DocuSign eSignature API.

2. For each example, create a `Config.toml` file with your OAuth 2.0 credentials, account ID, and the values listed in that example's guide. For example:

    ```toml
    serviceUrl = "<SERVICE_URL>"
    clientId = "<INTEGRATION_KEY>"
    clientSecret = "<SECRET_KEY>"
    refreshToken = "<REFRESH_TOKEN>"
    refreshUrl = "<REFRESH_URL>"
    accountId = "<ACCOUNT_ID>"
    userId = "<USER_ID>"
    ```

## Running an Example

Execute the following commands to build an example from the source:

* To build an example:

    ```bash
    bal build
    ```

* To run an example:

    ```bash
    bal run
    ```

## Building the Examples with the Local Module

**Warning**: Due to the absence of support for reading local repositories for single Ballerina files, the Bala of the module is manually written to the central repository as a workaround. Consequently, the bash script may modify your local Ballerina repositories.

Execute the following commands to build all the examples against the changes you have made to the module locally:

* To build all the examples:

    ```bash
    ./build.sh build
    ```

* To run all the examples:

    ```bash
    ./build.sh run
    ```
