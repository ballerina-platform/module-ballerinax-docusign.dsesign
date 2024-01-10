## Examples

The DocuSign eSignature connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-docusign.esign/tree/main/examples), covering use cases like creating calendar, scheduling meeting events, and adding reminders.

1. [Send Envelopes with DocuSign](https://github.com/ballerina-platform/module-ballerinax-googleapis.docusign.esign/tree/main/examples/send-envelope)
    This example shows how to use DocuSign eSignature APIs to send envelope to recipients to add their respective esignatures to documents in the envelope.

## Prerequisites

1. Follow the [instructions](https://github.com/ballerina-platform/module-ballerinax-docusign.esign#set-up-guide) to set up the Calendar API.

2. For each example, create a `Config.toml` file with your OAuth2 tokens, client ID, and client secret. Here's an example of how your `Config.toml` file should look:

    ```toml
    accessToken = <Access Token>
    accountId = <Account ID>
    userId = <User ID>
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
