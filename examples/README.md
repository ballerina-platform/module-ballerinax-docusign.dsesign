## Examples

The DocuSign eSignature connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-docusign.dsesign/tree/main/examples).

1. [Send documents for esignatures](https://github.com/ballerina-platform/module-ballerinax-docusign.dsesign/tree/main/examples/send-documents-for-esignatures)
    This example shows how to use DocuSign eSignature APIs to send envelope to recipients to add their respective esignatures to documents in the envelope.

2. [Create esignatures](https://github.com/ballerina-platform/module-ballerinax-docusign.dsesign/tree/main/examples/create-digital-signatures)
    This example shows how to create a eSignature for your DocuSign account.

## Prerequisites

1. Follow the [instructions](https://github.com/ballerina-platform/module-ballerinax-docusign.dsesign#set-up-guide) to set up the DocuSign eSignature API.

2. For each example, create a `Config.toml` file with your OAuth2 tokens, account ID, and user ID. Here's an example of how your `Config.toml` file should look:

    ```toml
    clientId = <CLIENT_ID>
    clientSecret = <CLIENT_SECRET>
    refreshToken = <REFRESH_TOKEN>
    refreshUrl = <REFRESH_URL>
    accountId = <ACCOUNT_ID>
    userId = <USER_ID>
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
