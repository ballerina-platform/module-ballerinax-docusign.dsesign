// Copyright (c) 2023, WSO2 LLC. (http://www.wso2.com) All Rights Reserved.
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

# 
public type DocGenFormFieldOption record {
    # A sender-defined description of the line item.
    string description?;
    # 
    string label?;
    # When **true,** the radio button is selected.
    string selected?;
    # Specifies the value of the tab. 
    string value?;
};

# 
public type NotaryContactDetails record {
    # 
    string hasDocusignCertificate?;
    # 
    JurisdictionSummary[] jurisdictions?;
};

# A list of supported languages.
public type SupportedLanguages record {
    # A list of languages that you can use for a recipient's language setting. These are the languages that you can set for the standard email format and signing view for each recipient.
    # 
    # For example, in the recipient's email notification, this setting affects elements such as the standard introductory text describing the request to sign. It also determines the language used for buttons and tabs in both the email notification and the signing experience.
    # 
    # **Note:** Setting a language for a recipient affects only the DocuSign standard text. Any custom text that you enter for the `emailBody` and `emailSubject` of the notification is not translated, and appears exactly as you enter it.
    # 
    # Example:
    # 
    # ```
    # {
    #     "languages": [
    #         {
    #             "name": "Arabic (ar)",
    #             "value": "ar"
    #         },
    #         {
    #             "name": "Bulgarian (bg)",
    #             "value": "bg"
    #         },
    #         .
    #         .
    #         .
    # }
    # ```
    NameValue[] languages?;
};

# The AccountPermissionProfiles resource provides methods that allow you to manage permission profiles for groups of account users.
public type AccountPermissionProfiles record {
    # The username of the user who last modified the permission profile.
    string modifiedByUsername?;
    # The date and time when the permission profile was last modified.
    string modifiedDateTime?;
    # The ID of the permission profile.
    # 
    # Use [AccountPermissionProfiles: list](/docs/esign-rest-api/reference/accounts/accountpermissionprofiles/list/)
    # to get a list of permission profiles and their IDs.
    # 
    # You can also download a CSV file of all permission profiles
    # and their IDs from the **Settings > Permission Profiles** page
    # of your eSignature account page.
    string permissionProfileId?;
    # The name of the account permission profile. 
    # 
    # Example: `Account Administrator`
    string permissionProfileName?;
    # This object defines account permissions for users who are associated with the account permission profile. 
    AccountRoleSettings settings?;
    # The total number of users in the group associated with the account permission profile.
    string userCount?;
    # A list of user objects containing information about the users who are associated with the account permission profile.
    UserInformation[] users?;
};

# Envelope documents
public type EnvelopeDocuments record {
    # An array of document objects.
    EnvelopeDocument[] envelopeDocuments?;
    # The envelope ID of the envelope status that failed to post.
    string envelopeId?;
};

# 
public type UserAuthorizationsDeleteResponse record {
    # 
    UserAuthorizationIdWithStatus[] results?;
};

# This object is used only when `inPersonSigningType` in the `inPersonSigner` object is `notary`.
# 
# It describes information about the notary host.
# The following information is required
# when using the eNotary in-person signing flow:
# 
# * `name`: Specifies the notary's full legal name.
# * `email`: Specifies the notary's email address.
# * `recipientId`: A unique ID number for the notary signing host.
public type NotaryHost record {
    # If a value is provided, the recipient must enter the value as the access code to view and sign the envelope. 
    # 
    # Maximum Length: 50 characters and it must conform to the account's access code format setting.
    # 
    # If blank, but the signer `accessCode` property is set in the envelope, then that value is used.
    # 
    # If blank and the signer `accessCode` property is not set, then the access code is not required.
    string accessCode?;
    # Metadata about a property.
    PropertyMetadata accessCodeMetadata?;
    # Optional. When **true,** the access code will be added to the email sent to the recipient. This nullifies the security measure of `accessCode` on the recipient.
    string addAccessCodeToEmail?;
    # When **true,** if the recipient is locked on a template, advanced recipient routing can override the lock.
    string allowSystemOverrideForLockedRecipient?;
    # Error message provided by the destination email system. This field is only provided if the email notification to the recipient fails to send. This property is read-only.
    string autoRespondedReason?;
    # 
    string bulkSendV2Recipient?;
    # Specifies whether the recipient is embedded or remote. 
    # 
    # If the `clientUserId` property is not null then the recipient is embedded. Use this field to associate the signer with their userId in your app. Authenticating the user is the responsibility of your app when you use embedded signing.
    # 
    # If the `clientUserId` property is set and either `SignerMustHaveAccount` or `SignerMustLoginToSign` property of the account settings is set to  **true,** an error is generated on sending.
    # 
    # **Note:** This property is not returned by the [listStatusChanges](/docs/esign-rest-api/reference/envelopes/envelopes/liststatuschanges/) endpoint.
    # 
    # Maximum length: 100 characters. 
    string clientUserId?;
    # Indicates the number of times that the recipient has been through a signing completion for the envelope. If this number is greater than 0 for a signing group, only the user who previously completed may sign again. This property is read-only.
    string completedCount?;
    # An optional array of strings that allows the sender to provide custom data about the recipient. This information is returned in the envelope status but otherwise not used by DocuSign. Each customField string can be a maximum of 100 characters.
    string[] customFields?;
    # The date and time the recipient declined the document. This property is read-only.
    string declinedDateTime?;
    # The reason the recipient declined the document. This property is read-only.
    string declinedReason?;
    # The date and time that the envelope was delivered to the recipient. This property is read-only.
    string deliveredDateTime?;
    # The delivery method. One of:
    # 
    # - `email`
    # - `fax`
    # - `SMS`
    # - `WhatsApp`
    # - `offline`
    # 
    # The `SMS` and `WhatsApp` delivery methods
    # are limited to `signer`, `carbonCopy`, and `certifiedDelivery`
    # recipients.
    # 
    # **Related topics**
    # 
    # - [Using SMS delivery with the eSignature API][smsconcept]
    # - [How to request a signature by SMS delivery][howto]
    # 
    # [smsconcept]: /docs/esign-rest-api/esign101/concepts/sms-delivery/using-sms-esignature/
    # [howto]: /docs/esign-rest-api/how-to/request-signature-sms/
    string deliveryMethod?;
    # Metadata about a property.
    PropertyMetadata deliveryMethodMetadata?;
    # Reserved for DocuSign.
    string designatorId?;
    # Reserved for DocuSign.
    string designatorIdGuid?;
    # A list of `documentVisibility` objects. Each object in the list specifies whether a document in the envelope is visible to this recipient. For the envelope to use this functionality, Document Visibility must be enabled for the account and the `enforceSignerVisibility` property must be set to **true.**
    DocumentVisibility[] documentVisibility?;
    # The notary's email address.
    # 
    # Maximum Length: 100 characters.
    string email?;
    # Metadata about a property.
    PropertyMetadata emailMetadata?;
    # Sets custom email subject and email body for individual
    # recipients. **Note:** You must explicitly set `supportedLanguage`
    # if you use this feature.
    RecipientEmailNotification emailNotification?;
    # Specifies a sender-provided valid URL string for redirecting an embedded recipient. When using this option, the embedded recipient still receives an email from DocuSign, just as a remote recipient would. When the document link in the email is clicked the recipient is redirected, through DocuSign, to the supplied URL to complete their actions. When routing to the URL, the sender's system (the server responding to the URL) must request a recipient token to launch a signing session. 
    # 
    # When `SIGN_AT_DOCUSIGN`, the recipient is directed to an embedded signing or viewing process directly at DocuSign. The signing or viewing action is initiated by the DocuSign system and the transaction activity and Certificate of Completion records will reflect this. In all other ways the process is identical to an embedded signing or viewing operation launched by a partner.
    # 
    # It is important to understand that in a typical embedded workflow, the authentication of an embedded recipient is the responsibility of the sending application. DocuSign expects that senders will follow their own processes for establishing the recipient's identity. In this workflow the recipient goes through the sending application before the embedded signing or viewing process is initiated. However, when the sending application sets `EmbeddedRecipientStartURL=SIGN_AT_DOCUSIGN`, the recipient goes directly to the embedded signing or viewing process, bypassing the sending application and any authentication steps the sending application would use. In this case, DocuSign recommends that you use one of the normal DocuSign authentication features (Access Code, Phone Authentication, SMS Authentication, etc.) to verify the identity of the recipient.
    # 
    # If the `clientUserId` property is NOT set, and the `embeddedRecipientStartURL` is set, DocuSign will ignore the redirect URL and launch the standard signing process for the email recipient. Information can be appended to the embedded recipient start URL using merge fields. The available merge fields items are: `envelopeId`, `recipientId`, `recipientName`, `recipientEmail`, and `customFields`. The `customFields` property must be set for the recipient or envelope. The merge fields are enclosed in double brackets. 
    # 
    # *Example*: 
    # 
    # `http://senderHost/[[mergeField1]]/ beginSigningSession? [[mergeField2]]&[[mergeField3]]` 
    string embeddedRecipientStartURL?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # Reserved for DocuSign.
    string faxNumber?;
    # Metadata about a property.
    PropertyMetadata faxNumberMetadata?;
    # The host recipient ID.
    string hostRecipientId?;
    # The name of the authentication check to use. This value must match one of the authentication types that the account uses. The names of these authentication types appear in the web console sending interface in the Identify list for a recipient. This setting overrides any default authentication setting. Valid values are:
    # 
    # - `Phone Auth $`: The recipient must authenticate by using two-factor authentication (2FA). You provide the phone number to use for 2FA in the `phoneAuthentication` object.
    # - `SMS Auth $`: The recipient must authenticate via SMS. You provide the phone number to use in the `smsAuthentication` object.
    # - `ID Check $`: The  recipient must answer detailed security questions. 
    # 
    # **Example:** Your account has ID Check and SMS Authentication available. In the web console Identify list, these appear as ID Check $ and SMS Auth $. To use ID Check in an envelope, the idCheckConfigurationName should be ID Check $. For SMS, you would use SMS Auth $, and you would also need to add a phone number to the smsAuthentication node.
    string idCheckConfigurationName?;
    # Metadata about a property.
    PropertyMetadata idCheckConfigurationNameMetadata?;
    # A complex element that contains input information related to a recipient ID check.
    IdCheckInformationInput idCheckInformationInput?;
    # Specifies ID Verification applied on an envelope by workflow ID.
    # See the [list](/docs/esign-rest-api/reference/accounts/identityverifications/list/)
    # method in the [IdentityVerifications](/docs/esign-rest-api/reference/accounts/identityverifications/) resource
    # for more information on how to retrieve workflow IDs available for an account.
    # This can be used in addition to other [recipient authentication](https://support.docusign.com/s/document-item?bundleId=gav1643676262430&topicId=kzp1578456318101.html) methods.
    RecipientIdentityVerification identityVerification?;
    # When **true** and the envelope recipient creates a DocuSign account after signing, the Manage Account Email Notification settings are used as the default settings for the recipient's account. 
    string inheritEmailNotificationConfiguration?;
    # Reserved for DocuSign.
    string lockedRecipientPhoneAuthEditable?;
    # Reserved for DocuSign.
    string lockedRecipientSmsEditable?;
    # The notary's full legal name.
    # 
    # Maximum Length: 100 characters.
    string name?;
    # Metadata about a property.
    PropertyMetadata nameMetadata?;
    # A note sent to the notary in the signing email.
    # This note is visible only to this notary.
    # 
    # Maximum Length: 1000 characters.
    string note?;
    # Metadata about a property.
    PropertyMetadata noteMetadata?;
    # A complex type that contains the elements:
    # 
    # * `recipMayProvideNumber`: A Boolean value that specifies whether the recipient can use the phone number of their choice.
    # * `senderProvidedNumbers`: A list of phone numbers that the recipient can use.
    # * `recordVoicePrint`: Reserved for DocuSign.
    # * `validateRecipProvidedNumber`: Reserved for DocuSign.
    RecipientPhoneAuthentication phoneAuthentication?;
    # Reserved for DocuSign.
    RecipientAttachment[] recipientAttachments?;
    # A complex element that contains information about a user's authentication status.
    AuthenticationStatus recipientAuthenticationStatus?;
    # Metadata about the features that are supported for the recipient type. This property is read-only.
    FeatureAvailableMetadata[] recipientFeatureMetadata?;
    # Unique for the recipient. It is used by the tab element to indicate which recipient is to sign the Document.
    string recipientId?;
    # The globally-unique identifier (GUID) for a specific recipient on a specific envelope. If the same recipient is associated with multiple envelopes, they will have a different GUID for each one. This property is read-only.
    string recipientIdGuid?;
    # The recipient type, as specified by the following values:
    # - `agent`: Agent recipients can add name and email information for recipients that appear after the agent in routing order.
    # - `carbonCopy`: Carbon copy recipients get a copy of the envelope but don't need to sign, initial, date, or add information to any of the documents. This type of recipient can be used in any routing order.
    # - `certifiedDelivery`: Certified delivery recipients must receive the completed documents for the envelope to be completed. They don't need to sign, initial, date, or add information to any of the documents.
    # - `editor`: Editors have the same management and access rights for the envelope as the sender. Editors can add name and email information, add or change the routing order, set authentication options, and can edit signature/initial tabs and data fields for the remaining recipients.
    # - `inPersonSigner`: In-person recipients are DocuSign users who act as signing hosts in the same physical location as the signer.
    # - `intermediaries`: Intermediary recipients can optionally add name and email information for recipients at the same or subsequent level in the routing order.
    # - `seal`: Electronic seal recipients represent legal entities.
    # - `signer`: Signers are recipients who must sign, initial, date, or add data to form fields on the documents in the envelope.
    # - `witness`: Witnesses are recipients whose signatures affirm that the identified signers have signed the documents in the envelope.
    string recipientType?;
    # Metadata about a property.
    PropertyMetadata recipientTypeMetadata?;
    # When **true,** the recipient is required to use the specified ID check method (including Phone and SMS authentication) to validate their identity. 
    string requireIdLookup?;
    # Metadata about a property.
    PropertyMetadata requireIdLookupMetadata?;
    # Optional element. Specifies the role name associated with the recipient.<br/><br/>This property is required when you are working with template recipients.
    string roleName?;
    # Specifies the routing order of the recipient in the envelope. 
    string routingOrder?;
    # Metadata about a property.
    PropertyMetadata routingOrderMetadata?;
    # The UTC DateTime when the envelope was sent. This property is read-only.
    string sentDateTime?;
    # Reserved for DocuSign.
    string signedDateTime?;
    # The ID of the [signing group](https://support.docusign.com/s/document-item?bundleId=gav1643676262430&topicId=zgn1578456447934.html).
    string signingGroupId?;
    # Metadata about a property.
    PropertyMetadata signingGroupIdMetadata?;
    # Optional. The name of the signing group. 
    # 
    # Maximum Length: 100 characters. 
    string signingGroupName?;
    # A complex type that contains information about users in the signing group.
    UserInfo[] signingGroupUsers?;
    # Contains the element senderProvidedNumbers which is an Array  of phone numbers the recipient can use for SMS text authentication.
    RecipientSMSAuthentication smsAuthentication?;
    # Deprecated.
    SocialAuthentication[] socialAuthentications?;
    # The recipient's status. This property is read-only. 
    # 
    # Valid values:
    # 
    # - `autoresponded`: The recipient's email system auto-responded to the email from DocuSign. This status is used in the web console to inform senders about the bounced-back email. This recipient status is only used if **Send-on-behalf-of** is turned off for the account.
    # - `completed`: The recipient has completed their actions (signing or other required actions if not a signer) for an envelope.
    # - `created`: The recipient is in a draft state. This value is only associated with draft envelopes (envelopes that have a status of `created`).
    # - `declined`: The recipient declined to sign the documents in the envelope.
    # - `delivered`: The recipient has viewed the documents in an envelope through the DocuSign signing website. This is not an email delivery of the documents in an envelope.
    # - `faxPending`: The recipient has finished signing and the system is waiting for a fax attachment from the recipient before completing their signing step.
    # - `sent`: The recipient has been sent an email notification that it is their turn to sign an envelope.
    # - `signed`: The recipient has completed (signed) all required tags in an envelope. This is a temporary state during processing, after which the recipient's status automatically switches to `completed`.
    string status?;
    # The code associated with the recipient's status. This property is read-only. 
    string statusCode?;
    # When **true,** email notifications are suppressed for the recipient, and they must access envelopes and documents from their DocuSign inbox.
    string suppressEmails?;
    # All of the tabs associated with a recipient. Each property is a list of a type of tab.
    EnvelopeRecipientTabs tabs?;
    # When **true,** the sender cannot change any attributes of the recipient. Used only when working with template recipients. 
    string templateLocked?;
    # When **true,** the sender may not remove the recipient. Used only when working with template recipients.
    string templateRequired?;
    # The total number of tabs in the documents. This property is read-only.
    string totalTabCount?;
    # The ID of the user to access.
    # 
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    string userId?;
};

# When a formula tab
# has a `paymentDetails` property,
# the formula tab
# is a payment item.
# See [Requesting Payments Along with Signatures][paymentguide]
# in the DocuSign Support Center
# to learn more about payments.
# 
# [paymentguide]:     https://support.docusign.com/s/document-item?bundleId=juu1573854950452&topicId=fyw1573854935374.html
public type PaymentDetails record {
    # An array of accepted payment methods:
    # 
    # * `CreditCard`
    # * `ApplePay`
    # * `AndroidPay`
    # * `BankAccount`
    # 
    # For example, if you only accept credit cards and ACH transfers, you would set this property to:
    # 
    # `'["BankAccount", "CreditCard"]'`
    # 
    # Do not specify `BankAccount` (ACH) if you are also using in-person signing.
    string[] allowedPaymentMethods?;
    # The GUID set by the payment gateway (such as Stripe) that identifies a transaction. The `chargeId` is created when authorizing a payment and must be referenced when completing a payment.
    string chargeId?;
    # Specifies the three-letter
    # [ISO 4217][ISO 4217] currency code for the payment.
    # 
    # Supported currencies are:
    # 
    # * AUD: Australian dollar
    # * CAD: Canadian dollar
    # * EUR: Euro
    # * GBP: Great Britain pound
    # * USD: United States dollar
    # 
    # Specifying any other ISO 4217 code for payments is an error.
    # 
    # [ISO 4217]:          https://en.wikipedia.org/wiki/ISO_4217
    string currencyCode?;
    # Metadata about a property.
    PropertyMetadata currencyCodeMetadata?;
    # The customer ID.
    string customerId?;
    # This is a sender-defined field that passes any extra metadata about the payment that will show up in the Authorize.net transaction under **Description** in the merchant gateway portal. The custom metadata will be recorded in downloaded Authorize.net reports. 
    # 
    # The following example shows what the **Description** field of the transaction will look like: 
    # 
    # `<envelopeID>, <customMetadata>`
    string customMetadata?;
    # A sender-defined field that specifies whether custom metadata is required for the transaction. When **true,** custom metadata is required. This property only applies if you are using an Authorize.net payment gateway account.
    boolean customMetadataRequired?;
    # A GUID that identifies the payment gateway
    # connected to the sender's DocuSign account.
    # 
    # There is no public API
    # for connecting payment gateway accounts
    # You must connect and manage payment gateway accounts
    # through the DocuSign Admin console
    # and through your chosen payment gateway.
    # 
    # You can get the gateway account ID
    # in the Payments section
    # of the DocuSign Admin console.
    # 
    # 
    # [paymentgateways]:  https://support.docusign.com/s/document-item?bundleId=juu1573854950452&topicId=knc1573854895499.html
    string gatewayAccountId?;
    # Metadata about a property.
    PropertyMetadata gatewayAccountIdMetadata?;
    # Display name of the gateway connected to sender's DocuSign account.
    # 
    # Possible values are: Stripe, Braintree, Authorize.Net, CyberSource, Zuora, Elavon.
    string gatewayDisplayName?;
    # Name of the gateway connected to sender's DocuSign account.
    # 
    # Possible values are:
    # 
    # * `Stripe`
    # * `Braintree`
    # * `AuthorizeDotNet`
    # * `CyberSource`
    # * `Zuora`
    # * `Elavon`
    string gatewayName?;
    # A payment formula can have
    # one or more line items
    # that provide detail about
    # individual items in a payment request.
    # 
    # The list of line items
    # are returned as metadata
    # to the payment gateway.
    PaymentLineItem[] lineItems?;
    # This property specifies how the signer's collected payment details will be used.
    # 
    # Valid values:
    # 
    # - `authorize`: The payment details will be used to collect payment. This is the default value.
    # - `save`: The signer's payment method (credit card or bank account) will be saved to the sender's payment gateway.
    # - `save_and_authorize`: The signer's payment method (credit card or bank account) will be saved to the sender's payment gateway and will also be used to collect payment.
    string paymentOption?;
    # The payment source ID.
    string paymentSourceId?;
    # 
    PaymentSignerValues signerValues?;
    # This read-only property describes the status of a payment.
    # 
    # * `new`<br>
    #   This is a new payment request.
    #   The envelope has been created,
    #   but no payment authorizations have been made.
    # 
    # * `auth_complete`<br>
    #   A recipient has entered their credit card information,
    #   but the envelope has not been completed.
    #   The card has not been charged.
    # 
    # * `payment_complete`<br>
    #   The recipient's card has been charged.
    # 
    # * `payment_capture_failed`<br>
    #   Final charge failed.
    #   This can happen when too much time
    #   passes between authorizing the payment
    #   and completing the document.
    # 
    # * `future_payment_saved` <br>
    # The recipient's payment method has been saved to the sender's payment gateway.
    string status?;
    # 
    string subGatewayName?;
    # Describes information
    # about the `total` of a payment.
    Money total?;
};

# Users' profiles
public type UserProfiles record {
    # Contains address information.
    AddressInformation address?;
    # Indicates the authentication methods that the user uses. These properties cannot be modified by the PUT operation. 
    AuthenticationMethod[] authenticationMethods?;
    # The name of the user's company.
    string companyName?;
    #  When **true,** the user's company and title information display on the ID card. 
    string displayOrganizationInfo?;
    # When **true,** the user's address and phone number display on the ID card.
    string displayPersonalInfo?;
    # When **true,** the user's ID card can be viewed from signed documents and envelope history.
    string displayProfile?;
    # When **true,** the user's usage information displays on the ID card.
    string displayUsageHistory?;
    # The URL for retrieving the user's profile image.
    string profileImageUri?;
    # The user's job title.
    # 
    # Limit: 100 characters.
    string title?;
    # A complex element consisting of: 
    # 
    # * lastSentDateTime - the date and time the user last sent an envelope. 
    # * lastSignedDateTime - the date and time the user last signed an envelope.
    # * sentCount - the number of envelopes the user has sent.
    # * signedCount - the number of envelopes the user has signed.
    UsageHistory usageHistory?;
    # User information.
    UserInformation userDetails?;
    # The date and time that the user's profile was last modified.
    string userProfileLastModifiedDate?;
};

# The `connectCustomConfiguration` object describes a Connect configuration for your account.
public type ConnectCustomConfiguration record {
    # Set this value to **true** to enable the webhook. The default property is **false.**
    string allowEnvelopePublish?;
    # When **true,** DocuSign sends data to the designated Salesforce account through Connect. The default value is **true.**
    string allowSalesforcePublish?;
    # When **true,** the tracked envelope and recipient events for all users, including users that are added a later time, are sent through Connect. The default value is **false.**
    # 
    # **Note:** If this property is **false,** make sure you set the `userIds` property to a non-empty array of user IDs.
    string allUsers?;
    # This flag allows you to toggle between including and excluding specified users from the configuration. When **false,** the users corresponding to the IDs in `userIds` will be included in the configuration. Conversely, when **true,** the users will be excluded from the configuration. The default value is **false.**
    string allUsersExcept?;
    # The type of the configuration. Valid values:
    # 
    # * `custom`: Creates an account-level configuration
    # * `customrecipient`: Creates a Recipient Connect configuration
    # * `salesforce`
    # * `eOriginal`
    # 
    # This property is required.
    string configurationType?;
    # The DocuSign-generated ID for the Connect configuration.
    # 
    # This property is read-only.
    string connectId?;
    # The delivery mode of the configuration. Valid values:
    # 
    # * `SIM`
    # * `Aggregate`
    string deliveryMode?;
    # 
    string disabledBy?;
    # When **true,** Connect logging is turned on. DocuSign recommends that you enable this functionality to help troubleshoot any issues. 
    # 
    # You can have a maximum of 100 active logs in your account. You can view the entries in active logs in the **Logs** tab in the Connect console.
    string enableLog?;
    # A list of envelope-level event statuses that will trigger Connect to send updates to the endpoint specified in the `url` property.
    # 
    # When using any of [the legacy event message formats](/platform/webhooks/connect/legacy-message-formats/), you must include either the `envelopeEvents` property or the `recipientEvents` property. If you are instead using the [JSON SIM event model](]/platform/webhooks/connect/improved-json-sim-event-model/), use the `events` property.
    # 
    # The [possible event statuses](/platform/webhooks/connect/event-triggers/) are:
    # 
    # * `Sent`
    # * `Delivered`
    # * `Completed`
    # * `Declined`
    # * `Voided`
    # 
    # **Note:** These values are case-sensitive.
    string[] envelopeEvents?;
    # This object lets you choose the data format of your Connect response.
    ConnectEventData eventData?;
    # A comma-separated list of envelope-level event statuses that will trigger Connect to send updates to the endpoint specified in the `urlToPublishTo` property.
    # 
    # Set this property when you are using the [JSON SIM event model](/platform/webhooks/connect/improved-json-sim-event-model/). If you are instead using any of [the legacy event message formats](/platform/webhooks/connect/legacy-message-formats/), set either the `envelopeEvents` property or the `recipientEvents` property.
    # 
    # The [possible event statuses](/platform/webhooks/connect/improved-json-sim-event-model/#eventreference) are:
    # 
    # * `envelope-created`
    # * `envelope-sent`
    # * `envelope-resent`
    # * `envelope-delivered`
    # * `envelope-completed`
    # * `envelope-declined`
    # * `envelope-voided`
    # * `recipient-authenticationfailed`
    # * `recipient-autoresponded`
    # * `recipient-declined`
    # * `recipient-delivered`
    # * `recipient-completed`
    # * `recipient-sent`
    # * `recipient-resent`
    # * `template-created`
    # * `template-modified`
    # * `template-deleted`
    # * `envelope-corrected`
    # * `envelope-purge`
    # * `envelope-deleted`
    # * `envelope-discard`
    # * `recipient-reassign`
    # * `recipient-delegate`
    # * `recipient-finish-later`
    # * `click-agreed`
    # * `click-declined`
    string[] events?;
    # The ID of an external folder.
    string externalFolderId?;
    # The label for an external folder.
    string externalFolderLabel?;
    # 
    string[] groupIds?;
    # When **true,** the Connect Service includes the Certificate of Completion with completed envelopes. 
    string includeCertificateOfCompletion?;
    # 
    string includeCertSoapHeader?;
    # When **true,** the Document Fields associated with the envelope's documents are included in the notification messages. Document Fields are optional custom name-value pairs added to documents using the API. 
    string includeDocumentFields?;
    # Reserved for DocuSign.
    string includeDocuments?;
    # When **true,** if the envelope is voided, the Connect Service notification will include the void reason, as entered by the person that voided the envelope. 
    string includeEnvelopeVoidReason?;
    # 
    string includeHMAC?;
    # 
    string includeOAuth?;
    # When **true,** Connect will include the sender account as Custom Field in the data.
    string includeSenderAccountasCustomField?;
    # When **true,** Connect will include the envelope time zone information.
    string includeTimeZoneInformation?;
    # 
    string integratorManaged?;
    # The name of the Connect configuration.
    # 
    # This property is required.
    string name?;
    # The password for the Connect configuration.
    # 
    # This property is not used for the `createHistoricalEnvelopePublishTransaction` endpoint.
    string password?;
    # An array of recipient event statuses that will trigger Connect to send notifications to your webhook listener at the URL endpoint specified in the `url` property. 
    # 
    # When using any of [the legacy event message formats](/platform/webhooks/connect/legacy-message-formats/), you must include either the `envelopeEvents` property or the `recipientEvents` property. If you are instead using the [JSON SIM event model](/platform/webhooks/connect/improved-json-sim-event-model/), use the `events` property.
    # 
    # The [possible event statuses](/platform/webhooks/connect/event-triggers/) are:
    # 
    # * `Sent`
    # * `AutoResponded`
    # * `Delivered`
    # * `Completed`
    # * `Declined`
    # * `AuthenticationFailed`
    # 
    # **Note:** These values are case-sensitive.
    string[] recipientEvents?;
    # When **true,** [Mutual TLS](/platform/webhooks/mutual-tls/) authentication is enabled.
    string requireMutualTls?;
    # When **true,** event delivery acknowledgements are enabled for your Connect configuration.
    # 
    # DocuSign Connect awaits a valid 200 response from your application acknowledging that it received a message. If you do not acknowledge receiving an event notification message within 100 seconds, DocuSign treats the message as a failure and places it into a failure queue. It is imperative that you acknowledge successful receipt of Connect events as they occur by sending a 200 event back.
    # 
    # #### When **true** and Send Individual Messages (SIM) mode is activated
    # 
    # If the HTTP status response to a notification message is not in the range of 200-299,
    # then the message delivery failed, and the configuration is marked as down.
    # 
    # The message will be queued and retried once per day.
    # While a Connect configuration is marked down, subsequent notifications will not be tried. Instead they will be immediately queued with the reason `Pending`.
    # When a message succeeds, all queued messages for the configuration will be tried immediately, in order.
    # 
    # There is a maximum of ten retries. Alternately, you can use **Republish Connect Information** to manually republish the notification.
    # 
    # #### When **true** and SIM mode is not activated
    # 
    # If the HTTP Status response to a notification message is not in the range of 200-299,  then the message delivery failed, and the message is queued.
    # 
    # The message will be retried after at least a day the next time a subsequent message is successfully sent to this configuration (subscription).  Subsequent notifications will be tried when they occur.
    # There is a maximum of ten retries. Alternately, you can use **Republish Connect Information** to manually republish the notification.
    # 
    # #### When **false**
    # 
    # When `requiresAcknowledgement` is set to **false** and you do not acknowledge receiving an event notification message within 100 seconds, DocuSign treats the message as a failure and determines that the server is unavailable. It does not retry to send the notification message, and you must handle the failure manually.
    string requiresAcknowledgement?;
    # The version of the Salesforce API that you are using.
    string salesforceApiVersion?;
    # 
    string salesforceAuthcode?;
    # 
    string salesforceCallBackUrl?;
    # When **true,** DocuSign can use documents in your Salesforce account for sending and signing.
    string salesforceDocumentsAsContentFiles?;
    # 
    string senderOverride?;
    # This property sets the items that are available for selection when adding or editing Connect objects. 
    string[] senderSelectableItems?;
    # An array of Salesforce objects.
    ConnectSalesforceObject[] sfObjects?;
    # When **true,** Mutual TLS will be enabled for notifications. Mutual TLS must be initiated by the listener (the customer's web server) during the TLS handshake protocol. 
    string signMessageWithX509Certificate?;
    # The namespace of the SOAP interface.
    # 
    # **Note:** If `useSoapInterface` is set to **true,** you must set this value.
    string soapNamespace?;
    # The web address of the listener or retrieving service endpoint. It must be an HTTPS URL.
    string urlToPublishTo?;
    # A comma-separated list of user IDs. This sets the users associated with the tracked envelope and recipient events. When a tracked event occurs for a set user, the a notification message is sent to your Connect listener.
    # 
    # By default, the users will be included in the configuration. If you want to exclude the users, set the `allUsersExcept` property to **true.**
    # 
    # **Note:** If `allUsers` is set to `false`, then you must provide a list of user IDs.
    string[] userIds?;
    # The name of the user.
    string userName?;
    # When **true,** the notifications are sent to your endpoint as SOAP requests. 
    string useSoapInterface?;
};


# A complex element that specifies the notification settings for the envelope.
public type EnvelopeNotificationRequest record {
    # A complex element that specifies the expiration settings for the envelope. When an envelope expires, it is voided and no longer available for signing. **Note:** there is a short delay between when the envelope expires and when it is voided.
    Expirations expirations?;
    # A complex element that specifies reminder settings for the envelope.
    Reminders reminders?;
    # When **true,** the account default notification settings are used for the envelope, overriding the reminders and expirations settings. When **false,** the reminders and expirations settings specified in this request are used. The default value is **false.**
    string useAccountDefaults?;
};

# 
public type SenderName record {
    # When **true,** the text string in the document may have extra whitespace and still match the anchor string. This occurs in two cases.
    # 
    # First, it matches if the document string has a single extra whitespace character following a non-whitespace character in the anchor string. For example, if the anchor string is `DocuSign`, then `Docu Sign` will match. However, <code>Docu&nbsp;&nbsp;&nbsp;Sign</code> will not match.
    # 
    # Second, it matches if the document string has one or more extra whitespace characters following a whitespace character in the anchor string. For example, if the anchor string is `Docu Sign`, then <code>Docu&nbsp;&nbsp;&nbsp;Sign</code> will match.
    # 
    # The default value is **true.**
    string anchorAllowWhiteSpaceInCharacters?;
    # Metadata about a property.
    PropertyMetadata anchorAllowWhiteSpaceInCharactersMetadata?;
    # This property controls how [anchor tabs][AnchorTabs] are placed. When **true,** the text string in a document must match the case of the `anchorString` property for an anchor tab to be created. The default value is **false.**
    # 
    # For example, when set to **true,** if the anchor string is `DocuSign`, then `DocuSign` will match but `Docusign`, `docusign`, `DoCuSiGn`, etc. will not match. When **false,** `DocuSign`, `Docusign`, `docusign`, `DoCuSiGn`, etc. will all match.
    # 
    # This functionality uses the following rules:
    # 
    # - Unless punctuation is specified in the `anchorString`, this functionality ignores punctuation and the following characters:
    # 
    #   $~><|^+=
    # 
    #   For example, the `anchorString` `water` will match on the string `Fetch a pail of water.`
    # 
    # - Strings embedded in other strings are ignored during the matching process.
    # 
    # - In words that have dashes, the parts separated by dashes are treated as distinct words.
    # 
    #   Example: If the anchor string is `forget`, then an anchor tab is placed on the `forget` in `forget-me-not`, even when `anchorMatchWholeWord` is set to **true.**
    # 
    # - Letters with accent marks are treated as distinct characters from their unaccented counterparts.
    # 
    # - For single-character anchor strings, if the two characters appear right next to each other in the document, a single anchor tab is placed for both of them.
    # 
    #   Example: If the anchor string is `i`, then only one anchor tab is placed in `skiing`.
    # 
    # - Unlike punctuation, numbers are not ignored when finding anchor words.
    # 
    #   Example: If the anchor string is `cat`, then `-cat-` is matched but `1cat2` is not when `anchorMatchWholeWord` is set to **true** (its default value).
    # 
    # **Note:** You can only specify the value of this property in POST requests.
    # 
    # [AnchorTabs]: /docs/esign-rest-api/esign101/concepts/tabs/auto-place/
    string anchorCaseSensitive?;
    # Metadata about a property.
    PropertyMetadata anchorCaseSensitiveMetadata?;
    # This property controls how [anchor tabs][AnchorTabs] are aligned in relation to the anchor text. Possible values are :
    # 
    # - `left`: Aligns the left side of the tab with the beginning of the first character of the matching anchor word. This is the default value.
    # - `right`: Aligns the tab’s left side with the last character of the matching anchor word.
    # 
    # **Note:** You can only specify the value of this property in POST requests.
    # 
    # [AnchorTabs]: /docs/esign-rest-api/esign101/concepts/tabs/auto-place/
    string anchorHorizontalAlignment?;
    # Metadata about a property.
    PropertyMetadata anchorHorizontalAlignmentMetadata?;
    # When **true,** this tab is ignored if the `anchorString` is not found in the document.
    string anchorIgnoreIfNotPresent?;
    # Metadata about a property.
    PropertyMetadata anchorIgnoreIfNotPresentMetadata?;
    # When **true,** the text string in a document must match the value of the `anchorString` property in its entirety for an [anchor tab][AnchorTab] to be created. The default value is **false.**
    # 
    # For example, when set to **true,** if the input is `man` then `man` will match but `manpower`, `fireman`, and `penmanship` will not. When **false,** if the input is `man` then `man`, `manpower`, `fireman`, and `penmanship` will all match.
    # 
    # This functionality uses the following rules:
    # 
    # - Unless punctuation is specified in the `anchorString`, this functionality ignores punctuation and the following characters:
    # 
    #   $~><|^+=
    # 
    #   For example, the `anchorString` `water` will match on the string `Fetch a pail of water.`
    # 
    # - Strings embedded in other strings are ignored during the matching process.
    # 
    # - In words that have dashes, the parts separated by dashes are treated as distinct words.
    # 
    #   Example: If the anchor string is `forget`, then an anchor tab is placed on the `forget` in `forget-me-not`, even when `anchorMatchWholeWord` is set to **true.**
    # 
    # - Letters with accent marks are treated as distinct characters from their unaccented counterparts.
    # 
    # - For single-character anchor strings, if the two characters appear right next to each other in the document, a single anchor tab is placed for both of them.
    # 
    #   Example: If the anchor string is `i`, then only one anchor tab is placed in `skiing`.
    # 
    # - Unlike punctuation, numbers are not ignored when finding anchor words.
    # 
    #   Example: If the anchor string is `cat`, then `-cat-` is matched but `1cat2` is not when `anchorMatchWholeWord` is set to **true** (its default value).
    # 
    # 
    # **Note:** You can only specify the value of this property in POST requests.
    # 
    # [AnchorTab]: /docs/esign-rest-api/esign101/concepts/tabs/auto-place/
    string anchorMatchWholeWord?;
    # Metadata about a property.
    PropertyMetadata anchorMatchWholeWordMetadata?;
    # Specifies the string to find in the document and use as the basis for tab placement.
    string anchorString?;
    # Metadata about a property.
    PropertyMetadata anchorStringMetadata?;
    # Reserved for DocuSign.
    string anchorTabProcessorVersion?;
    # Metadata about a property.
    PropertyMetadata anchorTabProcessorVersionMetadata?;
    # Specifies units of the `anchorXOffset` and `anchorYOffset`. Valid units are:
    # 
    # - `pixels` (default)
    # - `inches`
    # - `mms`
    # - `cms`
    string anchorUnits?;
    # Metadata about a property.
    PropertyMetadata anchorUnitsMetadata?;
    # Specifies the X axis location of the tab in `anchorUnits` relative to the `anchorString`.
    string anchorXOffset?;
    # Metadata about a property.
    PropertyMetadata anchorXOffsetMetadata?;
    # Specifies the Y axis location of the tab in `anchorUnits` relative to the `anchorString`.
    string anchorYOffset?;
    # Metadata about a property.
    PropertyMetadata anchorYOffsetMetadata?;
    # When **true,** the information in the tab is bold.
    string bold?;
    # Metadata about a property.
    PropertyMetadata boldMetadata?;
    # 
    string caption?;
    # Metadata about a property.
    PropertyMetadata captionMetadata?;
    # For conditional fields this is the `tabLabel` of the parent tab that controls this tab's visibility.
    string conditionalParentLabel?;
    # Metadata about a property.
    PropertyMetadata conditionalParentLabelMetadata?;
    # For conditional fields, this is the value of the parent tab that controls the tab's visibility.
    # 
    # If the parent tab is a Checkbox, Radio button, Optional Signature, or Optional Initial use "on" as the value to show that the parent tab is active.
    string conditionalParentValue?;
    # Metadata about a property.
    PropertyMetadata conditionalParentValueMetadata?;
    # The DocuSign generated custom tab ID for the custom tab to be applied. This can only be used when adding new tabs for a recipient. When used, the new tab inherits all the custom tab properties.
    string customTabId?;
    # Metadata about a property.
    PropertyMetadata customTabIdMetadata?;
    # Specifies the document ID number that the tab is placed on. This must refer to an existing Document's ID attribute.
    string documentId?;
    # Metadata about a property.
    PropertyMetadata documentIdMetadata?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The font to be used for the tab value. Supported fonts include:
    # 
    # - Default
    # - Arial
    # - ArialNarrow
    # - Calibri
    # - CourierNew
    # - Garamond
    # - Georgia
    # - Helvetica
    # - LucidaConsole
    # - MSGothic
    # - MSMincho
    # - OCR-A
    # - Tahoma
    # - TimesNewRoman
    # - Trebuchet
    # - Verdana
    string font?;
    # The font color to use for the information in the tab. Possible values are: 
    # 
    # - Black
    # - BrightBlue
    # - BrightRed
    # - DarkGreen
    # - DarkRed
    # - Gold
    # - Green
    # - NavyBlue
    # - Purple
    # - White
    string fontColor?;
    # Metadata about a property.
    PropertyMetadata fontColorMetadata?;
    # Metadata about a property.
    PropertyMetadata fontMetadata?;
    # The font size used for the information in the tab. Possible values are:
    # 
    # - Size7
    # - Size8
    # - Size9
    # - Size10
    # - Size11
    # - Size12
    # - Size14
    # - Size16
    # - Size18
    # - Size20
    # - Size22
    # - Size24
    # - Size26
    # - Size28
    # - Size36
    # - Size48
    # - Size72
    string fontSize?;
    # Metadata about a property.
    PropertyMetadata fontSizeMetadata?;
    # An integer specifying the order in which the guided form HTML should render. The order is relative to the `formPageLabel`, the group by which to place the guided form HTML block.
    string formOrder?;
    # Metadata about a property.
    PropertyMetadata formOrderMetadata?;
    # A string specifying the group in which to place the guided form HTML. Each group displays as a separate guided forms page in the signing experience.
    string formPageLabel?;
    # Metadata about a property.
    PropertyMetadata formPageLabelMetadata?;
    # An integer specifying the order in which to present the guided form pages.
    string formPageNumber?;
    # Metadata about a property.
    PropertyMetadata formPageNumberMetadata?;
    # The height of the tab in pixels.
    # Must be an integer.
    string height?;
    # Metadata about a property.
    PropertyMetadata heightMetadata?;
    # When **true,** the information in the tab is italic.
    string italic?;
    # Metadata about a property.
    PropertyMetadata italicMetadata?;
    # Allows you to customize locale settings.
    LocalePolicyTab localePolicy?;
    # Contains information for transferring values between Salesforce data fields and DocuSign tabs.
    MergeField mergeField?;
    # Reserved for DocuSign.
    string mergeFieldXml?;
    # 
    string name?;
    # Metadata about a property.
    PropertyMetadata nameMetadata?;
    # Specifies the page number on which the tab is located.
    string pageNumber?;
    # Metadata about a property.
    PropertyMetadata pageNumberMetadata?;
    # Unique for the recipient. It is used by the tab element to indicate which recipient is to sign the Document.
    string recipientId?;
    # The globally-unique identifier (GUID) for a specific recipient on a specific envelope. If the same recipient is associated with multiple envelopes, they will have a different GUID for each one. This property is read-only.
    string recipientIdGuid?;
    # Metadata about a property.
    PropertyMetadata recipientIdGuidMetadata?;
    # Metadata about a property.
    PropertyMetadata recipientIdMetadata?;
    # 
    SmartContractInformation smartContractInformation?;
    # Reserved for DocuSign.
    string 'source?;
    # Indicates the envelope status. Valid values are:
    # 
    # * sent - The envelope is sent to the recipients. 
    # * created - The envelope is saved as a draft and can be modified and sent later.
    string status?;
    # Metadata about a property.
    PropertyMetadata statusMetadata?;
    # An array of tab groups that this tab belongs to. Tab groups are identified by their `groupLabel` property.
    # 
    # To associate this tab with a tab group, add the tab group's `groupLabel` to this array.
    string[] tabGroupLabels?;
    # Metadata about a property.
    PropertyMetadata tabGroupLabelsMetadata?;
    # The unique identifier for the tab.
    string tabId?;
    # Metadata about a property.
    PropertyMetadata tabIdMetadata?;
    # The label associated with the tab. This value may be an empty string.
    # If no value is provided, the tab type is used as the value.
    # 
    # Maximum Length: 500 characters.
    string tabLabel?;
    # Metadata about a property.
    PropertyMetadata tabLabelMetadata?;
    # A positive integer that sets the order the tab is navigated to during signing.
    # 
    # Tabs on a page are navigated to in ascending order, starting with the lowest number and moving to the highest. If two or more tabs have the same `tabOrder` value, the normal auto-navigation setting behavior for the envelope is used.
    string tabOrder?;
    # Metadata about a property.
    PropertyMetadata tabOrderMetadata?;
    # Indicates the type of tab (for example, `signHere` or `initialHere`).
    string tabType?;
    # Metadata about a property.
    PropertyMetadata tabTypeMetadata?;
    # When **true,** the sender cannot change any attributes of the recipient. Used only when working with template recipients. 
    string templateLocked?;
    # Metadata about a property.
    PropertyMetadata templateLockedMetadata?;
    # When **true,** the sender may not remove the recipient. Used only when working with template recipients.
    string templateRequired?;
    # Metadata about a property.
    PropertyMetadata templateRequiredMetadata?;
    # The text of a tooltip that appears when a user hovers over a form field or tab.
    string tooltip?;
    # Metadata about a property.
    PropertyMetadata toolTipMetadata?;
    # When **true,** the information in the tab is underlined.
    string underline?;
    # Metadata about a property.
    PropertyMetadata underlineMetadata?;
    # Specifies the value of the tab. 
    string value?;
    # Metadata about a property.
    PropertyMetadata valueMetadata?;
    # The width of the tab in pixels.
    # Must be an integer.
    string width?;
    # Metadata about a property.
    PropertyMetadata widthMetadata?;
    # This property indicates the horizontal offset of the object on the page.
    # DocuSign uses 72 DPI when determining position.
    # Required. Must be an integer. May be zero.
    string xPosition?;
    # Metadata about a property.
    PropertyMetadata xPositionMetadata?;
    # This property indicates the vertical offset of the object on the page.
    # DocuSign uses 72 DPI when determining position.
    # Required. Must be an integer. May be zero.
    string yPosition?;
    # Metadata about a property.
    PropertyMetadata yPositionMetadata?;
};

# 
public type BulkProcessResult record {
    # 
    BulkSendBatchError[] errors?;
    # The GUID of the bulk send list.
    string listId?;
    # 
    string success?;
};

# The EnvelopePublish resource allows you to submit existing envelopes to any webhook.
public type EnvelopePublish record {
    # 
    string applyConnectSettings?;
    # 
    string envelopeCount?;
    # 
    EnvelopePublishTransactionErrorRollup[] envelopeLevelErrorRollups?;
    # 
    string envelopePublishTransactionId?;
    # 
    string errorCount?;
    # 
    string[] fileLevelErrors?;
    # 
    string noActionRequiredEnvelopeCount?;
    # 
    string processedEnvelopeCount?;
    # 
    string processingStatus?;
    # 
    string resultsUri?;
    # 
    string submissionDate?;
    # 
    UserInfo submittedByUserInfo?;
    # 
    string submittedForPublishingEnvelopeCount?;
};

# 
public type DiagnosticsSettingsInformation record {
    #  When **true,** enables API request logging for the user. 
    string apiRequestLogging?;
    # Specifies the maximum number of API requests to log.
    string apiRequestLogMaxEntries?;
    # Indicates the remaining number of API requests that can be logged.
    string apiRequestLogRemainingEntries?;
};

# Signing groups' users
public type SigningGroupUsers record {
    # User management information.
    SigningGroupUser[] users?;
};

# 
public type UserAuthorizationWithStatus record {
    # A complex object describing a user authorization.
    UserAuthorization authorization?;
    # 
    string errorMessage?;
    # 
    string success?;
};

# 
public type UserInfo record {
    # The account ID associated with the envelope.
    string accountId?;
    # The name on the account.
    string accountName?;
    # Access code provided to the user to activate the account.
    string activationAccessCode?;
    # The user's email address.
    string email?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # 
    string ipAddress?;
    # When **true,** indicates that the user is logged in. This is a read-only property.
    string loginStatus?;
    # The user's membership ID.
    string membershipId?;
    # This field is no longer supported for most accounts. To create an eSignature user without sending an activation email, use the Admin API by following [these steps](/docs/admin-api/how-to/create-active-user/).
    string sendActivationEmail?;
    # A URI containing the user ID.
    string uri?;
    # The ID of the user to access.
    string userId?;
    # The name of the user.
    string userName?;
    # Status of the user's account. One of:
    # 
    # - `ActivationRequired`
    # - `ActivationSent`
    # - `Active`
    # - `Closed`
    # - `Disabled`
    string userStatus?;
    # The type of user, for example `CompanyUser`.
    string userType?;
};

# 
public type AuthorizationUser record {
    # The account ID.
    string accountId?;
    # The email address of the authorization user.
    string email?;
    # The name of the authorization user.
    string name?;
    # The ID of the authorization user.
    string userId?;
};

# Contains information about a billing plan.
public type BillingPlan record {
    # Reserved for DocuSign.
    AppStoreProduct[] appStoreProducts?;
    # Contains the `currencyCode` and `currencySymbol` for the alternate currency values for `envelopeFee`, `fixedFee`, and `seatFee` that are configured for this plan feature set.
    CurrencyPlanPrice[] currencyPlanPrices?;
    # When **true,** customer support is provided as part of the account plan.
    string enableSupport?;
    # The number of seats (users) included in the plan.
    string includedSeats?;
    # Any other percentage discount for the plan.
    # 
    # Example: `"0.00"`
    string otherDiscountPercent?;
    #  The payment cycle associated with the plan. Valid values: Monthly or Annually. 
    string paymentCycle?;
    # The payment method used for the billing plan. Valid values are:
    # 
    # - `NotSupported`
    # - `CreditCard`
    # - `PurchaseOrder`
    # - `Premium`
    # - `Freemium`
    # - `FreeTrial`
    # - `AppStore`
    # - `DigitalExternal`
    # - `DirectDebit`
    string paymentMethod?;
    # The per seat price for the plan.
    string perSeatPrice?;
    # Identifies the type of plan. Examples include:
    # 
    # - `business`
    # - `corporate`
    # - `enterprise` 
    # - `free`
    string planClassification?;
    # Reserved for DocuSign.
    FeatureSet[] planFeatureSets?;
    # DocuSign's ID for the account plan.
    string planId?;
    # The name of the billing plan.
    string planName?;
    # A complex type that returns information about any seat discounts. It contains the information `BeginSeatCount`, `EndSeatCount` and `SeatDiscountPercent`.
    SeatDiscount[] seatDiscounts?;
    # The support incident fee charged for each support incident.
    # 
    # Example: `"$0.00"`
    string supportIncidentFee?;
    # The support plan fee charged for this plan.
    # 
    # Example: `"$0.00"`
    string supportPlanFee?;
};

# Details about account consumer disclosures.
public type AccountConsumerDisclosures record {
    # The GUID of the account associated with the consumer disclosure.
    string accountEsignId?;
    # When **true,** indicates that the customer can withdraw their consent to the consumer disclosure when they decline to sign documents. If these recipients sign documents sent to them from your account in the future, they will be required to agree to the terms in the disclosure. The default value is **false.**
    # **Note:** Only Admin users can change this setting.
    string allowCDWithdraw?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowCDWithdrawMetadata?;
    # If the customer needs to change their email address, this is the email address to which they should the change request.
    # 
    # Maximum length: 100 characters.
    string changeEmail?;
    # Other information about the requirements for the user to change their email address.
    # 
    # Maximum length: 255 characters.
    # 
    # Example: 
    # 
    # `We do not require any other information from you to change your email address.`
    string changeEmailOther?;
    # Specifies the company name used in the disclosure. The default value is the account name.
    # 
    # However, if your account uses signing brands that specify a company name, you can substitute the brand's company name by setting the `useBrand` property to **true.** Whenever an envelope is sent from the account that uses a signing brand with a specified `companyName`, that value is used in email notifications and in the signing experience.
    # 
    # **Note:** This substitution only works if you use the default legal disclosure or if you apply the `companyName` to the merge fields in a custom ERSD. You must also set the value of the `useBrand` property to **true.**
    string companyName?;
    # The phone number of the company associated with the consumer disclosure, as a free-formatted string.
    string companyPhone?;
    # The cost per page if the customer requests paper copies.
    # 
    # Example: 
    # 
    # `0.0000`
    string copyCostPerPage?;
    # Specifies the fee collection method for cases in which the customer requires paper copies of the document.
    # 
    # Maximum length: 255 characters.
    # 
    # Example: 
    # 
    # `We will bill you for any fees at that time, if any.`
    string copyFeeCollectionMethod?;
    # The email address to which the customer should send a request for copies of a document.
    # 
    # Maximum length: 100 characters.
    string copyRequestEmail?;
    # When **true,** indicates that the consumer disclosure is a custom disclosure. The default is **false.**
    string custom?;
    # When **true** (default), indicates that eSign is enabled.
    string enableEsign?;
    # The final, assembled text of the Electronic Record and Signature Disclosure that includes the appropriate `companyName` and other specifics. It also includes the HTML tags used for formatting.
    string esignAgreement?;
    # The template for the Electronic Record and Signature Disclosure, which contains placeholders for information such as the `companyName`. It also includes the HTML tags used for formatting.
    # 
    # **Note:** If you are switching to or updating a custom disclosure, you can edit both the text and the HTML formatting.
    string esignText?;
    # The code for the language version of the disclosure. The following languages are supported:
    # 
    # - Arabic (`ar`)
    # - Bulgarian (`bg`)
    # - Czech (`cs`)
    # - Chinese Simplified (`zh_CN`)
    # - Chinese Traditional (`zh_TW`)
    # - Croatian (`hr`)
    # - Danish (`da`)
    # - Dutch (`nl`)
    # - English US (`en`)
    # - English UK (`en_GB`)
    # - Estonian (`et`)
    # - Farsi (`fa`)
    # - Finnish (`fi`)
    # - French (`fr`)
    # - French Canadian (`fr_CA`)
    # - German (`de`)
    # - Greek (`el`)
    # - Hebrew (`he`)
    # - Hindi (`hi`)
    # - Hungarian (`hu`)
    # - Bahasa Indonesian (`id`)
    # - Italian (`it`)
    # - Japanese (`ja`)
    # - Korean (`ko`)
    # - Latvian (`lv`)
    # - Lithuanian (`lt`)
    # - Bahasa Melayu (`ms`)
    # - Norwegian (`no`)
    # - Polish (`pl`)
    # - Portuguese (`pt`)
    # - Portuguese Brazil (`pt_BR`)
    # - Romanian (`ro`)
    # - Russian (`ru`)
    # - Serbian (`sr`)
    # - Slovak (`sk`)
    # - Slovenian (`sl`)
    # - Spanish (`es`)
    # - Spanish Latin America (`es_MX`)
    # - Swedish (`sv`)
    # - Thai (`th`)
    # - Turkish (`tr`)
    # - Ukrainian (`uk`) 
    # - Vietnamese (`vi`)
    # 
    # Additionally, you can automatically detect the browser language being used by the viewer and display the disclosure in that language by setting the value to `browser`.
    string languageCode?;
    # When **true,** the  recipient must agree to the consumer disclosure. The value of this property is read-only. It is calculated based on the account setting `consumerDisclosureFrequency` and the user's actions.
    string mustAgreeToEsign?;
    # **Deprecated.** 
    # 
    # The `pdfId` property in the consumer_disclosure PUT request is deprecated. For security reasons going forward, any value provided in the request packet must be ignored. 
    string pdfId?;
    # When **true,** specifies that the company name in the signing brand is used for the disclosure. Whenever an envelope is sent from the account that uses a signing brand with a specified company name, that value is used in email notifications and in the signing experience.  
    # 
    # When **false** (default), or if the signing brand does not specify a company name, the account name is used instead.
    # 
    # **Note:** This substitution only works if you use the default legal disclosure or if you apply the `companyName` to the merge fields in a custom ERSD. 
    string useBrand?;
    # When **true,** specifies that recipients in the same account as the sender must agree to eSign an Electronic Record and Signature Disclosure Statement.
    string useConsumerDisclosureWithinAccount?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata useConsumerDisclosureWithinAccountMetadata?;
    # Contains the first address line of the postal address to which a customer can send a consent withdrawal notification.
    # 
    # Maximum length: 100 characters. 
    string withdrawAddressLine1?;
    # Contains the second address line of the postal address to which a customer can send a consent withdrawal notification.
    # 
    # Maximum length: 100 characters. 
    string withdrawAddressLine2?;
    # When **true** (default), indicates that the customer can withdraw consent by email.
    string withdrawByEmail?;
    # When **true,** indicates that the customer can withdraw consent by postal mail. The default is **false.**
    string withdrawByMail?;
    # When **true,** indicates that the customer can withdraw consent by phone. The default is **false.**
    string withdrawByPhone?;
    # Contains the city of the postal address to which a customer can send a consent withdrawal notification.
    # 
    # Maximum length: 50 characters. 
    string withdrawCity?;
    # Text indicating the consequences of withdrawing consent.
    # 
    # Maximum length: 255 characters.
    string withdrawConsequences?;
    # Contains the email address to which a customer can send a consent withdrawal notification.
    # 
    # Maximum length: 100 characters. 
    string withdrawEmail?;
    # Contains any other information needed to withdraw consent.
    # 
    # Maximum length: 255 characters.
    # 
    # Example:
    # 
    # `We do not need any other information from you to withdraw consent.`
    string withdrawOther?;
    # Contains the phone number that a customer can call to register consent withdrawal notification as a free-formatted string.
    # 
    # Maximum length: 20 characters. 
    string withdrawPhone?;
    # Contains the postal code of the postal address to which a customer can send a consent withdrawal notification.
    # 
    # Maximum length: 20 characters. 
    string withdrawPostalCode?;
    # Contains the state of the postal address to which a customer can send a consent withdrawal notification.
    # 
    # Example: `PA`
    string withdrawState?;
};

# A complex type containing information about a signer recipient. A signer is a recipient who must take action on a document, such as sign, initial, date, or add data to form fields on a document.
public type Signer record {
    # If a value is provided, the recipient must enter the value as the access code to view and sign the envelope. 
    # 
    # Maximum Length: 50 characters and it must conform to the account's access code format setting.
    # 
    # If blank, but the signer `accessCode` property is set in the envelope, then that value is used.
    # 
    # If blank and the signer `accessCode` property is not set, then the access code is not required.
    string accessCode?;
    # Metadata about a property.
    PropertyMetadata accessCodeMetadata?;
    # Optional. When **true,** the access code will be added to the email sent to the recipient. This nullifies the security measure of `accessCode` on the recipient.
    string addAccessCodeToEmail?;
    # An array of additional notification objects.
    RecipientAdditionalNotification[] additionalNotifications?;
    # Optional element. When **true,** the agent recipient associated with this recipient can change the recipient's pre-populated email address. This element is only active if enabled for the account.
    string agentCanEditEmail?;
    # Optional. When **true,** the agent recipient associated with this recipient can change the recipient's pre-populated name. This element is only active if enabled for the account.
    string agentCanEditName?;
    # When **true,** if the recipient is locked on a template, advanced recipient routing can override the lock.
    string allowSystemOverrideForLockedRecipient?;
    # When **true,** autonavigation is set for the recipient.
    string autoNavigation?;
    # Error message provided by the destination email system. This field is only provided if the email notification to the recipient fails to send. This property is read-only.
    string autoRespondedReason?;
    # Reserved for DocuSign.
    string bulkRecipientsUri?;
    # 
    string bulkSendV2Recipient?;
    # When **true,** specifies that the signer can perform the signing ceremony offline.
    string canSignOffline?;
    # Specifies whether the recipient is embedded or remote. 
    # 
    # If the `clientUserId` property is not null then the recipient is embedded. Use this field to associate the signer with their userId in your app. Authenticating the user is the responsibility of your app when you use embedded signing.
    # 
    # If the `clientUserId` property is set and either `SignerMustHaveAccount` or `SignerMustLoginToSign` property of the account settings is set to  **true,** an error is generated on sending.
    # 
    # **Note:** This property is not returned by the [listStatusChanges](/docs/esign-rest-api/reference/envelopes/envelopes/liststatuschanges/) endpoint.
    # 
    # Maximum length: 100 characters. 
    string clientUserId?;
    # Indicates the number of times that the recipient has been through a signing completion for the envelope. If this number is greater than 0 for a signing group, only the user who previously completed may sign again. This property is read-only.
    string completedCount?;
    # 
    ConsentDetails[] consentDetailsList?;
    # The reason why the item was created.
    string creationReason?;
    # An optional array of strings that allows the sender to provide custom data about the recipient. This information is returned in the envelope status but otherwise not used by DocuSign. Each customField string can be a maximum of 100 characters.
    string[] customFields?;
    # The date and time the recipient declined the document. This property is read-only.
    string declinedDateTime?;
    # The reason the recipient declined the document. This property is read-only.
    string declinedReason?;
    # When **true,** this recipient is the default recipient and any tabs generated by the transformPdfFields option are mapped to this recipient.
    string defaultRecipient?;
    # 
    DelegationInfo delegatedBy?;
    # 
    DelegationInfo[] delegatedTo?;
    # The date and time that the envelope was delivered to the recipient. This property is read-only.
    string deliveredDateTime?;
    # The delivery method. One of:
    # 
    # - `email`
    # - `fax`
    # - `SMS`
    # - `WhatsApp`
    # - `offline`
    # 
    # The `SMS` and `WhatsApp` delivery methods
    # are limited to `signer`, `carbonCopy`, and `certifiedDelivery`
    # recipients.
    # 
    # **Related topics**
    # 
    # - [Using SMS delivery with the eSignature API][smsconcept]
    # - [How to request a signature by SMS delivery][howto]
    # 
    # [smsconcept]: /docs/esign-rest-api/esign101/concepts/sms-delivery/using-sms-esignature/
    # [howto]: /docs/esign-rest-api/how-to/request-signature-sms/
    string deliveryMethod?;
    # Metadata about a property.
    PropertyMetadata deliveryMethodMetadata?;
    # Reserved for DocuSign.
    string designatorId?;
    # Reserved for DocuSign.
    string designatorIdGuid?;
    # A list of `documentVisibility` objects. Each object in the list specifies whether a document in the envelope is visible to this recipient. For the envelope to use this functionality, Document Visibility must be enabled for the account and the `enforceSignerVisibility` property must be set to **true.**
    DocumentVisibility[] documentVisibility?;
    # The recipient's email address. The system sends notifications about the documents to sign to this address. Maximum length: 100 characters. 
    string email?;
    # Metadata about a property.
    PropertyMetadata emailMetadata?;
    # Sets custom email subject and email body for individual
    # recipients. **Note:** You must explicitly set `supportedLanguage`
    # if you use this feature.
    RecipientEmailNotification emailNotification?;
    # 
    string emailRecipientPostSigningURL?;
    # Specifies a sender-provided valid URL string for redirecting an embedded recipient. When using this option, the embedded recipient still receives an email from DocuSign, just as a remote recipient would. When the document link in the email is clicked the recipient is redirected, through DocuSign, to the supplied URL to complete their actions. When routing to the URL, the sender's system (the server responding to the URL) must request a recipient token to launch a signing session. 
    # 
    # When `SIGN_AT_DOCUSIGN`, the recipient is directed to an embedded signing or viewing process directly at DocuSign. The signing or viewing action is initiated by the DocuSign system and the transaction activity and Certificate of Completion records will reflect this. In all other ways the process is identical to an embedded signing or viewing operation launched by a partner.
    # 
    # It is important to understand that in a typical embedded workflow, the authentication of an embedded recipient is the responsibility of the sending application. DocuSign expects that senders will follow their own processes for establishing the recipient's identity. In this workflow the recipient goes through the sending application before the embedded signing or viewing process is initiated. However, when the sending application sets `EmbeddedRecipientStartURL=SIGN_AT_DOCUSIGN`, the recipient goes directly to the embedded signing or viewing process, bypassing the sending application and any authentication steps the sending application would use. In this case, DocuSign recommends that you use one of the normal DocuSign authentication features (Access Code, Phone Authentication, SMS Authentication, etc.) to verify the identity of the recipient.
    # 
    # If the `clientUserId` property is NOT set, and the `embeddedRecipientStartURL` is set, DocuSign will ignore the redirect URL and launch the standard signing process for the email recipient. Information can be appended to the embedded recipient start URL using merge fields. The available merge fields items are: `envelopeId`, `recipientId`, `recipientName`, `recipientEmail`, and `customFields`. The `customFields` property must be set for the recipient or envelope. The merge fields are enclosed in double brackets. 
    # 
    # *Example*: 
    # 
    # `http://senderHost/[[mergeField1]]/ beginSigningSession? [[mergeField2]]&[[mergeField3]]` 
    string embeddedRecipientStartURL?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # Specifies the documents that are not visible to this recipient. Document Visibility must be enabled for the account and the `enforceSignerVisibility` property must be set to **true** for the envelope to use this.
    # 
    # When enforce signer visibility is enabled, documents with tabs can only be viewed by signers that have a tab on that document. Recipients that have an administrative role (Agent, Editor, or Intermediaries) or informational role (Certified Deliveries or Carbon Copies) can always see all the documents in an envelope, unless they are specifically excluded using this setting when an envelope is sent. Documents that do not have tabs are always visible to all recipients, unless they are specifically excluded using this setting when an envelope is sent.
    string[] excludedDocuments?;
    # Reserved for DocuSign.
    string faxNumber?;
    # Metadata about a property.
    PropertyMetadata faxNumberMetadata?;
    # The recipient's first name. Maximum Length: 50 characters.
    string firstName?;
    # Metadata about a property.
    PropertyMetadata firstNameMetadata?;
    # Reserved for DocuSign.
    string fullName?;
    # Metadata about a property.
    PropertyMetadata fullNameMetadata?;
    # The name of the authentication check to use. This value must match one of the authentication types that the account uses. The names of these authentication types appear in the web console sending interface in the Identify list for a recipient. This setting overrides any default authentication setting. Valid values are:
    # 
    # - `Phone Auth $`: The recipient must authenticate by using two-factor authentication (2FA). You provide the phone number to use for 2FA in the `phoneAuthentication` object.
    # - `SMS Auth $`: The recipient must authenticate via SMS. You provide the phone number to use in the `smsAuthentication` object.
    # - `ID Check $`: The  recipient must answer detailed security questions. 
    # 
    # **Example:** Your account has ID Check and SMS Authentication available. In the web console Identify list, these appear as ID Check $ and SMS Auth $. To use ID Check in an envelope, the idCheckConfigurationName should be ID Check $. For SMS, you would use SMS Auth $, and you would also need to add a phone number to the smsAuthentication node.
    string idCheckConfigurationName?;
    # Metadata about a property.
    PropertyMetadata idCheckConfigurationNameMetadata?;
    # A complex element that contains input information related to a recipient ID check.
    IdCheckInformationInput idCheckInformationInput?;
    # Specifies ID Verification applied on an envelope by workflow ID.
    # See the [list](/docs/esign-rest-api/reference/accounts/identityverifications/list/)
    # method in the [IdentityVerifications](/docs/esign-rest-api/reference/accounts/identityverifications/) resource
    # for more information on how to retrieve workflow IDs available for an account.
    # This can be used in addition to other [recipient authentication](https://support.docusign.com/s/document-item?bundleId=gav1643676262430&topicId=kzp1578456318101.html) methods.
    RecipientIdentityVerification identityVerification?;
    # When **true** and the envelope recipient creates a DocuSign account after signing, the Manage Account Email Notification settings are used as the default settings for the recipient's account. 
    string inheritEmailNotificationConfiguration?;
    # When **true,** this signer is a bulk recipient and the recipient information is contained in a bulk recipient file. 
    # 
    # Note that when this is true the email and name for the recipient becomes bulk@recipient.com and "Bulk Recipient". These fields can not be changed for the bulk recipient. 
    string isBulkRecipient?;
    # Metadata about a property.
    PropertyMetadata isBulkRecipientMetadata?;
    # The recipient's last name.
    string lastName?;
    # Metadata about a property.
    PropertyMetadata lastNameMetadata?;
    # Reserved for DocuSign.
    string lockedRecipientPhoneAuthEditable?;
    # Reserved for DocuSign.
    string lockedRecipientSmsEditable?;
    # The full legal name of the recipient. Maximum Length: 100 characters.
    # 
    # **Note:** You must always set a value for this property in requests, even if `firstName` and `lastName` are set.
    string name?;
    # Metadata about a property.
    PropertyMetadata nameMetadata?;
    # The `recipientId` of the notary for this signer.
    string notaryId?;
    # 
    string notarySignerEmailSent?;
    # A note sent to the recipient in the signing email.
    # This note is unique to this recipient.
    # In the user interface,
    # it appears near the upper left corner
    # of the document
    # on the signing screen.
    # 
    # Maximum Length: 1000 characters.
    string note?;
    # Metadata about a property.
    PropertyMetadata noteMetadata?;
    # Reserved for DocuSign.
    OfflineAttributes offlineAttributes?;
    # A complex type that contains the elements:
    # 
    # * `recipMayProvideNumber`: A Boolean value that specifies whether the recipient can use the phone number of their choice.
    # * `senderProvidedNumbers`: A list of phone numbers that the recipient can use.
    # * `recordVoicePrint`: Reserved for DocuSign.
    # * `validateRecipProvidedNumber`: Reserved for DocuSign.
    RecipientPhoneAuthentication phoneAuthentication?;
    # Describes the recipient phone number.
    RecipientPhoneNumber phoneNumber?;
    # The proof file of the recipient. [ID Evidence](/docs/idevidence-api/) uses proof files to store the identification data that recipients submit when verifying their ID with [ID Verification](/docs/esign-rest-api/esign101/concepts/documents/)
    RecipientProofFile proofFile?;
    # Reserved for DocuSign.
    RecipientAttachment[] recipientAttachments?;
    # A complex element that contains information about a user's authentication status.
    AuthenticationStatus recipientAuthenticationStatus?;
    # Metadata about the features that are supported for the recipient type. This property is read-only.
    FeatureAvailableMetadata[] recipientFeatureMetadata?;
    # A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # 
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # 
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`.
    string recipientId?;
    # The globally-unique identifier (GUID) for a specific recipient on a specific envelope. If the same recipient is associated with multiple envelopes, they will have a different GUID for each one. This property is read-only.
    string recipientIdGuid?;
    # The default signature provider is the DocuSign Electronic signature system. This parameter is used to specify one or more Standards Based Signature (digital signature) providers for the signer to use. [More information.](/docs/esign-rest-api/esign101/concepts/standards-based-signatures/)
    RecipientSignatureProvider[] recipientSignatureProviders?;
    # When **true,** specifies that the recipient creates the tabs.
    string recipientSuppliesTabs?;
    # The recipient type, as specified by the following values:
    # - `agent`: Agent recipients can add name and email information for recipients that appear after the agent in routing order.
    # - `carbonCopy`: Carbon copy recipients get a copy of the envelope but don't need to sign, initial, date, or add information to any of the documents. This type of recipient can be used in any routing order.
    # - `certifiedDelivery`: Certified delivery recipients must receive the completed documents for the envelope to be completed. They don't need to sign, initial, date, or add information to any of the documents.
    # - `editor`: Editors have the same management and access rights for the envelope as the sender. Editors can add name and email information, add or change the routing order, set authentication options, and can edit signature/initial tabs and data fields for the remaining recipients.
    # - `inPersonSigner`: In-person recipients are DocuSign users who act as signing hosts in the same physical location as the signer.
    # - `intermediaries`: Intermediary recipients can optionally add name and email information for recipients at the same or subsequent level in the routing order.
    # - `seal`: Electronic seal recipients represent legal entities.
    # - `signer`: Signers are recipients who must sign, initial, date, or add data to form fields on the documents in the envelope.
    # - `witness`: Witnesses are recipients whose signatures affirm that the identified signers have signed the documents in the envelope.
    string recipientType?;
    # Metadata about a property.
    PropertyMetadata recipientTypeMetadata?;
    # When **true,** the recipient is required to use the specified ID check method (including Phone and SMS authentication) to validate their identity. 
    string requireIdLookup?;
    # Metadata about a property.
    PropertyMetadata requireIdLookupMetadata?;
    # Sets the type of signer certificate required for signing. If left blank, no certificate is required. Only one type of certificate can be set for a signer. Valid values:
    # 
    # * `docusign_express`: Requires a DocuSign Express certificate.
    # * `safe`: Requires a SAFE-BioPharma certificate.
    # * `open_trust`: Requires an OpenTrust certificate. 
    # 
    # **Important:** There are certain rules and restrictions that must be followed when requiring OpenTrust digital signatures. See [ML:OpenTrust Rules and Restrictions] for more information. 
    #  
    string requireSignerCertificate?;
    # When **true,** the signer must print, sign, and upload or fax the signed documents to DocuSign.
    string requireSignOnPaper?;
    # When **true,** the signer is required to upload a new signature, even if they have a pre-adopted signature in their personal DocuSign account.
    string requireUploadSignature?;
    # Optional element. Specifies the role name associated with the recipient.<br/><br/>This property is required when you are working with template recipients.
    string roleName?;
    # Specifies the routing order of the recipient in the envelope. 
    string routingOrder?;
    # Metadata about a property.
    PropertyMetadata routingOrderMetadata?;
    # The UTC DateTime when the envelope was sent. This property is read-only.
    string sentDateTime?;
    # Allows the sender to pre-specify the signature name, signature initials and signature font used in the signature stamp for the recipient.
    # 
    # Used only with recipient types In Person Signers and Signers.
    RecipientSignatureInformation signatureInfo?;
    # Reserved for DocuSign.
    string signedDateTime?;
    # When **true** and the feature is enabled in the sender's account, the signing recipient is required to draw signatures and initials at each signature/initial tab (instead of adopting a signature/initial style or only drawing a signature/initial once).
    string signInEachLocation?;
    # Metadata about a property.
    PropertyMetadata signInEachLocationMetadata?;
    # The ID of the [signing group](https://support.docusign.com/s/document-item?bundleId=gav1643676262430&topicId=zgn1578456447934.html).
    string signingGroupId?;
    # Metadata about a property.
    PropertyMetadata signingGroupIdMetadata?;
    # Optional. The name of the signing group. 
    # 
    # Maximum Length: 100 characters. 
    string signingGroupName?;
    # A complex type that contains information about users in the signing group.
    UserInfo[] signingGroupUsers?;
    # Contains the element senderProvidedNumbers which is an Array  of phone numbers the recipient can use for SMS text authentication.
    RecipientSMSAuthentication smsAuthentication?;
    # Deprecated.
    SocialAuthentication[] socialAuthentications?;
    # Specifies the status of the recipient at the time of the request. This property is read-only. Possible values are:
    # 
    # - `created`: The recipient is in a draft state. This is only associated with draft envelopes (envelopes with a created status).
    # - `sent`: The recipient has been sent an email notification that it is their turn to sign an envelope.
    # - `delivered`: The recipient has viewed the documents in an envelope through the DocuSign signing web site. This is not an email delivery of the documents in an envelope.
    # - `signed`; The recipient has completed (performed all required interactions, such as signing or entering data) all required tags in an envelope. This is a temporary state during processing, after which the recipient is automatically moved to completed.
    # - `declined`: The recipient declined to sign the documents in the envelope.
    # - `completed`: The recipient has completed their actions (signing or other required actions if not a signer) for an envelope.
    # - `faxpending`: The recipient has finished signing and the system is waiting a fax attachment by the recipient before completing their signing step.
    # - `autoresponded`: The recipient's email system auto-responded to the email from DocuSign. This status is used by the DocuSign webapp (also known as the DocuSign console) to inform senders about the auto-responded email.
    string status?;
    # Reserved for DocuSign.
    string statusCode?;
    # When **true,** email notifications are suppressed for the recipient, and they must access envelopes and documents from their DocuSign inbox.
    string suppressEmails?;
    # All of the tabs associated with a recipient. Each property is a list of a type of tab.
    EnvelopeRecipientTabs tabs?;
    # When **true,** the sender cannot change any attributes of the recipient. Used only when working with template recipients. 
    string templateLocked?;
    # When **true,** the sender may not remove the recipient. Used only when working with template recipients.
    string templateRequired?;
    # The total number of tabs in the documents. This property is read-only.
    string totalTabCount?;
    # The ID of the user to access.
    # 
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    string userId?;
};

# Contains information about a bank that processes a customer's direct debit payments.
public type DirectDebitProcessorInformation record {
    # The branch code of the bank used for direct debit.
    # 
    # Maximum Length: 10 characters.
    string bankBranchCode?;
    # The check digit or digits in the international bank account number. These digits are used to confirm the validity of the account.
    # 
    # Maximum Length: 4 characters.
    string bankCheckDigit?;
    # The code or number that identifies the bank. This is also known as the sort code.
    # 
    # Example: `200000`
    # 
    # Maximum Length: 18 characters.
    string bankCode?;
    # The name of the direct debit bank.
    # 
    # Maximum Length: 80 characters.
    string bankName?;
    # The name on the direct debit bank account. This field is required for POST and PUT requests.
    # 
    # Maximum Length: 60 characters.
    string bankTransferAccountName?;
    # The customer's bank account number. This value will be obfuscated. This field is required for POST and PUT requests.
    # 
    # Maximum Length: 30 characters.
    string bankTransferAccountNumber?;
    # Specifies the type of direct debit transfer. The value of this field is dependent on the user's country. This field is required for POST and PUT requests. Possible values are:
    # 
    # - `DirectDebitUK`
    # - `DirectEntryAU`
    # - `SEPA`
    string bankTransferType?;
    # The user's country. The system populates this value automatically.
    string country?;
    # The email address of the user who is associated with the payment method. This field is required for POST and PUT requests.
    # 
    # Maximum Length: 80 characters.
    string email?;
    # The user's first name. This field is required for POST and PUT requests.
    # 
    # Maximum Length: 30 characters.
    string firstName?;
    # The International Bank Account Number (IBAN). 
    # 
    # Example: `DE89370400440532013000`
    # 
    # For more information, see [PeopleSoft's guide to Setting Up Banks](https://docs.oracle.com/cd/E16365_01/fscm91pbr0/eng/psbooks/fsbk/chapter.htm?File=fsbk/htm/fsbk03.htm).
    # 
    # **Note:** This number will be obfuscated.
    string iBAN?;
    # The user's last name. This field is required for POST and PUT requests.
    # 
    # Maximum Length: 70 characters.
    string lastName?;
};

# Describes information
# about the `total` of a payment.
public type Money record {
    # The total payment amount
    # in the currency's base unit.
    # For example, for USD
    # the base currency is one cent.
    string amountInBaseUnit?;
    # The three-letter
    # [ISO 4217][ISO 4217] currency code for the payment.
    # 
    # For example:
    # 
    # * AUD Australian dollar
    # * CAD Canadian dollar
    # * EUR Euro
    # * GBP Great Britain pound
    # * USD United States dollar
    # 
    # This is a read-only property.
    # 
    # [ISO 4217]:          https://en.wikipedia.org/wiki/ISO_4217
    string currency?;
    # The payment amount as displayed
    # in the `currency`.
    # 
    # For example, if the payment amount
    # is USD 12.59,
    # the `amountInBaseUnit` is 1259 (cents),
    # and the displayed amount is `$12.59 USD`.
    # 
    # This is a read-only property.
    string displayAmount?;
};

# Number tabs validate that the entered value is a number.
# They do not support advanced validation or display options.
# See [Number fields](/docs/esign-rest-api/esign101/concepts/tabs/number-fields/)
# to learn more about this tab type.
public type Number record {
    # When **true,** the text string in the document may have extra whitespace and still match the anchor string. This occurs in two cases.
    # 
    # First, it matches if the document string has a single extra whitespace character following a non-whitespace character in the anchor string. For example, if the anchor string is `DocuSign`, then `Docu Sign` will match. However, <code>Docu&nbsp;&nbsp;&nbsp;Sign</code> will not match.
    # 
    # Second, it matches if the document string has one or more extra whitespace characters following a whitespace character in the anchor string. For example, if the anchor string is `Docu Sign`, then <code>Docu&nbsp;&nbsp;&nbsp;Sign</code> will match.
    # 
    # The default value is **true.**
    string anchorAllowWhiteSpaceInCharacters?;
    # Metadata about a property.
    PropertyMetadata anchorAllowWhiteSpaceInCharactersMetadata?;
    # This property controls how [anchor tabs][AnchorTabs] are placed. When **true,** the text string in a document must match the case of the `anchorString` property for an anchor tab to be created. The default value is **false.**
    # 
    # For example, when set to **true,** if the anchor string is `DocuSign`, then `DocuSign` will match but `Docusign`, `docusign`, `DoCuSiGn`, etc. will not match. When **false,** `DocuSign`, `Docusign`, `docusign`, `DoCuSiGn`, etc. will all match.
    # 
    # This functionality uses the following rules:
    # 
    # - Unless punctuation is specified in the `anchorString`, this functionality ignores punctuation and the following characters:
    # 
    #   $~><|^+=
    # 
    #   For example, the `anchorString` `water` will match on the string `Fetch a pail of water.`
    # 
    # - Strings embedded in other strings are ignored during the matching process.
    # 
    # - In words that have dashes, the parts separated by dashes are treated as distinct words.
    # 
    #   Example: If the anchor string is `forget`, then an anchor tab is placed on the `forget` in `forget-me-not`, even when `anchorMatchWholeWord` is set to **true.**
    # 
    # - Letters with accent marks are treated as distinct characters from their unaccented counterparts.
    # 
    # - For single-character anchor strings, if the two characters appear right next to each other in the document, a single anchor tab is placed for both of them.
    # 
    #   Example: If the anchor string is `i`, then only one anchor tab is placed in `skiing`.
    # 
    # - Unlike punctuation, numbers are not ignored when finding anchor words.
    # 
    #   Example: If the anchor string is `cat`, then `-cat-` is matched but `1cat2` is not when `anchorMatchWholeWord` is set to **true** (its default value).
    # 
    # **Note:** You can only specify the value of this property in POST requests.
    # 
    # [AnchorTabs]: /docs/esign-rest-api/esign101/concepts/tabs/auto-place/
    string anchorCaseSensitive?;
    # Metadata about a property.
    PropertyMetadata anchorCaseSensitiveMetadata?;
    # This property controls how [anchor tabs][AnchorTabs] are aligned in relation to the anchor text. Possible values are :
    # 
    # - `left`: Aligns the left side of the tab with the beginning of the first character of the matching anchor word. This is the default value.
    # - `right`: Aligns the tab’s left side with the last character of the matching anchor word.
    # 
    # **Note:** You can only specify the value of this property in POST requests.
    # 
    # [AnchorTabs]: /docs/esign-rest-api/esign101/concepts/tabs/auto-place/
    string anchorHorizontalAlignment?;
    # Metadata about a property.
    PropertyMetadata anchorHorizontalAlignmentMetadata?;
    # When **true,** this tab is ignored if the `anchorString` is not found in the document.
    string anchorIgnoreIfNotPresent?;
    # Metadata about a property.
    PropertyMetadata anchorIgnoreIfNotPresentMetadata?;
    # When **true,** the text string in a document must match the value of the `anchorString` property in its entirety for an [anchor tab][AnchorTab] to be created. The default value is **false.**
    # 
    # For example, when set to **true,** if the input is `man` then `man` will match but `manpower`, `fireman`, and `penmanship` will not. When **false,** if the input is `man` then `man`, `manpower`, `fireman`, and `penmanship` will all match.
    # 
    # This functionality uses the following rules:
    # 
    # - Unless punctuation is specified in the `anchorString`, this functionality ignores punctuation and the following characters:
    # 
    #   $~><|^+=
    # 
    #   For example, the `anchorString` `water` will match on the string `Fetch a pail of water.`
    # 
    # - Strings embedded in other strings are ignored during the matching process.
    # 
    # - In words that have dashes, the parts separated by dashes are treated as distinct words.
    # 
    #   Example: If the anchor string is `forget`, then an anchor tab is placed on the `forget` in `forget-me-not`, even when `anchorMatchWholeWord` is set to **true.**
    # 
    # - Letters with accent marks are treated as distinct characters from their unaccented counterparts.
    # 
    # - For single-character anchor strings, if the two characters appear right next to each other in the document, a single anchor tab is placed for both of them.
    # 
    #   Example: If the anchor string is `i`, then only one anchor tab is placed in `skiing`.
    # 
    # - Unlike punctuation, numbers are not ignored when finding anchor words.
    # 
    #   Example: If the anchor string is `cat`, then `-cat-` is matched but `1cat2` is not when `anchorMatchWholeWord` is set to **true** (its default value).
    # 
    # 
    # **Note:** You can only specify the value of this property in POST requests.
    # 
    # [AnchorTab]: /docs/esign-rest-api/esign101/concepts/tabs/auto-place/
    string anchorMatchWholeWord?;
    # Metadata about a property.
    PropertyMetadata anchorMatchWholeWordMetadata?;
    # Specifies the string to find in the document and use as the basis for tab placement.
    string anchorString?;
    # Metadata about a property.
    PropertyMetadata anchorStringMetadata?;
    # Reserved for DocuSign.
    string anchorTabProcessorVersion?;
    # Metadata about a property.
    PropertyMetadata anchorTabProcessorVersionMetadata?;
    # Specifies units of the `anchorXOffset` and `anchorYOffset`. Valid units are:
    # 
    # - `pixels` (default)
    # - `inches`
    # - `mms`
    # - `cms`
    string anchorUnits?;
    # Metadata about a property.
    PropertyMetadata anchorUnitsMetadata?;
    # Specifies the X axis location of the tab in `anchorUnits` relative to the `anchorString`.
    string anchorXOffset?;
    # Metadata about a property.
    PropertyMetadata anchorXOffsetMetadata?;
    # Specifies the Y axis location of the tab in `anchorUnits` relative to the `anchorString`.
    string anchorYOffset?;
    # Metadata about a property.
    PropertyMetadata anchorYOffsetMetadata?;
    # When **true,** the information in the tab is bold.
    string bold?;
    # Metadata about a property.
    PropertyMetadata boldMetadata?;
    # 
    string caption?;
    # Metadata about a property.
    PropertyMetadata captionMetadata?;
    # When **true,** the field appears normally while the recipient is adding or modifying the information in the field, but the data is not visible (the characters are hidden by asterisks) to any other signer or the sender.
    # 
    # When an envelope is completed the information is only available to the sender through the Form Data link in the DocuSign Console. The information on the downloaded document remains masked by asterisks.
    # 
    # This setting applies only to text boxes and does not affect list boxes, radio buttons, or check boxes.
    string concealValueOnDocument?;
    # Metadata about a property.
    PropertyMetadata concealValueOnDocumentMetadata?;
    # For conditional fields this is the `tabLabel` of the parent tab that controls this tab's visibility.
    string conditionalParentLabel?;
    # Metadata about a property.
    PropertyMetadata conditionalParentLabelMetadata?;
    # For conditional fields, this is the value of the parent tab that controls the tab's visibility.
    # 
    # If the parent tab is a Checkbox, Radio button, Optional Signature, or Optional Initial use "on" as the value to show that the parent tab is active.
    string conditionalParentValue?;
    # Metadata about a property.
    PropertyMetadata conditionalParentValueMetadata?;
    # The DocuSign generated custom tab ID for the custom tab to be applied. This can only be used when adding new tabs for a recipient. When used, the new tab inherits all the custom tab properties.
    string customTabId?;
    # Metadata about a property.
    PropertyMetadata customTabIdMetadata?;
    # When **true,** disables the auto sizing of single line text boxes in the signing screen when the signer enters data. If disabled users will only be able enter as much data as the text box can hold. By default this is false. This property only affects single line text boxes.
    string disableAutoSize?;
    # Metadata about a property.
    PropertyMetadata disableAutoSizeMetadata?;
    # Specifies the document ID number that the tab is placed on. This must refer to an existing Document's ID attribute.
    string documentId?;
    # Metadata about a property.
    PropertyMetadata documentIdMetadata?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The font to be used for the tab value. Supported fonts include:
    # 
    # - Default
    # - Arial
    # - ArialNarrow
    # - Calibri
    # - CourierNew
    # - Garamond
    # - Georgia
    # - Helvetica
    # - LucidaConsole
    # - MSGothic
    # - MSMincho
    # - OCR-A
    # - Tahoma
    # - TimesNewRoman
    # - Trebuchet
    # - Verdana
    string font?;
    # The font color to use for the information in the tab. Possible values are: 
    # 
    # - Black
    # - BrightBlue
    # - BrightRed
    # - DarkGreen
    # - DarkRed
    # - Gold
    # - Green
    # - NavyBlue
    # - Purple
    # - White
    string fontColor?;
    # Metadata about a property.
    PropertyMetadata fontColorMetadata?;
    # Metadata about a property.
    PropertyMetadata fontMetadata?;
    # The font size used for the information in the tab. Possible values are:
    # 
    # - Size7
    # - Size8
    # - Size9
    # - Size10
    # - Size11
    # - Size12
    # - Size14
    # - Size16
    # - Size18
    # - Size20
    # - Size22
    # - Size24
    # - Size26
    # - Size28
    # - Size36
    # - Size48
    # - Size72
    string fontSize?;
    # Metadata about a property.
    PropertyMetadata fontSizeMetadata?;
    # An integer specifying the order in which the guided form HTML should render. The order is relative to the `formPageLabel`, the group by which to place the guided form HTML block.
    string formOrder?;
    # Metadata about a property.
    PropertyMetadata formOrderMetadata?;
    # A string specifying the group in which to place the guided form HTML. Each group displays as a separate guided forms page in the signing experience.
    string formPageLabel?;
    # Metadata about a property.
    PropertyMetadata formPageLabelMetadata?;
    # An integer specifying the order in which to present the guided form pages.
    string formPageNumber?;
    # Metadata about a property.
    PropertyMetadata formPageNumberMetadata?;
    # Contains the formula
    # for calculating the value of
    # this tab.
    # 
    # Use a tab's `tabLabel`,
    # enclosed in brackets,
    # to refer to it.
    # 
    # For example,
    # you want to present the total cost
    # of two items, tax included.
    # 
    # The cost of each item is stored
    # in number tabs labeled Item1 and Item2.
    # The tax rate is in a number tab
    # labeled TaxRate.
    # 
    # The formula string for this property
    # would be:
    # `([Item1] + [Item2]) * (1 + [TaxRate])`
    # 
    # See [Calculated Fields][calculatedfields]
    # in the DocuSign Support Center
    # to learn more about formulas.
    # 
    # Maximum Length: 2000 characters
    # 
    # [calculatedfields]: https://support.docusign.com/s/document-item?bundleId=gbo1643332197980&topicId=crs1578456361259.html
    string formula?;
    # Metadata about a property.
    PropertyMetadata formulaMetadata?;
    # The height of the tab in pixels.
    # Must be an integer.
    string height?;
    # Metadata about a property.
    PropertyMetadata heightMetadata?;
    # When **true,** the information in the tab is italic.
    string italic?;
    # Metadata about a property.
    PropertyMetadata italicMetadata?;
    # Allows you to customize locale settings.
    LocalePolicyTab localePolicy?;
    # When **true,** the signer cannot change the data of the custom tab.
    string locked?;
    # Metadata about a property.
    PropertyMetadata lockedMetadata?;
    # An optional value that describes the maximum length of the property when the property is a string.
    string maxLength?;
    # Metadata about a property.
    PropertyMetadata maxLengthMetadata?;
    # Contains information for transferring values between Salesforce data fields and DocuSign tabs.
    MergeField mergeField?;
    # Reserved for DocuSign.
    string mergeFieldXml?;
    # The name of the tab. For example, `Sign Here` or `Initial Here`.
    # 
    # If the `tooltip` attribute is not set, this value will be displayed as the custom tooltip text.
    string name?;
    # Metadata about a property.
    PropertyMetadata nameMetadata?;
    # The initial value of the tab. 
    string originalValue?;
    # Metadata about a property.
    PropertyMetadata originalValueMetadata?;
    # The page number on which the tab is located. For supplemental documents, this value must be `1`.
    string pageNumber?;
    # Metadata about a property.
    PropertyMetadata pageNumberMetadata?;
    # The ID of the recipient to whom the tab will be assigned. This value should match the `recipientId` defined in the recipient object.
    string recipientId?;
    # The globally-unique identifier (GUID) for a specific recipient on a specific envelope. If the same recipient is associated with multiple envelopes, they will have a different GUID for each one. This property is read-only.
    string recipientIdGuid?;
    # Metadata about a property.
    PropertyMetadata recipientIdGuidMetadata?;
    # Metadata about a property.
    PropertyMetadata recipientIdMetadata?;
    # When **true** and shared is true, information must be entered in this field to complete the envelope. 
    string requireAll?;
    # Metadata about a property.
    PropertyMetadata requireAllMetadata?;
    # When **true,** the signer is required to fill out this tab.
    string required?;
    # Metadata about a property.
    PropertyMetadata requiredMetadata?;
    # Optional element for field markup. When **true,** the signer is required to initial when they modify a shared field.
    string requireInitialOnSharedChange?;
    # Metadata about a property.
    PropertyMetadata requireInitialOnSharedChangeMetadata?;
    # When **true,** the sender must populate the tab before an envelope can be sent using the template. 
    # 
    # This value tab can only be changed by modifying (PUT) the template. 
    # 
    # Tabs with a `senderRequired` value of true cannot be deleted from an envelope.
    string senderRequired?;
    # Metadata about a property.
    PropertyMetadata senderRequiredMetadata?;
    # When **true,** this custom tab is shared.
    string shared?;
    # Metadata about a property.
    PropertyMetadata sharedMetadata?;
    # Reserved for DocuSign.
    string shareToRecipients?;
    # Metadata about a property.
    PropertyMetadata shareToRecipientsMetadata?;
    # 
    SmartContractInformation smartContractInformation?;
    # Reserved for DocuSign.
    string 'source?;
    # The status of the tab. Possible values are:
    # 
    # - `active`: The tab is active, but the recipient has not yet interacted with it.
    # - `signed`: The recipient signed the tab.
    # - `declined`: The recipient declined the envelope.
    # - `na`: Used when the `status` property is not applicable to the tab type. (For example, a tab that has the `tabType` `SignerAttachmentOptional`).
    string status?;
    # Metadata about a property.
    PropertyMetadata statusMetadata?;
    # An array of tab groups that this tab belongs to. Tab groups are identified by their `groupLabel` property.
    # 
    # To associate this tab with a tab group, add the tab group's `groupLabel` to this array.
    string[] tabGroupLabels?;
    # Metadata about a property.
    PropertyMetadata tabGroupLabelsMetadata?;
    # The unique identifier for the tab.
    string tabId?;
    # Metadata about a property.
    PropertyMetadata tabIdMetadata?;
    # The label associated with the tab. This value may be an empty string.
    # If no value is provided, the tab type is used as the value.
    # 
    # Maximum Length: 500 characters.
    string tabLabel?;
    # Metadata about a property.
    PropertyMetadata tabLabelMetadata?;
    # A positive integer that sets the order the tab is navigated to during signing.
    # 
    # Tabs on a page are navigated to in ascending order, starting with the lowest number and moving to the highest. If two or more tabs have the same `tabOrder` value, the normal auto-navigation setting behavior for the envelope is used.
    string tabOrder?;
    # Metadata about a property.
    PropertyMetadata tabOrderMetadata?;
    # Indicates the type of tab (for example, `signHere` or `initialHere`).
    string tabType?;
    # Metadata about a property.
    PropertyMetadata tabTypeMetadata?;
    # When **true,** the sender cannot change any attributes of the recipient. Used only when working with template recipients. 
    string templateLocked?;
    # Metadata about a property.
    PropertyMetadata templateLockedMetadata?;
    # When **true,** the sender may not remove the recipient. Used only when working with template recipients.
    string templateRequired?;
    # Metadata about a property.
    PropertyMetadata templateRequiredMetadata?;
    # The text of a tooltip that appears when a user hovers over a form field or tab.
    string tooltip?;
    # Metadata about a property.
    PropertyMetadata toolTipMetadata?;
    # When **true,** the information in the tab is underlined.
    string underline?;
    # Metadata about a property.
    PropertyMetadata underlineMetadata?;
    # The message displayed if the custom tab fails input validation (either custom of embedded).
    string validationMessage?;
    # Metadata about a property.
    PropertyMetadata validationMessageMetadata?;
    # A regular expression used to validate input for the tab.
    string validationPattern?;
    # Metadata about a property.
    PropertyMetadata validationPatternMetadata?;
    # Specifies the value of the tab. 
    string value?;
    # Metadata about a property.
    PropertyMetadata valueMetadata?;
    # The width of the tab in pixels.
    # Must be an integer.
    string width?;
    # Metadata about a property.
    PropertyMetadata widthMetadata?;
    # This property indicates the horizontal offset of the object on the page.
    # DocuSign uses 72 DPI when determining position.
    # Required. Must be an integer. May be zero.
    # 
    # To improve the tab's position on the document,
    # DocuSign recommends
    # adjusting `xPosition`
    # and `yPosition`
    # coordinates
    # by (-3, -2)
    string xPosition?;
    # Metadata about a property.
    PropertyMetadata xPositionMetadata?;
    # This property indicates the vertical offset of the object on the page.
    # DocuSign uses 72 DPI when determining position.
    # Required. Must be an integer. May be zero.
    # 
    # To improve the tab's position on the document,
    # DocuSign recommends
    # adjusting `xPosition`
    # and `yPosition`
    # coordinates
    # by (-3, -2)
    string yPosition?;
    # Metadata about a property.
    PropertyMetadata yPositionMetadata?;
};

# Billing plans
public type BillingPlans record {
    # Contains information about the address associated with the account.
    AccountAddress billingAddress?;
    # When **true,** the credit card address information is the same as that returned as the billing address. If false, then the billing address is considered a billing contact address, and the credit card address can be different.
    string billingAddressIsCreditCardAddress?;
    # Contains information about an account billing plan.
    AccountBillingPlan billingPlan?;
    # This object contains information about a credit card that is associated with an account.
    CreditCardInformation creditCardInformation?;
    # Contains information about a bank that processes a customer's direct debit payments.
    DirectDebitProcessorInformation directDebitProcessorInformation?;
    # 
    DowngradePlanUpdateResponse downgradePlanInformation?;
    # 
    DowngradeRequestInformation downgradeRequestInformation?;
    # 
    BillingEntityInformationResponse entityInformation?;
    # The payment method used for the billing plan. Valid values are:
    # 
    # - `NotSupported`
    # - `CreditCard`
    # - `PurchaseOrder`
    # - `Premium`
    # - `Freemium`
    # - `FreeTrial`
    # - `AppStore`
    # - `DigitalExternal`
    # - `DirectDebit`
    string paymentMethod?;
    # 
    PaymentProcessorInformation paymentProcessorInformation?;
    # A complex type that contains the following information for entering referral and discount information. The following items are included in the referral information (all string content): enableSupport, includedSeats, saleDiscountPercent, saleDiscountAmount, saleDiscountFixedAmount, saleDiscountPeriods, saleDiscountSeatPriceOverride, planStartMonth, referralCode, referrerName, advertisementId, publisherId, shopperId, promoCode, groupMemberId, idType, and industry
    # 
    # **Note:** saleDiscountPercent, saleDiscountAmount, saleDiscountFixedAmount, saleDiscountPeriods, and saleDiscountSeatPriceOverride are reserved for DocuSign use only.
    ReferralInformation referralInformation?;
    # A list of billing plans that the current billing plan can be rolled into.
    BillingPlan[] successorPlans?;
    # 
    string taxExemptId?;
};

# Envelope templates
public type EnvelopeTemplates record {
    # An array of `templateSummary` objects that contain information about templates.
    TemplateSummary[] templates?;
};

# A Notary Seal tab enables the recipient to notarize a document. This tab can only be assigned to a remote notary recipient using [DocuSign Notary][notary].
# 
# [notary]: /docs/notary-api/
public type NotarySeal record {
    # When **true,** the text string in the document may have extra whitespace and still match the anchor string. This occurs in two cases.
    # 
    # First, it matches if the document string has a single extra whitespace character following a non-whitespace character in the anchor string. For example, if the anchor string is `DocuSign`, then `Docu Sign` will match. However, <code>Docu&nbsp;&nbsp;&nbsp;Sign</code> will not match.
    # 
    # Second, it matches if the document string has one or more extra whitespace characters following a whitespace character in the anchor string. For example, if the anchor string is `Docu Sign`, then <code>Docu&nbsp;&nbsp;&nbsp;Sign</code> will match.
    # 
    # The default value is **true.**
    string anchorAllowWhiteSpaceInCharacters?;
    # Metadata about a property.
    PropertyMetadata anchorAllowWhiteSpaceInCharactersMetadata?;
    # This property controls how [anchor tabs][AnchorTabs] are placed. When **true,** the text string in a document must match the case of the `anchorString` property for an anchor tab to be created. The default value is **false.**
    # 
    # For example, when set to **true,** if the anchor string is `DocuSign`, then `DocuSign` will match but `Docusign`, `docusign`, `DoCuSiGn`, etc. will not match. When **false,** `DocuSign`, `Docusign`, `docusign`, `DoCuSiGn`, etc. will all match.
    # 
    # This functionality uses the following rules:
    # 
    # - Unless punctuation is specified in the `anchorString`, this functionality ignores punctuation and the following characters:
    # 
    #   $~><|^+=
    # 
    #   For example, the `anchorString` `water` will match on the string `Fetch a pail of water.`
    # 
    # - Strings embedded in other strings are ignored during the matching process.
    # 
    # - In words that have dashes, the parts separated by dashes are treated as distinct words.
    # 
    #   Example: If the anchor string is `forget`, then an anchor tab is placed on the `forget` in `forget-me-not`, even when `anchorMatchWholeWord` is set to **true.**
    # 
    # - Letters with accent marks are treated as distinct characters from their unaccented counterparts.
    # 
    # - For single-character anchor strings, if the two characters appear right next to each other in the document, a single anchor tab is placed for both of them.
    # 
    #   Example: If the anchor string is `i`, then only one anchor tab is placed in `skiing`.
    # 
    # - Unlike punctuation, numbers are not ignored when finding anchor words.
    # 
    #   Example: If the anchor string is `cat`, then `-cat-` is matched but `1cat2` is not when `anchorMatchWholeWord` is set to **true** (its default value).
    # 
    # **Note:** You can only specify the value of this property in POST requests.
    # 
    # [AnchorTabs]: /docs/esign-rest-api/esign101/concepts/tabs/auto-place/
    string anchorCaseSensitive?;
    # Metadata about a property.
    PropertyMetadata anchorCaseSensitiveMetadata?;
    # This property controls how [anchor tabs][AnchorTabs] are aligned in relation to the anchor text. Possible values are :
    # 
    # - `left`: Aligns the left side of the tab with the beginning of the first character of the matching anchor word. This is the default value.
    # - `right`: Aligns the tab’s left side with the last character of the matching anchor word.
    # 
    # **Note:** You can only specify the value of this property in POST requests.
    # 
    # [AnchorTabs]: /docs/esign-rest-api/esign101/concepts/tabs/auto-place/
    string anchorHorizontalAlignment?;
    # Metadata about a property.
    PropertyMetadata anchorHorizontalAlignmentMetadata?;
    # When **true,** this tab is ignored if the `anchorString` is not found in the document.
    string anchorIgnoreIfNotPresent?;
    # Metadata about a property.
    PropertyMetadata anchorIgnoreIfNotPresentMetadata?;
    # When **true,** the text string in a document must match the value of the `anchorString` property in its entirety for an [anchor tab][AnchorTab] to be created. The default value is **false.**
    # 
    # For example, when set to **true,** if the input is `man` then `man` will match but `manpower`, `fireman`, and `penmanship` will not. When **false,** if the input is `man` then `man`, `manpower`, `fireman`, and `penmanship` will all match.
    # 
    # This functionality uses the following rules:
    # 
    # - Unless punctuation is specified in the `anchorString`, this functionality ignores punctuation and the following characters:
    # 
    #   $~><|^+=
    # 
    #   For example, the `anchorString` `water` will match on the string `Fetch a pail of water.`
    # 
    # - Strings embedded in other strings are ignored during the matching process.
    # 
    # - In words that have dashes, the parts separated by dashes are treated as distinct words.
    # 
    #   Example: If the anchor string is `forget`, then an anchor tab is placed on the `forget` in `forget-me-not`, even when `anchorMatchWholeWord` is set to **true.**
    # 
    # - Letters with accent marks are treated as distinct characters from their unaccented counterparts.
    # 
    # - For single-character anchor strings, if the two characters appear right next to each other in the document, a single anchor tab is placed for both of them.
    # 
    #   Example: If the anchor string is `i`, then only one anchor tab is placed in `skiing`.
    # 
    # - Unlike punctuation, numbers are not ignored when finding anchor words.
    # 
    #   Example: If the anchor string is `cat`, then `-cat-` is matched but `1cat2` is not when `anchorMatchWholeWord` is set to **true** (its default value).
    # 
    # 
    # **Note:** You can only specify the value of this property in POST requests.
    # 
    # [AnchorTab]: /docs/esign-rest-api/esign101/concepts/tabs/auto-place/
    string anchorMatchWholeWord?;
    # Metadata about a property.
    PropertyMetadata anchorMatchWholeWordMetadata?;
    # Specifies the string to find in the document and use as the basis for tab placement.
    string anchorString?;
    # Metadata about a property.
    PropertyMetadata anchorStringMetadata?;
    # Reserved for DocuSign.
    string anchorTabProcessorVersion?;
    # Metadata about a property.
    PropertyMetadata anchorTabProcessorVersionMetadata?;
    # Specifies units of the `anchorXOffset` and `anchorYOffset`. Valid units are:
    # 
    # - `pixels` (default)
    # - `inches`
    # - `mms`
    # - `cms`
    string anchorUnits?;
    # Metadata about a property.
    PropertyMetadata anchorUnitsMetadata?;
    # Specifies the X axis location of the tab in `anchorUnits` relative to the `anchorString`.
    string anchorXOffset?;
    # Metadata about a property.
    PropertyMetadata anchorXOffsetMetadata?;
    # Specifies the Y axis location of the tab in `anchorUnits` relative to the `anchorString`.
    string anchorYOffset?;
    # Metadata about a property.
    PropertyMetadata anchorYOffsetMetadata?;
    # 
    string caption?;
    # Metadata about a property.
    PropertyMetadata captionMetadata?;
    # For conditional fields this is the `tabLabel` of the parent tab that controls this tab's visibility.
    string conditionalParentLabel?;
    # Metadata about a property.
    PropertyMetadata conditionalParentLabelMetadata?;
    # For conditional fields, this is the value of the parent tab that controls the tab's visibility.
    # 
    # If the parent tab is a Checkbox, Radio button, Optional Signature, or Optional Initial use "on" as the value to show that the parent tab is active.
    string conditionalParentValue?;
    # Metadata about a property.
    PropertyMetadata conditionalParentValueMetadata?;
    # The DocuSign generated custom tab ID for the custom tab to be applied. This can only be used when adding new tabs for a recipient. When used, the new tab inherits all the custom tab properties.
    string customTabId?;
    # Metadata about a property.
    PropertyMetadata customTabIdMetadata?;
    # Specifies the document ID number that the tab is placed on. This must refer to an existing Document's ID attribute.
    string documentId?;
    # Metadata about a property.
    PropertyMetadata documentIdMetadata?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # An integer specifying the order in which the guided form HTML should render. The order is relative to the `formPageLabel`, the group by which to place the guided form HTML block.
    string formOrder?;
    # Metadata about a property.
    PropertyMetadata formOrderMetadata?;
    # A string specifying the group in which to place the guided form HTML. Each group displays as a separate guided forms page in the signing experience.
    string formPageLabel?;
    # Metadata about a property.
    PropertyMetadata formPageLabelMetadata?;
    # An integer specifying the order in which to present the guided form pages.
    string formPageNumber?;
    # Metadata about a property.
    PropertyMetadata formPageNumberMetadata?;
    # The height of the tab in pixels.
    # Must be an integer.
    string height?;
    # Metadata about a property.
    PropertyMetadata heightMetadata?;
    # Contains information for transferring values between Salesforce data fields and DocuSign tabs.
    MergeField mergeField?;
    # Reserved for DocuSign.
    string mergeFieldXml?;
    # 
    string name?;
    # Metadata about a property.
    PropertyMetadata nameMetadata?;
    # Specifies the page number on which the tab is located.
    string pageNumber?;
    # Metadata about a property.
    PropertyMetadata pageNumberMetadata?;
    # The ID of the recipient to whom the tab will be assigned. This value should match the `recipientId` defined in the recipient object.
    string recipientId?;
    # The globally-unique identifier (GUID) for a specific recipient on a specific envelope. If the same recipient is associated with multiple envelopes, they will have a different GUID for each one. This property is read-only.
    string recipientIdGuid?;
    # Metadata about a property.
    PropertyMetadata recipientIdGuidMetadata?;
    # Metadata about a property.
    PropertyMetadata recipientIdMetadata?;
    # Sets the size of the tab. This field accepts values from `0.5` to `1.0`, where `1.0` represents full size and `0.5` is 50% of full size.
    string scaleValue?;
    # Metadata about a property.
    PropertyMetadata scaleValueMetadata?;
    # 
    SmartContractInformation smartContractInformation?;
    # Reserved for DocuSign.
    string 'source?;
    # Indicates the envelope status. Valid values are:
    # 
    # * sent - The envelope is sent to the recipients. 
    # * created - The envelope is saved as a draft and can be modified and sent later.
    string status?;
    # Metadata about a property.
    PropertyMetadata statusMetadata?;
    # An array of tab groups that this tab belongs to. Tab groups are identified by their `groupLabel` property.
    # 
    # To associate this tab with a tab group, add the tab group's `groupLabel` to this array.
    string[] tabGroupLabels?;
    # Metadata about a property.
    PropertyMetadata tabGroupLabelsMetadata?;
    # The unique identifier for the tab.
    string tabId?;
    # Metadata about a property.
    PropertyMetadata tabIdMetadata?;
    # The label associated with the tab. This value may be an empty string.
    # If no value is provided, the tab type is used as the value.
    # 
    # Maximum Length: 500 characters.
    string tabLabel?;
    # Metadata about a property.
    PropertyMetadata tabLabelMetadata?;
    # A positive integer that sets the order the tab is navigated to during signing.
    # 
    # Tabs on a page are navigated to in ascending order, starting with the lowest number and moving to the highest. If two or more tabs have the same `tabOrder` value, the normal auto-navigation setting behavior for the envelope is used.
    string tabOrder?;
    # Metadata about a property.
    PropertyMetadata tabOrderMetadata?;
    # Indicates the type of tab (for example, `signHere` or `initialHere`).
    string tabType?;
    # Metadata about a property.
    PropertyMetadata tabTypeMetadata?;
    # When **true,** the sender cannot change any attributes of the recipient. Used only when working with template recipients. 
    string templateLocked?;
    # Metadata about a property.
    PropertyMetadata templateLockedMetadata?;
    # When **true,** the sender may not remove the recipient. Used only when working with template recipients.
    string templateRequired?;
    # Metadata about a property.
    PropertyMetadata templateRequiredMetadata?;
    # The text of a tooltip that appears when a user hovers over a form field or tab.
    string tooltip?;
    # Metadata about a property.
    PropertyMetadata toolTipMetadata?;
    # The width of the tab in pixels.
    # Must be an integer.
    string width?;
    # Metadata about a property.
    PropertyMetadata widthMetadata?;
    # This property indicates the horizontal offset of the object on the page.
    # DocuSign uses 72 DPI when determining position.
    # Required. Must be an integer. May be zero.
    string xPosition?;
    # Metadata about a property.
    PropertyMetadata xPositionMetadata?;
    # This property indicates the vertical offset of the object on the page.
    # DocuSign uses 72 DPI when determining position.
    # Required. Must be an integer. May be zero.
    string yPosition?;
    # Metadata about a property.
    PropertyMetadata yPositionMetadata?;
};

# Contains details about the password rules for an account.
public type AccountPasswordRules record {
    # When **true,** passwords expire. The default value is `false`.
    string expirePassword?;
    # The number of days before passwords expire. To use this property, the `expirePassword` property must be set to **true.**
    string expirePasswordDays?;
    # 
    AccountPasswordExpirePasswordDays expirePasswordDaysMetadata?;
    # The number of minutes a user is locked out of the system after three failed login attempts. The default value is `2`.
    string lockoutDurationMinutes?;
    # 
    AccountPasswordLockoutDurationMinutes lockoutDurationMinutesMetadata?;
    # The interval associated with the user lockout after a failed login attempt.
    # 
    # Possible values are:
    # 
    # - `minutes` (default)
    # - `hours`
    # - `days`
    string lockoutDurationType?;
    # 
    AccountPasswordLockoutDurationType lockoutDurationTypeMetadata?;
    # The minimum number of days after a password is set before it can be changed. This value can be `0` or more days. The default value is `0`.
    string minimumPasswordAgeDays?;
    # 
    AccountPasswordMinimumPasswordAgeDays minimumPasswordAgeDaysMetadata?;
    # The minimum number of characters in the password. This value must be a number between `6` and `15`. The default value is `6`.
    string minimumPasswordLength?;
    # 
    AccountMinimumPasswordLength minimumPasswordLengthMetadata?;
    # When **true,** passwords must include a digit. The default value is `false`.
    string passwordIncludeDigit?;
    # When **true,** passwords must include either a digit or a special character. The default value is `false`.
    # 
    # **Note:** Passwords cannot include angle brackets (`<` `>`) or spaces.
    string passwordIncludeDigitOrSpecialCharacter?;
    # When **true,** passwords must include a lowercase letter. The default value is `false`.
    string passwordIncludeLowerCase?;
    # When **true,** passwords must include a special character. The default value is `false`.
    # 
    # **Note:** Passwords cannot include angle brackets (`<` `>`) or spaces.
    string passwordIncludeSpecialCharacter?;
    # When **true,** passwords must include an uppercase letter. The default value is `false`.
    string passwordIncludeUpperCase?;
    # The type of password strength. Possible values are:
    # 
    # - `basic`: The minimum password length is 6 characters with no other password requirements.
    # - `medium`: The minimum password length is 7 characters. Passwords must also have one uppercase letter, one lowercase letter, and one number or special character.
    # - `strong`: The minimum password length is 9 characters. Passwords must also have one uppercase letter, one lowercase letter, one number, and one special character.
    # - `custom`: This option enables you to customize password requirements, including the following properties:
    # 
    #    - `minimumPasswordLength`
    #    - `minimumPasswordAgeDays`
    #    - `passwordIncludeDigit`
    #    - `passwordIncludeDigitOrSpecialCharacter`
    #    - `passwordIncludeLowerCase`
    #    - `passwordIncludeSpecialCharacter`
    #    - `passwordIncludeUpperCase`
    #    - `questionsRequired`
    string passwordStrengthType?;
    # 
    AccountPasswordStrengthType passwordStrengthTypeMetadata?;
    # The number of security questions required to confirm the user’s identity before the user can reset their password. The default value is `0`.
    string questionsRequired?;
    # Information about the number of password questions required (0 to 4) to confirm a user's identity when a user needs to reset their password.
    AccountPasswordQuestionsRequired questionsRequiredMetadata?;
};

# A tab that allows the recipient to approve documents
# without placing a signature or initials on the
# document.
public type Approve record {
    # When **true,** the text string in the document may have extra whitespace and still match the anchor string. This occurs in two cases.
    # 
    # First, it matches if the document string has a single extra whitespace character following a non-whitespace character in the anchor string. For example, if the anchor string is `DocuSign`, then `Docu Sign` will match. However, <code>Docu&nbsp;&nbsp;&nbsp;Sign</code> will not match.
    # 
    # Second, it matches if the document string has one or more extra whitespace characters following a whitespace character in the anchor string. For example, if the anchor string is `Docu Sign`, then <code>Docu&nbsp;&nbsp;&nbsp;Sign</code> will match.
    # 
    # The default value is **true.**
    string anchorAllowWhiteSpaceInCharacters?;
    # Metadata about a property.
    PropertyMetadata anchorAllowWhiteSpaceInCharactersMetadata?;
    # This property controls how [anchor tabs][AnchorTabs] are placed. When **true,** the text string in a document must match the case of the `anchorString` property for an anchor tab to be created. The default value is **false.**
    # 
    # For example, when set to **true,** if the anchor string is `DocuSign`, then `DocuSign` will match but `Docusign`, `docusign`, `DoCuSiGn`, etc. will not match. When **false,** `DocuSign`, `Docusign`, `docusign`, `DoCuSiGn`, etc. will all match.
    # 
    # This functionality uses the following rules:
    # 
    # - Unless punctuation is specified in the `anchorString`, this functionality ignores punctuation and the following characters:
    # 
    #   $~><|^+=
    # 
    #   For example, the `anchorString` `water` will match on the string `Fetch a pail of water.`
    # 
    # - Strings embedded in other strings are ignored during the matching process.
    # 
    # - In words that have dashes, the parts separated by dashes are treated as distinct words.
    # 
    #   Example: If the anchor string is `forget`, then an anchor tab is placed on the `forget` in `forget-me-not`, even when `anchorMatchWholeWord` is set to **true.**
    # 
    # - Letters with accent marks are treated as distinct characters from their unaccented counterparts.
    # 
    # - For single-character anchor strings, if the two characters appear right next to each other in the document, a single anchor tab is placed for both of them.
    # 
    #   Example: If the anchor string is `i`, then only one anchor tab is placed in `skiing`.
    # 
    # - Unlike punctuation, numbers are not ignored when finding anchor words.
    # 
    #   Example: If the anchor string is `cat`, then `-cat-` is matched but `1cat2` is not when `anchorMatchWholeWord` is set to **true** (its default value).
    # 
    # **Note:** You can only specify the value of this property in POST requests.
    # 
    # [AnchorTabs]: /docs/esign-rest-api/esign101/concepts/tabs/auto-place/
    string anchorCaseSensitive?;
    # Metadata about a property.
    PropertyMetadata anchorCaseSensitiveMetadata?;
    # This property controls how [anchor tabs][AnchorTabs] are aligned in relation to the anchor text. Possible values are :
    # 
    # - `left`: Aligns the left side of the tab with the beginning of the first character of the matching anchor word. This is the default value.
    # - `right`: Aligns the tab’s left side with the last character of the matching anchor word.
    # 
    # **Note:** You can only specify the value of this property in POST requests.
    # 
    # [AnchorTabs]: /docs/esign-rest-api/esign101/concepts/tabs/auto-place/
    string anchorHorizontalAlignment?;
    # Metadata about a property.
    PropertyMetadata anchorHorizontalAlignmentMetadata?;
    # When **true,** this tab is ignored if the `anchorString` is not found in the document.
    string anchorIgnoreIfNotPresent?;
    # Metadata about a property.
    PropertyMetadata anchorIgnoreIfNotPresentMetadata?;
    # When **true,** the text string in a document must match the value of the `anchorString` property in its entirety for an [anchor tab][AnchorTab] to be created. The default value is **false.**
    # 
    # For example, when set to **true,** if the input is `man` then `man` will match but `manpower`, `fireman`, and `penmanship` will not. When **false,** if the input is `man` then `man`, `manpower`, `fireman`, and `penmanship` will all match.
    # 
    # This functionality uses the following rules:
    # 
    # - Unless punctuation is specified in the `anchorString`, this functionality ignores punctuation and the following characters:
    # 
    #   $~><|^+=
    # 
    #   For example, the `anchorString` `water` will match on the string `Fetch a pail of water.`
    # 
    # - Strings embedded in other strings are ignored during the matching process.
    # 
    # - In words that have dashes, the parts separated by dashes are treated as distinct words.
    # 
    #   Example: If the anchor string is `forget`, then an anchor tab is placed on the `forget` in `forget-me-not`, even when `anchorMatchWholeWord` is set to **true.**
    # 
    # - Letters with accent marks are treated as distinct characters from their unaccented counterparts.
    # 
    # - For single-character anchor strings, if the two characters appear right next to each other in the document, a single anchor tab is placed for both of them.
    # 
    #   Example: If the anchor string is `i`, then only one anchor tab is placed in `skiing`.
    # 
    # - Unlike punctuation, numbers are not ignored when finding anchor words.
    # 
    #   Example: If the anchor string is `cat`, then `-cat-` is matched but `1cat2` is not when `anchorMatchWholeWord` is set to **true** (its default value).
    # 
    # 
    # **Note:** You can only specify the value of this property in POST requests.
    # 
    # [AnchorTab]: /docs/esign-rest-api/esign101/concepts/tabs/auto-place/
    string anchorMatchWholeWord?;
    # Metadata about a property.
    PropertyMetadata anchorMatchWholeWordMetadata?;
    # Specifies the string to find in the document and use as the basis for tab placement.
    string anchorString?;
    # Metadata about a property.
    PropertyMetadata anchorStringMetadata?;
    # Reserved for DocuSign.
    string anchorTabProcessorVersion?;
    # Metadata about a property.
    PropertyMetadata anchorTabProcessorVersionMetadata?;
    # Specifies units of the `anchorXOffset` and `anchorYOffset`. Valid units are:
    # 
    # - `pixels` (default)
    # - `inches`
    # - `mms`
    # - `cms`
    string anchorUnits?;
    # Metadata about a property.
    PropertyMetadata anchorUnitsMetadata?;
    # Specifies the X axis location of the tab in `anchorUnits` relative to the `anchorString`.
    string anchorXOffset?;
    # Metadata about a property.
    PropertyMetadata anchorXOffsetMetadata?;
    # Specifies the Y axis location of the tab in `anchorUnits` relative to the `anchorString`.
    string anchorYOffset?;
    # Metadata about a property.
    PropertyMetadata anchorYOffsetMetadata?;
    # When **true,** the information in the tab is bold.
    string bold?;
    # Metadata about a property.
    PropertyMetadata boldMetadata?;
    #  Specifies the approval text that displays in the tab. 
    string buttonText?;
    # Metadata about a property.
    PropertyMetadata buttonTextMetadata?;
    # 
    string caption?;
    # Metadata about a property.
    PropertyMetadata captionMetadata?;
    # For conditional fields this is the `tabLabel` of the parent tab that controls this tab's visibility.
    string conditionalParentLabel?;
    # Metadata about a property.
    PropertyMetadata conditionalParentLabelMetadata?;
    # For conditional fields, this is the value of the parent tab that controls the tab's visibility.
    # 
    # If the parent tab is a Checkbox, Radio button, Optional Signature, or Optional Initial use "on" as the value to show that the parent tab is active.
    string conditionalParentValue?;
    # Metadata about a property.
    PropertyMetadata conditionalParentValueMetadata?;
    # The DocuSign-generated custom tab ID for the custom tab to be applied. You can only use this when adding new tabs for a recipient. When used, the new tab inherits all of the properties of the custom tab.
    string customTabId?;
    # Metadata about a property.
    PropertyMetadata customTabIdMetadata?;
    # Specifies the document ID number that the tab is placed on. This must refer to an existing Document's ID attribute.
    string documentId?;
    # Metadata about a property.
    PropertyMetadata documentIdMetadata?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The font to be used for the tab value. Supported fonts include:
    # 
    # - Default
    # - Arial
    # - ArialNarrow
    # - Calibri
    # - CourierNew
    # - Garamond
    # - Georgia
    # - Helvetica
    # - LucidaConsole
    # - MSGothic
    # - MSMincho
    # - OCR-A
    # - Tahoma
    # - TimesNewRoman
    # - Trebuchet
    # - Verdana
    string font?;
    # The font color to use for the information in the tab. Possible values are: 
    # 
    # - Black
    # - BrightBlue
    # - BrightRed
    # - DarkGreen
    # - DarkRed
    # - Gold
    # - Green
    # - NavyBlue
    # - Purple
    # - White
    string fontColor?;
    # Metadata about a property.
    PropertyMetadata fontColorMetadata?;
    # Metadata about a property.
    PropertyMetadata fontMetadata?;
    # The font size used for the information in the tab. Possible values are:
    # 
    # - Size7
    # - Size8
    # - Size9
    # - Size10
    # - Size11
    # - Size12
    # - Size14
    # - Size16
    # - Size18
    # - Size20
    # - Size22
    # - Size24
    # - Size26
    # - Size28
    # - Size36
    # - Size48
    # - Size72
    string fontSize?;
    # Metadata about a property.
    PropertyMetadata fontSizeMetadata?;
    # An integer specifying the order in which the guided form HTML should render. The order is relative to the `formPageLabel`, the group by which to place the guided form HTML block.
    string formOrder?;
    # Metadata about a property.
    PropertyMetadata formOrderMetadata?;
    # A string specifying the group in which to place the guided form HTML. Each group displays as a separate guided forms page in the signing experience.
    string formPageLabel?;
    # Metadata about a property.
    PropertyMetadata formPageLabelMetadata?;
    # An integer specifying the order in which to present the guided form pages.
    string formPageNumber?;
    # Metadata about a property.
    PropertyMetadata formPageNumberMetadata?;
    # The height of the tab in pixels.
    # Must be an integer.
    string height?;
    # Metadata about a property.
    PropertyMetadata heightMetadata?;
    # When **true,** the information in the tab is italic.
    string italic?;
    # Metadata about a property.
    PropertyMetadata italicMetadata?;
    # Allows you to customize locale settings.
    LocalePolicyTab localePolicy?;
    # Contains information for transferring values between Salesforce data fields and DocuSign tabs.
    MergeField mergeField?;
    # Reserved for DocuSign.
    string mergeFieldXml?;
    # Specifies the page number on which the tab is located. For supplemental documents, this value must be `1`.
    string pageNumber?;
    # Metadata about a property.
    PropertyMetadata pageNumberMetadata?;
    # The ID of the recipient to whom the tab will be assigned. This value should match the `recipientId` defined in the recipient object.
    string recipientId?;
    # The globally-unique identifier (GUID) for a specific recipient on a specific envelope. If the same recipient is associated with multiple envelopes, they will have a different GUID for each one. This property is read-only.
    string recipientIdGuid?;
    # Metadata about a property.
    PropertyMetadata recipientIdGuidMetadata?;
    # Metadata about a property.
    PropertyMetadata recipientIdMetadata?;
    # 
    SmartContractInformation smartContractInformation?;
    # Reserved for DocuSign.
    string 'source?;
    # The status of the tab. Possible values are:
    # 
    # - `active`: The tab is active, but the recipient has not yet interacted with it.
    # - `signed`: The recipient signed the tab.
    # - `declined`: The recipient declined the envelope.
    # - `na`: Used when the `status` property is not applicable to the tab type. (For example, a tab that has the `tabType` `SignerAttachmentOptional`).
    string status?;
    # Metadata about a property.
    PropertyMetadata statusMetadata?;
    # An array of tab groups that this tab belongs to. Tab groups are identified by their `groupLabel` property.
    # 
    # To associate this tab with a tab group, add the tab group's `groupLabel` to this array.
    string[] tabGroupLabels?;
    # Metadata about a property.
    PropertyMetadata tabGroupLabelsMetadata?;
    # The unique identifier for the tab.
    string tabId?;
    # Metadata about a property.
    PropertyMetadata tabIdMetadata?;
    # The label associated with the tab. This value may be an empty string.
    # If no value is provided, the tab type is used as the value.
    # 
    # Maximum Length: 500 characters.
    string tabLabel?;
    # Metadata about a property.
    PropertyMetadata tabLabelMetadata?;
    # A positive integer that sets the order the tab is navigated to during signing.
    # 
    # Tabs on a page are navigated to in ascending order, starting with the lowest number and moving to the highest. If two or more tabs have the same `tabOrder` value, the normal auto-navigation setting behavior for the envelope is used.
    string tabOrder?;
    # Metadata about a property.
    PropertyMetadata tabOrderMetadata?;
    # Indicates the type of tab (for example, `signHere` or `initialHere`).
    string tabType?;
    # Metadata about a property.
    PropertyMetadata tabTypeMetadata?;
    # When **true,** the sender cannot change any attributes of the recipient. Used only when working with template recipients. 
    string templateLocked?;
    # Metadata about a property.
    PropertyMetadata templateLockedMetadata?;
    # When **true,** the sender may not remove the recipient. Used only when working with template recipients.
    string templateRequired?;
    # Metadata about a property.
    PropertyMetadata templateRequiredMetadata?;
    # **Note:** Approve tabs never display this tooltip in the signing interface.
    # 
    # Although you can technically set a value via the API for this tab,
    # it will not be displayed to the recipient.
    string tooltip?;
    # Metadata about a property.
    PropertyMetadata toolTipMetadata?;
    # When **true,** the information in the tab is underlined.
    string underline?;
    # Metadata about a property.
    PropertyMetadata underlineMetadata?;
    # The width of the tab in pixels.
    # Must be an integer.
    string width?;
    # Metadata about a property.
    PropertyMetadata widthMetadata?;
    # This property indicates the horizontal offset of the object on the page.
    # DocuSign uses 72 DPI when determining position.
    # Required. Must be an integer. May be zero.
    # 
    # To improve the tab's position on the document,
    # DocuSign recommends
    # adjusting `xPosition`
    # and `yPosition`
    # coordinates
    # by (-3, -2)
    string xPosition?;
    # Metadata about a property.
    PropertyMetadata xPositionMetadata?;
    # This property indicates the vertical offset of the object on the page.
    # DocuSign uses 72 DPI when determining position.
    # Required. Must be an integer. May be zero.
    # 
    # To improve the tab's position on the document,
    # DocuSign recommends
    # adjusting `xPosition`
    # and `yPosition`
    # coordinates
    # by (-3, -2)
    string yPosition?;
    # Metadata about a property.
    PropertyMetadata yPositionMetadata?;
};

# 
public type CommentHistoryResult record {
    # An array of comment tabs that contain information about users' comments on documents.
    Comment[] comments?;
    # The maximum number of results to return.
    int:Signed32 count?;
    # 
    string endTimetoken?;
    # 
    string startTimetoken?;
};

# This object is used to match a DocuSign field to a Salesforce field so that DocuSign can send information to your Salesforce account.
public type ConnectSalesforceField record {
    # 
    string dsAttribute?;
    # A URL that links to the information in the DocuSign field.
    string dsLink?;
    # 
    string dsNode?;
    # A unique ID for the Salesforce object.
    string id?;
    # 
    string sfField?;
    # The name of the Salesforce field.
    string sfFieldName?;
    # The name of the Salesforce folder.
    string sfFolder?;
    # 
    string sfLockedValue?;
};

# 
public type EnvelopeHtmlDefinitions record {
    # Holds the properties that define how to generate the responsive-formatted HTML for the document.
    DocumentHtmlDefinitionOriginal[] htmlDefinitions?;
};

# Identity Verification enables you to verify a signer's identity before they can access a document. The `IdentityVerifications` resource provides a method that enables you to list the workflows that are available to an account.
public type IdentityVerifications record {
    # Specifies the ID Verification workflow applied on an envelope by workflow ID. <br/>See the [list](/docs/esign-rest-api/reference/accounts/identityverifications/list/) method in the [IdentityVerifications](/docs/esign-rest-api/reference/accounts/identityverifications/) resource for more information on how to retrieve workflow IDs available for an account. <br/>This can be used in addition to other [recipient authentication](https://support.docusign.com/s/document-item?bundleId=gav1643676262430&topicId=kzp1578456318101.html) methods. <br/>Note that ID Verification and ID Check are two distinct methods. ID Verification checks recipients' identity by verifying their ID while ID Check relies on data available on public records (such as current and former address).
    AccountIdentityVerificationWorkflow[] identityVerification?;
};

# Defines an billing payment response object.
public type BillingPaymentResponse record {
    # Reserved for DocuSign.
    BillingPayment[] billingPayments?;
};

# This resource is used to create a responsive preview of a specific document.
public type DocumentResponsiveHtmlPreview record {
    # Holds the properties that define how to generate the responsive-formatted HTML for the document.
    string[] htmlDefinitions?;
};

# 
public type AskAnAdmin record {
    # 
    string email?;
    # 
    string message?;
    # 
    string name?;
    # 
    string phone?;
};

# Information about shared items.
public type MemberSharedItems record {
    # List of information about shared envelopes.
    SharedItem[] envelopes?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # List of information about shared folders.
    FolderSharedItem[] folders?;
    # List of information about shared templates.
    TemplateSharedItem[] templates?;
    # 
    UserInfo user?;
};

# 
public type FormDataItem record {
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The selected value in a list.
    string listSelectedValue?;
    # The name of the form field.
    string name?;
    # 
    string numericalValue?;
    # 
    string originalNumericalValue?;
    # The initial value associated with the form field.
    string originalValue?;
    # The current value associated with the form field.
    string value?;
};

# This object contains information about a [composite template][composite], which you can use to to apply multiple templates to a single envelope, combine templates with PDF forms, and combine templates with documents from cloud sources.
# 
# [composite]: /docs/esign-rest-api/esign101/concepts/templates/composite/
public type CompositeTemplate record {
    # The ID of this composite template. This ID is used as a reference when adding document object information. If used, the document's `content-disposition` must include the composite template ID to which the document should be added. If a composite template ID is not specified in the content-disposition, the document is applied based on the value of the `documentId` property only. If no document object is specified, the composite template inherits the first document.
    string compositeTemplateId?;
    # A document object.
    Document document?;
    #  Zero or more inline templates and their position in the overlay. If supplied, they are overlaid into the envelope in the order of their Sequence value.
    InlineTemplate[] inlineTemplates?;
    # A number representing the sequence in which to apply the template that contains the PDF metadata.
    # 
    # Example: `4`
    string pdfMetaDataTemplateSequence?;
    # Zero or more server-side templates and their position in the overlay. If supplied, they are overlaid into the envelope in the order of their Sequence value.
    ServerTemplate[] serverTemplates?;
};

# Contains account Information.
public type AccountInformation record {
    # The GUID associated with the account ID.
    string accountIdGuid?;
    # The name of the current account.
    string accountName?;
    # Contains account settings information. Used in requests to set property values. Used in responses to report property values.
    AccountSettingsInformation accountSettings?;
    # When **true,** the transaction rooms feature exposed through the Workspaces API is enabled.
    string allowTransactionRooms?;
    # Number of days remaining in the current billing period.
    string billingPeriodDaysRemaining?;
    # The billing period end date in UTC timedate format.
    string billingPeriodEndDate?;
    # The number of envelopes that can be sent in the current billing period (can be unlimited).
    string billingPeriodEnvelopesAllowed?;
    # The number of envelopes that have been sent in the current billing period.
    string billingPeriodEnvelopesSent?;
    # The billing period start date in UTC timedate format.
    string billingPeriodStartDate?;
    # Reserved for DocuSign.
    string billingProfile?;
    # The AccountBrands resource enables you to use account-level brands to customize the styles and text that recipients see.
    AccountBrands brands?;
    # When **true,** specifies that you can upgrade the account through the API. For GET methods, you must set the `include_metadata` query parameter to **true** for this property to appear in the response.
    string canUpgrade?;
    # 
    string connectPermission?;
    # The creation date of the account in UTC timedate format.
    string createdDate?;
    # Specifies the [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code for the account.
    string currencyCode?;
    # ID of the plan used to create this account.
    string currentPlanId?;
    # 
    string displayApplianceStartUrl?;
    # 
    string displayApplianceUrl?;
    # The code that identifies the billing plan groups and plans for the new account.
    string distributorCode?;
    # URL of the landing page used to create the account.
    string docuSignLandingUrl?;
    # 
    record {|string...;|} dssValues?;
    # When **true,** the ability to send envelopes is blocked. When **false,** envelopes can be sent.
    string envelopeSendingBlocked?;
    # The price of sending an envelope, represented in the account's local currency.
    string envelopeUnitPrice?;
    # The Account ID displayed on the user's Account page.
    string externalAccountId?;
    #  A complex element that contains up to four Question/Answer pairs for forgotten password information for a user.
    string forgottenPasswordQuestionsCount?;
    # When **true,** the account has been downgraded from a premium account type. Otherwise **false.**
    string isDowngrade?;
    # The payment method used for the billing plan. Valid values are:
    # 
    # - `NotSupported`
    # - `CreditCard`
    # - `PurchaseOrder`
    # - `Premium`
    # - `Freemium`
    # - `FreeTrial`
    # - `AppStore`
    # - `DigitalExternal`
    # - `DirectDebit`
    string paymentMethod?;
    # Identifies the type of plan. Examples include:
    # 
    # - `business`
    # - `corporate`
    # - `enterprise` 
    # - `free`
    string planClassification?;
    # The date that the current plan will end.
    string planEndDate?;
    # The name of the Billing Plan.
    string planName?;
    # The date that the Account started using the current plan.
    string planStartDate?;
    # 
    RecipientDomain[] recipientDomains?;
    # The number of active users the account can have at one time.
    string seatsAllowed?;
    # The number of users currently active on the account.
    string seatsInUse?;
    # The status of the account content per (Title 21 CFR Part 11)[https://www.fda.gov/regulatory-information/search-fda-guidance-documents/part-11-electronic-records-electronic-signatures-scope-and-application]. This regulation defines the criteria under which electronic records and electronic signatures are considered trustworthy.
    string status21CFRPart11?;
    # The date on which the account was suspended.
    string suspensionDate?;
    # Indicates whether the account is currently suspended.
    string suspensionStatus?;
    # 
    boolean useDisplayAppliance?;
};

# 
public type BulkProcessingListSummaries record {
    # An array of `bulkSendingListSummary` objects where each summary provides basic information about a bulk send list that belongs to the current user.
    BulkProcessingListSummary[] bulkListSummaries?;
};

# A template custom field enables you to prepopulate custom metadata for all new envelopes that are created by using a specific template. You can then use the custom data for sorting, organizing, searching, and other downstream processes.
public type TemplateCustomFields record {
    # An array of list custom fields.
    ListCustomField[] listCustomFields?;
    # An array of text custom fields.
    TextCustomField[] textCustomFields?;
};

# This object's properties describe the contents of a workspace folder.
public type WorkspaceFolderContents record {
    # The last index position in the result set. 
    string endPosition?;
    # This object represents an item in a workspace, which can be either a file or folder.
    WorkspaceItem folder?;
    # A list of workspace items.
    WorkspaceItem[] items?;
    # 
    WorkspaceItem[] parentFolders?;
    # The number of results in this response. Because you can filter which entries are included in the response, this value is always less than or equal to the `totalSetSize`.
    string resultSetSize?;
    # The starting index position of the current result set.
    string startPosition?;
    # The total number of items in the result set. This value is always greater than or equal to the value of `resultSetSize`.
    string totalSetSize?;
    # The ID of the workspace, always populated.
    string workspaceId?;
};

# One of the selectable items
# in the `listItems` property
# of a [`list`](/docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/create/) tab.
public type ListItem record {
    # When **true,** indicates that this item is the default selection shown to a signer. 
    # 
    # Only one selection can be set as the default.
    string selected?;
    # Metadata about a property.
    PropertyMetadata selectedMetadata?;
    # Specifies the text that is shown in the dropdown list. 
    string text?;
    # Metadata about a property.
    PropertyMetadata textMetadata?;
    # Specifies the value that is used when the list item is selected.
    string value?;
    # Metadata about a property.
    PropertyMetadata valueMetadata?;
};

# 
public type SmartSectionAnchorPosition record {
    # Specifies the page number on which the tab is located.
    int:Signed32 pageNumber?;
    # This property indicates the horizontal offset of the object on the page.
    # DocuSign uses 72 DPI when determining position.
    # Required. Must be an integer. May be zero.
    decimal xPosition?;
    # This property indicates the vertical offset of the object on the page.
    # DocuSign uses 72 DPI when determining position.
    # Required. Must be an integer. May be zero.
    decimal yPosition?;
};

# 
public type UserAuthorizations record {
    # 
    UserAuthorization[] authorizations?;
    # The last index position in the result set. 
    string endPosition?;
    # The URI for the next chunk of records based on the search request. It is `null` if this is the last set of results for the search. 
    string nextUri?;
    # The URI for the prior chunk of records based on the search request. It is `null` if this is the first set of results for the search. 
    string previousUri?;
    # The number of results in this response. Because you can filter which entries are included in the response, this value is always less than or equal to the `totalSetSize`.
    string resultSetSize?;
    # The starting index position of the current result set.
    string startPosition?;
    # The total number of items in the result set. This value is always greater than or equal to the value of `resultSetSize`.
    string totalSetSize?;
};

# Template tabs
public type TemplateRecipientTabs record {
    # A list of
    # [Approve tabs][approve].
    # 
    # An Approve tab enables
    # the recipient to approve documents without
    # placing a signature or initials on the document. If the
    # recipient clicks the tab during the signing process, the
    # recipient is considered to have signed the document. No
    # information is shown on the document of the approval, but it
    # is recorded as a signature in the envelope history.
    # The value of an approve tab can't be set.
    # 
    # [approve]:          /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    Approve[] approveTabs?;
    # A list of
    # [Checkbox tabs][checkbox].
    # 
    # 
    # A Checkbox tab enables the recipient to select a yes/no (on/off) option. This value can be set.
    # 
    # 
    # [checkbox]:  /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    Checkbox[] checkboxTabs?;
    # An array of tabs that represents a collection of comments in a comment thread. For example, if a recipient has questions about the content of a document, they can add a comment to the document and control who else can see the comment. This value can't be set.
    CommentThread[] commentThreadTabs?;
    # A list of
    # [Commission County tabs][cc].
    # 
    # 
    # A Commission County tab displays the county of a notary's commission. This tab can only be assigned to a remote notary recipient using [DocuSign Notary][notary]. The tab's value can be edited by the recipient.
    # 
    # 
    # [cc]:  /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    # [notary]: /docs/notary-api/
    CommissionCounty[] commissionCountyTabs?;
    # A list of
    # [Commission Expiration tabs][tabref].
    # 
    # 
    # A Commission Expiration tab displays the expiration date of a notary's commission. This tab can only be assigned to a remote notary recipient using [DocuSign Notary][notary]. The tab's value can be edited by the recipient.
    # 
    # 
    # [tabref]:  /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    # [notary]: /docs/notary-api/
    CommissionExpiration[] commissionExpirationTabs?;
    # A list of
    # [Commission Number tabs][tabref].
    # 
    # 
    # A Commission Number tab displays a notary's commission number. This tab can only be assigned to a remote notary recipient using [DocuSign Notary][notary]. The tab's value can be edited by the recipient.
    # 
    # 
    # [tabref]:  /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    # [notary]: /docs/notary-api/
    CommissionNumber[] commissionNumberTabs?;
    # A list of
    # [Commission State tabs][cc].
    # 
    # 
    # A Commission County tab displays the state in which a notary's commission was granted. This tab can only be assigned to a remote notary recipient using [DocuSign Notary][notary]. The tab's value can be edited by the recipient.
    # 
    # 
    # [cc]:  /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    # [notary]: /docs/notary-api/
    CommissionState[] commissionStateTabs?;
    # A list of
    # [Company tabs][company].
    # 
    # A Company tab displays a field for the name of the recipient's company. This value can't be set.
    # 
    # [company]: /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/create/#parameters_company
    Company[] companyTabs?;
    # A list of
    # [Date Signed tabs][dateSigned].
    # 
    # 
    # A Date Signed tab displays the date that the recipient signed the document. This value can't be set.
    # 
    # [dateSigned]: /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    DateSigned[] dateSignedTabs?;
    # A list of
    # [Date tabs][date].
    # 
    # A Date tab enables the recipient to enter a date. This value can't be set. The tooltip for this tab recommends the date format MM/DD/YYYY, but several other date formats are also accepted. The system retains the format that the recipient enters.
    # 
    # **Note:** If you need to enforce a specific date format, DocuSign recommends that you use a Text tab with a validation pattern and validation message.
    # 
    # 
    # [date]: /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    Date[] dateTabs?;
    # A list of
    # [Decline tabs][decline].
    # 
    # A Decline tab enables the recipient to decline the envelope. If the recipient clicks the tab during the signing process, the envelope is voided. The value of this tab can't be set.
    # 
    # 
    # [decline]: /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    Decline[] declineTabs?;
    # A list of Draw Tabs.
    # 
    # A Draw Tab allows the recipient to add a free-form drawing to the document.
    Draw[] drawTabs?;
    # A list of
    # [Email Address tabs][emailAddress].
    # 
    # An Email Address tab displays the recipient's email as entered in the recipient information. This value can't be set.
    # 
    # 
    # [emailAddress]: /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    EmailAddress[] emailAddressTabs?;
    # A list of
    # [Email tabs][email].
    # 
    # An Email tab enables the recipient to enter an email address.
    # This is a one-line field that checks that a valid email
    # address is entered. It uses the same parameters as a Text
    # tab, with the validation message and pattern set for email
    # information. This value can be set.
    # 
    # When getting information that includes
    # this tab type, the original value of the tab when the
    # associated envelope was sent is included in the response.
    # 
    # [email]: /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    Email[] emailTabs?;
    # A list of
    # [Envelope ID tabs][envelopeId].
    # 
    # An Envelope ID tab  displays the envelope ID. Recipients cannot enter or change the information in this tab. This value can't be set.
    # 
    # 
    # [envelopeId]: /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/create/#response201_envelopeid
    EnvelopeId[] envelopeIdTabs?;
    # A list of
    # [First Name tabs][firstName].
    # 
    # A First Name tab displays the recipient's first name. The system automatically populates this field by splitting the name in the recipient information on spaces. This value can't be set.
    # 
    # 
    # [firstName]: /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/create/#parameters_firstname
    FirstName[] firstNameTabs?;
    # A list of [Formula tabs][formulaTab].
    # 
    # The value of a Formula tab is calculated from the values of other number or date tabs in the document. When the recipient completes the underlying fields, the Formula tab calculates and displays the result. This value can be set.
    # 
    # The `formula` property of the tab contains the references to the underlying tabs. To learn more about formulas, see [Calculated Fields][calculatedfields].
    # 
    # If a Formula tab contains a `paymentDetails` property, the tab is considered a payment item. To learn more about payments, see [Requesting Payments Along with Signatures][paymentguide].
    # 
    # [calculatedfields]: https://support.docusign.com/s/document-item?bundleId=gbo1643332197980&topicId=crs1578456361259.html
    # [paymentguide]:     https://support.docusign.com/s/document-item?bundleId=juu1573854950452&topicId=fyw1573854935374.html
    # [formulaTab]:       /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    FormulaTab[] formulaTabs?;
    # A list of
    # [Full Name tabs][fullName].
    # 
    # A Full Name tab displays the recipient's full name. This value can't be set.
    # 
    # 
    # [fullName]: /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    FullName[] fullNameTabs?;
    # A list of
    # [Initial Here tabs][initialHere].
    # 
    # This type of tab enables the recipient to initial the document. May be optional. This value can't be set.
    # 
    # [initialHere]: /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    InitialHere[] initialHereTabs?;
    # A list of
    # [Last Name tabs][lastName].
    # 
    # A Last Name tab displays the recipient's last name. The system automatically populates this field by splitting the name in the recipient information on spaces. This value can't be set.
    # 
    # 
    # [lastName]: /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    LastName[] lastNameTabs?;
    # An array of List tabs.
    # 
    # A List tab enables the recipient to choose from a list of options. You specify the options in the `listItems` property. This value can't be set.
    # 
    # Find descriptions of all tab types in
    # the [EnvelopeRecipientTabs Resource][ert].
    # 
    # [ert]: /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    List[] listTabs?;
    # A list of  [Notarize tabs][notarize].
    # 
    # A Notarize tab alerts notary recipients that they must take action on the page. This value can be set.
    # 
    # **Note:** Only one notarize tab can appear on a page.
    # 
    # [notarize]: /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    Notarize[] notarizeTabs?;
    # A list of Notary Seal tabs.
    # 
    # A Notary Seal tab enables the recipient to notarize a document. This tab can only be assigned to a remote notary recipient using [DocuSign Notary][notary].
    # 
    # [notary]: /docs/notary-api/
    NotarySeal[] notarySealTabs?;
    # A list of
    # [Note tabs][note].
    # 
    # A Note tab displays additional information to the recipient in the form of a note. This value can be set.
    # 
    # [note]: /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    Note[] noteTabs?;
    # A list of Number tabs.
    # 
    # Number tabs validate that the entered value is a number.
    # They do not support advanced validation or display options.
    # 
    # To learn more about the different forms of number tabs,
    # see [Number fields](/docs/esign-rest-api/esign101/concepts/tabs/number-fields/) in the Concepts guide.
    # For specific information about number tabs
    # see [Features of numberTabs](/docs/esign-rest-api/esign101/concepts/tabs/number-fields/#features-of-numbertabs).
    # 
    # [number]: /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    Number[] numberTabs?;
    # A list of numerical tabs.
    # 
    # Numerical  tabs provide robust display and validation features, including formatting for different regions and currencies, and minimum and maximum value validation.                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    # 
    # To learn more about the different forms of number tabs,
    # see [Number fields](/docs/esign-rest-api/esign101/concepts/tabs/number-fields/) in the Concepts guide.
    # For specific information about numerical tabs
    # see [Features of numericalTabs](/docs/esign-rest-api/esign101/concepts/tabs/number-fields/#features-of-numericaltabs).
    Numerical[] numericalTabs?;
    # A list of
    # [Phone Number tabs][cc].
    # 
    # 
    # A Phone Number tab enables a recipient to enter a phone number.
    # 
    # **Note:** This tab can only be assigned to a remote notary recipient using [DocuSign Notary][notary].
    # 
    # [cc]:  /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    # [notary]: /docs/notary-api/
    PhoneNumber[] phoneNumberTabs?;
    # This type of tab enables the recipient to strike through document text. This value can't be set.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    PolyLineOverlay[] polyLineOverlayTabs?;
    # Prefill tabs are tabs
    # that the sender can fill in
    # before the envelope is sent.
    # They are sometimes called
    # sender tags or pre-fill fields.
    # 
    # Only the following tab types can be
    # prefill tabs:
    # 
    # - text
    # - check boxes
    # - radio buttons
    # 
    # 
    # 
    # [Pre-Fill Your Own Document Fields][app]
    # describes how prefill tabs
    # work in the web application.
    # 
    # 
    # [Customize your envelopes with pre-fill fields][catblog]
    # shows how to use prefill tabs
    # in your application using the eSignature
    # SDKs.
    # 
    # [app]:      https://support.docusign.com/s/document-item?bundleId=gbo1643332197980&topicId=nwo1611173513994.html
    # [catblog]:  https://www.docusign.com/blog/developers/common-api-tasks-customize-your-envelopes-pre-fill-fields
    PrefillTabs prefillTabs?;
    # A list of [Radio Group tabs][radioGroup].
    # 
    # A Radio Group tab places a group of radio buttons on a document. The `radios` property is used to add and place the radio
    # buttons associated with the group. Only one radio button can be selected in a group. This value can be set.
    # 
    # 
    # [radioGroup]: /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    RadioGroup[] radioGroupTabs?;
    # A list of
    # [Signer Attachment tabs][signerAttachment].
    # 
    # This type of tab enables the recipient to attach supporting documents to an envelope. This value can't be set.
    # 
    # 
    # [signerAttachment]: /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    SignerAttachment[] signerAttachmentTabs?;
    # A list of
    # [Sign Here tabs][signHere].
    # 
    # This type of tab enables the recipient to sign a document. May be optional. This value can't be set.
    # 
    # [signHere]: /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    SignHere[] signHereTabs?;
    # A list of [Smart Section](https://www.docusign.com/blog/dsdev-deep-dive-responsive-smart-sections) tabs.
    # 
    # Smart Section tabs enhance responsive signing on mobile devices by enabling collapsible sections, page breaks, custom formatting options, and other advanced functionality.
    # 
    # **Note:** Smart Sections are a premium feature. Responsive signing must also be enabled for your account.
    SmartSection[] smartSectionTabs?;
    # A list of
    # [SSN tabs][ssn].
    # 
    # An SSN tab contains a one-line field that enables the recipient to enter a Social Security Number (SSN) with or without
    # dashes. It uses the same parameters as a Text tab, with the validation message and pattern set for SSN information. This value can be set.
    # 
    # 
    # [ssn]: /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    Ssn[] ssnTabs?;
    # An array of `tabGroup` items.
    # 
    # To associate a tab with a tab group, add the tab group's `groupLabel` to the tab's `tabGroupLabels` array.
    TabGroup[] tabGroups?;
    # A list of
    # Text tabs.
    # 
    # A text tab enables the recipient to enter free text. This value can be set.
    # 
    # Find descriptions of all tab types in
    # the [EnvelopeRecipientTabs Resource][ert].
    # 
    # [ert]: /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    Text[] textTabs?;
    # A list of
    # [Title tabs][title].
    # 
    # A Title tab displays the recipient's title.  This value can't be set.
    # 
    # 
    # [title]: /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    Title[] titleTabs?;
    # A list of
    # [View tabs][view].
    # 
    # A View tab is used with an Approve tab to handle supplemental documents.  This value can be set.
    # 
    # [view]: /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    View[] viewTabs?;
    # A list of
    # [Zip tabs][zip].
    # 
    # A Zip tab enables the recipient to enter a ZIP code. The ZIP code can be five digits or nine digits ( in ZIP+4 format), and can be entered with or without dashes. It uses the same parameters as a Text tab, with the validation message and pattern set for ZIP code information.  This value can be set.
    # 
    # 
    # [zip]: /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    Zip[] zipTabs?;
};

# 
public type BillingInvoicesSummary record {
    # 
    string accountBalance?;
    # Reserved for DocuSign.
    BillingInvoice[] billingInvoices?;
    # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code.
    string currencyCode?;
    # 
    string pastDueBalance?;
    # 
    string paymentAllowed?;
};

# The request object to update a user authorization.
public type UserAuthorizationUpdateRequest record {
    # The end date for the user authorization. The default value is the max UTC value: `9999-12-31T23:59:59.0000000+00:00`.
    string endDate?;
    # The start date for the user authorization. The default value is the current date and time.
    string startDate?;
};

# A complex type that contains the following information for entering referral and discount information. The following items are included in the referral information (all string content): enableSupport, includedSeats, saleDiscountPercent, saleDiscountAmount, saleDiscountFixedAmount, saleDiscountPeriods, saleDiscountSeatPriceOverride, planStartMonth, referralCode, referrerName, advertisementId, publisherId, shopperId, promoCode, groupMemberId, idType, and industry
# 
# **Note:** saleDiscountPercent, saleDiscountAmount, saleDiscountFixedAmount, saleDiscountPeriods, and saleDiscountSeatPriceOverride are reserved for DocuSign use only.
public type ReferralInformation record {
    # A complex type that contains the following information for entering referral and discount information. The following items are included in the referral information (all string content): enableSupport, includedSeats, saleDiscountPercent, saleDiscountAmount, saleDiscountFixedAmount, saleDiscountPeriods, saleDiscountSeatPriceOverride, planStartMonth, referralCode, referrerName, advertisementId, publisherId, shopperId, promoCode, groupMemberId, idType, and industry.
    # 
    # **Note:** saleDiscountPercent, saleDiscountAmount, saleDiscountFixedAmount, saleDiscountPeriods, and saleDiscountSeatPriceOverride are reserved for DocuSign use only.
    string advertisementId?;
    # When **true,** customer support is provided as part of the account plan.
    string enableSupport?;
    # An optional external ID for the referral.
    string externalOrgId?;
    # 
    string groupMemberId?;
    # 
    string idType?;
    # The number of seats (users) included in the plan.
    string includedSeats?;
    # The name of the industry associated with the referral. 
    # 
    # Example: `Accounting`
    string industry?;
    # 
    string planStartMonth?;
    # 
    string promoCode?;
    # 
    string publisherId?;
    # 
    string referralCode?;
    # The name of the referrer.
    string referrerName?;
    # Reserved for DocuSign.
    string saleDiscountAmount?;
    # Reserved for DocuSign.
    string saleDiscountFixedAmount?;
    # Reserved for DocuSign.
    string saleDiscountPercent?;
    # Reserved for DocuSign.
    string saleDiscountPeriods?;
    # Reserved for DocuSign.
    string saleDiscountSeatPriceOverride?;
    # 
    string shopperId?;
};

# Payments
public type Payments record {
    # Reserved for DocuSign.
    string amount?;
    # A sender-defined description of the line item.
    string description?;
    # 
    string paymentDate?;
    # The ID of the payment.
    string paymentId?;
    # When **true,** a PDF version of the invoice is available. 
    # 
    # To get the PDF, make the call again and change "Accept:" in the header to "Accept: application/pdf".
    string paymentNumber?;
};

# Object representing a summary of data for new users.
public type NewUsersSummary record {
    # A list of one or more new users.
    NewUser[] newUsers?;
};

# A complex element that specifies the scheduled sending settings for the envelope.
public type ScheduledSending record {
    # The ID of the bulk list. Set this optional value to use scheduled sending with a bulk send operation.
    string bulkListId?;
    # The timestamp of when the envelope is scheduled to be sent in ISO 8601 format.
    # 
    # This property is read-only.
    string resumeDate?;
    # User-specified rules indicating how and when the envelope should be scheduled for sending. Only one rule may be specified.
    EnvelopeDelayRule[] rules?;
    # Status of the scheduled sending job. Valid values:
    # 
    # * `pending`: The envelope has not yet been sent and the scheduled sending delay has not been initiated.
    # * `started`: The sender has initiated the sending process. The delay has not elapsed, so the envelope has not yet been sent to the first recipient.
    # * `completed`: The delay has elapsed and the envelope has been sent to the first recipient.
    # 
    # This property is read-only.
    string status?;
};

# The Users resource enables you to create and manage account users.
public type Users record {
    # The activation code a new user must enter when activating their account.
    string activationAccessCode?;
    # The name of the user's company.
    string company?;
    # Object representing the user's custom Connect configuration.
    ConnectUserObject[] connectConfigurations?;
    # 
    string countryCode?;
    # The UTC DateTime when the item was created.
    string createdDateTime?;
    # The name/value pair information for the user custom setting.
    NameValue[] customSettings?;
    # The default account ID associated with the user.
    string defaultAccountId?;
    # The user's email address.
    string email?;
    # Boolean value that specifies whether the user is enabled for updates from DocuSign Connect.
    string enableConnectForUser?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The user's first name. 
    # Maximum Length: 50 characters.
    string firstName?;
    # A complex element that has up to four Question/Answer pairs for forgotten password information.
    ForgottenPasswordInformation forgottenPasswordInfo?;
    # A list of the group information for groups to add the user to.
    # Use [UserGroups: listGroups](/docs/esign-rest-api/reference/usergroups/groups/list/) to get information about groups.
    # 
    # When setting a user's group, only the `groupId` is required.
    Group[] groupList?;
    # 
    boolean hasRemoteNotary?;
    # Contains address information.
    AddressInformation homeAddress?;
    # The URI for retrieving the image of the user's initials.
    string initialsImageUri?;
    # Determines if the feature set is actively set as part of the plan.
    string isAdmin?;
    # 
    string isAlternateAdmin?;
    # When **true,** National Association of Realtors (NAR) signature logos are enabled for the user.
    string isNAREnabled?;
    # The user's job title.
    string jobTitle?;
    # The date and time when the user last logged in to the system.
    string lastLogin?;
    # The user's last name. 
    # Maximum Length: 50 characters.
    string lastName?;
    # Shows the current status of the user's password. Possible values are: 
    # 
    # * password_reset
    # * password_active
    # * password_expired
    # * password_locked
    # * password_reset_failed 
    string loginStatus?;
    # The user's middle name. 
    # Limit: 50 characters.
    string middleName?;
    # The user's password.
    string password?;
    # If password expiration is enabled, the date-time when the user's password expires.
    string passwordExpiration?;
    # The ID of the permission profile associated with the user.
    string permissionProfileId?;
    # The name of the permission profile associated with the user.
    string permissionProfileName?;
    # The URL for retrieving the user's profile image.
    string profileImageUri?;
    # This field is no longer supported for most accounts. To create an eSignature user without sending an activation email, use the Admin API by following [these steps](/docs/admin-api/how-to/create-active-user/).
    string sendActivationEmail?;
    # When **true,** specifies that an additional activation email be sent if user's log on fails before the account is activated.
    string sendActivationOnInvalidLogin?;
    # An endpoint URI that you can use to retrieve the user's signature image.
    string signatureImageUri?;
    # 
    string subscribe?;
    # The suffix for the user's name, such as Jr, IV, PhD, etc.
    # 
    # Limit: 50 characters. 
    string suffixName?;
    # The salutation for the user, such as Ms, Dr, Capt., etc.
    # 
    # Limit: 10 characters.
    string title?;
    # A URI containing the user ID.
    string uri?;
    # The date and time that the user was added to the account.
    string userAddedToAccountDateTime?;
    # The ID of the user to access.
    # 
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    string userId?;
    # The user's full name.
    # <!--
    # `title` + `firstName` + `middleName` + `lastName` + `suffixName`
    # -->
    string userName?;
    # The date and time that the user's profile was last modified.
    string userProfileLastModifiedDate?;
    # Properties that configure the settings for a user. Some elements of this object have a `metadata` property, which includes the following:
    # - `rights`: The calling users permissions to edit this setting (can be `editable` or `read_only`)
    # - `uiHint`: Internally used to build UIs (can be `available` or `hidden`)
    # - `options`: The values supported for this setting (not all settings have this element)
    UserSettingsInformation userSettings?;
    # Status of the user's account. One of:
    # 
    # - `ActivationRequired`
    # - `ActivationSent`
    # - `Active`
    # - `Closed`
    # - `Disabled`
    string userStatus?;
    # The type of user, for example `CompanyUser`.
    string userType?;
    # Contains address information.
    AddressInformation workAddress?;
};

# Specifies one or more electronic seals to apply on documents. An electronic seal recipient is a legal entity rather than an actual person. Electronic Seals can be used by organizations and governments to show evidence of origin and integrity of documents. Even though electronic seals can be represented by a tab in a document, they do not require user interaction and apply automatically in the order specified by the sender. The sender is therefore the person authorizing usage of the electronic seal in the flow.
# 
# Example:
# 
# ```json
# "recipients": {
#       "seals": [
#         {
#           "recipientId": "1",
#           "routingOrder" : 1,
#           "recipientSignatureProviders": [
#             {
#               "sealName": "52e9d968-xxxx-xxxx-xxxx-4682bc45c106"
#             }
#         ]
#       }
#     ]
#   },
#     .
#     .
#     .
# ```
# For more information about Electronic Seals, see [Apply Electronic Seals to Your Documents](https://support.docusign.com/s/document-item?bundleId=xcm1643837555908&topicId=isl1578456577247.html).
public type SealSign record {
    # Not applicable.
    string accessCode?;
    # Metadata about a property.
    PropertyMetadata accessCodeMetadata?;
    # Not applicable.
    string addAccessCodeToEmail?;
    # When **true,** if the recipient is locked on a template, advanced recipient routing can override the lock.
    string allowSystemOverrideForLockedRecipient?;
    # Error message provided by the destination email system. This field is only provided if the email notification to the recipient fails to send. This property is read-only.
    string autoRespondedReason?;
    # 
    string bulkSendV2Recipient?;
    # Not applicable.
    string clientUserId?;
    # Not applicable.
    string completedCount?;
    # Not applicable.
    string[] customFields?;
    # Not applicable.
    string declinedDateTime?;
    # Not applicable.
    string declinedReason?;
    # Not applicable.
    string deliveredDateTime?;
    # The delivery method. One of:
    # 
    # - `email`
    # - `fax`
    # - `SMS`
    # - `WhatsApp`
    # - `offline`
    # 
    # The `SMS` and `WhatsApp` delivery methods
    # are limited to `signer`, `carbonCopy`, and `certifiedDelivery`
    # recipients.
    # 
    # **Related topics**
    # 
    # - [Using SMS delivery with the eSignature API][smsconcept]
    # - [How to request a signature by SMS delivery][howto]
    # 
    # [smsconcept]: /docs/esign-rest-api/esign101/concepts/sms-delivery/using-sms-esignature/
    # [howto]: /docs/esign-rest-api/how-to/request-signature-sms/
    string deliveryMethod?;
    # Metadata about a property.
    PropertyMetadata deliveryMethodMetadata?;
    # Reserved for DocuSign.
    string designatorId?;
    # Reserved for DocuSign.
    string designatorIdGuid?;
    # Not applicable.
    DocumentVisibility[] documentVisibility?;
    # Sets custom email subject and email body for individual
    # recipients. **Note:** You must explicitly set `supportedLanguage`
    # if you use this feature.
    RecipientEmailNotification emailNotification?;
    # Not applicable.
    string embeddedRecipientStartURL?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # Reserved for DocuSign.
    string faxNumber?;
    # Metadata about a property.
    PropertyMetadata faxNumberMetadata?;
    # Not applicable.
    string idCheckConfigurationName?;
    # Metadata about a property.
    PropertyMetadata idCheckConfigurationNameMetadata?;
    # A complex element that contains input information related to a recipient ID check.
    IdCheckInformationInput idCheckInformationInput?;
    # Specifies ID Verification applied on an envelope by workflow ID.
    # See the [list](/docs/esign-rest-api/reference/accounts/identityverifications/list/)
    # method in the [IdentityVerifications](/docs/esign-rest-api/reference/accounts/identityverifications/) resource
    # for more information on how to retrieve workflow IDs available for an account.
    # This can be used in addition to other [recipient authentication](https://support.docusign.com/s/document-item?bundleId=gav1643676262430&topicId=kzp1578456318101.html) methods.
    RecipientIdentityVerification identityVerification?;
    # Not applicable.
    string inheritEmailNotificationConfiguration?;
    # Reserved for DocuSign.
    string lockedRecipientPhoneAuthEditable?;
    # Reserved for DocuSign.
    string lockedRecipientSmsEditable?;
    # Not applicable.
    string name?;
    # Not applicable.
    string note?;
    # Metadata about a property.
    PropertyMetadata noteMetadata?;
    # A complex type that contains the elements:
    # 
    # * `recipMayProvideNumber`: A Boolean value that specifies whether the recipient can use the phone number of their choice.
    # * `senderProvidedNumbers`: A list of phone numbers that the recipient can use.
    # * `recordVoicePrint`: Reserved for DocuSign.
    # * `validateRecipProvidedNumber`: Reserved for DocuSign.
    RecipientPhoneAuthentication phoneAuthentication?;
    # Not applicable.
    RecipientAttachment[] recipientAttachments?;
    # A complex element that contains information about a user's authentication status.
    AuthenticationStatus recipientAuthenticationStatus?;
    # Metadata about the features that are supported for the recipient type. This property is read-only.
    FeatureAvailableMetadata[] recipientFeatureMetadata?;
    # Unique for the recipient. It is used by the tab element to indicate which recipient is to sign the Document.
    string recipientId?;
    # The globally-unique identifier (GUID) for a specific recipient on a specific envelope. If the same recipient is associated with multiple envelopes, they will have a different GUID for each one. This property is read-only.
    string recipientIdGuid?;
    # (Required) Indicates which electronic seal to apply on documents when creating an envelope.
    RecipientSignatureProvider[] recipientSignatureProviders?;
    # The recipient type, as specified by the following values:
    # - `agent`: Agent recipients can add name and email information for recipients that appear after the agent in routing order.
    # - `carbonCopy`: Carbon copy recipients get a copy of the envelope but don't need to sign, initial, date, or add information to any of the documents. This type of recipient can be used in any routing order.
    # - `certifiedDelivery`: Certified delivery recipients must receive the completed documents for the envelope to be completed. They don't need to sign, initial, date, or add information to any of the documents.
    # - `editor`: Editors have the same management and access rights for the envelope as the sender. Editors can add name and email information, add or change the routing order, set authentication options, and can edit signature/initial tabs and data fields for the remaining recipients.
    # - `inPersonSigner`: In-person recipients are DocuSign users who act as signing hosts in the same physical location as the signer.
    # - `intermediaries`: Intermediary recipients can optionally add name and email information for recipients at the same or subsequent level in the routing order.
    # - `seal`: Electronic seal recipients represent legal entities.
    # - `signer`: Signers are recipients who must sign, initial, date, or add data to form fields on the documents in the envelope.
    # - `witness`: Witnesses are recipients whose signatures affirm that the identified signers have signed the documents in the envelope.
    string recipientType?;
    # Metadata about a property.
    PropertyMetadata recipientTypeMetadata?;
    # Not applicable.
    string requireIdLookup?;
    # Metadata about a property.
    PropertyMetadata requireIdLookupMetadata?;
    # Optional element. Specifies the role name associated with the recipient.<br/><br/>This property is required when you are working with template recipients.
    string roleName?;
    # (Optional, default: 1) 
    # Specifies the routing order of the electronic seal in the envelope.
    # The routing order assigned to your electronic seal cannot be shared with another recipient.
    # It is recommended that you set a routing order for your electronic seals.
    string routingOrder?;
    # Metadata about a property.
    PropertyMetadata routingOrderMetadata?;
    # Not applicable.
    string sentDateTime?;
    # Not applicable.
    string signedDateTime?;
    # Contains the element senderProvidedNumbers which is an Array  of phone numbers the recipient can use for SMS text authentication.
    RecipientSMSAuthentication smsAuthentication?;
    # Deprecated.
    SocialAuthentication[] socialAuthentications?;
    # The recipient's status. This property is read-only. 
    # 
    # Valid values:
    # 
    # - `autoresponded`: The recipient's email system auto-responded to the email from DocuSign. This status is used in the web console to inform senders about the bounced-back email. This recipient status is only used if **Send-on-behalf-of** is turned off for the account.
    # - `completed`: The recipient has completed their actions (signing or other required actions if not a signer) for an envelope.
    # - `created`: The recipient is in a draft state. This value is only associated with draft envelopes (envelopes that have a status of `created`).
    # - `declined`: The recipient declined to sign the documents in the envelope.
    # - `delivered`: The recipient has viewed the documents in an envelope through the DocuSign signing website. This is not an email delivery of the documents in an envelope.
    # - `faxPending`: The recipient has finished signing and the system is waiting for a fax attachment from the recipient before completing their signing step.
    # - `sent`: The recipient has been sent an email notification that it is their turn to sign an envelope.
    # - `signed`: The recipient has completed (signed) all required tags in an envelope. This is a temporary state during processing, after which the recipient's status automatically switches to `completed`.
    string status?;
    # The code associated with the recipient's status. This property is read-only.
    string statusCode?;
    # Not applicable.
    string suppressEmails?;
    # All of the tabs associated with a recipient. Each property is a list of a type of tab.
    EnvelopeRecipientTabs tabs?;
    # When **true,** the sender cannot change any attributes of the recipient. Used only when working with template recipients. 
    string templateLocked?;
    # When **true,** the sender may not remove the recipient. Used only when working with template recipients.
    string templateRequired?;
    # Not applicable.
    string totalTabCount?;
    # Not applicable.
    string userId?;
};

# An envelope custom field enables you to collect custom data about envelopes on a per-envelope basis. You can then use the custom data for sorting, organizing, searching, and other downstream processes. For example, you can use custom fields to copy envelopes or data to multiple areas in Salesforce. eOriginal customers can eVault their documents from the web app on a per-envelope basis by setting an envelope custom field with a name like "eVault with eOriginal?" to "Yes" or "No".
# 
# When a user creates an envelope, the envelope custom fields display in the **Envelope Settings** section of the DocuSign console. Envelope recipients do not see the envelope custom fields. For more information, see [Envelope Custom Fields](https://support.docusign.com/s/document-item?bundleId=pik1583277475390&topicId=qor1583277385137.html).
public type EnvelopeCustomFields record {
    # An array of list custom fields.
    ListCustomField[] listCustomFields?;
    # An array of text custom fields.
    TextCustomField[] textCustomFields?;
};

# An Electronic or Standards Based Signature (digital signature) provider for the signer to use. [More information](/docs/esign-rest-api/esign101/concepts/standards-based-signatures/).
public type RecipientSignatureProvider record {
    # By default, electronic seals apply on all documents in an envelope. If any of the documents has a `signHere` tab, then a visual representation of the electronic seal will show up in the final document. If not, the electronic seal will be visible in the metadata but not in the content of the document.
    # 
    # To apply electronic seals on specific documents only, you must enable the  `sealDocumentsWithTabsOnly` parameter. In this case, Electronic Seal applies only on documents that have `signHere` tabs set for the Electronic Seal recipient. Other documents won't be sealed. 
    string sealDocumentsWithTabsOnly?;
    # Indicates the name of the electronic seal to apply on documents.
    string sealName?;
    # The name of an Electronic or Standards Based Signature (digital signature) provider for the signer to use. For details, see [the current provider list](/docs/esign-rest-api/esign101/concepts/standards-based-signatures/). You can also retrieve the list by using the [AccountSignatureProviders: List](/docs/esign-rest-api/reference/accounts/accountsignatureproviders/list/) method.
    # 
    # Example: `universalsignaturepen_default`
    string signatureProviderName?;
    # Metadata about a property.
    PropertyMetadata signatureProviderNameMetadata?;
    # Option settings for the signature provider. Different providers require or use different options. [The current provider list and the options they require.](/docs/esign-rest-api/esign101/concepts/standards-based-signatures/)
    RecipientSignatureProviderOptions signatureProviderOptions?;
};

# A tab that allows the recipient to sign a document. May be
# optional.
public type SignHere record {
    # When **true,** the text string in the document may have extra whitespace and still match the anchor string. This occurs in two cases.
    # 
    # First, it matches if the document string has a single extra whitespace character following a non-whitespace character in the anchor string. For example, if the anchor string is `DocuSign`, then `Docu Sign` will match. However, <code>Docu&nbsp;&nbsp;&nbsp;Sign</code> will not match.
    # 
    # Second, it matches if the document string has one or more extra whitespace characters following a whitespace character in the anchor string. For example, if the anchor string is `Docu Sign`, then <code>Docu&nbsp;&nbsp;&nbsp;Sign</code> will match.
    # 
    # The default value is **true.**
    string anchorAllowWhiteSpaceInCharacters?;
    # Metadata about a property.
    PropertyMetadata anchorAllowWhiteSpaceInCharactersMetadata?;
    # This property controls how [anchor tabs][AnchorTabs] are placed. When **true,** the text string in a document must match the case of the `anchorString` property for an anchor tab to be created. The default value is **false.**
    # 
    # For example, when set to **true,** if the anchor string is `DocuSign`, then `DocuSign` will match but `Docusign`, `docusign`, `DoCuSiGn`, etc. will not match. When **false,** `DocuSign`, `Docusign`, `docusign`, `DoCuSiGn`, etc. will all match.
    # 
    # This functionality uses the following rules:
    # 
    # - Unless punctuation is specified in the `anchorString`, this functionality ignores punctuation and the following characters:
    # 
    #   $~><|^+=
    # 
    #   For example, the `anchorString` `water` will match on the string `Fetch a pail of water.`
    # 
    # - Strings embedded in other strings are ignored during the matching process.
    # 
    # - In words that have dashes, the parts separated by dashes are treated as distinct words.
    # 
    #   Example: If the anchor string is `forget`, then an anchor tab is placed on the `forget` in `forget-me-not`, even when `anchorMatchWholeWord` is set to **true.**
    # 
    # - Letters with accent marks are treated as distinct characters from their unaccented counterparts.
    # 
    # - For single-character anchor strings, if the two characters appear right next to each other in the document, a single anchor tab is placed for both of them.
    # 
    #   Example: If the anchor string is `i`, then only one anchor tab is placed in `skiing`.
    # 
    # - Unlike punctuation, numbers are not ignored when finding anchor words.
    # 
    #   Example: If the anchor string is `cat`, then `-cat-` is matched but `1cat2` is not when `anchorMatchWholeWord` is set to **true** (its default value).
    # 
    # **Note:** You can only specify the value of this property in POST requests.
    # 
    # [AnchorTabs]: /docs/esign-rest-api/esign101/concepts/tabs/auto-place/
    string anchorCaseSensitive?;
    # Metadata about a property.
    PropertyMetadata anchorCaseSensitiveMetadata?;
    # This property controls how [anchor tabs][AnchorTabs] are aligned in relation to the anchor text. Possible values are :
    # 
    # - `left`: Aligns the left side of the tab with the beginning of the first character of the matching anchor word. This is the default value.
    # - `right`: Aligns the tab’s left side with the last character of the matching anchor word.
    # 
    # **Note:** You can only specify the value of this property in POST requests.
    # 
    # [AnchorTabs]: /docs/esign-rest-api/esign101/concepts/tabs/auto-place/
    string anchorHorizontalAlignment?;
    # Metadata about a property.
    PropertyMetadata anchorHorizontalAlignmentMetadata?;
    # When **true,** this tab is ignored if the `anchorString` is not found in the document.
    string anchorIgnoreIfNotPresent?;
    # Metadata about a property.
    PropertyMetadata anchorIgnoreIfNotPresentMetadata?;
    # When **true,** the text string in a document must match the value of the `anchorString` property in its entirety for an [anchor tab][AnchorTab] to be created. The default value is **false.**
    # 
    # For example, when set to **true,** if the input is `man` then `man` will match but `manpower`, `fireman`, and `penmanship` will not. When **false,** if the input is `man` then `man`, `manpower`, `fireman`, and `penmanship` will all match.
    # 
    # This functionality uses the following rules:
    # 
    # - Unless punctuation is specified in the `anchorString`, this functionality ignores punctuation and the following characters:
    # 
    #   $~><|^+=
    # 
    #   For example, the `anchorString` `water` will match on the string `Fetch a pail of water.`
    # 
    # - Strings embedded in other strings are ignored during the matching process.
    # 
    # - In words that have dashes, the parts separated by dashes are treated as distinct words.
    # 
    #   Example: If the anchor string is `forget`, then an anchor tab is placed on the `forget` in `forget-me-not`, even when `anchorMatchWholeWord` is set to **true.**
    # 
    # - Letters with accent marks are treated as distinct characters from their unaccented counterparts.
    # 
    # - For single-character anchor strings, if the two characters appear right next to each other in the document, a single anchor tab is placed for both of them.
    # 
    #   Example: If the anchor string is `i`, then only one anchor tab is placed in `skiing`.
    # 
    # - Unlike punctuation, numbers are not ignored when finding anchor words.
    # 
    #   Example: If the anchor string is `cat`, then `-cat-` is matched but `1cat2` is not when `anchorMatchWholeWord` is set to **true** (its default value).
    # 
    # 
    # **Note:** You can only specify the value of this property in POST requests.
    # 
    # [AnchorTab]: /docs/esign-rest-api/esign101/concepts/tabs/auto-place/
    string anchorMatchWholeWord?;
    # Metadata about a property.
    PropertyMetadata anchorMatchWholeWordMetadata?;
    # Specifies the string to find in the document and use as the basis for tab placement.
    string anchorString?;
    # Metadata about a property.
    PropertyMetadata anchorStringMetadata?;
    # Reserved for DocuSign.
    string anchorTabProcessorVersion?;
    # Metadata about a property.
    PropertyMetadata anchorTabProcessorVersionMetadata?;
    # Specifies units of the `anchorXOffset` and `anchorYOffset`. Valid units are:
    # 
    # - `pixels` (default)
    # - `inches`
    # - `mms`
    # - `cms`
    string anchorUnits?;
    # Metadata about a property.
    PropertyMetadata anchorUnitsMetadata?;
    # Specifies the X axis location of the tab in `anchorUnits` relative to the `anchorString`.
    string anchorXOffset?;
    # Metadata about a property.
    PropertyMetadata anchorXOffsetMetadata?;
    # Specifies the Y axis location of the tab in `anchorUnits` relative to the `anchorString`.
    string anchorYOffset?;
    # Metadata about a property.
    PropertyMetadata anchorYOffsetMetadata?;
    # 
    string caption?;
    # Metadata about a property.
    PropertyMetadata captionMetadata?;
    # For conditional fields this is the `tabLabel` of the parent tab that controls this tab's visibility.
    string conditionalParentLabel?;
    # Metadata about a property.
    PropertyMetadata conditionalParentLabelMetadata?;
    # For conditional fields, this is the value of the parent tab that controls the tab's visibility.
    # 
    # If the parent tab is a Checkbox, Radio button, Optional Signature, or Optional Initial use "on" as the value to show that the parent tab is active.
    string conditionalParentValue?;
    # Metadata about a property.
    PropertyMetadata conditionalParentValueMetadata?;
    # The DocuSign generated custom tab ID for the custom tab to be applied. This can only be used when adding new tabs for a recipient. When used, the new tab inherits all the custom tab properties.
    string customTabId?;
    # Metadata about a property.
    PropertyMetadata customTabIdMetadata?;
    # Specifies the document ID number that the tab is placed on. This must refer to an existing Document's ID attribute.
    string documentId?;
    # Metadata about a property.
    PropertyMetadata documentIdMetadata?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # An integer specifying the order in which the guided form HTML should render. The order is relative to the `formPageLabel`, the group by which to place the guided form HTML block.
    string formOrder?;
    # Metadata about a property.
    PropertyMetadata formOrderMetadata?;
    # A string specifying the group in which to place the guided form HTML. Each group displays as a separate guided forms page in the signing experience.
    string formPageLabel?;
    # Metadata about a property.
    PropertyMetadata formPageLabelMetadata?;
    # An integer specifying the order in which to present the guided form pages.
    string formPageNumber?;
    # Metadata about a property.
    PropertyMetadata formPageNumberMetadata?;
    # Reserved for DocuSign.
    string handDrawRequired?;
    # Not applicable to Sign Here tab.
    string height?;
    # Metadata about a property.
    PropertyMetadata heightMetadata?;
    # When **true,**  the tab contains a visual representation for an electronic seal in a document.
    string isSealSignTab?;
    # Contains information for transferring values between Salesforce data fields and DocuSign tabs.
    MergeField mergeField?;
    # Reserved for DocuSign.
    string mergeFieldXml?;
    # The name of the tab. For example, `Sign Here` or `Initial Here`.
    # 
    # If the `tooltip` attribute is not set, this value will be displayed as the custom tooltip text.
    string name?;
    # Metadata about a property.
    PropertyMetadata nameMetadata?;
    # When **true,** the recipient does not need to complete this tab to complete the signing process.
    string optional?;
    # Metadata about a property.
    PropertyMetadata optionalMetadata?;
    # Specifies the page number on which the tab is located.
    # Must be 1 for supplemental documents.
    string pageNumber?;
    # Metadata about a property.
    PropertyMetadata pageNumberMetadata?;
    # The ID of the recipient to whom the tab will be assigned. This value should match the `recipientId` defined in the recipient object.
    string recipientId?;
    # The globally-unique identifier (GUID) for a specific recipient on a specific envelope. If the same recipient is associated with multiple envelopes, they will have a different GUID for each one. This property is read-only.
    string recipientIdGuid?;
    # Metadata about a property.
    PropertyMetadata recipientIdGuidMetadata?;
    # Metadata about a property.
    PropertyMetadata recipientIdMetadata?;
    # Scales the size of the tab. This field accepts values from 0.5 to 2.0, where  0.5 is half the normal size, 1.0 is normal size, and 2.0 is twice the normal size.
    string scaleValue?;
    # Metadata about a property.
    PropertyMetadata scaleValueMetadata?;
    # 
    SmartContractInformation smartContractInformation?;
    # Reserved for DocuSign.
    string 'source?;
    # 
    Stamp stamp?;
    # The type of stamp. Valid values are:
    # 
    # - `signature`: A signature image. This is the default value.
    # - `stamp`: A stamp image.
    # - null
    string stampType?;
    # Metadata about a property.
    PropertyMetadata stampTypeMetadata?;
    # The status of the tab. Possible values are:
    # 
    # - `active`: The tab is active, but the recipient has not yet interacted with it.
    # - `signed`: The recipient signed the tab.
    # - `declined`: The recipient declined the envelope.
    # - `na`: Used when the `status` property is not applicable to the tab type. (For example, a tab that has the `tabType` `SignerAttachmentOptional`).
    string status?;
    # Metadata about a property.
    PropertyMetadata statusMetadata?;
    # An array of tab groups that this tab belongs to. Tab groups are identified by their `groupLabel` property.
    # 
    # To associate this tab with a tab group, add the tab group's `groupLabel` to this array.
    string[] tabGroupLabels?;
    # Metadata about a property.
    PropertyMetadata tabGroupLabelsMetadata?;
    # The unique identifier for the tab.
    string tabId?;
    # Metadata about a property.
    PropertyMetadata tabIdMetadata?;
    # The label associated with the tab. This value may be an empty string.
    # If no value is provided, the tab type is used as the value.
    # 
    # Maximum Length: 500 characters.
    string tabLabel?;
    # Metadata about a property.
    PropertyMetadata tabLabelMetadata?;
    # A positive integer that sets the order the tab is navigated to during signing.
    # 
    # Tabs on a page are navigated to in ascending order, starting with the lowest number and moving to the highest. If two or more tabs have the same `tabOrder` value, the normal auto-navigation setting behavior for the envelope is used.
    string tabOrder?;
    # Metadata about a property.
    PropertyMetadata tabOrderMetadata?;
    # Indicates the type of tab (for example, `signHere` or `initialHere`).
    string tabType?;
    # Metadata about a property.
    PropertyMetadata tabTypeMetadata?;
    # When **true,** the sender cannot change any attributes of the recipient. Used only when working with template recipients. 
    string templateLocked?;
    # Metadata about a property.
    PropertyMetadata templateLockedMetadata?;
    # When **true,** the sender may not remove the recipient. Used only when working with template recipients.
    string templateRequired?;
    # Metadata about a property.
    PropertyMetadata templateRequiredMetadata?;
    # The text of a tooltip that appears when a user hovers over a form field or tab.
    string tooltip?;
    # Metadata about a property.
    PropertyMetadata toolTipMetadata?;
    # Not applicable to Sign Here tab.
    string width?;
    # Metadata about a property.
    PropertyMetadata widthMetadata?;
    # This property indicates the horizontal offset of the object on the page.
    # DocuSign uses 72 DPI when determining position.
    # Required. Must be an integer. May be zero.
    # 
    # To improve the tab's position on the document,
    # DocuSign recommends
    # adjusting `xPosition`
    # and `yPosition`
    # coordinates
    # by (+1, -7)
    string xPosition?;
    # Metadata about a property.
    PropertyMetadata xPositionMetadata?;
    # This property indicates the vertical offset of the object on the page.
    # DocuSign uses 72 DPI when determining position.
    # Required. Must be an integer. May be zero.
    # 
    # To improve the tab's position on the document,
    # DocuSign recommends
    # adjusting `xPosition`
    # and `yPosition`
    # coordinates
    # by (+1, -7)
    string yPosition?;
    # Metadata about a property.
    PropertyMetadata yPositionMetadata?;
};

# Describes a recipient who is a member of a conditional group.
public type RecipientOption record {
    # The email ID of the agent. This property is required. Maximum length: 100 characters.
    string email?;
    # The full legal name of the recipient. Maximum length: 100 characters.
    string name?;
    # An identifier for the recipient. After assigning this value in a `recipient` object, you can reference it in the `conditions` object to set the recipient as a conditional recipient. For an example, see [How to use conditional recipients](/docs/esign-rest-api/how-to/use-conditional-recipients/).
    string recipientLabel?;
    # Specifies the signing group role of the recipient. This property is required.
    string roleName?;
    # The ID of the [signing group](https://support.docusign.com/s/document-item?bundleId=gav1643676262430&topicId=zgn1578456447934.html).
    string signingGroupId?;
};

# 
public type PaymentProcessorInformation record {
    # Contains address information.
    AddressInformation address?;
    # The ID of the billing agreement.
    string billingAgreementId?;
    # The email address associated with the payment processor.
    string email?;
};

# This object contains details about an envelope transfer rule.
public type EnvelopeTransferRule record {
    # When **true,** the original owner is added as a carbon copy recipient after envelope transfer. The default value is **false.**
    string carbonCopyOriginalOwner?;
    # When **true,** the envelope transfer rule is active.
    string enabled?;
    # The ID of the envelope transfer rule. The system generates this ID when the rule is first created.
    string envelopeTransferRuleId?;
    # The type of envelope event that triggers the transfer. Valid values are:
    # 
    # - `sent`
    # - `before sent` 
    # - `completed`
    string eventType?;
    # This object contains information about a group.
    Group fromGroup?;
    # User information.
    UserInformation fromUser?;
    # The UTC DateTime when the envelope transfer rule was last modified. This property is read-only.
    string modifiedDate?;
    # User information.
    UserInformation modifiedUser?;
    # This object contains details about a folder.
    Folder toFolder?;
    # User information.
    UserInformation toUser?;
};

# 
public type GraphicsContext record {
    # The fill color to use for the overlay. Colors are typically specified by their RGB hex values, but you can also use a [friendly CSS color name](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value).
    string fillColor?;
    # The line color to use for the overlay. Colors are typically specified by their RGB hex values, but you can also use a [friendly CSS color name](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value).
    string lineColor?;
    # The line weight or thickness to use for the overlay.
    string lineWeight?;
};

# Allows you to customize locale settings.
public type LocalePolicyTab record {
    # Specifies the address format. Valid values:
    # 
    # - `en_us`
    # - `ja_jp`
    # - `zh_cn_tw`
    string addressFormat?;
    # Specifies the type of calendar. Valid values:
    # 
    # - `gregorian`
    # - `japanese`
    # - `buddhist`
    string calendarType?;
    # The two letter [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language code.
    string cultureName?;
    # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code.
    # 
    # Supported formats:
    # 
    # - `AED`
    # - `AFN`
    # - `ALL`
    # - `AMD`
    # - `ANG`
    # - `AOA`
    # - `ARS`
    # - `AUD`
    # - `AWG`
    # - `AZN`
    # - `BAM`
    # - `BBD`
    # - `BDT`
    # - `BGN`
    # - `BHD`
    # - `BIF`
    # - `BMD`
    # - `BND`
    # - `BOB`
    # - `BOV`
    # - `BRL`
    # - `BSD`
    # - `BTN`
    # - `BWP`
    # - `BYN`
    # - `BYR`
    # - `BZD`
    # - `CAD`
    # - `CDF`
    # - `CHE`
    # - `CHF`
    # - `CHW`
    # - `CLF`
    # - `CLP`
    # - `CNY`
    # - `COP`
    # - `COU`
    # - `CRC`
    # - `CUC`
    # - `CUP`
    # - `CVE`
    # - `CZK`
    # - `DJF`
    # - `DKK`
    # - `DOP`
    # - `DZD`
    # - `EGP`
    # - `ERN`
    # - `ETB`
    # - `EUR`
    # - `FJD`
    # - `FKP`
    # - `GBP`
    # - `GEL`
    # - `GHS`
    # - `GIP`
    # - `GMD`
    # - `GNF`
    # - `GTQ`
    # - `GYD`
    # - `HKD`
    # - `HNL`
    # - `HRK`
    # - `HTG`
    # - `HUF`
    # - `IDR`
    # - `ILS`
    # - `INR`
    # - `IQD`
    # - `IRR`
    # - `ISK`
    # - `JMD`
    # - `JOD`
    # - `JPY`
    # - `KES`
    # - `KGS`
    # - `KHR`
    # - `KMF`
    # - `KPW`
    # - `KRW`
    # - `KWD`
    # - `KYD`
    # - `KZT`
    # - `LAK`
    # - `LBP`
    # - `LKR`
    # - `LRD`
    # - `LSL`
    # - `LYD`
    # - `MAD`
    # - `MDL`
    # - `MGA`
    # - `MKD`
    # - `MMK`
    # - `MNT`
    # - `MOP`
    # - `MRO`
    # - `MUR`
    # - `MVR`
    # - `MWK`
    # - `MXN`
    # - `MXV`
    # - `MYR`
    # - `MZN`
    # - `NAD`
    # - `NGN`
    # - `NIO`
    # - `NOK`
    # - `NPR`
    # - `NZD`
    # - `OMR`
    # - `PAB`
    # - `PEN`
    # - `PGK`
    # - `PHP`
    # - `PKR`
    # - `PLN`
    # - `PYG`
    # - `QAR`
    # - `RON`
    # - `RSD`
    # - `RUB`
    # - `RWF`
    # - `SAR`
    # - `SBD`
    # - `SCR`
    # - `SDG`
    # - `SEK`
    # - `SGD`
    # - `SHP`
    # - `SLL`
    # - `SOS`
    # - `SRD`
    # - `SSP`
    # - `STD`
    # - `SVC`
    # - `SYP`
    # - `SZL`
    # - `THB`
    # - `TJS`
    # - `TMT`
    # - `TND`
    # - `TOP`
    # - `TRY`
    # - `TTD`
    # - `TWD`
    # - `TZS`
    # - `UAH`
    # - `UGX`
    # - `USD`
    # - `USN`
    # - `UYI`
    # - `UYU`
    # - `UZS`
    # - `VEF`
    # - `VND`
    # - `VUV`
    # - `WST`
    # - `XAF`
    # - `XAG`
    # - `XAU`
    # - `XBA`
    # - `XBB`
    # - `XBC`
    # - `XBD`
    # - `XCD`
    # - `XDR`
    # - `XOF`
    # - `XPD`
    # - `XPF`
    # - `XPT`
    # - `XSU`
    # - `XTS`
    # - `XUA`
    # - `XXX`
    # - `YER`
    # - `ZAR`
    # - `ZMW`
    # - `ZWL`
    string currencyCode?;
    # Determines how negative currency values
    # are displayed.
    # 
    # In most cases, you should not need to change
    # this value. See [Explicitly define formatting](/docs/esign-rest-api/esign101/concepts/tabs/number-fields/#explicitly-define-formatting).
    # 
    # Valid values:
    # 
    # - `Default`<br>
    #   `0`
    # - `OPar_CSym_1_Comma_234_Comma_567_Period_89_CPar`<br>
    #   `($1,234,567.89)`
    # - `Minus_CSym_1_Comma_234_Comma_567_Period_89`<br>
    #   `-$1,234,567.89`
    # - `Minus_CSym_Space_1_Period_234_Period_567_Comma_89`<br>
    #   `-$ 1.234.567,89`
    # - `CSym_Space_Minus_1_Period_234_Period_567_Comma_89`<br>
    #   `$ -1.234.567,89`
    # - `Minus_1_Period_234_Period_567_Comma_89_Space_CSym`<br>
    #   `-1.234.567,89 $`
    # - `OPar_1_Space_234_Space_567_Comma_89_Space_CSym_CPar`<br>
    #   `(1 234 567,89 $)`
    # - `Minus_1_Space_234_Space_567_Comma_89_Space_CSym`<br>
    #   `-1 234 567,89 $`
    # - `CSym_Minus_1_Quote_234_Quote_567_Period_89`<br>
    #   `$-1'234'567.89`
    # - `Minus_CSym_1_Period_234_Period_567_Comma_89`<br>
    #   `-$1.234.567,89`
    # - `Minus_CSym_1_Comma_234_Comma_567`<br>
    #   `-$1,234,567`
    # - `Minus_CSym_12_Comma_34_Comma_567_Period_89`<br>
    #   `-$12,34,567.89`
    # - `OPar_CSym_Space_1234_Comma_567_Period_89_CPar`<br>
    #   `($ 1234,567.89)`
    # - `CSym_Space_Minus_12_Comma_34_Comma_567_Period_89`<br>
    #   `$ -12,34,567.89`
    # - `CSym_Minus_12_Comma_34_Comma_567_Period_89`<br>
    #   `$-1,234,567.89`
    # - `CSym_Space_Minus_1_Space_234_Space_567_Comma_89`<br>
    #   `$ -1 234 567,89`
    # - `CSym_Space_Minus_1_Space_234_Space_567_Period_89`<br>
    #   `$ -1 234 567.89`
    # - `Minus_CSym_Space_1_Space_234_Space_567_Comma_89`<br>
    #   `-$ 1 234 567,89`
    # - `Minus_1_Space_234_Space_567_Comma_89_CSym`<br>
    #   `-1 234 567,89$`
    # - `Minus_1_Space_234_Space_567_Period_89_Space_CSym`<br>
    #   `-1 234 567.89 $`
    # - `OPar_CSym_1_Period_234_Period_567_CPar`<br>
    #   `(1.234.567)`
    # - `OPar_CSym_1_Comma_234_Comma_567_CPar`<br>
    #   `($1,234,567)`
    # - `Minus_1_Comma_234_Comma_567_Period_89_Space_CSym`<br>
    #   `-1,234,567.89 $`
    # - `Minus_CSym_Space_1_Comma_234_Comma_567_Period_89`<br>
    #   `-$ 1,234,567.89`
    # - `OPar_CSym_Space_1_Period_234_Period_567_Comma_89_CPar`<br>
    #   `($ 1.234.567,89)`
    # - `OPar_CSym_Space_1_Quote_234_Quote_567_Period_89_CPar`<br>
    #   `($ 1'234'567.89)`
    # - `OPar_CSym_Space_1_Space_234_Space_567_Comma_89_CPar`<br>
    #   `($ 1 234 567,89)`
    # - `OPar_CSym_Space_1_Space_234_Space_567_Period_89_CPar`<br>
    #   `($ 1 234 567.89)`
    # - `OPar_CSym_12_Comma_34_Comma_567_Period_89_CPar`<br>
    #   `($12,34,567.89)`
    # - `OPar_CSym_Space_12_Comma_34_Comma_567_Period_89_CPar`<br>
    #   `($ 12,34,567.89)`
    # - `OPar_1_Comma_234_Comma_567_Period_89_Space_CSym_CPar`<br>
    #   `(1,234,567.89 $)`
    # - `OPar_1_Period_234_Period_567_Comma_89_Space_CSym_CPar`<br>
    #   `(1.234.567,89 $)`
    # - `OPar_1_Space_234_Space_567_Comma_89_CSym_CPar`<br>
    #   `(1 234 567,89$)`
    # - `OPar_1_Space_234_Space_567_Period_89_Space_CSym_CPar`<br>
    #   `(1 234 567.89 $)`
    # - `OPar_CSym_Space_1_Comma_234_Comma_567_Period_89_CPar`<br>
    #   `($ 1,234,567.89)`
    # - `Minus_CSym_1_Period_234_Period_567`<br>
    #   `-$ 1.234.567`
    # - `Minus_CSym_Space_1_Quote_234_Quote_567_Period_89`<br>
    #   `-$ 1'234'567.89`
    # - `Minus_CSym_Space_1_Space_234_Space_567_Period_89`<br>
    #   `-$ 1 234 567.89`
    # - `CSym_Minus_1_Comma_234_Comma_567`<br>
    #   `$-1,234,567`
    # - `CSym_Minus_1_Period_234_Period_567`<br>
    #   `$-1.234.567`
    # - `CSym_Space_Minus_1_Quote_234_Quote_567_Period_89`<br>
    #   `$ -1'234'567.89`
    # - `CSym_Space_Minus_1_Comma_234_Comma_567_Period_89`<br>
    #   `$ -1,234,567.89`
    # - `Minus_CSym_Space_12_Comma_34_Comma_567_Period_89`<br>
    #   `-$ 12,34,567.89`
    # - `Minus_1_Period_234_Period_567_Space_CSym`<br>
    #   `-123.456.789 $`
    # - `CSym_Minus_1_Space_234_Space_567_Comma_89`<br>
    #   `$-123 456 789,00`
    # - `Minus_1_Quote_234_Quote_567_Period_89_Space_CSym`<br>
    #   `-123'456'789.00 $`
    # - `CSym_1_Comma_234_Comma_567_Period_89_Minus`<br>
    #   `$123,456,789.00-`
    # - `CSym_Minus_1_Period_234_Period_567_Comma_89`<br>
    #   `$-123.456.789,00`
    # - `OPar_CSym_1_Period_234_Period_567_Comma_89_CPar`<br>
    #   `($123.456.789,00)`
    # - `Minus_CSym_1234_Comma_567_Period_89`<br>
    #   `-$123456,789.00`
    # - `Minus_CSym_1_Space_234_Space_567_Comma_89`<br>
    #   `-$123 456 789,00`
    string currencyNegativeFormat?;
    # Determines how positive currency values
    # are displayed.
    # 
    # In most cases, you should not need to change
    # this value. See [Explicitly define formatting](/docs/esign-rest-api/esign101/concepts/tabs/number-fields/#explicitly-define-formatting).
    # 
    # Valid values:
    # 
    # 
    # - `Default`<br>
    #   Uses the current locale.
    # - `CSym_1_Comma_234_Comma_567_Period_89`<br>
    #   `$1,234,567.89`
    # - `CSym_Space_1_Period_234_Period_567_Comma_89`<br>
    #   `$ 1.234.567,89`
    # - `Leading_1_Period_234_Period_567_Comma_89_Space_CSym`<br>
    #   `1.234.567,89 $`
    # - `Leading_1_Space_234_Space_567_Comma_89_Space_CSym`<br>
    #   `1 234 567,89 $`
    # - `CSym_Space_1_Quote_234_Quote_567_Period_89`<br>
    #   `$ 1'234'567.89`
    # - `CSym_1_Comma_234_Comma_567`<br>
    #   `$1,234,567`
    # - `CSym_Space_12_Comma_34_Comma_567_Period_89`<br>
    #   `$ 12,34,567.89`
    # - `CSym_12_Comma_34_Comma_567_Period_89`<br>
    #   `$12,34,567.89`
    # - `CSym_Space_1234_Comma_567_Period_89`<br>
    #   `$ 1234,567.89`
    # - `Leading_1_Space_234_Space_567_Period_89_Space_CSym`<br>
    #   `1 234 567.89 $`
    # - `CSym_Space_1_Space_234_Space_567_Comma_89`<br>
    #   `$ 1 234 567,89`
    # - `CSym_Space_1_Space_234_Space_567_Period_89`<br>
    #   `$ 1 234 567.89`
    # - `Leading_1_Space_234_Space_567_Comma_89_CSym`<br>
    #   `1 234 567,89$`
    # - `CSym_1_Period_234_Period_567`<br>
    #   `$1.234.567`
    # - `Leading_1_Comma_234_Comma_567_Period_89_Space_CSym`<br>
    #   `1,234,567. $` (New Armenian)
    # - `CSym_Space_1_Comma_234_Comma_567_Period_89`<br>
    #   `$ 1,234,567.89` (Persian)
    # - `CSym_1_Period_234_Period_567_Comma_89`<br>
    #   `$123.456.789,00` (es-CO)
    # - `Leading_1_Quote_234_Quote_567_Period_89_Space_CSym`<br>
    #   `123'456'789.00 $` (fr-ch)
    # - `CSym_1234_Comma_567_Period_89`<br>
    #   `$123456,789.00` (es-PR)
    # - `Leading_1_Period_234_Period_567_Space_CSym`<br>
    #   `123.456.789 $`
    # - `CSym_1_Space_234_Space_567_Comma_89`<br>
    #   `$123 456 789,00` (en-ZA, es-CR)
    string currencyPositiveFormat?;
    # 
    string customDateFormat?;
    # 
    string customTimeFormat?;
    # Specifies the date format. Valid values:
    # 
    # - `default` <br> used the UI's 
    # - `longformat` <br> use the UI's long format
    # - `dd_mm_yy` <br> dd-MM-yy
    # - `dd_mmm_yy` <br> dd-MMM-yy
    # - `dd_mm_yyyy` <br> dd-MM-yyyy
    # - `dd_mmm_yyyy` <br> dd-MMM-yyyy
    # - `ddmmmmyyyy` <br> dd MMMM yyyy
    # - `ddmmyyyy` <br> dd/MM/yyyy
    # - `ddmmyyyy_de` <br> dd.MM.yyyy
    # - `dmyyyy` <br> d/M/yyyy
    # - `d_m_yyyy` <br> d-M-yyyy
    # - `mmmd_yyyy` <br> MMM d, yyyy
    # - `mmm_dd_yyyy` <br> MMM-dd-yyyy
    # - `mmmmd_yyyy` <br> MMMM d, yyyy
    # - `mm_dd_yyyy` <br> MM-dd-yyyy
    # - `mdyyyy` <br> M/d/yyyy
    # - `yyyy_mmm_dd` <br> yyyy-MMM-dd
    # - `yyyy_mm_dd` <br> yyyy-MM-dd
    # - `yyyymmdd` <br> yyyy/MM/dd
    # - `yyyymd` <br> yyyy/M/d
    # - `custom` <br> Customer set own value
    # - `mmddyyyy` <br> MM/dd/yyyy
    # - `mmddyy` <br> MM/dd/yy
    # - `yyyy_mmmm_d` <br> yyyy MMMM d
    string dateFormat?;
    # When a user is required to enter their initials,
    # this property
    # specifies how initials are rendered.
    # The examples show the
    # initials for "William Henry Gates".
    # 
    # 
    # - `first1last1`<br> "WG"
    # - `last2`<br> "GA"
    # - `first2`<br> "WI"
    # - `last2_cjk`<br> first two characters from last name in CJK characters.
    # 
    # <!-- Components/BusinessObjects/Models/ConcealedApiRestModels/localePolicyEnums.cs -->
    string initialFormat?;
    # Describes how names are displayed. Valid values:
    # 
    # - `first_middle_last`<br>William Henry Gates
    # - `full`<br>Mr William Henry Gates III
    # - `last_first`<br>Gates William
    # - `lastfirst`<br>GatesWilliam
    # - `last_first_cjk`<br>Gates William only with CJK characters
    # - `lastfirst_cjk`<br>GatesWilliam only with CJK characters
    # 
    # <!-- Web/RestApi/Models/v2_1/localePolicy.cs#L341-L366 -->
    string nameFormat?;
    # Specifies the time format. Valid values:
    # 
    # - `none`      <br>None
    # - `hh_mm`     <br>hh:mm 
    # - `hhmm`      <br>HH:mm
    # - `hhmmss`    <br>HH:mm:ss
    # - `hhmmsstt`  <br>HH:mm:ss tt
    # - `hhmmtt`    <br> HH:mm tt
    # - `hmm`       <br>h:mm
    # - `hmmss`     <br>h:mm:ss
    # - `hmmsstt`   <br>h:mm:ss tt
    # - `hmmtt`     <br>h:mm tt
    # - `custom`    <br>Customer-set format
    # 
    # <!-- Web/RestApi/Models/v2_1/localePolicy.cs#L501-L546 -->
    string timeFormat?;
    # Specifies the time zone. Valid values:
    # 
    # - `TZ_01_AfghanistanStandardTime`
    # - `TZ_02_AlaskanStandardTime`
    # - `TZ_03_ArabStandardTime`
    # - `TZ_04_ArabianStandardTime`
    # - `TZ_05_ArabicStandardTime`
    # - `TZ_06_ArgentinaStandardTime`
    # - `TZ_07_AtlanticStandardTime`
    # - `TZ_08_AUS_CentralStandardTime`
    # - `TZ_09_AUS_EasternStandardTime`
    # - `TZ_10_AzerbaijanStandardTime`
    # - `TZ_11_AzoresStandardTime`
    # - `TZ_12_BangladeshStandardTime`
    # - `TZ_13_CanadaCentralStandardTime`
    # - `TZ_14_CapeVerdeStandardTime`
    # - `TZ_15_CaucasusStandardTime`
    # - `TZ_16_CentralAustraliaStandardTime`
    # - `TZ_17_CentralAmericaStandardTime`
    # - `TZ_18_CentralAsiaStandardTime`
    # - `TZ_19_CentralBrazilianStandardTime`
    # - `TZ_20_CentralEuropeStandardTime`
    # - `TZ_21_CentralEuropeanStandardTime`
    # - `TZ_22_CentralPacificStandardTime`
    # - `TZ_23_CentralStandardTime`
    # - `TZ_24_CentralStandardTimeMexico`
    # - `TZ_25_ChinaStandardTime`
    # - `TZ_26_DatelineStandardTime`
    # - `TZ_27_E_AfricaStandardTime`
    # - `TZ_28_E_AustraliaStandardTime`
    # - `TZ_29_E_EuropeStandardTime`
    # - `TZ_30_E_SouthAmericaStandardTime`
    # - `TZ_31_EasternStandardTime`
    # - `TZ_32_EgyptStandardTime`
    # - `TZ_33_EkaterinburgStandardTime`
    # - `TZ_34_FijiStandardTime`
    # - `TZ_35_FLE_StandardTime`
    # - `TZ_36_GeorgianStandardTime`
    # - `TZ_37_GMT_StandardTime`
    # - `TZ_38_GreenlandStandardTime`
    # - `TZ_39_GreenwichStandardTime`
    # - `TZ_40_GTB_StandardTime`
    # - `TZ_41_HawaiianStandardTime`
    # - `TZ_42_IndiaStandardTime`
    # - `TZ_43_IranStandardTime`
    # - `TZ_44_IsraelStandardTime`
    # - `TZ_45_JordanStandardTime`
    # - `TZ_46_KaliningradStandardTime`
    # - `TZ_47_KamchatkaStandardTime`
    # - `TZ_48_KoreaStandardTime`
    # - `TZ_49_MagadanStandardTime`
    # - `TZ_50_MauritiusStandardTime`
    # - `TZ_51_MidAtlanticStandardTime`
    # - `TZ_52_MiddleEastStandardTime`
    # - `TZ_53_MontevideoStandardTime`
    # - `TZ_54_MoroccoStandardTime`
    # - `TZ_55_MountainStandardTime`
    # - `TZ_56_MountainStandardTimeMMexico`
    # - `TZ_57_MyanmarStandardTime`
    # - `TZ_58_N_CentralAsiaStandardTime`
    # - `TZ_59_NamibiaStandardTime`
    # - `TZ_60_NepalStandardTime`
    # - `TZ_61_NewZealandStandardTime`
    # - `TZ_62_NewfoundlandStandardTime`
    # - `TZ_63_NorthAsiaEastStandardTime`
    # - `TZ_64_NorthAsiaStandardTime`
    # - `TZ_65_PacificSAStandardTime`
    # - `TZ_66_PacificStandardTime`
    # - `TZ_67_PacificStandardTimeMexico`
    # - `TZ_68_PakistanStandardTime`
    # - `TZ_69_ParaguayStandardTime`
    # - `TZ_70_RomanceStandardTime`
    # - `TZ_71_RussianStandardTime`
    # - `TZ_72_SAEasternStandardTime`
    # - `TZ_73_SAPacificStandardTime`
    # - `TZ_74_SAWesternStandardTime`
    # - `TZ_75_SamoaStandardTime`
    # - `TZ_76_SE_AsiaStandardTime`
    # - `TZ_77_SingaporeStandardTime`
    # - `TZ_78_SouthAfricaStandardTime`
    # - `TZ_79_SriLankaStandardTime`
    # - `TZ_80_SyriaStandardTime`
    # - `TZ_81_TaipeiStandardTime`
    # - `TZ_82_TasmaniaStandardTime`
    # - `TZ_83_TokyoStandardTime`
    # - `TZ_84_TongaStandardTime`
    # - `TZ_85_TurkeyStandardTime`
    # - `TZ_86_UlaanbaatarStandardTime`
    # - `TZ_87_US_EasternStandardTime`
    # - `TZ_88_USMountainStandardTime`
    # - `TZ_89_VenezuelaStandardTime`
    # - `TZ_90_VladivostokStandardTime`
    # - `TZ_91_W_AustraliaStandardTime`
    # - `TZ_92_W_CentralAfricaStandardTime`
    # - `TZ_93_W_EuropeStandardTime`
    # - `TZ_94_WestAsiaStandardTime`
    # - `TZ_95_WestPacificStandardTime`
    # - `TZ_96_YakutskStandardTime`
    string timeZone?;
    # When **true,** use the long currency format for the locale.
    string useLongCurrencyFormat?;
};

# A complex type containing information about a witness recipient. Witnesses are recipients whose signatures affirm that the identified signers have signed the documents in the envelope.
public type Witness record {
    # If a value is provided, the recipient must enter the value as the access code to view and sign the envelope. 
    # 
    # Maximum Length: 50 characters and it must conform to the account's access code format setting.
    # 
    # If blank, but the signer `accessCode` property is set in the envelope, then that value is used.
    # 
    # If blank and the signer `accessCode` property is not set, then the access code is not required.
    string accessCode?;
    # Metadata about a property.
    PropertyMetadata accessCodeMetadata?;
    # Optional. When **true,** the access code will be added to the email sent to the recipient. This nullifies the security measure of `accessCode` on the recipient.
    string addAccessCodeToEmail?;
    # An array of additional notification objects.
    RecipientAdditionalNotification[] additionalNotifications?;
    # Optional element. When **true,** the agents recipient associated with this recipient can change the recipient's pre-populated email address. This element is only active if enabled for the account.
    string agentCanEditEmail?;
    # Optional element. When **true,** the agents recipient associated with this recipient can change the recipient's pre-populated name. This element is only active if enabled for the account.
    string agentCanEditName?;
    # When **true,** if the recipient is locked on a template, advanced recipient routing can override the lock.
    string allowSystemOverrideForLockedRecipient?;
    # When **true,** autonavigation is set for the recipient.
    string autoNavigation?;
    # Error message provided by the destination email system. This field is only provided if the email notification to the recipient fails to send. This property is read-only.
    string autoRespondedReason?;
    # Reserved for DocuSign.
    string bulkRecipientsUri?;
    # 
    string bulkSendV2Recipient?;
    # When **true,** specifies that the signer can perform the signing ceremony offline.
    string canSignOffline?;
    # Specifies whether the recipient is embedded or remote. 
    # 
    # If the `clientUserId` property is not null then the recipient is embedded. Use this field to associate the signer with their userId in your app. Authenticating the user is the responsibility of your app when you use embedded signing.
    # 
    # If the `clientUserId` property is set and either `SignerMustHaveAccount` or `SignerMustLoginToSign` property of the account settings is set to  **true,** an error is generated on sending.
    # 
    # **Note:** This property is not returned by the [listStatusChanges](/docs/esign-rest-api/reference/envelopes/envelopes/liststatuschanges/) endpoint.
    # 
    # Maximum length: 100 characters. 
    string clientUserId?;
    # Indicates the number of times that the recipient has been through a signing completion for the envelope. If this number is greater than 0 for a signing group, only the user who previously completed may sign again. This property is read-only.
    string completedCount?;
    # 
    ConsentDetails[] consentDetailsList?;
    # The reason why the recipient was created (for example, `sender`). This property is read-only.
    string creationReason?;
    # An optional array of strings that allows the sender to provide custom data about the recipient. This information is returned in the envelope status but otherwise not used by DocuSign. Each customField string can be a maximum of 100 characters.
    string[] customFields?;
    # The date and time the recipient declined the document. This property is read-only.
    string declinedDateTime?;
    # The reason the recipient declined the document. This property is read-only.
    string declinedReason?;
    # When **true,** this recipient is the default recipient and any tabs generated by the transformPdfFields option are mapped to this recipient.
    string defaultRecipient?;
    # 
    DelegationInfo delegatedBy?;
    # 
    DelegationInfo[] delegatedTo?;
    # The date and time that the envelope was delivered to the recipient. This property is read-only.
    string deliveredDateTime?;
    # The delivery method. One of:
    # 
    # - `email`
    # - `fax`
    # - `SMS`
    # - `WhatsApp`
    # - `offline`
    # 
    # The `SMS` and `WhatsApp` delivery methods
    # are limited to `signer`, `carbonCopy`, and `certifiedDelivery`
    # recipients.
    # 
    # **Related topics**
    # 
    # - [Using SMS delivery with the eSignature API][smsconcept]
    # - [How to request a signature by SMS delivery][howto]
    # 
    # [smsconcept]: /docs/esign-rest-api/esign101/concepts/sms-delivery/using-sms-esignature/
    # [howto]: /docs/esign-rest-api/how-to/request-signature-sms/
    string deliveryMethod?;
    # Metadata about a property.
    PropertyMetadata deliveryMethodMetadata?;
    # Reserved for DocuSign.
    string designatorId?;
    # Reserved for DocuSign.
    string designatorIdGuid?;
    # A list of `documentVisibility` objects. Each object in the list specifies whether a document in the envelope is visible to this recipient. For the envelope to use this functionality, Document Visibility must be enabled for the account and the `enforceSignerVisibility` property must be set to **true.**
    DocumentVisibility[] documentVisibility?;
    # The recipient's email address.
    string email?;
    # Metadata about a property.
    PropertyMetadata emailMetadata?;
    # Sets custom email subject and email body for individual
    # recipients. **Note:** You must explicitly set `supportedLanguage`
    # if you use this feature.
    RecipientEmailNotification emailNotification?;
    # 
    string emailRecipientPostSigningURL?;
    # Specifies a sender-provided valid URL string for redirecting an embedded recipient. When using this option, the embedded recipient still receives an email from DocuSign, just as a remote recipient would. When the document link in the email is clicked the recipient is redirected, through DocuSign, to the supplied URL to complete their actions. When routing to the URL, the sender's system (the server responding to the URL) must request a recipient token to launch a signing session. 
    # 
    # When `SIGN_AT_DOCUSIGN`, the recipient is directed to an embedded signing or viewing process directly at DocuSign. The signing or viewing action is initiated by the DocuSign system and the transaction activity and Certificate of Completion records will reflect this. In all other ways the process is identical to an embedded signing or viewing operation launched by a partner.
    # 
    # It is important to understand that in a typical embedded workflow, the authentication of an embedded recipient is the responsibility of the sending application. DocuSign expects that senders will follow their own processes for establishing the recipient's identity. In this workflow the recipient goes through the sending application before the embedded signing or viewing process is initiated. However, when the sending application sets `EmbeddedRecipientStartURL=SIGN_AT_DOCUSIGN`, the recipient goes directly to the embedded signing or viewing process, bypassing the sending application and any authentication steps the sending application would use. In this case, DocuSign recommends that you use one of the normal DocuSign authentication features (Access Code, Phone Authentication, SMS Authentication, etc.) to verify the identity of the recipient.
    # 
    # If the `clientUserId` property is NOT set, and the `embeddedRecipientStartURL` is set, DocuSign will ignore the redirect URL and launch the standard signing process for the email recipient. Information can be appended to the embedded recipient start URL using merge fields. The available merge fields items are: `envelopeId`, `recipientId`, `recipientName`, `recipientEmail`, and `customFields`. The `customFields` property must be set for the recipient or envelope. The merge fields are enclosed in double brackets. 
    # 
    # *Example*: 
    # 
    # `http://senderHost/[[mergeField1]]/ beginSigningSession? [[mergeField2]]&[[mergeField3]]` 
    string embeddedRecipientStartURL?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # Specifies the documents that are not visible to this recipient. Document Visibility must be enabled for the account and the `enforceSignerVisibility` property must be set to **true** for the envelope to use this.
    # 
    # When enforce signer visibility is enabled, documents with tabs can only be viewed by signers that have a tab on that document. Recipients that have an administrative role (Agent, Editor, or Intermediaries) or informational role (Certified Deliveries or Carbon Copies) can always see all the documents in an envelope, unless they are specifically excluded using this setting when an envelope is sent. Documents that do not have tabs are always visible to all recipients, unless they are specifically excluded using this setting when an envelope is sent.
    string[] excludedDocuments?;
    # Reserved for DocuSign.
    string faxNumber?;
    # Metadata about a property.
    PropertyMetadata faxNumberMetadata?;
    # The recipient's first name. Maximum Length: 50 characters.
    string firstName?;
    # Metadata about a property.
    PropertyMetadata firstNameMetadata?;
    # Reserved for DocuSign.
    string fullName?;
    # Metadata about a property.
    PropertyMetadata fullNameMetadata?;
    # The name of the authentication check to use. This value must match one of the authentication types that the account uses. The names of these authentication types appear in the web console sending interface in the Identify list for a recipient. This setting overrides any default authentication setting. Valid values are:
    # 
    # - `Phone Auth $`: The recipient must authenticate by using two-factor authentication (2FA). You provide the phone number to use for 2FA in the `phoneAuthentication` object.
    # - `SMS Auth $`: The recipient must authenticate via SMS. You provide the phone number to use in the `smsAuthentication` object.
    # - `ID Check $`: The  recipient must answer detailed security questions. 
    # 
    # **Example:** Your account has ID Check and SMS Authentication available. In the web console Identify list, these appear as ID Check $ and SMS Auth $. To use ID Check in an envelope, the idCheckConfigurationName should be ID Check $. For SMS, you would use SMS Auth $, and you would also need to add a phone number to the smsAuthentication node.
    string idCheckConfigurationName?;
    # Metadata about a property.
    PropertyMetadata idCheckConfigurationNameMetadata?;
    # A complex element that contains input information related to a recipient ID check.
    IdCheckInformationInput idCheckInformationInput?;
    # Specifies ID Verification applied on an envelope by workflow ID.
    # See the [list](/docs/esign-rest-api/reference/accounts/identityverifications/list/)
    # method in the [IdentityVerifications](/docs/esign-rest-api/reference/accounts/identityverifications/) resource
    # for more information on how to retrieve workflow IDs available for an account.
    # This can be used in addition to other [recipient authentication](https://support.docusign.com/s/document-item?bundleId=gav1643676262430&topicId=kzp1578456318101.html) methods.
    RecipientIdentityVerification identityVerification?;
    # When **true** and the envelope recipient creates a DocuSign account after signing, the Manage Account Email Notification settings are used as the default settings for the recipient's account. 
    string inheritEmailNotificationConfiguration?;
    # Reserved for DocuSign.
    string isBulkRecipient?;
    # Metadata about a property.
    PropertyMetadata isBulkRecipientMetadata?;
    # The recipient's last name.
    string lastName?;
    # Metadata about a property.
    PropertyMetadata lastNameMetadata?;
    # Reserved for DocuSign.
    string lockedRecipientPhoneAuthEditable?;
    # Reserved for DocuSign.
    string lockedRecipientSmsEditable?;
    # The full legal name of the recipient. Maximum Length: 100 characters.
    # 
    # **Note:** You must always set a value for this property in requests, even if `firstName` and `lastName` are set.
    string name?;
    # Metadata about a property.
    PropertyMetadata nameMetadata?;
    # 
    string notaryId?;
    # 
    string notarySignerEmailSent?;
    # A note sent to the recipient in the signing email.
    # This note is unique to this recipient.
    # In the user interface,
    # it appears near the upper left corner
    # of the document
    # on the signing screen.
    # 
    # Maximum Length: 1000 characters.
    string note?;
    # Metadata about a property.
    PropertyMetadata noteMetadata?;
    # Reserved for DocuSign.
    OfflineAttributes offlineAttributes?;
    # A complex type that contains the elements:
    # 
    # * `recipMayProvideNumber`: A Boolean value that specifies whether the recipient can use the phone number of their choice.
    # * `senderProvidedNumbers`: A list of phone numbers that the recipient can use.
    # * `recordVoicePrint`: Reserved for DocuSign.
    # * `validateRecipProvidedNumber`: Reserved for DocuSign.
    RecipientPhoneAuthentication phoneAuthentication?;
    # Describes the recipient phone number.
    RecipientPhoneNumber phoneNumber?;
    # The proof file of the recipient. [ID Evidence](/docs/idevidence-api/) uses proof files to store the identification data that recipients submit when verifying their ID with [ID Verification](/docs/esign-rest-api/esign101/concepts/documents/)
    RecipientProofFile proofFile?;
    # Reserved for DocuSign.
    RecipientAttachment[] recipientAttachments?;
    # A complex element that contains information about a user's authentication status.
    AuthenticationStatus recipientAuthenticationStatus?;
    # Metadata about the features that are supported for the recipient type. This property is read-only.
    FeatureAvailableMetadata[] recipientFeatureMetadata?;
    # Unique for the recipient. It is used by the tab element to indicate which recipient is to sign the Document.
    string recipientId?;
    # The globally-unique identifier (GUID) for a specific recipient on a specific envelope. If the same recipient is associated with multiple envelopes, they will have a different GUID for each one. This property is read-only.
    string recipientIdGuid?;
    # The default signature provider is the DocuSign Electronic signature system. This parameter is used to specify one or more Standards Based Signature (digital signature) providers for the signer to use. [More information.](/docs/esign-rest-api/esign101/concepts/standards-based-signatures/)
    RecipientSignatureProvider[] recipientSignatureProviders?;
    # When **true,** specifies that the recipient creates the tabs.
    string recipientSuppliesTabs?;
    # The recipient type, as specified by the following values:
    # - `agent`: Agent recipients can add name and email information for recipients that appear after the agent in routing order.
    # - `carbonCopy`: Carbon copy recipients get a copy of the envelope but don't need to sign, initial, date, or add information to any of the documents. This type of recipient can be used in any routing order.
    # - `certifiedDelivery`: Certified delivery recipients must receive the completed documents for the envelope to be completed. They don't need to sign, initial, date, or add information to any of the documents.
    # - `editor`: Editors have the same management and access rights for the envelope as the sender. Editors can add name and email information, add or change the routing order, set authentication options, and can edit signature/initial tabs and data fields for the remaining recipients.
    # - `inPersonSigner`: In-person recipients are DocuSign users who act as signing hosts in the same physical location as the signer.
    # - `intermediaries`: Intermediary recipients can optionally add name and email information for recipients at the same or subsequent level in the routing order.
    # - `seal`: Electronic seal recipients represent legal entities.
    # - `signer`: Signers are recipients who must sign, initial, date, or add data to form fields on the documents in the envelope.
    # - `witness`: Witnesses are recipients whose signatures affirm that the identified signers have signed the documents in the envelope.
    string recipientType?;
    # Metadata about a property.
    PropertyMetadata recipientTypeMetadata?;
    # When **true,** the recipient is required to use the specified ID check method (including Phone and SMS authentication) to validate their identity. 
    string requireIdLookup?;
    # Metadata about a property.
    PropertyMetadata requireIdLookupMetadata?;
    # By default, DocuSign signers create electronic signatures. This field can be used to require the signer to use a SAFE-BioPharma digital certificate for signing.
    # 
    # This parameter should only be used to select a SAFE-BioPharma certificate. New integrations should use the `recipientSignatureProviders` parameter for other types of digital certificates. 
    # 
    # Set this parameter to `safe` to use a SAFE-BioPharma certificate.
    # 
    # The signer must be enrolled in the SAFE program to sign with a SAFE certificate.
    string requireSignerCertificate?;
    # When **true,** the signer must print, sign, and upload or fax the signed documents to DocuSign.
    string requireSignOnPaper?;
    # When **true,** the signer is required to upload a new signature, even if they have a pre-adopted signature in their personal DocuSign account.
    string requireUploadSignature?;
    # Optional element. Specifies the role name associated with the recipient.<br/><br/>This property is required when you are working with template recipients.
    string roleName?;
    # Specifies the routing order of the recipient in the envelope. 
    string routingOrder?;
    # Metadata about a property.
    PropertyMetadata routingOrderMetadata?;
    # The UTC DateTime when the envelope was sent. This property is read-only.
    string sentDateTime?;
    # Allows the sender to pre-specify the signature name, signature initials and signature font used in the signature stamp for the recipient.
    # 
    # Used only with recipient types In Person Signers and Signers.
    RecipientSignatureInformation signatureInfo?;
    # Reserved for DocuSign.
    string signedDateTime?;
    # When **true** and the feature is enabled in the sender's account, the signing recipient is required to draw signatures and initials at each signature/initial tab (instead of adopting a signature/initial style or only drawing a signature/initial once).
    string signInEachLocation?;
    # Metadata about a property.
    PropertyMetadata signInEachLocationMetadata?;
    # The ID of the [signing group](https://support.docusign.com/s/document-item?bundleId=gav1643676262430&topicId=zgn1578456447934.html).
    string signingGroupId?;
    # Metadata about a property.
    PropertyMetadata signingGroupIdMetadata?;
    # Optional. The name of the signing group. 
    # 
    # Maximum Length: 100 characters. 
    string signingGroupName?;
    # A complex type that contains information about users in the signing group.
    UserInfo[] signingGroupUsers?;
    # Contains the element senderProvidedNumbers which is an Array  of phone numbers the recipient can use for SMS text authentication.
    RecipientSMSAuthentication smsAuthentication?;
    # Deprecated.
    SocialAuthentication[] socialAuthentications?;
    # The recipient's status. This property is read-only. 
    # 
    # Valid values:
    # 
    # - `autoresponded`: The recipient's email system auto-responded to the email from DocuSign. This status is used in the web console to inform senders about the bounced-back email. This recipient status is only used if **Send-on-behalf-of** is turned off for the account.
    # - `completed`: The recipient has completed their actions (signing or other required actions if not a signer) for an envelope.
    # - `created`: The recipient is in a draft state. This value is only associated with draft envelopes (envelopes that have a status of `created`).
    # - `declined`: The recipient declined to sign the documents in the envelope.
    # - `delivered`: The recipient has viewed the documents in an envelope through the DocuSign signing website. This is not an email delivery of the documents in an envelope.
    # - `faxPending`: The recipient has finished signing and the system is waiting for a fax attachment from the recipient before completing their signing step.
    # - `sent`: The recipient has been sent an email notification that it is their turn to sign an envelope.
    # - `signed`: The recipient has completed (signed) all required tags in an envelope. This is a temporary state during processing, after which the recipient's status automatically switches to `completed`.
    string status?;
    # The code associated with the recipient's status. This property is read-only.
    string statusCode?;
    # When **true,** email notifications are suppressed for the recipient, and they must access envelopes and documents from their DocuSign inbox.
    string suppressEmails?;
    # All of the tabs associated with a recipient. Each property is a list of a type of tab.
    EnvelopeRecipientTabs tabs?;
    # When **true,** the sender cannot change any attributes of the recipient. Used only when working with template recipients. 
    string templateLocked?;
    # When **true,** the sender may not remove the recipient. Used only when working with template recipients.
    string templateRequired?;
    # The total number of tabs in the documents. This property is read-only.
    string totalTabCount?;
    # The ID of the user to access.
    # 
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    string userId?;
    # The `recipientId` of the person or party for whom the recipient is a witness.
    string witnessFor?;
    # Not used. Use the `witnessFor` property instead.
    string witnessForGuid?;
};

# A user authorizations to create or update.
public type UserAuthorizationCreateRequestWithId record {
    # 
    AuthorizationUser agentUser?;
    # The ID of the user authorization. This property is required to update an existing authorization.
    string authorizationId?;
    # The UTC DateTime to end the authorization. The default value is the max UTC value: `9999-12-31T23:59:59.0000000+00:00`.
    string endDate?;
    # The permission level to grant the agent. Valid values:
    # 
    # - `Send`
    # - `Manage`
    # - `Sign`
    # 
    # This property is required if you are creating a new authorization.
    string permission?;
    # The UTC DateTime to initiate the authorization. The default value is the current date and time.
    string startDate?;
};

# 
public type DocGenFormFieldValidation record {
    # 
    string errorMessage?;
    # 
    string expression?;
};

# Contains details about a signing group. Signing groups enable you to send an envelope to a predefined group of recipients and have any one member of the group sign your documents. When you send an envelope to a signing group, anyone in the group can open it and sign it with their own signature.
public type SigningGroup record {
    # The UTC DateTime when the signing group was created. This property is read-only.
    string created?;
    # The name of the user who created the signing group. This property is read-only.
    string createdBy?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The email address for the signing group. You can use a group email address to email all of the group members at the same time.
    string groupEmail?;
    # The name of the group.
    string groupName?;
    # The type of the group. The only valid value for this request is `sharedSigningGroup`.
    string groupType?;
    # The UTC DateTime when the signing group was last modified. This property is read-only.
    string modified?;
    # The user ID (GUID) of the user who last modified this user record. This property is read-only.
    string modifiedBy?;
    # The ID of the [signing group](https://support.docusign.com/s/document-item?bundleId=gav1643676262430&topicId=zgn1578456447934.html).
    string signingGroupId?;
    # User management information.
    SigningGroupUser[] users?;
};

# 
public type CustomFieldsEnvelope record {
    # An array of list custom fields.
    ListCustomField[] listCustomFields?;
    # An array of text custom fields.
    TextCustomField[] textCustomFields?;
};

# This object represents an item in a workspace, which can be either a file or folder.
public type WorkspaceItem record {
    # Provides properties that describe user authorization to a workspace.
    WorkspaceUserAuthorization callerAuthorization?;
    # If the item is a file, this property specifies the content type of the file.
    string contentType?;
    # The UTC DateTime when the workspace item was created.
    string created?;
    # The ID of the user who created the workspace item.
    string createdById?;
    # This object represents the workspace user. This property is only returned in response to user specific GET call. 
    WorkspaceUser createdByInformation?;
    # The file extension of a file item.
    string extension?;
    # The size of the file in bytes.
    string fileSize?;
    # The URI for retrieving the file.
    string fileUri?;
    # A unique ID for the Salesforce object.
    string id?;
    #  When **true,** the item is public.
    string isPublic?;
    # The UTC date and time that the comment was last updated.
    # 
    # **Note:** This can only be done by the creator.
    string lastModified?;
    # The ID of the user who last modified the item.
    string lastModifiedById?;
    # This object represents the workspace user. This property is only returned in response to user specific GET call. 
    WorkspaceUser lastModifiedByInformation?;
    # The name of the file or folder.
    string name?;
    # The number of pages in a file.
    string pageCount?;
    # The ID of the parent folder, or the special value `root` for the root folder.
    string parentFolderId?;
    # The URI of the parent folder.
    string parentFolderUri?;
    # A 64-byte, Secure Hash Algorithm 256 (SHA256) checksum that the caller computes across the entirety of the original content of a file. DocuSign compares this value to its own computation. If the two values are not equal, the original content and received content are not the same and the upload is refused.
    string sha256?;
    # The height of the thumbnail image.
    string thumbHeight?;
    # Description of a page of a document.
    Page thumbnail?;
    # The width of the thumbnail image.
    string thumbWidth?;
    # The type of the workspace item. Valid values are file, folder.
    string 'type?;
    # A URI containing the user ID.
    string uri?;
    # Provides properties that describe user authorization to a workspace.
    WorkspaceUserAuthorization userAuthorization?;
};

# Contains information about an agent recipient. An agent is a recipient who can add name and email information for recipients that appear after the agent in routing order.
public type Agent record {
    # If a value is provided, the recipient must enter the value as the access code to view and sign the envelope. 
    # 
    # Maximum Length: 50 characters and it must conform to the account's access code format setting.
    # 
    # If blank, but the signer `accessCode` property is set in the envelope, then that value is used.
    # 
    # If blank and the signer `accessCode` property is not set, then the access code is not required.
    string accessCode?;
    # Metadata about a property.
    PropertyMetadata accessCodeMetadata?;
    # Optional. When **true,** the access code will be added to the email sent to the recipient. This nullifies the security measure of `accessCode` on the recipient.
    string addAccessCodeToEmail?;
    # An array of additional notification objects.
    RecipientAdditionalNotification[] additionalNotifications?;
    # When **true,** if the recipient is locked on a template, advanced recipient routing can override the lock.
    string allowSystemOverrideForLockedRecipient?;
    # Error message provided by the destination email system. This field is only provided if the email notification to the recipient fails to send. This property is read-only.
    string autoRespondedReason?;
    # 
    string bulkSendV2Recipient?;
    # Specifies whether the recipient is embedded or remote. 
    # 
    # If the `clientUserId` property is not null then the recipient is embedded. Use this field to associate the signer with their userId in your app. Authenticating the user is the responsibility of your app when you use embedded signing.
    # 
    # If the `clientUserId` property is set and either `SignerMustHaveAccount` or `SignerMustLoginToSign` property of the account settings is set to  **true,** an error is generated on sending.
    # 
    # **Note:** This property is not returned by the [listStatusChanges](/docs/esign-rest-api/reference/envelopes/envelopes/liststatuschanges/) endpoint.
    # 
    # Maximum length: 100 characters. 
    string clientUserId?;
    # Indicates the number of times that the recipient has been through a signing completion for the envelope. If this number is greater than 0 for a signing group, only the user who previously completed may sign again. This property is read-only.
    string completedCount?;
    # 
    ConsentDetails[] consentDetailsList?;
    # An optional array of strings that allows the sender to provide custom data about the recipient. This information is returned in the envelope status but otherwise not used by DocuSign. Each customField string can be a maximum of 100 characters.
    string[] customFields?;
    # The date and time the recipient declined the document. This property is read-only.
    string declinedDateTime?;
    # The reason the recipient declined the document. This property is read-only.
    string declinedReason?;
    # The date and time that the envelope was delivered to the recipient. This property is read-only.
    string deliveredDateTime?;
    # The delivery method. One of:
    # 
    # - `email`
    # - `fax`
    # - `SMS`
    # - `WhatsApp`
    # - `offline`
    # 
    # The `SMS` and `WhatsApp` delivery methods
    # are limited to `signer`, `carbonCopy`, and `certifiedDelivery`
    # recipients.
    # 
    # **Related topics**
    # 
    # - [Using SMS delivery with the eSignature API][smsconcept]
    # - [How to request a signature by SMS delivery][howto]
    # 
    # [smsconcept]: /docs/esign-rest-api/esign101/concepts/sms-delivery/using-sms-esignature/
    # [howto]: /docs/esign-rest-api/how-to/request-signature-sms/
    string deliveryMethod?;
    # Metadata about a property.
    PropertyMetadata deliveryMethodMetadata?;
    # Reserved for DocuSign.
    string designatorId?;
    # Reserved for DocuSign.
    string designatorIdGuid?;
    # A list of `documentVisibility` objects. Each object in the list specifies whether a document in the envelope is visible to this recipient. For the envelope to use this functionality, Document Visibility must be enabled for the account and the `enforceSignerVisibility` property must be set to **true.**
    DocumentVisibility[] documentVisibility?;
    # The email ID of the agent. Notification of the document to sign is sent to this email id. 
    # 
    # Maximum length: 100 characters. 
    string email?;
    # Metadata about a property.
    PropertyMetadata emailMetadata?;
    # Sets custom email subject and email body for individual
    # recipients. **Note:** You must explicitly set `supportedLanguage`
    # if you use this feature.
    RecipientEmailNotification emailNotification?;
    # 
    string emailRecipientPostSigningURL?;
    # Specifies a sender-provided valid URL string for redirecting an embedded recipient. When using this option, the embedded recipient still receives an email from DocuSign, just as a remote recipient would. When the document link in the email is clicked the recipient is redirected, through DocuSign, to the supplied URL to complete their actions. When routing to the URL, the sender's system (the server responding to the URL) must request a recipient token to launch a signing session. 
    # 
    # When `SIGN_AT_DOCUSIGN`, the recipient is directed to an embedded signing or viewing process directly at DocuSign. The signing or viewing action is initiated by the DocuSign system and the transaction activity and Certificate of Completion records will reflect this. In all other ways the process is identical to an embedded signing or viewing operation launched by a partner.
    # 
    # It is important to understand that in a typical embedded workflow, the authentication of an embedded recipient is the responsibility of the sending application. DocuSign expects that senders will follow their own processes for establishing the recipient's identity. In this workflow the recipient goes through the sending application before the embedded signing or viewing process is initiated. However, when the sending application sets `EmbeddedRecipientStartURL=SIGN_AT_DOCUSIGN`, the recipient goes directly to the embedded signing or viewing process, bypassing the sending application and any authentication steps the sending application would use. In this case, DocuSign recommends that you use one of the normal DocuSign authentication features (Access Code, Phone Authentication, SMS Authentication, etc.) to verify the identity of the recipient.
    # 
    # If the `clientUserId` property is NOT set, and the `embeddedRecipientStartURL` is set, DocuSign will ignore the redirect URL and launch the standard signing process for the email recipient. Information can be appended to the embedded recipient start URL using merge fields. The available merge fields items are: `envelopeId`, `recipientId`, `recipientName`, `recipientEmail`, and `customFields`. The `customFields` property must be set for the recipient or envelope. The merge fields are enclosed in double brackets. 
    # 
    # *Example*: 
    # 
    # `http://senderHost/[[mergeField1]]/ beginSigningSession? [[mergeField2]]&[[mergeField3]]` 
    string embeddedRecipientStartURL?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # Specifies the documents that are not visible to this recipient. Document Visibility must be enabled for the account and the `enforceSignerVisibility` property must be set to **true** for the envelope to use this.
    # 
    # When enforce signer visibility is enabled, documents with tabs can only be viewed by signers that have a tab on that document. Recipients that have an administrative role (Agent, Editor, or Intermediaries) or informational role (Certified Deliveries or Carbon Copies) can always see all the documents in an envelope, unless they are specifically excluded using this setting when an envelope is sent. Documents that do not have tabs are always visible to all recipients, unless they are specifically excluded using this setting when an envelope is sent.
    string[] excludedDocuments?;
    # Reserved for DocuSign.
    string faxNumber?;
    # Metadata about a property.
    PropertyMetadata faxNumberMetadata?;
    # The recipient's first name. Maximum Length: 50 characters.
    string firstName?;
    # Metadata about a property.
    PropertyMetadata firstNameMetadata?;
    # Reserved for DocuSign.
    string fullName?;
    # Metadata about a property.
    PropertyMetadata fullNameMetadata?;
    # The name of the authentication check to use. This value must match one of the authentication types that the account uses. The names of these authentication types appear in the web console sending interface in the Identify list for a recipient. This setting overrides any default authentication setting. Valid values are:
    # 
    # - `Phone Auth $`: The recipient must authenticate by using two-factor authentication (2FA). You provide the phone number to use for 2FA in the `phoneAuthentication` object.
    # - `SMS Auth $`: The recipient must authenticate via SMS. You provide the phone number to use in the `smsAuthentication` object.
    # - `ID Check $`: The  recipient must answer detailed security questions. 
    # 
    # **Example:** Your account has ID Check and SMS Authentication available. In the web console Identify list, these appear as ID Check $ and SMS Auth $. To use ID Check in an envelope, the idCheckConfigurationName should be ID Check $. For SMS, you would use SMS Auth $, and you would also need to add a phone number to the smsAuthentication node.
    string idCheckConfigurationName?;
    # Metadata about a property.
    PropertyMetadata idCheckConfigurationNameMetadata?;
    # A complex element that contains input information related to a recipient ID check.
    IdCheckInformationInput idCheckInformationInput?;
    # Specifies ID Verification applied on an envelope by workflow ID.
    # See the [list](/docs/esign-rest-api/reference/accounts/identityverifications/list/)
    # method in the [IdentityVerifications](/docs/esign-rest-api/reference/accounts/identityverifications/) resource
    # for more information on how to retrieve workflow IDs available for an account.
    # This can be used in addition to other [recipient authentication](https://support.docusign.com/s/document-item?bundleId=gav1643676262430&topicId=kzp1578456318101.html) methods.
    RecipientIdentityVerification identityVerification?;
    # When **true** and the envelope recipient creates a DocuSign account after signing, the Manage Account Email Notification settings are used as the default settings for the recipient's account. 
    string inheritEmailNotificationConfiguration?;
    # The recipient's last name.
    string lastName?;
    # Metadata about a property.
    PropertyMetadata lastNameMetadata?;
    # Reserved for DocuSign.
    string lockedRecipientPhoneAuthEditable?;
    # Reserved for DocuSign.
    string lockedRecipientSmsEditable?;
    # The full legal name of the recipient. Maximum Length: 100 characters.
    # 
    # **Note:** You must always set a value for this property in requests, even if `firstName` and `lastName` are set.
    string name?;
    # Metadata about a property.
    PropertyMetadata nameMetadata?;
    # A note sent to the recipient in the signing email.
    # This note is unique to this recipient.
    # In the user interface,
    # it appears near the upper left corner
    # of the document
    # on the signing screen.
    # 
    # Maximum Length: 1000 characters.
    string note?;
    # Metadata about a property.
    PropertyMetadata noteMetadata?;
    # A complex type that contains the elements:
    # 
    # * `recipMayProvideNumber`: A Boolean value that specifies whether the recipient can use the phone number of their choice.
    # * `senderProvidedNumbers`: A list of phone numbers that the recipient can use.
    # * `recordVoicePrint`: Reserved for DocuSign.
    # * `validateRecipProvidedNumber`: Reserved for DocuSign.
    RecipientPhoneAuthentication phoneAuthentication?;
    # Describes the recipient phone number.
    RecipientPhoneNumber phoneNumber?;
    # Reserved for DocuSign.
    RecipientAttachment[] recipientAttachments?;
    # A complex element that contains information about a user's authentication status.
    AuthenticationStatus recipientAuthenticationStatus?;
    # Metadata about the features that are supported for the recipient type. This property is read-only.
    FeatureAvailableMetadata[] recipientFeatureMetadata?;
    # A local reference used to map
    # recipients to other objects, such as specific
    # document tabs.
    # 
    # A `recipientId` must be
    # either an integer or a GUID,
    # and the `recipientId` must be
    # unique within an envelope.
    # 
    # For example, many envelopes assign the first recipient
    # a `recipientId` of `1`.
    string recipientId?;
    # The globally-unique identifier (GUID) for a specific recipient on a specific envelope. If the same recipient is associated with multiple envelopes, they will have a different GUID for each one. This property is read-only.
    string recipientIdGuid?;
    # The recipient type, as specified by the following values:
    # - `agent`: Agent recipients can add name and email information for recipients that appear after the agent in routing order.
    # - `carbonCopy`: Carbon copy recipients get a copy of the envelope but don't need to sign, initial, date, or add information to any of the documents. This type of recipient can be used in any routing order.
    # - `certifiedDelivery`: Certified delivery recipients must receive the completed documents for the envelope to be completed. They don't need to sign, initial, date, or add information to any of the documents.
    # - `editor`: Editors have the same management and access rights for the envelope as the sender. Editors can add name and email information, add or change the routing order, set authentication options, and can edit signature/initial tabs and data fields for the remaining recipients.
    # - `inPersonSigner`: In-person recipients are DocuSign users who act as signing hosts in the same physical location as the signer.
    # - `intermediaries`: Intermediary recipients can optionally add name and email information for recipients at the same or subsequent level in the routing order.
    # - `seal`: Electronic seal recipients represent legal entities.
    # - `signer`: Signers are recipients who must sign, initial, date, or add data to form fields on the documents in the envelope.
    # - `witness`: Witnesses are recipients whose signatures affirm that the identified signers have signed the documents in the envelope.
    string recipientType?;
    # Metadata about a property.
    PropertyMetadata recipientTypeMetadata?;
    # When **true,** the recipient is required to use the specified ID check method (including Phone and SMS authentication) to validate their identity. 
    string requireIdLookup?;
    # Metadata about a property.
    PropertyMetadata requireIdLookupMetadata?;
    # Optional element. Specifies the role name associated with the recipient.<br/><br/>This property is required when you are working with template recipients.
    string roleName?;
    # Specifies the routing order of the recipient in the envelope. 
    string routingOrder?;
    # Metadata about a property.
    PropertyMetadata routingOrderMetadata?;
    # The UTC DateTime when the envelope was sent. This property is read-only.
    string sentDateTime?;
    # Reserved for DocuSign.
    string signedDateTime?;
    # The ID of the [signing group](https://support.docusign.com/s/document-item?bundleId=gav1643676262430&topicId=zgn1578456447934.html).
    string signingGroupId?;
    # Metadata about a property.
    PropertyMetadata signingGroupIdMetadata?;
    # Optional. The name of the signing group. 
    # 
    # Maximum Length: 100 characters. 
    string signingGroupName?;
    # A complex type that contains information about users in the signing group.
    UserInfo[] signingGroupUsers?;
    # Contains the element senderProvidedNumbers which is an Array  of phone numbers the recipient can use for SMS text authentication.
    RecipientSMSAuthentication smsAuthentication?;
    # Deprecated.
    SocialAuthentication[] socialAuthentications?;
    # The recipient's status. This property is read-only. 
    # 
    # Valid values:
    # 
    # - `autoresponded`: The recipient's email system auto-responded to the email from DocuSign. This status is used in the web console to inform senders about the bounced-back email. This recipient status is only used if **Send-on-behalf-of** is turned off for the account.
    # - `completed`: The recipient has completed their actions (signing or other required actions if not a signer) for an envelope.
    # - `created`: The recipient is in a draft state. This value is only associated with draft envelopes (envelopes that have a status of `created`).
    # - `declined`: The recipient declined to sign the documents in the envelope.
    # - `delivered`: The recipient has viewed the documents in an envelope through the DocuSign signing website. This is not an email delivery of the documents in an envelope.
    # - `faxPending`: The recipient has finished signing and the system is waiting for a fax attachment from the recipient before completing their signing step.
    # - `sent`: The recipient has been sent an email notification that it is their turn to sign an envelope.
    # - `signed`: The recipient has completed (signed) all required tags in an envelope. This is a temporary state during processing, after which the recipient's status automatically switches to `completed`.
    string status?;
    # The code associated with the recipient's status. This property is read-only.
    string statusCode?;
    # When **true,** email notifications are suppressed for the recipient, and they must access envelopes and documents from their DocuSign inbox.
    string suppressEmails?;
    # When **true,** the sender cannot change any attributes of the recipient. Used only when working with template recipients. 
    string templateLocked?;
    # When **true,** the sender may not remove the recipient. Used only when working with template recipients.
    string templateRequired?;
    # The total number of tabs in the documents. This property is read-only.
    string totalTabCount?;
    # The ID of the user to access.
    # 
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    string userId?;
};

# 
public type ResourceInformation record {
    # 
    NameValue[] resources?;
};

# A DocuSign workspace is a collaboration area for sharing files and data.
public type Workspaces record {
    # The ID of the account to bill.
    string billableAccountId?;
    # This object represents the workspace user. This property is only returned in response to user specific GET call. 
    WorkspaceUser callerInformation?;
    # The UTC DateTime when the workspace user authorization was created.
    string created?;
    # This object represents the workspace user. This property is only returned in response to user specific GET call. 
    WorkspaceUser createdByInformation?;
    # Utc date and time the comment was last updated (can only be done by creator.)
    string lastModified?;
    # This object represents the workspace user. This property is only returned in response to user specific GET call. 
    WorkspaceUser lastModifiedByInformation?;
    # This object provides information about the settings for the workspace.
    WorkspaceSettings settings?;
    # The status of the workspace. Valid values are:
    # 
    # - `active`
    # - `closed`
    string status?;
    # The relative URL for accessing the workspace.
    string workspaceBaseUrl?;
    # Text describing the purpose of the workspace.
    string workspaceDescription?;
    # The ID of the workspace, always populated.
    string workspaceId?;
    # The name of the workspace.
    string workspaceName?;
    # The relative URI for accessing the workspace.
    string workspaceUri?;
};

# This object contains information about the envelope or template that you want to send in bulk.
public type BulkSendRequest record {
    # The human-readable name of the batch. If you do not set this value, it defaults to the `name` property of the `bulkSendingList` object.
    string batchName?;
    # The GUID of the envelope or template that you want to send in bulk.
    string envelopeOrTemplateId?;
};

# Contains account settings information. Used in requests to set property values. Used in responses to report property values.
public type AccountSettingsInformation record {
    # Object specifying the format of the string provided to a recipient in order to access an envelope.
    AccessCodeFormat accessCodeFormat?;
    # UTC date/time format for the account.
    string accountDateTimeFormat?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata accountDateTimeFormatMetadata?;
    # 
    string accountDefaultLanguage?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata accountDefaultLanguageMetadata?;
    # The name on the account.
    string accountName?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata accountNameMetadata?;
    # A complex element that specifies notifications (expirations and reminders) for the envelope.
    AccountNotification accountNotification?;
    # An object that defines the options that are available to non-administrators in the UI.
    AccountUISettings accountUISettings?;
    # When **true,** [Signature Adoption Configuration](https://support.docusign.com/s/document-item?bundleId=pik1583277475390&topicId=dsz1583277358168.html) is enabled. 
    # 
    # **Note:** Only Admin users can change this setting.
    string adoptSigConfig?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata adoptSigConfigMetadata?;
    # When **true,** the Advanced Correction feature is enabled for this account.
    string advancedCorrect?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata advancedCorrectMetadata?;
    # 
    string advancedSearchEnableTabField?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata advancedSearchEnableTabFieldMetadata?;
    # 
    string advancedSearchEnableTemplateIdField?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata advancedSearchEnableTemplateIdFieldMetadata?;
    # 
    string advancedSearchEnableTemplateNameField?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata advancedSearchEnableTemplateNameFieldMetadata?;
    # When **true,** the configured [Access Code Format](/docs/esign-rest-api/reference/accounts/accounts/get/#accessCodeFormat) page is enabled for account administrators.
    # 
    # **Note:** Only Admin users can change this setting.
    string allowAccessCodeFormat?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowAccessCodeFormatMetadata?;
    # When **true,** the account can be managed on a per-user basis.
    # 
    # **Note:** Only Admin users can change this setting.
    string allowAccountManagementGranular?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowAccountManagementGranularMetadata?;
    # Boolean that specifies whether member names can be changed in the account.
    string allowAccountMemberNameChange?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowAccountMemberNameChangeMetadata?;
    # 
    string allowACE?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowACEMetadata?;
    # When **true,** [Conditional Routing](https://support.docusign.com/s/document-item?bundleId=gav1643676262430&topicId=aqm1578456487908.html) is enabled for the account as part of DocuSign's Advanced Recipient Routing feature.
    string allowAdvancedRecipientRoutingConditional?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowAdvancedRecipientRoutingConditionalMetadata?;
    #   When **true,** an agent recipient can change the email addresses of recipients later in the signing order.
    string allowAgentNameEmailEdit?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowAgentNameEmailEditMetadata?;
    # 
    string allowAgreementActions?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowAgreementActionsMetadata?;
    # 
    string allowAgreementOrchestrations?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowAgreementOrchestrationsMetadata?;
    #   When **true,** auto-navigation can be enabled for this account.
    string allowAutoNavSettings?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowAutoNavSettingsMetadata?;
    #  When **true,** auto-tagging is enabled for the account.
    string allowAutoTagging?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowAutoTaggingMetadata?;
    # When **true,** bulk send functionality is enabled for the account.
    # 
    # **Note:** Only Admin users can change this setting.
    string allowBulkSend?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowBulkSendMetadata?;
    # When **true,** indicates that the customer can withdraw their consent to the consumer disclosure when they decline to sign documents. If these recipients sign documents sent to them from your account in the future, they will be required to agree to the terms in the disclosure. The default value is **false.**
    # **Note:** Only Admin users can change this setting.
    string allowCDWithdraw?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowCDWithdrawMetadata?;
    # Boolean that specifies whether a Connect configuration can use HTTP listeners.
    string allowConnectHttpListenerConfigs?;
    # 
    string AllowConnectIdentityVerificationUI?;
    # 
    string allowConnectOAuthUI?;
    # Reserved for DocuSign.
    string allowConnectSendFinishLater?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowConnectSendFinishLaterMetadata?;
    # 
    string allowConnectUnifiedPayloadUI?;
    # When **true,**
    # the account has the ability to change the
    # [Consumer Disclosure](https://support.docusign.com/s/document-item?bundleId=pik1583277475390&topicId=aqg1583277336549.html)
    # setting.
    string allowConsumerDisclosureOverride?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowConsumerDisclosureOverrideMetadata?;
    # When **true,** senders can download form data from the envelopes that they send.
    # 
    # **Note:** Only Admin users can change this setting.
    string allowDataDownload?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowDataDownloadMetadata?;
    # "true" if the account has permission to use the scheduled sending feature to send envelopes at a specified datetime in the future, "false" otherwise.
    string allowDelayedRouting?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowDelayedRoutingMetadata?;
    # 
    string allowDelegatedSigning?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowDelegatedSigningMetadata?;
    # 
    string allowDocGenDocuments?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowDocGenDocumentsMetadata?;
    # Boolean that specifies whether disclosure documents can be included in envelopes.
    string allowDocumentDisclosures?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowDocumentDisclosuresMetadata?;
    # Boolean that specifies whether notifications can include the envelope's signed document.
    string allowDocumentsOnSignedEnvelopes?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowDocumentsOnSignedEnvelopesMetadata?;
    # When **true,** the [Document Visibility](https://support.docusign.com/guides/ndse-user-guide-document-visibility) feature is enabled for the account.
    string allowDocumentVisibility?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowDocumentVisibilityMetadata?;
    # 
    string allowEditingEnvelopesOnBehalfOfOthers?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowEditingEnvelopesOnBehalfOfOthersMetadata?;
    # When **true,**
    # [eHanko stamps](https://support.docusign.com/s/document-item?bundleId=jux1643235969954&topicId=dys1578456666697.html)
    # are enabled.
    string allowEHankoStamps?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowEHankoStampsMetadata?;
    # Specifies whether eNote eOriginal integration is enabled.
    string allowENoteEOriginal?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowENoteEOriginalMetadata?;
    # When **true,** the envelope correction feature is enabled.
    # 
    # **Note:** Only Admin users can change this setting.
    string allowEnvelopeCorrect?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowEnvelopeCorrectMetadata?;
    # Specifies whether the account is able to
    # manage rules that [transfer ownership](https://support.docusign.com/s/document-item?bundleId=pik1583277475390&topicId=xqx1583277378404.html)
    # of envelopes within the same account.
    string allowEnvelopeCustodyTransfer?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowEnvelopeCustodyTransferMetadata?;
    # Specifies whether
    # [envelope custom fields](https://support.docusign.com/s/document-item?bundleId=jux1643235969954&topicId=mns1578456285568.html)
    # are enabled.
    string allowEnvelopeCustomFields?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowEnvelopeCustomFieldsMetadata?;
    # When **true,** envelope publishing reporting is enabled.
    # 
    # **Note:** Only Admin users can change this setting.
    string allowEnvelopePublishReporting?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowEnvelopePublishReportingMetadata?;
    # Specifies whether the account has access to reports.
    string allowEnvelopeReporting?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowEnvelopeReportingMetadata?;
    # If the account plan does not include calculated fields, this setting allows an account to use them.
    string allowExpression?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowExpressionMetadata?;
    # When **true,** signers are required to use Express Digital Signatures.
    # 
    # **Note:** Only Admin users can change this setting.
    string allowExpressSignerCertificate?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowExpressSignerCertificateMetadata?;
    # Boolean that specifies whether resource files can be used for extended sending.
    string allowExtendedSendingResourceFile?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowExtendedSendingResourceFileMetadata?;
    # 
    string allowExternalLinkedAccounts?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowExternalLinkedAccountsMetadata?;
    # When **true,** the account can
    # configure and use signature pads for their recipients.
    # 
    # **Note:** Only Admin users can change this setting.
    string allowExternalSignaturePad?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowExternalSignaturePadMetadata?;
    # 
    string allowIDVForEUQualifiedSignatures?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowIDVForEUQualifiedSignaturesMetadata?;
    # When **true,** IDV Level 1 is allowed. The default value is **false.**
    string allowIDVLevel1?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowIDVLevel1Metadata?;
    # 
    string allowIDVLevel1Trial?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowIDVLevel1TrialMetadata?;
    # 
    string allowIDVLevel2?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowIDVLevel2Metadata?;
    # 
    string allowIDVLevel3?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowIDVLevel3Metadata?;
    # 
    string allowIDVPlatform?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowIDVPlatformMetadata?;
    # When **true,** the account administrator can enable in-person signing.
    # 
    # **Note:** Only SysAdmin users can change this setting.
    string allowInPerson?;
    # Account-level flag that determines the ability to perform In-Person Electronic Notary (IPEN) actions.
    string allowInPersonElectronicNotary?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowInPersonElectronicNotaryMetadata?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowInPersonMetadata?;
    # When **true,** [Managed Stamps](https://support.docusign.com/s/document-item?bundleId=pik1583277475390&topicId=cex1583277417267.html) are enabled.
    string allowManagedStamps?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowManagedStampsMetadata?;
    # 
    string allowManagingEnvelopesOnBehalfOfOthers?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowManagingEnvelopesOnBehalfOfOthersMetadata?;
    # When **true,** the Document Markup feature is enabled.
    # 
    # **Note:**  To use this feature, Document Markup must be enabled at both the account and envelope levels. Only Admin users can change this setting at the account level.
    string allowMarkup?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowMarkupMetadata?;
    # When **true,** account users can set their own
    # [time zone settings](https://support.docusign.com/s/articles/How-do-I-modify-time-zone-settings-for-my-account).
    # 
    # **Note:** Only Admin users can change this setting.
    string allowMemberTimeZone?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowMemberTimeZoneMetadata?;
    # When **true,** the account can use
    # [merge fields](https://support.docusign.com/s/document-item?bundleId=evk1581360654067&topicId=ipy1581360621906.html)
    # with DocuSign for Salesforce.
    string allowMergeFields?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowMergeFieldsMetadata?;
    # Specifies whether the account supports multiple brands.
    string allowMultipleBrandProfiles?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowMultipleBrandProfilesMetadata?;
    # When **true,** recipients can
    # upload multiple signer attachments with a single attachment.
    # 
    # **Note:** Only Admin users can change this setting.
    string allowMultipleSignerAttachments?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowMultipleSignerAttachmentsMetadata?;
    # Specifies whether users can use
    # international numbers
    # for phone authentication.
    string allowNonUSPhoneAuth?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowNonUSPhoneAuthMetadata?;
    # 
    string allowOcrOfEnvelopeDocuments?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowOcrOfEnvelopeDocumentsMetadata?;
    # When **true,**
    # [offline signing](https://support.docusign.com/articles/Offline-access-with-the-DocuSign-Mobile-App-for-iOS-iPad-iPhone-iPod-Touch)
    # is enabled for the account.
    # 
    # **Note:** Only Admin users can change this setting.
    string allowOfflineSigning?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowOfflineSigningMetadata?;
    # When **true,** senders can use OpenTrust signer certificates.
    # 
    # **Note:** Only Admin users can change this setting.
    string allowOpenTrustSignerCertificate?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowOpenTrustSignerCertificateMetadata?;
    # 
    string allowOrganizationDocusignMonitor?;
    # 
    string allowOrganizationDocusignMonitorFree?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowOrganizationDocusignMonitorFreeMetadata?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowOrganizationDocusignMonitorMetadata?;
    # 
    string allowOrganizationDomainUserManagement?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowOrganizationDomainUserManagementMetadata?;
    # Boolean that specifies whether [DocuSign Admin](/docs/admin-api/) is enabled for the account.
    string allowOrganizations?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowOrganizationsMetadata?;
    # 
    string allowOrganizationSsoManagement?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowOrganizationSsoManagementMetadata?;
    # Organization-level flag that determines the ability to perform In-Person Electronic Notary (IPEN) actions.
    string allowOrganizationToUseInPersonElectronicNotary?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowOrganizationToUseInPersonElectronicNotaryMetadata?;
    # 
    string allowOrganizationToUseRemoteNotary?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowOrganizationToUseRemoteNotaryMetadata?;
    # Org level flag that determines the availability to perform Third Party Notary (3PN) actions.
    string allowOrganizationToUseThirdPartyElectronicNotary?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowOrganizationToUseThirdPartyElectronicNotaryMetadata?;
    # 
    string allowParticipantRecipientType?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowParticipantRecipientTypeMetadata?;
    # When **true,** payment processing is enabled for the account.
    # 
    # **Note:** Only Admin users can change this setting.
    string allowPaymentProcessing?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowPaymentProcessingMetadata?;
    # 
    string allowPerformanceAnalytics?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowPerformanceAnalyticsMetadata?;
    # Boolean that specifies whether phone authentication is enabled for the account.
    string allowPhoneAuthentication?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowPhoneAuthenticationMetadata?;
    # Boolean that specifies whether users can override phone authentication.
    string allowPhoneAuthOverride?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowPhoneAuthOverrideMetadata?;
    # Reserved for DocuSign. This property returns the value **false** when listing account settings. This property is read-only.
    string allowPrivateSigningGroups?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowPrivateSigningGroupsMetadata?;
    # 
    string allowRecipientConnect?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowRecipientConnectMetadata?;
    # When **true,**
    # an account administrator can to turn on reminders
    # and expiration defaults for the account.
    # 
    # **Note:** Only Admin users can change this setting.
    string allowReminders?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowRemindersMetadata?;
    # 
    string allowRemoteNotary?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowRemoteNotaryMetadata?;
    # When **true,**
    # resource files can be uploaded in branding.
    string allowResourceFileBranding?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowResourceFileBrandingMetadata?;
    # When **true,**
    # account administrators can
    # specify that signers are
    # required to use SAFE-BioPharma digital signatures.
    # 
    # **Note:** Only Admin users can change this setting.
    string allowSafeBioPharmaSignerCertificate?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowSafeBioPharmaSignerCertificateMetadata?;
    # "true" if the account has permission to use the scheduled sending feature to send envelopes at a specified datetime in the future, "false" otherwise.
    string allowScheduledSending?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowScheduledSendingMetadata?;
    # Boolean that specifies whether a DocuSign Signature Appliance can be used with the account.
    string allowSecurityAppliance?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowSecurityApplianceMetadata?;
    # 
    string allowSendingEnvelopesOnBehalfOfOthers?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowSendingEnvelopesOnBehalfOfOthersMetadata?;
    # When **true,**
    # the account admin can enable the
    # Send to Certified Delivery
    # feature on the account.
    string allowSendToCertifiedDelivery?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowSendToCertifiedDeliveryMetadata?;
    # When **true,**
    # the account admin can enable the Send to Intermediary
    # feature on the account.
    string allowSendToIntermediary?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowSendToIntermediaryMetadata?;
    # When **true,**
    # the account can use templates.
    string allowServerTemplates?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowServerTemplatesMetadata?;
    # 
    string allowSetEmbeddedRecipientStartURL?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowSetEmbeddedRecipientStartURLMetadata?;
    # When **true,**
    # shared tabs are enabled for the account.
    # 
    # **Note:** Only Admin users can change this setting.
    string allowSharedTabs?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowSharedTabsMetadata?;
    # When **true,** Signature Stamps are enabled.
    # 
    # **Note:** Only Admin users can change this setting.
    string allowSignatureStamps?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowSignatureStampsMetadata?;
    # When **true,** recipients can sign documents from the home page.
    # 
    # **Note:** Only Admin users can change this setting.
    string allowSignDocumentFromHomePage?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowSignDocumentFromHomePageMetadata?;
    # When **true,** the recipient of an envelope sent from this account can reassign it to another person.
    # 
    # **Note:** Only Admin users can change this setting.
    string allowSignerReassign?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowSignerReassignMetadata?;
    # When **true,** an account administrator can override the ability of an envelope recipient to reassign it to another person.
    # 
    # **Note:** Only Admin users can change this setting.
    string allowSignerReassignOverride?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowSignerReassignOverrideMetadata?;
    # Boolean that specifies whether Signing and App Extensions are allowed.
    string allowSigningExtensions?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowSigningExtensionsMetadata?;
    # When **true,** the account allows signing groups. This setting is only shown in responses that list account settings. This property is read-only.
    string allowSigningGroups?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowSigningGroupsMetadata?;
    # 
    string allowSigningInsights?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowSigningInsightsMetadata?;
    # Boolean that specifies whether the account supports radio buttons on tabs [Radio CustomTabType](/docs/esign-soap-api/reference/sending-group/tab/).
    string allowSigningRadioDeselect?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowSigningRadioDeselectMetadata?;
    # When **true,**
    # the account administrator can enable
    # the Sign Now feature.
    string allowSignNow?;
    # Metadata that indicates whether the `allowSignNow` property is editable.
    string allowSignNowMetadata?;
    # 
    string allowSMSDelivery?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowSMSDeliveryMetadata?;
    # Deprecated.
    string allowSocialIdLogin?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowSocialIdLoginMetadata?;
    # When **true,** this user can include supplemental documents.
    string allowSupplementalDocuments?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowSupplementalDocumentsMetadata?;
    # Account level flag that determines the availability to perform Third Party Notary (3PN) actions.
    string allowThirdPartyElectronicNotary?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowThirdPartyElectronicNotaryMetadata?;
    # 
    string allowTransactionsWorkspace?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowTransactionsWorkspaceMetadata?;
    # 
    string allowTransactionsWorkspaceOriginal?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowTransactionsWorkspaceOriginalMetadata?;
    # 
    string allowUsersToAccessDirectory?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowUsersToAccessDirectoryMetadata?;
    # 
    string allowValueInsights?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowValueInsightsMetadata?;
    # 
    string allowWebForms?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowWebFormsMetadata?;
    # 
    string allowWhatsAppDelivery?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowWhatsAppDeliveryMetadata?;
    # This property determines how template anchor tabs are applied.
    # 
    # Valid values are:
    # 
    # - `document`: Anchor tabs are applied only to the document that you specify. 
    # - `envelope`: Anchor tabs are applied to all of the documents in the envelope associated with the template.
    # 
    # **Note:** When you are using the `anchorPopulationScope` property with a Composite Template, the value `document` is supported only with a single server template and a single inline template.
    string anchorPopulationScope?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata anchorPopulationScopeMetadata?;
    # Reserved for DocuSign.
    string anchorTagVersionedPlacementEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata anchorTagVersionedPlacementMetadataEnabled?;
    # When **true,** envelope documents are included as a PDF file attachment to "signing completed" emails.
    # 
    # **Note:** Only SysAdmin users can change this setting.
    string attachCompletedEnvelope?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata attachCompletedEnvelopeMetadata?;
    # Sets when authentication checks are applied for recipient envelope access. This setting only applies to the following ID checks: 
    # 
    # - Phone Authentication
    # - SMS Authentication
    # - Knowledge-Based ID
    # 
    # This setting takes one of the following options: 
    # 
    # - `initial_access`: The authentication check always applies the first time a recipient accesses the documents. Recipients are not asked to authenticate again when they access the documents from the same browser on the same device. If the recipient attempts to access the documents from a different browser or a different device, the recipient must pass authentication again. Once authenticated, that recipient is not challenged again on the new device or browser. The ability for a recipient to skip authentication for documents is limited to documents sent from the same sending account.
    # - `each_access`: Authentication checks apply every time a recipient attempts to access the envelope. However, you can configure the Authentication Expiration setting to allow recipients to skip authentication when they have recently passed authentication by setting a variable time frame.
    # 
    # **Note:** Only Admin users can change this setting.
    string authenticationCheck?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata authenticationCheckMetadata?;
    # Specifies how auto-navigation works.
    # Valid values are:
    # 
    # - `off`
    # - `required_fields`
    # - `required_and_blank_fields`
    # - `all_fields`
    # - `page_then_required_fields`
    # - `page_then_required_and_blank_fields`
    # - `page_then_all_fields`
    string autoNavRule?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata autoNavRuleMetadata?;
    # Boolean that specifies whether to automatically provision a user membership in the account for accountless recipients. (Also known as Just-in-Time provisioning.)
    string autoProvisionSignerAccount?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata autoProvisionSignerAccountMetadata?;
    # Boolean that specifies whether BCC for Email Archive is enabled for the account. BCC for Email Archive allows you to set up an archive email address so that a BCC copy of an envelope is sent only to that address.
    string bccEmailArchive?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata bccEmailArchiveMetadata?;
    # Reserved for DocuSign.
    string betaSwitchConfiguration?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata betaSwitchConfigurationMetadata?;
    # Contains address information.
    AddressInformation billingAddress?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata billingAddressMetadata?;
    # When **true,** this user can use the bulk send feature for the account.
    string bulkSend?;
    # 
    string bulkSendActionResendLimit?;
    # 
    string bulkSendMaxCopiesInBatch?;
    # 
    string bulkSendMaxUnprocessedEnvelopesCount?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata bulkSendMetadata?;
    # When **true,** account administrators can self-brand their sending console through the DocuSign console.
    string canSelfBrandSend?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canSelfBrandSendMetadata?;
    # When **true,** account administrators can self-brand their signing console through the DocuSign console.
    string canSelfBrandSign?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canSelfBrandSignMetadata?;
    # 
    string canUseSalesforceOAuth?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canUseSalesforceOAuthMetadata?;
    # Reserved for DocuSign.
    string captureVoiceRecording?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata captureVoiceRecordingMetadata?;
    # 
    string cfr21SimplifiedSigningEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata cfr21SimplifiedSigningEnabledMetadata?;
    # Boolean that specifies whether to use a shorter/wider format when generating the CFR Part 11 signature image.
    string cfrUseWideImage?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata cfrUseWideImageMetadata?;
    # 
    string checkForMultipleAdminsOnAccount?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata checkForMultipleAdminsOnAccountMetadata?;
    # Boolean that specifies whether the signers of the envelopes from this account use a signature with a DocuSign chrome around it or not.
    string chromeSignatureEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata chromeSignatureEnabledMetadata?;
    # When **true,** the text of comments is included in email notifications when a comment is posted.
    # 
    # **Note:**  If the envelope requires additional recipient authentication, comment text is not included.
    string commentEmailShowMessageText?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata commentEmailShowMessageTextMetadata?;
    # When **true** and comments are enabled for the account, senders can disable comments for an envelope through the **Advanced Options** menu that appears during the sending process.
    string commentsAllowEnvelopeOverride?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata commentsAllowEnvelopeOverrideMetadata?;
    # When **true,** conditional fields can be used in documents.
    # 
    # **Note:** Only Admin users can change this setting.
    string conditionalFieldsEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata conditionalFieldsEnabledMetadata?;
    # Speficies how often to display the consumer disclosure.
    # 
    # Valid values are:
    # 
    # - `once`: Per account, the supplemental document is displayed once only per `userId`. 
    # - `always`: Per envelope, the supplemental document is displayed once only per `userId`. 
    # - `each_access`: Per envelope, the supplemental document is displayed once only per `recipientId`.
    string consumerDisclosureFrequency?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata consumerDisclosureFrequencyMetadata?;
    # Boolean that specifies whether to enable PDF form fields to get converted to DocuSign secure fields when the document is added or uploaded to an envelope.
    string convertPdfFields?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata convertPdfFieldsMetadata?;
    # Specifies how data is shared for tabs with the same tabLabel. Valid values are:
    # 
    # - `document`: Tabs in a document with the same label populate with the same data.
    # - `envelope`: Tabs in all documents in the envelope with the same label populate with the same data.
    # - `notset`:   Use the global account setting.
    # 
    # This setting applies to the following tab types:
    # 
    # - Check box
    # - Company
    # - Data field
    # - Drop-down list
    # - Full name
    # - Formula
    # - Note
    # - Title
    # 
    # **Note:** Only Admin users can change this setting. Changing this setting affects envelopes that have been sent but not completed.
    string dataPopulationScope?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata dataPopulationScopeMetadata?;
    # 
    string defaultToAdvancedEnvelopesFilterForm?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata defaultToAdvancedEnvelopesFilterFormMetadata?;
    # 
    string disableAutoTemplateMatching?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata disableAutoTemplateMatchingMetadata?;
    # When **true,** the mobile app distributor key is prevented from connecting for account users.
    string disableMobileApp?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata disableMobileAppMetadata?;
    # When **true,** push notifications are disabled for the account.
    # 
    # **Note:** Only Admin users can change this setting.
    string disableMobilePushNotifications?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata disableMobilePushNotificationsMetadata?;
    # When **true,** sending from a mobile application is disabled.
    # 
    # **Note:** Only Admin users can change this setting.
    string disableMobileSending?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata disableMobileSendingMetadata?;
    # When **true,** account users cannot be logged into multiple sessions at the same time.
    # 
    # **Note:** Only Admin users can change this setting.
    string disableMultipleSessions?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata disableMultipleSessionsMetadata?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata disablePurgeNotificationsForSenderMetadata?;
    # When **true,** signers cannot view certificates of completion.
    string disableSignerCertView?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata disableSignerCertViewMetadata?;
    # When **true,** signers cannot view envelope history.
    string disableSignerHistoryView?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata disableSignerHistoryViewMetadata?;
    # When **true,** the **Select Style** option is hidden from signers and they must draw their signature instead. 
    string disableStyleSignature?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata disableStyleSignatureMetadata?;
    # When **true,** signers cannot upload custom image files of their signature and initials.
    # 
    # **Note:** Only Admin users can change this setting.
    string disableUploadSignature?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata disableUploadSignatureMetadata?;
    # When **true,** the User Sharing feature is disabled for the account.
    string disableUserSharing?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata disableUserSharingMetadata?;
    # Boolean that specifies whether to display a Beta switch for your app.
    string displayBetaSwitch?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata displayBetaSwitchMetadata?;
    # Sets the account document upload restriction for non-account administrators. Valid values are:
    # 
    # - `no_restrictions`: There are no restrictions on the type of documents that can be uploaded.
    # - `allow_pdf_only`: Non-administrators can only upload PDF files.
    # - `no_upload`: Non-administrators cannot upload files.
    # 
    # **Note:** Only Admin users can change this setting.
    string documentConversionRestrictions?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata documentConversionRestrictionsMetadata?;
    # Sets a document retention period, which controls the number of days that DocuSign retains documents after they have reached a completed,declined, or voided state. When document retention is enabled for the account, the default value is `356` days.
    string documentRetention?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata documentRetentionMetadata?;
    # When **true** and `documentRetention` is set, document fields and metadata are also purged after the document retention period ends. The default value is **false.**
    # 
    # **Note:** Only Admins can change this setting.
    string documentRetentionPurgeTabs?;
    # Configures the Document Visibility feature for the account. Valid values are:
    # 
    # - `Off`: Document Visibility is not active for the account.
    # - `MustSignToViewUnlessSenderAccount`: Document Visibility is enabled for all envelopes sent from the account. Any member of the sending account can view all of the documents in an envelope.
    # - `MustSignToViewUnlessSender`: Document Visibility is enabled for all envelopes sent from the account. Only the sender can view all of the documents in an envelope.
    # - `SenderCanSetMustSignToViewUnlessSenderAccount`: The sender has the option to enable Document Visibility for an envelope. When enabled for an envelope, all of the documents within it are still visible to any member of the sending account.
    # Vd- `SenderCanSetMustSignToViewUnlessSender`: The sender has the option to enable Document Visibility for an envelope. When enabled for an envelope, all of the documents in the envelope are visible only to the sender.
    # 
    # **Note:** For this configuration to take effect, `allowDocumentVisibility` must be set to **true.**
    string documentVisibility?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata documentVisibilityMetadata?;
    # 
    string draftEnvelopeRetention?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata draftEnvelopeRetentionMetadata?;
    # 
    string dss_EnableProvisioningPenConfiguration_RadminOption?;
    # 
    string dss_EnableSignatureTypeCustomTagRadmin_RadminOption?;
    # 
    string dss_SIGN_28411_EnableLeavePagePrompt_RadminOption?;
    # 
    string dss_SIGN_29182_SlideUpBar_RadminOption?;
    # Specifies the version of the email templates used in an account. If new signing is selected in a member's Admin page, the user is updated to the newest version (1.1), the minimum version of email supported for the account.
    string emailTemplateVersion?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata emailTemplateVersionMetadata?;
    # When **true,** enables Access Code Generator on the account.
    string enableAccessCodeGenerator?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableAccessCodeGeneratorMetadata?;
    # 
    string enableAccountWideSearch?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableAccountWideSearchMetadata?;
    # Account Level Flag that determines the availability to use ADM Healthcare fields
    string enableAdmHealthcare?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableAdmHealthcareMetadata?;
    # 
    string enableAdvancedEnvelopesSearch?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableAdvancedEnvelopesSearchMetadata?;
    # When **true,** enables Advanced Payments for the account.
    string enableAdvancedPayments?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableAdvancedPaymentsMetadata?;
    # When **true,** enables advanced PowerForms for the account.
    string enableAdvancedPowerForms?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableAdvancedPowerFormsMetadata?;
    # 
    string enableAgreementActionsForCLM?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableAgreementActionsForCLMMetadata?;
    # 
    string enableAgreementActionsForESign?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableAgreementActionsForESignMetadata?;
    # When **true,** enables the account to set the AutoNav rule setting, which enables a sender to override the auto-navigation setting per envelope.
    # 
    # **Note:** To change this setting, you must be a SysAdmin user or `EnableAutoNavByDSAdmin` must be set.
    string enableAutoNav?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableAutoNavMetadata?;
    # 
    string enableBccDummyLink?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableBccDummyLinkMetadata?;
    # When **true,** calculated fields are enabled for the account. 
    # 
    # **Note:** This setting can be changed only by Admin users, and only if the account-level setting `allowExpression` is set to **true.**
    string enableCalculatedFields?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableCalculatedFieldsMetadata?;
    # 
    string enableClickPlus?;
    # 
    string enableClickPlusConditionalContent?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableClickPlusConditionalContentMetaData?;
    # 
    string enableClickPlusCustomFields?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableClickPlusCustomFieldsMetaData?;
    # 
    string enableClickPlusCustomStyle?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableClickPlusCustomStyleMetaData?;
    # 
    string enableClickPlusDynamicContent?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableClickPlusDynamicContentMetaData?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableClickPlusMetaData?;
    # Boolean that specifies whether clickwraps are enabled in your app. A [clickwrap](/docs/click-api/click101/) is an iframe that you embed in your own website or app.
    string enableClickwraps?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableClickwrapsMetadata?;
    # 
    string enableCombinedPDFDownloadForSBS?;
    # 
    string enableCommentsHistoryDownloadInSigning?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableCommentsHistoryDownloadInSigningMetadata?;
    # 
    string enableContactSuggestions?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableContactSuggestionsMetadata?;
    # When **true,** enables customer satisfaction metric tracking for the account.
    string enableCustomerSatisfactionMetricTracking?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableCustomerSatisfactionMetricTrackingMetadata?;
    # 
    string enableDSigEUAdvancedPens?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableDSigEUAdvancedPensMetadata?;
    # 
    string enableDSigExpressPens?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableDSigExpressPensMetadata?;
    # 
    string enableDSigIDCheckForAESPens?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableDSigIDCheckForAESPensMetadata?;
    # 
    string enableDSigIDCheckInPersonForQESPens?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableDSigIDCheckInPersonForQESPensMetadata?;
    # 
    string enableDSigIDCheckRemoteForQESPens?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableDSigIDCheckRemoteForQESPensMetadata?;
    # 
    string enableDSigIDVerificationPens?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableDSigIDVerificationPensMetadata?;
    # 
    string enableDSigIDVerificationPremierPens?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableDSigIDVerificationPremierPensMetadata?;
    # Reserved for DocuSign.
    string enableDSPro?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableDSProMetadata?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableEnforceTlsEmailsSettingMetadata?;
    # When **true,** enables the account administrator
    # to control envelope stamping for an account
    # (stamping the `envelopeId` in the document margins).
    # 
    # **Note:** This setting can be changed only
    # by Admin users, and only if the account-level
    # setting `enableEnvelopeStampingByDSAdmin` is set to **true.**
    string enableEnvelopeStampingByAccountAdmin?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableEnvelopeStampingByAccountAdminMetadata?;
    # When **true,** enables the DocuSign administrator to control envelope stamping for an account (placement of the `envelopeId`).
    string enableEnvelopeStampingByDSAdmin?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableEnvelopeStampingByDSAdminMetadata?;
    # 
    string enableESignAPIHourlyLimitManagement?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableESignAPIHourlyLimitManagementMetadata?;
    # 
    string enableEsignCommunities?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableEsignCommunitiesMetadata?;
    # 
    string enableIDFxAccountlessSMSAuthForPart11?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableIDFxAccountlessSMSAuthForPart11Metadata?;
    # 
    string enableIDFxIntuitKBA?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableIDFxIntuitKBAMetadata?;
    # 
    string enableIDFxPhoneAuthentication?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableIDFxPhoneAuthenticationMetadata?;
    # 
    string enableIdfxPhoneAuthSignatureAuthStatus?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableIdfxPhoneAuthSignatureAuthStatusMetadata?;
    # 
    string enableInboxBrowseViewsPoweredByElasticSearch?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableInboxBrowseViewsPoweredByElasticSearchMetadata?;
    # 
    string enableInboxRelevanceSort?;
    # 
    string enableInboxRelevanceSortForRecentAccounts?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableInboxRelevanceSortForRecentAccountsMetadata?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableInboxRelevanceSortMetadata?;
    # 
    string enableInBrowserEditor?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableInBrowserEditorMetadata?;
    # 
    string enableKeyTermsSuggestionsByDocumentType?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableKeyTermsSuggestionsByDocumentTypeMetadata?;
    # 
    string enableLargeFileSupport?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableLargeFileSupportMetadata?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableParticipantRecipientSettingMetadata?;
    # When **true,** payment processing is enabled for this account.
    # 
    # **Note:** This setting can be changed only by Admin users, and only if the account-level setting `allowPaymentProcessing` is set.
    string enablePaymentProcessing?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enablePaymentProcessingMetadata?;
    # 
    string enablePDFAConversion?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enablePDFAConversionMetadata?;
    # When **true,** enables PowerForms for the account.
    # 
    # **Note:** Only SysAdmin users can change this setting.
    string enablePowerForm?;
    # When **true,** enables direct PowerForms for an account. Direct PowerForms are in-session PowerForms.
    # 
    # **Note:** Only Admin users can change this setting.
    string enablePowerFormDirect?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enablePowerFormDirectMetadata?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enablePowerFormMetadata?;
    # Reserved for DocuSign.
    string enableRecipientDomainValidation?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableRecipientDomainValidationMetadata?;
    # 
    string enableRecipientMayProvidePhoneNumber?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableRecipientMayProvidePhoneNumberMetadata?;
    # Enables direct links to envelopes in reports for administrators in the following scopes:
    # - `NoEnvelopes`
    # - `AllEnvelopes`
    # - `OnlyOwnEnvelopes`
    string enableReportLinks?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableReportLinksMetadata?;
    # When **true,** the account can use the `requireSignOnPaper` option.
    # 
    # **Note:** Only Admin users can change this setting.
    string enableRequireSignOnPaper?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableRequireSignOnPaperMetadata?;
    # When **true,** account administrators can reserve a web domain and users. Domains are organization-specific reserved internet domains, such as `@exampledomain.com`. You can define policy settings for users of each reserved domain within your organization, export lists of domain users for audit purposes, and manage domain users.
    # 
    # - Domains may be claimed by an organization.
    # - When a domain is claimed by an organization, all users within that domain are added to the organization, even if they have trial or free accounts.
    # - You can set domain controls for all users of the domain.
    # - You can export information about your organization’s users that are associated with your reserved domains.
    # 
    # **Note:** Only SysAdmin users can change this setting.
    string enableReservedDomain?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableReservedDomainMetadata?;
    # When **true,** enables responsive signing.
    string enableResponsiveSigning?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableResponsiveSigningMetadata?;
    # When **true,** scheduled releases are enabled. The default value is **false.**
    string enableScheduledRelease?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableScheduledReleaseMetadata?;
    # 
    string enableSearch?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableSearchMetadata?;
    # 
    string enableSearchServiceAzureUri?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableSearchServiceAzureUriMetadata?;
    # 
    string enableSearchSiteSpecificApi?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableSearchSiteSpecificApiMetadata?;
    # 
    string enableSearchUI?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableSearchUIMetadata?;
    # When **true,** enables fonts to be set on tags for the account.
    string enableSendingTagsFontSettings?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableSendingTagsFontSettingsMetadata?;
    # When **true,** this account can use the Agent recipient type.
    # 
    # **Note:** Only SysAdmin users can change this setting.
    string enableSendToAgent?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableSendToAgentMetadata?;
    # When **true,** this account can use the Intermediary recipient type.
    # 
    # **Note:** Only Admin users can change this setting, and only if `allowSendToIntermediary` is set.
    string enableSendToIntermediary?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableSendToIntermediaryMetadata?;
    # When **true,** this account can use the Editor recipient type.
    # 
    # **Note:** Only Admin users can change this setting.
    string enableSendToManage?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableSendToManageMetadata?;
    # When **true,** the account can define the routing
    # order of recipients for envelopes sent by using the eSignature API.
    # 
    # **Note:** Only SysAdmin users can change this setting.
    string enableSequentialSigningAPI?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableSequentialSigningAPIMetadata?;
    # When **true,** the account can define the routing order
    # of recipients for envelopes sent by using the DocuSign application.
    # 
    # **Note:** Only SysAdmin users can change this setting.
    string enableSequentialSigningUI?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableSequentialSigningUIMetadata?;
    # When **true,** users can use the signing attachments feature to request attachments from signers.
    # 
    # **Note:** Only Admin users can change this setting.
    string enableSignerAttachments?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableSignerAttachmentsMetadata?;
    # When **true,** enables comments for the account so that signers and recipients can make and respond to comments in documents belonging to the envelopes that they are sent.
    string enableSigningExtensionComments?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableSigningExtensionCommentsMetadata?;
    # When **true,** enables conversation functionality.
    string enableSigningExtensionConversations?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableSigningExtensionConversationsMetadata?;
    # When **true,** switches Signing Order to On by default for new envelopes.
    string enableSigningOrderSettingsForAccount?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableSigningOrderSettingsForAccountMetadata?;
    # When **true,** a sender can allow signers to use the sign on paper option.
    # 
    # **Note:** Only Admin users can change this setting.
    string enableSignOnPaper?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableSignOnPaperMetadata?;
    # When **true,** a user can override the default default account setting for the Sign on Paper option, which specifies whether signers can sign documents on paper as an option to signing electronically.
    # 
    # **Note:** Only Admin users can change this setting.
    string enableSignOnPaperOverride?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableSignOnPaperOverrideMetadata?;
    # When **true,** Sign with Notary functionality is enabled for the account.
    # 
    # **Note:** Only Admin users can change this setting.
    string enableSignWithNotary?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableSignWithNotaryMetadata?;
    # When **true,** blockchain-based [Smart Contracts](https://www.docusign.com/products/blockchain) are enabled. The default value is **false.**
    string enableSmartContracts?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableSmartContractsMetadata?;
    # When **true,** the account can use SMS authentication.
    # 
    # **Note:** Only Admin users can change this setting.
    string enableSMSAuthentication?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableSMSAuthenticationMetadata?;
    # 
    string enableSMSDeliveryAdditionalNotification?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableSMSDeliveryAdditionalNotificationMetadata?;
    # 
    string enableSMSDeliveryPrimary?;
    # Deprecated.
    string enableSocialIdLogin?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableSocialIdLoginMetadata?;
    # When **true,** enables strikethrough formatting in documents.
    string enableStrikeThrough?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableStrikeThroughMetadata?;
    # Reserved for DocuSign.
    string enableTransactionPoint?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableTransactionPointMetadata?;
    # When **true,** Vaulting is enabled for the account.
    string enableVaulting?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableVaultingMetadata?;
    # 
    string enableWebFormsSeparateUserPermissions?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableWebFormsSeparateUserPermissionsMetadata?;
    # Reserved for DocuSign.
    string enableWitnessing?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableWitnessingMetadata?;
    # When **true,** the template name must be unique.
    string enforceTemplateNameUniqueness?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enforceTemplateNameUniquenessMetadata?;
    # 
    string enforceTlsEmails?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enforceTlsEmailsMetadata?;
    # Shows the envelope integration rule for the account, which indicates whether custom admins can enable Connect for their accounts. Enumeration values are: 
    # 
    # - `not_allowed`
    # - `full` 
    # 
    # **Note:** Only SysAdmin users can change this setting.                                                                                 
    string envelopeIntegrationAllowed?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata envelopeIntegrationAllowedMetadata?;
    # When **true,** enables Connect for an account. Note that Connect integration requires additional configuration that must be set up for it to take effect; this switch is only the on/off control for the account.
    # 
    # **Note:** Only Admin users can change this setting, and only when `envelopeIntegrationAllowed` is set.
    string envelopeIntegrationEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata envelopeIntegrationEnabledMetadata?;
    # 
    string EnvelopeLimitsTotalDocumentSizeAllowedInMB?;
    # 
    string EnvelopeLimitsTotalDocumentSizeAllowedInMBEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata EnvelopeLimitsTotalDocumentSizeAllowedInMBEnabledMetadata?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata EnvelopeLimitsTotalDocumentSizeAllowedInMBMetadata?;
    # 
    string envelopeSearchMode?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata envelopeSearchModeMetadata?;
    # When **true,** envelopes sent by this account automatically have the envelope ID stamped in the document margins, unless the sender selects not to have the documents stamped.
    string envelopeStampingDefaultValue?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata envelopeStampingDefaultValueMetadata?;
    # 
    string exitPrompt?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata exitPromptMetadata?;
    # Boolean that specifies whether a member of an account can express send (without tags) or must send with tags on documents.
    string expressSend?;
    # Boolean that specifies whether a member of an account can send templates without the tags being stripped out, even when the account is configured to let its users express send only (they cannot use the tagger).
    string expressSendAllowTabs?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata expressSendAllowTabsMetadata?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata expressSendMetadata?;
    # A complex object specifying the external document sources.
    ExternalDocumentSources externalDocumentSources?;
    # Specifies the signature pad type.
    # Valid values are:
    # 
    # - `none`
    # - `topaz`
    # - `e_padv9`
    # - `e_pad_integrisign`
    # - `topaz_sigplusextlite`
    # 
    # **Note:** Only Admin users can change this setting.
    string externalSignaturePadType?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata externalSignaturePadTypeMetadata?;
    # When **true,** fax delivery to recipients is allowed for the account.
    # 
    # **Note:** Only Admin users can change this setting.
    string faxOutEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata faxOutEnabledMetadata?;
    # 
    string finishReminder?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata finishReminderMetadata?;
    # When **true,** HTML used to implement [Guided Forms](https://www.docusign.com/products/guided-forms) is enabled for the account.
    string guidedFormsHtmlAllowed?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata guidedFormsHtmlAllowedMetadata?;
    # 
    string guidedFormsHtmlConversionPolicy?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata guidedFormsHtmlConversionPolicyMetadata?;
    # 
    string hasRecipientConnectClaimedDomain?;
    # Boolean that specifies whether to hide the account address in the Certificate of Completion.
    string hideAccountAddressInCoC?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata hideAccountAddressInCoCMetadata?;
    # Boolean that specifies whether to hide the pricing functionality for an account.
    string hidePricing?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata hidePricingMetadata?;
    # A list of ID check configuration objects.
    IdCheckConfiguration[] idCheckConfigurations?;
    # Determines when a user's authentication with the account expires. Valid values are:
    # 
    # - `always`: Users are required to authenticate each time.
    # - `variable`: If the authentication for a user is valid and falls within the value for the `idCheckExpireDays` property, the user is not required to authenticate again.
    # 
    # **Note:** Only Admin users can change this setting.
    string idCheckExpire?;
    # The number of days before user authentication credentials expire. A value of `0` specifies that users must re-authenticate for each new session.
    # 
    # **Note:** Only Admin users can change this setting.
    string idCheckExpireDays?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata idCheckExpireDaysMetadata?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata idCheckExpireMetadata?;
    # The number of minutes before user authentication credentials expire.
    string idCheckExpireMinutes?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata idCheckExpireMinutesMetadata?;
    # Indicates if authentication is configured for the account. Valid values are:
    # 
    # - `always`: Authentication checks are performed on every envelope.
    # - `never`: Authentication checks are not performed on any envelopes.
    # - `optional`: Authentication is configurable per envelope.
    # 
    # **Note:** Only Admin users can change this setting.
    string idCheckRequired?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata idCheckRequiredMetadata?;
    # Specifies the ID Verification workflow applied on an envelope by workflow ID. <br/>See the [list](/docs/esign-rest-api/reference/accounts/identityverifications/list/) method in the [IdentityVerifications](/docs/esign-rest-api/reference/accounts/identityverifications/) resource for more information on how to retrieve workflow IDs available for an account. <br/>This can be used in addition to other [recipient authentication](https://support.docusign.com/s/document-item?bundleId=gav1643676262430&topicId=kzp1578456318101.html) methods. <br/>Note that ID Verification and ID Check are two distinct methods. ID Verification checks recipients' identity by verifying their ID while ID Check relies on data available on public records (such as current and former address).
    AccountIdentityVerificationWorkflow[] identityVerification?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata identityVerificationMetadata?;
    # 
    string idfxKBAAuthenticationOverride?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata idfxKBAAuthenticationOverrideMetadata?;
    # 
    string idfxPhoneAuthenticationOverride?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata idfxPhoneAuthenticationOverrideMetadata?;
    # Reserved for DocuSign.
    string ignoreErrorIfAnchorTabNotFound?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata ignoreErrorIfAnchorTabNotFoundMetadataEnabled?;
    # A text field containing the question that an in-person signing host uses to collect personal information from the recipient. The recipient's response to this question is saved and can be viewed in the certificate associated with the envelope.
    # 
    # **Note:** Only Admin users can change this setting.
    string inPersonIDCheckQuestion?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata inPersonIDCheckQuestionMetadata?;
    # When **true,** in-person signing is enabled for the account.
    string inPersonSigningEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata inPersonSigningEnabledMetadata?;
    # When **true,** the account can send in-session (embedded) envelopes.
    # 
    # **Note:** Only Admin users can change this setting.
    string inSessionEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata inSessionEnabledMetadata?;
    # When **true,** emails are not sent to the in-session (embedded) recipients on an envelope.
    # 
    # **Note:** Only Admin users can change this setting.
    string inSessionSuppressEmails?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata inSessionSuppressEmailsMetadata?;
    # 
    string isConnectDocumentFieldsEnabled?;
    # 
    LinkedExternalPrimaryAccount[] linkedExternalPrimaryAccounts?;
    # The maximum number of signing groups allowed on the account. The default value is `50`. This setting is only shown in responses that list account settings.
    # 
    # **Note:** Only SysAdmin users can change this setting.
    string maximumSigningGroups?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata maximumSigningGroupsMetadata?;
    # The maximum number of users per signing group. The default value is `50`. This setting is only shown in responses that list account settings.
    # 
    # **Note:** Only SysAdmin users can change this setting.
    string maximumUsersPerSigningGroup?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata maximumUsersPerSigningGroupMetadata?;
    # The maximum number of custom stamps.
    string maxNumberOfCustomStamps?;
    # 
    string mergeMixedModeResults?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata mergeMixedModeResultsMetadata?;
    # The number of minutes of inactivity before a mobile user is automatically logged out of the system. Valid values are `1` to `120` minutes. The default value is `20` minutes.
    # 
    # **Note:** Only Admin users can change this setting.
    string mobileSessionTimeout?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata mobileSessionTimeoutMetadata?;
    # The number of active custom stamps associated with the account. DocuSign calculates this number automatically. This property is only visible to the DocuSign account manager.
    string numberOfActiveCustomStamps?;
    # Boolean that specifies whether to opt in for Signing v02 on Mobile Devices functionality.
    string optInMobileSigningV02?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata optInMobileSigningV02Metadata?;
    # 
    string optInUniversalSignatures?;
    # Boolean that allows envelope senders to opt out of the recipient signing auto-navigation feature and opt out of updating tab font color.
    string optOutAutoNavTextAndTabColorUpdates?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata optOutAutoNavTextAndTabColorUpdatesMetadata?;
    # Boolean that specifies whether to allow envelope senders to opt out of using the new platform seal.
    string optOutNewPlatformSeal?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata optOutNewPlatformSealPlatformMetadata?;
    # 
    string pdfMaxChunkedUploadPartSize?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata pdfMaxChunkedUploadPartSizeMetadata?;
    # 
    string pdfMaxChunkedUploadTotalSize?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata pdfMaxChunkedUploadTotalSizeMetadata?;
    # 
    string pdfMaxIndividualUploadSize?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata pdfMaxIndividualUploadSizeMetadata?;
    # When **true,** senders can allow recipients to provide a phone number for the Phone Authentication process.
    # 
    # **Note:** Only Admin users can change this setting.
    string phoneAuthRecipientMayProvidePhoneNumber?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata phoneAuthRecipientMayProvidePhoneNumberMetadata?;
    # The policy for adding a digital certificate to downloaded, printed, and emailed documents. 
    # 
    # Possible values are: 
    # 
    # - `no_sign`
    # - `no_sign_allow_user_override`
    # - `yes_sign` (Specifies that PDF files downloaded from the platform are signed.)
    # 
    # **Note:** Only Admin users can change this setting.
    string pkiSignDownloadedPDFDocs?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata pkiSignDownloadedPDFDocsMetadata?;
    # 
    string readOnlyMode?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata readOnlyModeMetadata?;
    # When **true,**
    # recipients receiving envelopes from this account
    # can sign offline.
    # 
    # **Note:** Only Admin users can change this setting.
    string recipientsCanSignOffline?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata recipientsCanSignOfflineMetadata?;
    # When **true,** recipients receiving envelopes from this account can override auto-navigation functionality.
    # 
    # **Note:** Only Admin users can change this setting.
    string recipientSigningAutoNavigationControl?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata recipientSigningAutoNavigationControlMetadata?;
    # When **true,**
    # recipients are required
    # to use a 21 CFR part 11-compliant signing experience.
    # 
    # **Note:** Only Admin users can change this setting.
    string require21CFRpt11Compliance?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata require21CFRpt11ComplianceMetadata?;
    # When **true,** signers who decline to sign an envelope sent from this account
    # are required to provide a reason for declining.
    # 
    # **Note:** Only Admin users can change this setting.
    string requireDeclineReason?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata requireDeclineReasonMetadata?;
    # When **true,** the account requires external management of users.
    # 
    # **Note:** Only Admin users can change this setting.
    string requireExternalUserManagement?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata requireExternalUserManagementMetadata?;
    # Sets the Digital Signature certificate requirements for sending envelopes.
    # Valid values are:
    # 
    # - `none`: A Digital Signature certificate is not required.
    # - `docusign_express`: Signers must use a DocuSign Express certificate.
    # - `docusign_personal`: Signers must use a DocuSign personal certificate.
    # - `safe`
    # - `open_trust`: Signers must use an OpenTrust certificate.
    string requireSignerCertificateType?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata requireSignerCertificateTypeMetadata?;
    # The RSA account name.
    # 
    # **Note:**
    # Only Admin users can change this setting. Modifying this value may disrupt
    # your ID Check capability.
    # Ensure you have the correct value before changing it.
    string rsaVeridAccountName?;
    # The password for the RSA account.
    # 
    # 
    # **Note:**
    # Only Admin users can change this setting. Modifying this value may disrupt
    # your ID Check capability.
    # Ensure you have the correct value before changing it.
    string rsaVeridPassword?;
    # The RSA rule set used with the account.
    # 
    # **Note:**
    # Only Admin users can change this setting. Modifying this value may disrupt
    # your ID Check capability.
    # Ensure you have the correct value before changing it.
    string rsaVeridRuleset?;
    # The user ID for the RSA account.
    # 
    # **Note:**
    # Only Admin users can change this setting. Modifying this value may disrupt
    # your ID Check capability.
    # Ensure you have the correct value before changing it.
    string rsaVeridUserId?;
    # 
    string sbsTransactionLevel?;
    # Sets how self-signed documents are presented to the email recipients.
    # Valid values are:
    # 
    # - `include_pdf`: A PDF of the completed document is attached to the email.
    # - `include_link`: A secure link to the self-signed documents is included
    #    in the email.
    # 
    # **Note:** Only Admin users can change this setting.
    string selfSignedRecipientEmailDocument?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata selfSignedRecipientEmailDocumentMetadata?;
    # When **true,** the `selfSignedRecipientEmailDocument` user setting
    # can be set for an individual user.
    # The user setting overrides the account setting.
    # 
    # **Note:** Only Admin users can change this account setting.
    string selfSignedRecipientEmailDocumentUserOverride?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata selfSignedRecipientEmailDocumentUserOverrideMetadata?;
    # When **true,** a signer can draw their signature in each
    # location where a sign or initial tab exists. This functionality
    # is typically used for mobile signing.
    # 
    # **Note:** Only Admin users can change this setting.
    string senderCanSignInEachLocation?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata senderCanSignInEachLocationMetadata?;
    # When **true,** a sender who is also a recipient of an envelope
    # must follow the authentication requirements for the envelope.
    # 
    # **Note:** Only Admin users can change this setting.
    string senderMustAuthenticateSigning?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata senderMustAuthenticateSigningMetadata?;
    # The account-wide default font color to use for the content of the tab.
    # 
    # Valid values are:
    # 
    # - `Black`
    # - `BrightBlue`
    # - `BrightRed`
    # - `DarkGreen`
    # - `DarkRed`
    # - `Gold`
    # - `Green`
    # - `NavyBlue`
    # - `Purple`
    # - `White`
    string sendingTagsFontColor?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata sendingTagsFontColorMetadata?;
    # The account-wide default font to be used for the tab value. Supported fonts include:
    # 
    # - `Default`
    # - `Arial`
    # - `ArialNarrow`
    # - `Calibri`
    # - `CourierNew`
    # - `Garamond`
    # - `Georgia`
    # - `Helvetica`
    # - `LucidaConsole`
    # - `MSGothic`
    # - `MSMincho`
    # - `OCR-A`
    # - `Tahoma`
    # - `TimesNewRoman`
    # - `Trebuchet`
    # - `Verdana`
    string sendingTagsFontName?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata sendingTagsFontNameMetadata?;
    # The account-wide default font size used for the information in the tab:
    # 
    # - `Size7`
    # - `Size8`
    # - `Size9`
    # - `Size10`
    # - `Size11`
    # - `Size12`
    # - `Size14`
    # - `Size16`
    # - `Size18`
    # - `Size20`
    # - `Size22`
    # - `Size24`
    # - `Size26`
    # - `Size28`
    # - `Size36`
    # - `Size48`
    # - `Size72`
    string sendingTagsFontSize?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata sendingTagsFontSizeMetadata?;
    # 
    string sendLockoutRecipientNotification?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata sendLockoutRecipientNotificationMetadata?;
    # When true,
    # the account can use the
    # certified deliveries recipient type.
    string sendToCertifiedDeliveryEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata sendToCertifiedDeliveryEnabledMetadata?;
    # The amount of idle activity time, in minutes, before a user is automatically logged out of the system. The minimum setting is 20 minutes and the maximum setting is 120 minutes.
    string sessionTimeout?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata sessionTimeoutMetadata?;
    # When **true,** senders can set the email language to use for
    # each recipient.
    # 
    # **Note:** Only Admin users can change this setting.
    string setRecipEmailLang?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata setRecipEmailLangMetadata?;
    # When **true,**
    # setting a unique language for a recipient
    # not only affects the email language, but also the signing
    # language they are presented with. When **false,** only the email will
    # be affected when the sender specifies a unique language for a
    # recipient.
    # 
    # **Note:** Only Admin users can change this setting.
    string setRecipSignLang?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata setRecipSignLangMetadata?;
    # Boolean that specifies whether an account can use Shared Template Folders.
    string sharedTemplateFolders?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata sharedTemplateFoldersMetadata?;
    # Boolean that specifies whether complete dialogs are displayed directly within an application in embedded signing sessions.
    string showCompleteDialogInEmbeddedSession?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata showCompleteDialogInEmbeddedSessionMetadata?;
    # When **true,** Conditional Routing options display to senders during the sending experience.
    string showConditionalRoutingOnSend?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata showConditionalRoutingOnSendMetadata?;
    # Boolean that specifies whether conditional field options are initially displayed (before a user makes entries).
    string showInitialConditionalFields?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata showInitialConditionalFieldsMetadata?;
    # Boolean that specifies whether localized watermarks are displayed.
    string showLocalizedWatermarks?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata showLocalizedWatermarksMetadata?;
    # 
    string showMaskedFieldsWhenDownloadingDocumentAsSender?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata showMaskedFieldsWhenDownloadingDocumentAsSenderMetadata?;
    # When **true,**
    # show tutorials.
    string showTutorials?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata showTutorialsMetadata?;
    # Names of electronic or digital signature providers that can be used.
    string[] signatureProviders?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata signatureProvidersMetadata?;
    # The format for the signature date. Valid values are:
    # 
    # - `d/M/yyyy`
    # - `dd-MM-yy`
    # - `dd-MMM-yy`
    # - `dd-MM-yyyy`
    # - `dd.MM.yyyy`
    # - `dd-MMM-yyyy`
    # - `dd MMMM yyyy`
    # - `M/d/yyyy`
    # - `MM-dd-yyyy`
    # - `MM/dd/yyyy`
    # - `MM/dd/yy`
    # - `MMM-dd-yyyy`
    # - `MMM d, yyyy`
    # - `MMMM d, yyyy`
    # - `yyyy-MM-dd`
    # - `yyyy-MMM-dd`
    # - `yyyy/MM/dd`
    # - `yyyy MMMM d`
    # 
    # **Note:** Only Admin users can change this setting.
    string signDateFormat?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata signDateFormatMetadata?;
    # 
    string signDateTimeAccountLanguageOverride?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata signDateTimeAccountLanguageOverrideMetadata?;
    # 
    string signDateTimeAccountTimezoneOverride?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata signDateTimeAccountTimezoneOverrideMetadata?;
    # When **true,**
    # the Certificate of Completion is included in the PDF of the envelope documents
    # when it is downloaded.
    # 
    # **Note:** Only Admin users can change this setting.
    string signerAttachCertificateToEnvelopePDF?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata signerAttachCertificateToEnvelopePDFMetadata?;
    # When **true,** signer attachments are added to the parent document
    # that contains the attachment.
    # The default behavior creates
    # a new document in the envelope for every signer attachment.
    # 
    # **Note:** Only Admin users can change this setting.
    string signerAttachConcat?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata signerAttachConcatMetadata?;
    # When **true,**
    # a signer can create a DocuSign account
    # after signing.
    # 
    # **Note:** Only Admin users can change this setting.
    string signerCanCreateAccount?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata signerCanCreateAccountMetadata?;
    # When **true,** recipients can sign on a mobile device.
    # 
    # **Note:** Only Admin users can change this setting.
    string signerCanSignOnMobile?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata signerCanSignOnMobileMetadata?;
    # When **true,** an "envelope complete" email is sent to an in-session
    # (embedded) or offline signer after DocuSign processes the envelope
    # if in-session emails are not suppressed.
    # 
    # **Note:** Only Admin users can change this setting.
    string signerInSessionUseEnvelopeCompleteEmail?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata signerInSessionUseEnvelopeCompleteEmailMetadata?;
    # Sets the login requirements for signers. Valid values are:
    # 
    # - `login_not_required`: Signers are not required to log in.
    # - `login_required_if_account_holder`: If the signer has a DocuSign account,
    #   they must log in to sign the document.
    # - `login_required_per_session`: The sender cannot send an envelope to anyone
    #   who does not have a DocuSign account.
    # - `login_required_per_envelope`: The sender cannot send an envelope to anyone
    #   who does not have a DocuSign account, and the signer must also log in for
    #   each envelope they will sign.
    # 
    # 
    # **Note:** Only Admin users can change this setting. If you use Direct PowerForms
    # or captive (embedded signers), the "Account required" settings are bypassed for
    # those signers. If your workflow requires that the signer have an account,
    # you should not use those methods.
    string signerLoginRequirements?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata signerLoginRequirementsMetadata?;
    # When **true,** senders can only send an envelope to a recipient
    # that has a DocuSign account.
    # 
    # **Note:** Only Account Administrators can change this setting.
    string signerMustHaveAccount?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata signerMustHaveAccountMetadata?;
    # When **true,**
    # signers must log in to the DocuSign platform to sign an envelope.
    # 
    # **Note:** Only Admin users can change this setting.
    string signerMustLoginToSign?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata signerMustLoginToSignMetadata?;
    # When **true,** the initial values of all SecureFields are written
    # to the document when it is sent.
    # 
    # **Note:** Only Admin users can change this setting.
    string signerShowSecureFieldInitialValues?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata signerShowSecureFieldInitialValuesMetadata?;
    # The number of minutes
    # that a signing session stays
    # alive without any activity.
    string signingSessionTimeout?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata signingSessionTimeoutMetadata?;
    # Reserved for DocuSign.
    string signingUiVersion?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata signingUiVersionMetadata?;
    # The format for the signature time. Valid values are:
    # 
    # - `none`
    # - `HH:mm`
    # - `h:mm`
    # - `HH:mm:ss`
    # - `h:mm:ss`
    string signTimeFormat?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata signTimeFormatMetadata?;
    # When **true,**
    # the time shows the AM or PM indicator.
    string signTimeShowAmPm?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata signTimeShowAmPmMetadata?;
    # When **true,** simplified sending is enabled for the account. The default value is **false.**
    string simplifiedSendingEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata simplifiedSendingEnabledMetadata?;
    # When **true,**
    # single sign-on (SSO) is enabled.
    string singleSignOnEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata singleSignOnEnabledMetadata?;
    # When **true,**
    # do not require authentication prompt for viewing completed envelopes
    string skipAuthCompletedEnvelopes?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata skipAuthCompletedEnvelopesMetadata?;
    # When **true,**
    # recipients can use
    # [social ids](https://support.docusign.com/guides/signer-authentication)
    # when signing
    string socialIdRecipAuth?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata socialIdRecipAuthMetadata?;
    # When **true,** senders can specify the visibility of the documents in an envelope at the recipient level.
    string specifyDocumentVisibility?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata specifyDocumentVisibilityMetadata?;
    # When **true,**
    # when initiating correction of an in-flight envelope
    # the sender starts in advanced correct mode.
    string startInAdvancedCorrect?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata startInAdvancedCorrectMetadata?;
    # When **true,** account users must accept supplemental documents when signing.
    string supplementalDocumentsMustAccept?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata supplementalDocumentsMustAcceptMetadata?;
    # When **true,** account users must both view and accept supplemental documents when signing.
    string supplementalDocumentsMustRead?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata supplementalDocumentsMustReadMetadata?;
    # When **true,** account users must view supplemental documents when signing.
    string supplementalDocumentsMustView?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata supplementalDocumentsMustViewMetadata?;
    # Boolean that specifies whether or not API calls require a x509 cert in the header of the call.
    string suppressCertificateEnforcement?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata suppressCertificateEnforcementMetadata?;
    # 
    TabAccountSettings tabAccountSettings?;
    # Specifies the time zone
    # to use with the API.
    # 
    # Valid values are:
    # 
    # - `TZ_01_AfghanistanStandardTime`
    # - `TZ_02_AlaskanStandardTime`
    # - `TZ_03_ArabStandardTime`
    # - `TZ_04_ArabianStandardTime`
    # - `TZ_05_ArabicStandardTime`
    # - `TZ_06_ArgentinaStandardTime`
    # - `TZ_07_AtlanticStandardTime`
    # - `TZ_08_AUS_CentralStandardTime`
    # - `TZ_09_AUS_EasternStandardTime`
    # - `TZ_10_AzerbaijanStandardTime`
    # - `TZ_11_AzoresStandardTime`
    # - `TZ_12_BangladeshStandardTime`
    # - `TZ_13_CanadaCentralStandardTime`
    # - `TZ_14_CapeVerdeStandardTime`
    # - `TZ_15_CaucasusStandardTime`
    # - `TZ_16_CentralAustraliaStandardTime`
    # - `TZ_17_CentralAmericaStandardTime`
    # - `TZ_18_CentralAsiaStandardTime`
    # - `TZ_19_CentralBrazilianStandardTime`
    # - `TZ_20_CentralEuropeStandardTime`
    # - `TZ_21_CentralEuropeanStandardTime`
    # - `TZ_22_CentralPacificStandardTime`
    # - `TZ_23_CentralStandardTime`
    # - `TZ_24_CentralStandardTimeMexico`
    # - `TZ_25_ChinaStandardTime`
    # - `TZ_26_DatelineStandardTime`
    # - `TZ_27_E_AfricaStandardTime`
    # - `TZ_28_E_AustraliaStandardTime`
    # - `TZ_29_E_EuropeStandardTime`
    # - `TZ_30_E_SouthAmericaStandardTime`
    # - `TZ_31_EasternStandardTime`
    # - `TZ_32_EgyptStandardTime`
    # - `TZ_33_EkaterinburgStandardTime`
    # - `TZ_34_FijiStandardTime`
    # - `TZ_35_FLE_StandardTime`
    # - `TZ_36_GeorgianStandardTime`
    # - `TZ_37_GMT_StandardTime`
    # - `TZ_38_GreenlandStandardTime`
    # - `TZ_39_GreenwichStandardTime`
    # - `TZ_40_GTB_StandardTime`
    # - `TZ_41_HawaiianStandardTime`
    # - `TZ_42_IndiaStandardTime`
    # - `TZ_43_IranStandardTime`
    # - `TZ_44_IsraelStandardTime`
    # - `TZ_45_JordanStandardTime`
    # - `TZ_46_KaliningradStandardTime`
    # - `TZ_47_KamchatkaStandardTime`
    # - `TZ_48_KoreaStandardTime`
    # - `TZ_49_MagadanStandardTime`
    # - `TZ_50_MauritiusStandardTime`
    # - `TZ_51_MidAtlanticStandardTime`
    # - `TZ_52_MiddleEastStandardTime`
    # - `TZ_53_MontevideoStandardTime`
    # - `TZ_54_MoroccoStandardTime`
    # - `TZ_55_MountainStandardTime`
    # - `TZ_56_MountainStandardTimeMMexico`
    # - `TZ_57_MyanmarStandardTime`
    # - `TZ_58_N_CentralAsiaStandardTime`
    # - `TZ_59_NamibiaStandardTime`
    # - `TZ_60_NepalStandardTime`
    # - `TZ_61_NewZealandStandardTime`
    # - `TZ_62_NewfoundlandStandardTime`
    # - `TZ_63_NorthAsiaEastStandardTime`
    # - `TZ_64_NorthAsiaStandardTime`
    # - `TZ_65_PacificSAStandardTime`
    # - `TZ_66_PacificStandardTime`
    # - `TZ_67_PacificStandardTimeMexico`
    # - `TZ_68_PakistanStandardTime`
    # - `TZ_69_ParaguayStandardTime`
    # - `TZ_70_RomanceStandardTime`
    # - `TZ_71_RussianStandardTime`
    # - `TZ_72_SAEasternStandardTime`
    # - `TZ_73_SAPacificStandardTime`
    # - `TZ_74_SAWesternStandardTime`
    # - `TZ_75_SamoaStandardTime`
    # - `TZ_76_SE_AsiaStandardTime`
    # - `TZ_77_SingaporeStandardTime`
    # - `TZ_78_SouthAfricaStandardTime`
    # - `TZ_79_SriLankaStandardTime`
    # - `TZ_80_SyriaStandardTime`
    # - `TZ_81_TaipeiStandardTime`
    # - `TZ_82_TasmaniaStandardTime`
    # - `TZ_83_TokyoStandardTime`
    # - `TZ_84_TongaStandardTime`
    # - `TZ_85_TurkeyStandardTime`
    # - `TZ_86_UlaanbaatarStandardTime`
    # - `TZ_87_US_EasternStandardTime`
    # - `TZ_88_USMountainStandardTime`
    # - `TZ_89_VenezuelaStandardTime`
    # - `TZ_90_VladivostokStandardTime`
    # - `TZ_91_W_AustraliaStandardTime`
    # - `TZ_92_W_CentralAfricaStandardTime`
    # - `TZ_93_W_EuropeStandardTime`
    # - `TZ_94_WestAsiaStandardTime`
    # - `TZ_95_WestPacificStandardTime`
    # - `TZ_96_YakutskStandardTime`
    string timezoneOffsetAPI?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata timezoneOffsetAPIMetadata?;
    # Specifies the time zone
    # to use in the UI.
    # 
    # Valid values are:
    # 
    # - `TZ_01_AfghanistanStandardTime`
    # - `TZ_02_AlaskanStandardTime`
    # - `TZ_03_ArabStandardTime`
    # - `TZ_04_ArabianStandardTime`
    # - `TZ_05_ArabicStandardTime`
    # - `TZ_06_ArgentinaStandardTime`
    # - `TZ_07_AtlanticStandardTime`
    # - `TZ_08_AUS_CentralStandardTime`
    # - `TZ_09_AUS_EasternStandardTime`
    # - `TZ_10_AzerbaijanStandardTime`
    # - `TZ_11_AzoresStandardTime`
    # - `TZ_12_BangladeshStandardTime`
    # - `TZ_13_CanadaCentralStandardTime`
    # - `TZ_14_CapeVerdeStandardTime`
    # - `TZ_15_CaucasusStandardTime`
    # - `TZ_16_CentralAustraliaStandardTime`
    # - `TZ_17_CentralAmericaStandardTime`
    # - `TZ_18_CentralAsiaStandardTime`
    # - `TZ_19_CentralBrazilianStandardTime`
    # - `TZ_20_CentralEuropeStandardTime`
    # - `TZ_21_CentralEuropeanStandardTime`
    # - `TZ_22_CentralPacificStandardTime`
    # - `TZ_23_CentralStandardTime`
    # - `TZ_24_CentralStandardTimeMexico`
    # - `TZ_25_ChinaStandardTime`
    # - `TZ_26_DatelineStandardTime`
    # - `TZ_27_E_AfricaStandardTime`
    # - `TZ_28_E_AustraliaStandardTime`
    # - `TZ_29_E_EuropeStandardTime`
    # - `TZ_30_E_SouthAmericaStandardTime`
    # - `TZ_31_EasternStandardTime`
    # - `TZ_32_EgyptStandardTime`
    # - `TZ_33_EkaterinburgStandardTime`
    # - `TZ_34_FijiStandardTime`
    # - `TZ_35_FLE_StandardTime`
    # - `TZ_36_GeorgianStandardTime`
    # - `TZ_37_GMT_StandardTime`
    # - `TZ_38_GreenlandStandardTime`
    # - `TZ_39_GreenwichStandardTime`
    # - `TZ_40_GTB_StandardTime`
    # - `TZ_41_HawaiianStandardTime`
    # - `TZ_42_IndiaStandardTime`
    # - `TZ_43_IranStandardTime`
    # - `TZ_44_IsraelStandardTime`
    # - `TZ_45_JordanStandardTime`
    # - `TZ_46_KaliningradStandardTime`
    # - `TZ_47_KamchatkaStandardTime`
    # - `TZ_48_KoreaStandardTime`
    # - `TZ_49_MagadanStandardTime`
    # - `TZ_50_MauritiusStandardTime`
    # - `TZ_51_MidAtlanticStandardTime`
    # - `TZ_52_MiddleEastStandardTime`
    # - `TZ_53_MontevideoStandardTime`
    # - `TZ_54_MoroccoStandardTime`
    # - `TZ_55_MountainStandardTime`
    # - `TZ_56_MountainStandardTimeMMexico`
    # - `TZ_57_MyanmarStandardTime`
    # - `TZ_58_N_CentralAsiaStandardTime`
    # - `TZ_59_NamibiaStandardTime`
    # - `TZ_60_NepalStandardTime`
    # - `TZ_61_NewZealandStandardTime`
    # - `TZ_62_NewfoundlandStandardTime`
    # - `TZ_63_NorthAsiaEastStandardTime`
    # - `TZ_64_NorthAsiaStandardTime`
    # - `TZ_65_PacificSAStandardTime`
    # - `TZ_66_PacificStandardTime`
    # - `TZ_67_PacificStandardTimeMexico`
    # - `TZ_68_PakistanStandardTime`
    # - `TZ_69_ParaguayStandardTime`
    # - `TZ_70_RomanceStandardTime`
    # - `TZ_71_RussianStandardTime`
    # - `TZ_72_SAEasternStandardTime`
    # - `TZ_73_SAPacificStandardTime`
    # - `TZ_74_SAWesternStandardTime`
    # - `TZ_75_SamoaStandardTime`
    # - `TZ_76_SE_AsiaStandardTime`
    # - `TZ_77_SingaporeStandardTime`
    # - `TZ_78_SouthAfricaStandardTime`
    # - `TZ_79_SriLankaStandardTime`
    # - `TZ_80_SyriaStandardTime`
    # - `TZ_81_TaipeiStandardTime`
    # - `TZ_82_TasmaniaStandardTime`
    # - `TZ_83_TokyoStandardTime`
    # - `TZ_84_TongaStandardTime`
    # - `TZ_85_TurkeyStandardTime`
    # - `TZ_86_UlaanbaatarStandardTime`
    # - `TZ_87_US_EasternStandardTime`
    # - `TZ_88_USMountainStandardTime`
    # - `TZ_89_VenezuelaStandardTime`
    # - `TZ_90_VladivostokStandardTime`
    # - `TZ_91_W_AustraliaStandardTime`
    # - `TZ_92_W_CentralAfricaStandardTime`
    # - `TZ_93_W_EuropeStandardTime`
    # - `TZ_94_WestAsiaStandardTime`
    # - `TZ_95_WestPacificStandardTime`
    # - `TZ_96_YakutskStandardTime`
    string timezoneOffsetUI?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata timezoneOffsetUIMetadata?;
    # Reserved for DocuSign.
    string universalSignatureOptIn?;
    # Reserved for DocuSign.
    string useAccountLevelEmail?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata useAccountLevelEmailMetadata?;
    # When **true,** the account uses an Electronic Record and
    # Signature Disclosure Statement.
    # 
    # **Note:** Only Admin users can change this setting.
    string useConsumerDisclosure?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata useConsumerDisclosureMetadata?;
    # When **true,** specifies that recipients in the same account as the sender must agree to eSign an Electronic Record and Signature Disclosure Statement.
    string useConsumerDisclosureWithinAccount?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata useConsumerDisclosureWithinAccountMetadata?;
    # Reserved for DocuSign.
    string useDerivedKeys?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata useDerivedKeysMetadata?;
    # When **true,**
    # signers
    # are required to use Express Digital Signatures.
    string useDocuSignExpressSignerCertificate?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata useDocuSignExpressSignerCertificateMetadata?;
    # 
    string useEnvelopeSearchMixedMode?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata useEnvelopeSearchMixedModeMetadata?;
    # 
    string useMultiAppGroupsData?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata useMultiAppGroupsDataMetadata?;
    # Reserved for DocuSign.
    string useNewBlobForPdf?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata useNewBlobForPdfMetadata?;
    # 
    string useNewEnvelopeSearch?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata useNewEnvelopeSearchMetadata?;
    # 
    string useNewEnvelopeSearchOnlyWhenSearchingAfterDate?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata useNewEnvelopeSearchOnlyWhenSearchingAfterDateMetadata?;
    # 
    string useNewEnvelopeSearchOnlyWithSearchTerm?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata useNewEnvelopeSearchOnlyWithSearchTermMetadata?;
    # When **true,**
    # signers are
    # required to use SAFE digital signatures.
    string useSAFESignerCertificates?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata useSAFESignerCertificatesMetadata?;
    # When **true,**
    # the account can use the API.
    # 
    # **Note:** Only SysAdmin users can change this setting.
    string usesAPI?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata usesAPIMetadata?;
    # Boolean that specifies whether the account uses the digital signature provider platform to eSign.
    string useSignatureProviderPlatform?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata useSignatureProviderPlatformMetadata?;
    # 
    string useSmartContractsV1?;
    # Boolean that specifies whether validations on recipient email domains are allowed.
    string validationsAllowed?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata validationsAllowedMetadata?;
    # Valid values are:
    # 
    # - `docusign`
    # - `account`
    string validationsBrand?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata validationsBrandMetadata?;
    # Valid values are:
    # 
    # - `none`
    # - `monthly`
    string validationsCadence?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata validationsCadenceMetadata?;
    # When **true,**
    # enables validations.
    string validationsEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata validationsEnabledMetadata?;
    # Valid values are:
    # 
    # - `none`
    # - `life_sciences_part11`
    string validationsReport?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata validationsReportMetadata?;
    # When **true,**
    # the
    # [watermark feature](https://support.docusign.com/s/articles/How-do-I-manage-the-watermark-for-In-Process-envelopes-sent-from-my-account)
    # is enabled for the account.
    string waterMarkEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata waterMarkEnabledMetadata?;
    # When **true,**
    # sent reminders are included in the envelope history.
    string writeReminderToEnvelopeHistory?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata writeReminderToEnvelopeHistoryMetadata?;
    # The smallest screen allowed.
    string wurflMinAllowableScreenSize?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata wurflMinAllowableScreenSizeMetadata?;
};

# A tab that displays the recipient's email as entered in the
# recipient information.
public type EmailAddress record {
    # When **true,** the text string in the document may have extra whitespace and still match the anchor string. This occurs in two cases.
    # 
    # First, it matches if the document string has a single extra whitespace character following a non-whitespace character in the anchor string. For example, if the anchor string is `DocuSign`, then `Docu Sign` will match. However, <code>Docu&nbsp;&nbsp;&nbsp;Sign</code> will not match.
    # 
    # Second, it matches if the document string has one or more extra whitespace characters following a whitespace character in the anchor string. For example, if the anchor string is `Docu Sign`, then <code>Docu&nbsp;&nbsp;&nbsp;Sign</code> will match.
    # 
    # The default value is **true.**
    string anchorAllowWhiteSpaceInCharacters?;
    # Metadata about a property.
    PropertyMetadata anchorAllowWhiteSpaceInCharactersMetadata?;
    # This property controls how [anchor tabs][AnchorTabs] are placed. When **true,** the text string in a document must match the case of the `anchorString` property for an anchor tab to be created. The default value is **false.**
    # 
    # For example, when set to **true,** if the anchor string is `DocuSign`, then `DocuSign` will match but `Docusign`, `docusign`, `DoCuSiGn`, etc. will not match. When **false,** `DocuSign`, `Docusign`, `docusign`, `DoCuSiGn`, etc. will all match.
    # 
    # This functionality uses the following rules:
    # 
    # - Unless punctuation is specified in the `anchorString`, this functionality ignores punctuation and the following characters:
    # 
    #   $~><|^+=
    # 
    #   For example, the `anchorString` `water` will match on the string `Fetch a pail of water.`
    # 
    # - Strings embedded in other strings are ignored during the matching process.
    # 
    # - In words that have dashes, the parts separated by dashes are treated as distinct words.
    # 
    #   Example: If the anchor string is `forget`, then an anchor tab is placed on the `forget` in `forget-me-not`, even when `anchorMatchWholeWord` is set to **true.**
    # 
    # - Letters with accent marks are treated as distinct characters from their unaccented counterparts.
    # 
    # - For single-character anchor strings, if the two characters appear right next to each other in the document, a single anchor tab is placed for both of them.
    # 
    #   Example: If the anchor string is `i`, then only one anchor tab is placed in `skiing`.
    # 
    # - Unlike punctuation, numbers are not ignored when finding anchor words.
    # 
    #   Example: If the anchor string is `cat`, then `-cat-` is matched but `1cat2` is not when `anchorMatchWholeWord` is set to **true** (its default value).
    # 
    # **Note:** You can only specify the value of this property in POST requests.
    # 
    # [AnchorTabs]: /docs/esign-rest-api/esign101/concepts/tabs/auto-place/
    string anchorCaseSensitive?;
    # Metadata about a property.
    PropertyMetadata anchorCaseSensitiveMetadata?;
    # This property controls how [anchor tabs][AnchorTabs] are aligned in relation to the anchor text. Possible values are :
    # 
    # - `left`: Aligns the left side of the tab with the beginning of the first character of the matching anchor word. This is the default value.
    # - `right`: Aligns the tab’s left side with the last character of the matching anchor word.
    # 
    # **Note:** You can only specify the value of this property in POST requests.
    # 
    # [AnchorTabs]: /docs/esign-rest-api/esign101/concepts/tabs/auto-place/
    string anchorHorizontalAlignment?;
    # Metadata about a property.
    PropertyMetadata anchorHorizontalAlignmentMetadata?;
    # When **true,** this tab is ignored if the `anchorString` is not found in the document.
    string anchorIgnoreIfNotPresent?;
    # Metadata about a property.
    PropertyMetadata anchorIgnoreIfNotPresentMetadata?;
    # When **true,** the text string in a document must match the value of the `anchorString` property in its entirety for an [anchor tab][AnchorTab] to be created. The default value is **false.**
    # 
    # For example, when set to **true,** if the input is `man` then `man` will match but `manpower`, `fireman`, and `penmanship` will not. When **false,** if the input is `man` then `man`, `manpower`, `fireman`, and `penmanship` will all match.
    # 
    # This functionality uses the following rules:
    # 
    # - Unless punctuation is specified in the `anchorString`, this functionality ignores punctuation and the following characters:
    # 
    #   $~><|^+=
    # 
    #   For example, the `anchorString` `water` will match on the string `Fetch a pail of water.`
    # 
    # - Strings embedded in other strings are ignored during the matching process.
    # 
    # - In words that have dashes, the parts separated by dashes are treated as distinct words.
    # 
    #   Example: If the anchor string is `forget`, then an anchor tab is placed on the `forget` in `forget-me-not`, even when `anchorMatchWholeWord` is set to **true.**
    # 
    # - Letters with accent marks are treated as distinct characters from their unaccented counterparts.
    # 
    # - For single-character anchor strings, if the two characters appear right next to each other in the document, a single anchor tab is placed for both of them.
    # 
    #   Example: If the anchor string is `i`, then only one anchor tab is placed in `skiing`.
    # 
    # - Unlike punctuation, numbers are not ignored when finding anchor words.
    # 
    #   Example: If the anchor string is `cat`, then `-cat-` is matched but `1cat2` is not when `anchorMatchWholeWord` is set to **true** (its default value).
    # 
    # 
    # **Note:** You can only specify the value of this property in POST requests.
    # 
    # [AnchorTab]: /docs/esign-rest-api/esign101/concepts/tabs/auto-place/
    string anchorMatchWholeWord?;
    # Metadata about a property.
    PropertyMetadata anchorMatchWholeWordMetadata?;
    # Specifies the string to find in the document and use as the basis for tab placement.
    string anchorString?;
    # Metadata about a property.
    PropertyMetadata anchorStringMetadata?;
    # Reserved for DocuSign.
    string anchorTabProcessorVersion?;
    # Metadata about a property.
    PropertyMetadata anchorTabProcessorVersionMetadata?;
    # Specifies units of the `anchorXOffset` and `anchorYOffset`. Valid units are:
    # 
    # - `pixels` (default)
    # - `inches`
    # - `mms`
    # - `cms`
    string anchorUnits?;
    # Metadata about a property.
    PropertyMetadata anchorUnitsMetadata?;
    # Specifies the X axis location of the tab in `anchorUnits` relative to the `anchorString`.
    string anchorXOffset?;
    # Metadata about a property.
    PropertyMetadata anchorXOffsetMetadata?;
    # Specifies the Y axis location of the tab in `anchorUnits` relative to the `anchorString`.
    string anchorYOffset?;
    # Metadata about a property.
    PropertyMetadata anchorYOffsetMetadata?;
    # When **true,** the information in the tab is bold.
    string bold?;
    # Metadata about a property.
    PropertyMetadata boldMetadata?;
    # 
    string caption?;
    # Metadata about a property.
    PropertyMetadata captionMetadata?;
    # For conditional fields this is the `tabLabel` of the parent tab that controls this tab's visibility.
    string conditionalParentLabel?;
    # Metadata about a property.
    PropertyMetadata conditionalParentLabelMetadata?;
    # For conditional fields, this is the value of the parent tab that controls the tab's visibility.
    # 
    # If the parent tab is a Checkbox, Radio button, Optional Signature, or Optional Initial use "on" as the value to show that the parent tab is active.
    string conditionalParentValue?;
    # Metadata about a property.
    PropertyMetadata conditionalParentValueMetadata?;
    # The DocuSign-generated custom tab ID for the custom tab to be applied. This property can only be used when adding new tabs for a recipient. When used, the new tab inherits all the custom tab properties.
    string customTabId?;
    # Metadata about a property.
    PropertyMetadata customTabIdMetadata?;
    # Specifies the document ID number that the tab is placed on. This must refer to an existing Document's ID attribute.
    string documentId?;
    # Metadata about a property.
    PropertyMetadata documentIdMetadata?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The font to be used for the tab value. Supported fonts include:
    # 
    # - Default
    # - Arial
    # - ArialNarrow
    # - Calibri
    # - CourierNew
    # - Garamond
    # - Georgia
    # - Helvetica
    # - LucidaConsole
    # - MSGothic
    # - MSMincho
    # - OCR-A
    # - Tahoma
    # - TimesNewRoman
    # - Trebuchet
    # - Verdana
    string font?;
    # The font color to use for the information in the tab. Possible values are: 
    # 
    # - Black
    # - BrightBlue
    # - BrightRed
    # - DarkGreen
    # - DarkRed
    # - Gold
    # - Green
    # - NavyBlue
    # - Purple
    # - White
    string fontColor?;
    # Metadata about a property.
    PropertyMetadata fontColorMetadata?;
    # Metadata about a property.
    PropertyMetadata fontMetadata?;
    # The font size used for the information in the tab. Possible values are:
    # 
    # - Size7
    # - Size8
    # - Size9
    # - Size10
    # - Size11
    # - Size12
    # - Size14
    # - Size16
    # - Size18
    # - Size20
    # - Size22
    # - Size24
    # - Size26
    # - Size28
    # - Size36
    # - Size48
    # - Size72
    string fontSize?;
    # Metadata about a property.
    PropertyMetadata fontSizeMetadata?;
    # An integer specifying the order in which the guided form HTML should render. The order is relative to the `formPageLabel`, the group by which to place the guided form HTML block.
    string formOrder?;
    # Metadata about a property.
    PropertyMetadata formOrderMetadata?;
    # A string specifying the group in which to place the guided form HTML. Each group displays as a separate guided forms page in the signing experience.
    string formPageLabel?;
    # Metadata about a property.
    PropertyMetadata formPageLabelMetadata?;
    # An integer specifying the order in which to present the guided form pages.
    string formPageNumber?;
    # Metadata about a property.
    PropertyMetadata formPageNumberMetadata?;
    # The height of the tab in pixels.
    # Must be an integer.
    string height?;
    # Metadata about a property.
    PropertyMetadata heightMetadata?;
    # When **true,** the information in the tab is italic.
    string italic?;
    # Metadata about a property.
    PropertyMetadata italicMetadata?;
    # Allows you to customize locale settings.
    LocalePolicyTab localePolicy?;
    # Contains information for transferring values between Salesforce data fields and DocuSign tabs.
    MergeField mergeField?;
    # Reserved for DocuSign.
    string mergeFieldXml?;
    # The name of the tab. For example, `Sign Here` or `Initial Here`.
    string name?;
    # Metadata about a property.
    PropertyMetadata nameMetadata?;
    # The page number on which the tab is located.
    # For supplemental documents, this value must be `1`.
    string pageNumber?;
    # Metadata about a property.
    PropertyMetadata pageNumberMetadata?;
    # The ID of the recipient to whom the tab will be assigned. This value should match the `recipientId` defined in the recipient object.
    string recipientId?;
    # The globally-unique identifier (GUID) for a specific recipient on a specific envelope. If the same recipient is associated with multiple envelopes, they will have a different GUID for each one. This property is read-only.
    string recipientIdGuid?;
    # Metadata about a property.
    PropertyMetadata recipientIdGuidMetadata?;
    # Metadata about a property.
    PropertyMetadata recipientIdMetadata?;
    # 
    SmartContractInformation smartContractInformation?;
    # Reserved for DocuSign.
    string 'source?;
    # The status of the tab. Possible values are:
    # 
    # - `active`: The tab is active, but the recipient has not yet interacted with it.
    # - `signed`: The recipient signed the tab.
    # - `declined`: The recipient declined the envelope.
    # - `na`: Used when the `status` property is not applicable to the tab type. (For example, a tab that has the `tabType` `SignerAttachmentOptional`).
    string status?;
    # Metadata about a property.
    PropertyMetadata statusMetadata?;
    # An array of tab groups that this tab belongs to. Tab groups are identified by their `groupLabel` property.
    # 
    # To associate this tab with a tab group, add the tab group's `groupLabel` to this array.
    string[] tabGroupLabels?;
    # Metadata about a property.
    PropertyMetadata tabGroupLabelsMetadata?;
    # The unique identifier for the tab.
    string tabId?;
    # Metadata about a property.
    PropertyMetadata tabIdMetadata?;
    # The label associated with the tab. This value may be an empty string.
    # If no value is provided, the tab type is used as the value.
    # 
    # Maximum Length: 500 characters.
    string tabLabel?;
    # Metadata about a property.
    PropertyMetadata tabLabelMetadata?;
    # A positive integer that sets the order the tab is navigated to during signing.
    # 
    # Tabs on a page are navigated to in ascending order, starting with the lowest number and moving to the highest. If two or more tabs have the same `tabOrder` value, the normal auto-navigation setting behavior for the envelope is used.
    string tabOrder?;
    # Metadata about a property.
    PropertyMetadata tabOrderMetadata?;
    # Indicates the type of tab (for example, `signHere` or `initialHere`).
    string tabType?;
    # Metadata about a property.
    PropertyMetadata tabTypeMetadata?;
    # When **true,** the sender cannot change any attributes of the recipient. Used only when working with template recipients. 
    string templateLocked?;
    # Metadata about a property.
    PropertyMetadata templateLockedMetadata?;
    # When **true,** the sender may not remove the recipient. Used only when working with template recipients.
    string templateRequired?;
    # Metadata about a property.
    PropertyMetadata templateRequiredMetadata?;
    # **Note:** Email Address tabs never display this tooltip in the signing interface.
    # 
    # Although you can technically set a value via the API for this tab,
    # it will not be displayed to the recipient.
    string tooltip?;
    # Metadata about a property.
    PropertyMetadata toolTipMetadata?;
    # When **true,** the information in the tab is underlined.
    string underline?;
    # Metadata about a property.
    PropertyMetadata underlineMetadata?;
    # Specifies the value of the tab. 
    string value?;
    # Metadata about a property.
    PropertyMetadata valueMetadata?;
    # The width of the tab in pixels.
    # Must be an integer.
    string width?;
    # Metadata about a property.
    PropertyMetadata widthMetadata?;
    # This property indicates the horizontal offset of the object on the page.
    # DocuSign uses 72 DPI when determining position.
    # Required. Must be an integer. May be zero.
    # 
    # To improve the tab's position on the document,
    # DocuSign recommends
    # adjusting `xPosition`
    # and `yPosition`
    # coordinates
    # by (-3, -2)
    string xPosition?;
    # Metadata about a property.
    PropertyMetadata xPositionMetadata?;
    # This property indicates the vertical offset of the object on the page.
    # DocuSign uses 72 DPI when determining position.
    # Required. Must be an integer. May be zero.
    # 
    # To improve the tab's position on the document,
    # DocuSign recommends
    # adjusting `xPosition`
    # and `yPosition`
    # coordinates
    # by (-3, -2)
    string yPosition?;
    # Metadata about a property.
    PropertyMetadata yPositionMetadata?;
};
