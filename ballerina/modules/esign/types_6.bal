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
public type DowngradeBillingPlanInformation record {
    # 
    string downgradeEventType?;
    # An object used to identify the features and attributes of the account being created.
    PlanInformation planInformation?;
    # 
    string promoCode?;
    # 
    string saleDiscount?;
    # Reserved for DocuSign.
    string saleDiscountPeriods?;
    # 
    string saleDiscountType?;
};

# A complex object specifying ID check configuration.
public type IdCheckConfiguration record {
    # A list of ID check security steps, each specifying an authorization type.
    IdCheckSecurityStep[] authSteps?;
    # Boolean that specifies whether the signature is the default signature for the user.
    string isDefault?;
    # The name of the signature.
    string name?;
};

# Results from a folder item request.
public type FolderItemResponse record {
    # The last index position in the result set. 
    string endPosition?;
    # A list of the envelopes in the specified folder or folders. 
    FolderItem_v2[] folderItems?;
    # The URI for the next chunk of records based on the search request. It is `null` if this is the last set of results for the search. 
    string nextUri?;
    # The URI for the prior chunk of records based on the search request. It is `null` if this is the first set of results for the search. 
    string previousUri?;
    # The number of results in this response. Because you can filter which entries are included in the response, this value is always less than or equal to the `totalSetSize`.
    string resultSetSize?;
    # The starting index position of the current result set.
    string startPosition?;
    # The total number of items in the result.
    string totalRows?;
};

# A tab that displays the recipient's last name. This tab
# takes the recipient's name as entered in the recipient
# information, splits it into sections based on spaces and
# uses the last section as the last name.
public type LastName record {
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
    # The name of the tab. For example, `Sign Here` or `Initial Here`.
    # 
    # If the `tooltip` attribute is not set, this value will be displayed as the custom tooltip text.
    string name?;
    # Metadata about a property.
    PropertyMetadata nameMetadata?;
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

# This object contains the details to use for a specific copy, or instance, of the envelope. When you send an envelope by using a bulk send list, you can customize these properties for each instance.
public type BulkSendingCopy record {
    # The custom fields for this copy of the envelope.
    # 
    # **Note:** These custom fields must also be included in the original envelope or template that you want to send.
    BulkSendingCopyCustomField[] customFields?;
    # 
    BulksendingCopyDocGenFormField[] docGenFormFields?;
    # The email body for this copy of the envelope.
    string emailBlurb?;
    # The email subject line for this copy of the envelope.
    # 
    # For information about adding merge field information to the email subject,
    # see [Template Email Subject Merge Fields](/docs/esign-rest-api/reference/templates/templates/create/).
    # 
    # **Note:** The subject line is limited to 100 characters, including any merged fields.It is not truncated. It is an error if the text is longer than 100 characters.
    string emailSubject?;
    # Information about the recipients associated with this copy of the envelope.
    BulkSendingCopyRecipient[] recipients?;
};

# 
public type InlineTemplate record {
    # An `accountCustomField` is an envelope custom field that you set at the account level.
    # Applying custom fields enables account administrators to group and manage envelopes.
    AccountCustomFields customFields?;
    # A complex element that contains details about the documents associated with the envelope.
    Document[] documents?;
    # 
    Envelope envelope?;
    # Envelope recipients
    EnvelopeRecipients recipients?;
    # Specifies the order in which templates are overlaid.
    string sequence?;
};

# Contains address input information.
public type AddressInformationInput record {
    # Contains address information.
    AddressInformation addressInformation?;
    # Specifies the display level for the recipient. Valid values are:
    # * `ReadOnly`
    # * `Editable`
    # * `DoNotDisplay`
    string displayLevelCode?;
    # A Boolean value that specifies whether the information must be returned in the response.
    string receiveInResponse?;
};

# 
public type BulkProcessingLists record {
    # 
    string[] bulkProcessListIds?;
};

# 
public type ConditionalRecipientRuleFilter record {
    # How the tab value is compared to the `value` property. Valid values:
    # 
    # * `equals`
    # * `greaterThan`
    # * `greaterThanEquals`
    # * `lessThan`
    # * `lessThanEquals`
    # * `filled`
    # * `selected`
    string operator?;
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
    # The scope under which the condition is evaluated. Valid values:
    # 
    # * `tabs`
    string scope?;
    # The unique identifier for the tab.
    string tabId?;
    # The label associated with the tab. This value may be an empty string.
    # If no value is provided, the tab type is used as the value.
    # 
    # Maximum Length: 500 characters.
    string tabLabel?;
    # Indicates the type of tab (for example, `signHere` or `initialHere`).
    string tabType?;
    # A set value to which the tab's actual value is compared.
    string value?;
};

# 
public type UserAuthorizationsResponse record {
    # 
    UserAuthorizationWithStatus[] results?;
};

# Invoices
public type Invoices record {
    # Reserved for DocuSign.
    string amount?;
    # Reserved for DocuSign.
    string balance?;
    # Reserved for DocuSign.
    string dueDate?;
    # Reserved for DocuSign.
    string invoiceId?;
    # Reserved for DocuSign.
    BillingInvoiceItem[] invoiceItems?;
    # Reserved for DocuSign.
    string invoiceNumber?;
    # Contains a URI for an endpoint that you can use to retrieve invoice information.
    string invoiceUri?;
    # 
    string nonTaxableAmount?;
    # 
    string pdfAvailable?;
    # 
    string taxableAmount?;
};

# This resource is used to create a responsive preview of all of the documents associated with a template.
public type TemplateResponsiveHtmlPreview record {
    # Holds the properties that define how to generate the responsive-formatted HTML for the document.
    string[] htmlDefinitions?;
};

# The proof file of the recipient. [ID Evidence](/docs/idevidence-api/) uses proof files to store the identification data that recipients submit when verifying their ID with [ID Verification](/docs/esign-rest-api/esign101/concepts/documents/)
public type RecipientProofFile record {
    # 
    string hasIdentityAttempts?;
    # Indicates whether a proof file is available for this recipient.
    string isInProofFile?;
};

# This object contains details about a billing plan.
public type BillingPlanInformation record {
    # Contains information about an APP store receipt.
    AppStoreReceipt appStoreReceipt?;
    # Contains information about the address associated with the account.
    AccountAddress billingAddress?;
    # This object contains information about a credit card that is associated with an account.
    CreditCardInformation creditCardInformation?;
    # Contains information about a bank that processes a customer's direct debit payments.
    DirectDebitProcessorInformation directDebitProcessorInformation?;
    # (Optional) The user's reason for downgrading their billing plan.
    string downgradeReason?;
    # 
    string enablePreAuth?;
    # When **true,** customer support is provided as part of the account plan.
    string enableSupport?;
    # The number of seats (users) included in the plan.
    string includedSeats?;
    # Reserved for DocuSign.
    string incrementalSeats?;
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
    string paymentProcessor?;
    # 
    PaymentProcessorInformation paymentProcessorInformation?;
    # An object used to identify the features and attributes of the account being created.
    PlanInformation planInformation?;
    # 
    string processPayment?;
    # A complex type that contains the following information for entering referral and discount information. The following items are included in the referral information (all string content): enableSupport, includedSeats, saleDiscountPercent, saleDiscountAmount, saleDiscountFixedAmount, saleDiscountPeriods, saleDiscountSeatPriceOverride, planStartMonth, referralCode, referrerName, advertisementId, publisherId, shopperId, promoCode, groupMemberId, idType, and industry
    # 
    # **Note:** saleDiscountPercent, saleDiscountAmount, saleDiscountFixedAmount, saleDiscountPeriods, and saleDiscountSeatPriceOverride are reserved for DocuSign use only.
    ReferralInformation referralInformation?;
    # The renewal status of the account. Possible values are:
    # 
    # - `auto`: The account automatically renews. 
    # - `queued_for_close`: The account will be closed at the billingPeriodEndDate. 
    # - `queued_for_downgrade`: The account will be downgraded at the `billingPeriodEndDate`.
    string renewalStatus?;
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
    string taxExemptId?;
};

# 
public type AccountPasswordLockoutDurationMinutes record {
    # 
    string maximumMinutes?;
    # 
    string minimumMinutes?;
};

# 
public type BulkSendEnvelopesInfo record {
    # When **true,** marks all of the documents in the envelope as authoritative copies.
    # 
    # **Note:** You can override this value for a specific document. For example, you can set the `authoritativeCopy` property to **true** at the envelope level, but turn it off for a single document by setting the `authoritativeCopy` property for the document to **false.**
    string authoritativeCopy?;
    # 
    string completed?;
    # 
    string correct?;
    # The UTC DateTime when the workspace user authorization was created.
    string created?;
    # 
    string declined?;
    # 
    string deleted?;
    # 
    string delivered?;
    # 
    string digitalSignaturesPending?;
    # The number of entries with a status of `sent`.
    string sent?;
    # 
    string signed?;
    # 
    string timedOut?;
    # 
    string transferCompleted?;
    # 
    string voided?;
};

# 
public type DocumentTemplate record {
    # 
    string documentEndPage?;
    # Specifies the document ID number that the tab is placed on. This must refer to an existing Document's ID attribute.
    string documentId?;
    # 
    string documentStartPage?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The unique identifier of the template. If this is not provided, DocuSign generates an error and the call fails.
    string templateId?;
};

# 
public type NewAccountDefinition record {
    # The account name for the new account.
    string accountName?;
    # Contains account settings information. Used in requests to set property values. Used in responses to report property values.
    AccountSettingsInformation accountSettings?;
    # Contains information about the address associated with the account.
    AccountAddress addressInformation?;
    # This object contains information about a credit card that is associated with an account.
    CreditCardInformation creditCardInformation?;
    # Contains information about a bank that processes a customer's direct debit payments.
    DirectDebitProcessorInformation directDebitProcessorInformation?;
    # The Distributor Code that you received from DocuSign.
    string distributorCode?;
    # The password for the `distributorCode`.
    string distributorPassword?;
    # 
    string enablePreAuth?;
    # Reserved for DocuSign.
    string envelopePartitionId?;
    # User information.
    UserInformation initialUser?;
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
    string paymentProcessor?;
    # 
    PaymentProcessorInformation paymentProcessorInformation?;
    # An object used to identify the features and attributes of the account being created.
    PlanInformation planInformation?;
    # 
    string processPayment?;
    # A complex type that contains the following information for entering referral and discount information. The following items are included in the referral information (all string content): enableSupport, includedSeats, saleDiscountPercent, saleDiscountAmount, saleDiscountFixedAmount, saleDiscountPeriods, saleDiscountSeatPriceOverride, planStartMonth, referralCode, referrerName, advertisementId, publisherId, shopperId, promoCode, groupMemberId, idType, and industry
    # 
    # **Note:** saleDiscountPercent, saleDiscountAmount, saleDiscountFixedAmount, saleDiscountPeriods, and saleDiscountSeatPriceOverride are reserved for DocuSign use only.
    ReferralInformation referralInformation?;
    # 
    SocialAccountInformation socialAccountInformation?;
    # 
    string taxExemptId?;
};

# This object provides information about the settings for the workspace.
public type WorkspaceSettings record {
    # When **true,** commenting on the documents in the workspace is allowed.
    string commentsAllowed?;
};

# 
public type AccountPasswordMinimumPasswordAgeDays record {
    # 
    string maximumAge?;
    # 
    string minimumAge?;
};

# 
public type DowngradRequestBillingInfoResponse record {
    # 
    DowngradePlanUpdateResponse downgradePlanInformation?;
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
};

# A complex element that contains input information related to a recipient ID check.
public type IdCheckInformationInput record {
    # Contains address input information.
    AddressInformationInput addressInformationInput?;
    # Complex type containing:
    # 
    # * dateOfBirth
    # * displayLevelCode
    # * receiveInResponse
    DobInformationInput dobInformationInput?;
    # 
    Ssn4InformationInput ssn4InformationInput?;
    # 
    Ssn9InformationInput ssn9InformationInput?;
};

# A user-specified object that describes the envelope delay.
# 
# To indicate a relative delay, use `delay`. To indicate the exact datetime the envelope should be sent, use `resumeDate`. Only one of the two properties can be used.
public type EnvelopeDelayRule record {
    # A string timespan representing the duration of the sending delay. The timespan is in the format `d.hh:mm:ss` where `d` is the number of days, `hh` is the number of hours (measured on a 24-hour clock), `mm` is minutes, and `ss` is seconds. The maximum delay is 30 days.
    string delay?;
    # An ISO 8601 formatted datetime string indicating the date and time that the envelope will be sent. The specified datetime must occur in the future. It must not exceed 30 days from the time that the request is made.
    string resumeDate?;
};

# Contains information on a billing plan.
public type BillingPayment record {
    # Reserved for DocuSign.
    string amount?;
    # Reserved for DocuSign.
    string invoiceId?;
    # The ID of the payment.
    string paymentId?;
};

# This response object is returned after you upload a chunked upload.
public type ChunkedUploadResponse record {
    # A 64-byte, Secure Hash Algorithm 256 (SHA256) checksum that the caller computes across the entirety of the original content that has been uploaded to the chunked upload. DocuSign compares this value to its own computation. If the two values are not equal, the original content and received content are not the same and the commit action is refused.
    string checksum?;
    # The ID of the chunked upload. 
    string chunkedUploadId?;
    # A list of the parts that compose the chunked upload, including their byte sizes. The list must be contiguous before you can commit the chunked upload.
    ChunkedUploadPart[] chunkedUploadParts?;
    # The URI that you use to reference the chunked upload in other API requests, such as envelope document and envelope attachment requests. 
    string chunkedUploadUri?;
    # When **true,** the chunked upload has been committed. A committed chunked upload can no longer receive any additional parts and is ready for use within other API requests. 
    string committed?;
    # The UTC time at which the chunked upload expires and is no longer addressable. 
    # 
    # **Note:** You must fully upload and use a chunked upload within 20 minutes of initializing it.
    string expirationDateTime?;
    # The maximum number of parts allowed for a chunked upload. This value is configurable per DocuSign environment, account, or integrator. The default value is 128. The maximum possible value is 256.  
    string maxChunkedUploadParts?;
    # The maximum total size allowed for a chunked upload. This value is configured per DocuSign environment, account, or integrator. The default value is 50 MB.
    string maxTotalSize?;
    # The total size of the parts of the chunked upload.
    # 
    # **Note:** When a chunked upload is used as an envelope document, it is subject to the PDF size limit (25 MB) and page count limit that apply to all envelope documents.
    string totalSize?;
};

# Specifies an Identity Verification workflow.
public type AccountIdentityVerificationWorkflow record {
    # Text describing the purpose of the Identity Verification workflow.
    string defaultDescription?;
    # The name of the Identity Verification workflow.
    string defaultName?;
    # 
    AccountIdentityInputOption[] inputOptions?;
    # When **true,** the workflow is disabled.
    string isDisabled?;
    # 
    string ownerType?;
    # Contains information about the signature provider associated with the Identity Verification workflow.
    # If empty, then this specific workflow is not intended for signers.
    AccountSignatureProvider signatureProvider?;
    # Workflow unique ID</br>This is the ID you must specify when setting ID Verification in an envelope using the `identityVerification`
    # [core recipient parameter](/docs/esign-rest-api/reference/envelopes/enveloperecipients/#core-recipient-parameters)
    string workflowId?;
    # 
    string workflowLabel?;
    # Reserved for DocuSign.
    string workflowResourceKey?;
};

# A tab that displays the recipient's title.
public type Title record {
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
    # When **true,** the signer is required to fill out this tab.
    string required?;
    # Metadata about a property.
    PropertyMetadata requiredMetadata?;
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

# Contains details about the history of the BCC email archive configuration.
public type BccEmailArchiveHistory record {
    # The ID of the account that owns the BCC email archive configuration.
    string accountId?;
    # The action taken on the BCC email archive configuration.
    # 
    # Examples: 
    # 
    # - `CREATED`: The BCC email archive configuration has been created.
    # - `UPDATED`: The BCC email address has been activated by clicking on the activation link in the activation email message.
    # - `CLOSED`: The BCC email address has been marked as closed is no longer used for archiving.
    string action?;
    # The BCC email address used to archive the emails that DocuSign generates. 
    # 
    # Example: customer_bcc@example.com
    string email?;
    # The UTC DateTime when the BCC email address was last modified.
    string modified?;
    # 
    UserInfo modifiedBy?;
    # The status of the BCC email address. Possible values are:
    # 
    # - `activation_sent`: An activation link has been sent to the BCC email address.
    # - `active`: The BCC email address is actively used for archiving.
    # - `closed`: The BCC email address is no longer used for archiving.
    string status?;
};

# This object represents a list custom field from which envelope creators and senders can select custom data.
public type ListCustomField record {
    # If you are using merge fields, this property specifies the type of the merge field. The only supported value is `salesforce`.
    string configurationType?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The ID of the custom field.
    string fieldId?;
    # An array of strings that represents the options in a list.
    # 
    # Maximum length: 2048 characters, but each individual option string can only be a maximum of 100 characters.
    string[] listItems?;
    # The name of the custom field.
    string name?;
    # When **true,** senders are required to select an option from the list before they can send the envelope.
    string required?;
    # When **true,** the field displays in the **Envelope Custom Fields** section when a user creates or sends an envelope.
    string show?;
    # The value of the custom field. This is the value that the user who creates or sends the envelope selects from the list.
    string value?;
};

# This tab is used with the Approve tab to handle supplemental documents.
public type View record {
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
    # The text to display on the button.
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
    # When **true,** the recipient must click the **View** button for the supporting document prior to completing the signing process.
    string required?;
    # Metadata about a property.
    PropertyMetadata requiredMetadata?;
    # When **true,** the recipient must read through the document.
    string requiredRead?;
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
public type BulkProcessRequest record {
    # 
    string batchName?;
    # The GUID of the envelope or template.
    string envelopeOrTemplateId?;
};

# Information for a folder request.
public type FoldersRequest record {
    # An array of envelope ID GUIDs.
    string[] envelopeIds?;
    # Not used.
    Folder[] folders?;
    #  The ID of the folder that the envelope is being moved from.
    string fromFolderId?;
};

# This object contains information about a file or folder in a workspace.
public type WorkspaceItems record {
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
    # The ID of the workspace item.
    string id?;
    #  When **true,** the item is public.
    string isPublic?;
    # The UTC DateTime that the item was last modified.
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
    # The type of workspace item. Valid values are:
    # 
    # - `file`
    # - `folder`
    string 'type?;
    # A URI containing the user ID.
    string uri?;
    # Provides properties that describe user authorization to a workspace.
    WorkspaceUserAuthorization userAuthorization?;
};

# 
public type FileType record {
    # 
    string fileExtension?;
    # The mime-type of a file type listed in a fileTypes collection.
    string mimeType?;
};

# Use this object to create a filtered view of the items in a folder.
public type Filter record {
    # When **true,** the current user needs to take action on the item.
    string actionRequired?;
    # The number of days a sent envelope remains active before it expires.
    string expires?;
    # Filters for any combination of folder IDs and folder types. The possible folder types are:
    # 
    # - `awaiting_my_signature`
    # - `completed`
    # - `draft`
    # - `drafts`
    # - `expiring_soon`
    # - `inbox`
    # - `out_for_signature`
    # - `recyclebin`
    # - `sentitems`
    # - `waiting_for_others`
    string folderIds?;
    # The UTC DateTime of the beginning of a date range. If no value is provided, the default search is the previous 30 days.
    string fromDateTime?;
    # When **true,** the item is a template.
    string isTemplate?;
    # The order in which to sort the results.
    # 
    # Valid values are: 
    # 
    # 
    # * `asc`: Ascending order.
    # * `desc`: Descending order. 
    string 'order?;
    # The field used to sort the results.
    # 
    # Example: `Created`
    string orderBy?;
    # Reserved for DocuSign.
    string searchTarget?;
    # A free text search field for searching across the items in a folder. The search looks for the text that you enter in the recipient names and emails, envelope custom fields, sender name, and subject.
    string searchText?;
    # The status of the envelope. By default, all statuses are returned.
    # 
    # For details, see [Envelope Status Code Descriptions](/docs/esign-rest-api/esign101/rules-and-limits/responses/).
    string status?;
    # The UTC DateTime of the end of a date range. If no value is provided, the default search is to the current date.
    string toDateTime?;
};

# 
public type ConnectSecret record {
    # A list of Connect failure logs.
    ConnectLog[] failures?;
    # A list of Connect general logs.
    ConnectLog[] logs?;
    # The count of records in the log list.
    string totalRecords?;
    # The type of this tab. Values are:
    # 
    # - `Approve`
    # - `CheckBox`
    # - `Company`
    # - `Date`
    # - `DateSigned`
    # - `Decline`
    # - `Email`
    # - `EmailAddress`
    # - `EnvelopeId`
    # - `FirstName`
    # - `Formula`
    # - `FullName`
    # - `InitialHere`
    # - `InitialHereOptional`
    # - `LastName`
    # - `List`
    # - `Note`
    # - `Number`
    # - `Radio`
    # - `SignerAttachment`
    # - `SignHere`
    # - `SignHereOptional`
    # - `Ssn`
    # - `Text`
    # - `Title`
    # - `Zip5`
    # - `Zip5Dash4`
    string 'type?;
};

# A tab that displays the recipient's full name.
public type FullName record {
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
    # The DocuSign-generated custom tab ID for the custom tab to be applied. This can only be used when adding new tabs for a recipient. When used, the new tab inherits all the custom tab properties.
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
    # 
    # If the `tooltip` attribute is not set, this value will be displayed as the custom tooltip text.
    string name?;
    # Metadata about a property.
    PropertyMetadata nameMetadata?;
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

# A complex type defining the management and access rights of a recipient assigned as an editor on the envelope. Editors have the same management and access rights for the envelope as the sender. They can make changes to the envelope as if they were using the Correct feature. This recipient can add name and email information, add or change the routing order and set authentication options for the remaining recipients. Additionally, this recipient can edit signature/initial tabs and text tabs for the remaining recipients.
public type Editor record {
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
    # The recipient's email address. Notification of the document to sign is sent to this email address. 
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
    # Reserved for DocuSign.
    string faxNumber?;
    # Metadata about a property.
    PropertyMetadata faxNumberMetadata?;
    # The recipient's first name. 
    # 
    # Maximum Length: 50 characters.
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
public type EnvelopeDocumentHtmlDefinitions record {
    # Holds the properties that define how to generate the responsive-formatted HTML for the document.
    DocumentHtmlDefinitionOriginal[] htmlDefinitions?;
};

# 
public type Watermark record {
    # The display angle of the watermark. Valid values:
    # 
    # * 0 (horizontal)
    # * 45 (diagonal)
    # * 90 (vertical)
    string displayAngle?;
    # When **true,** the watermark will be applied to documents that are still in progress. When **false,** the watermark will not be applied.
    string enabled?;
    # The watermark's font. Valid values:
    # 
    # - `courier`
    # - `helvetica`
    # - `timesnewroman`
    string font?;
    # The watermark's font color. Valid values:
    # 
    # * `black`
    # * `blue`
    # * `red`
    # * `gray`
    # * `yellow`
    string fontColor?;
    # The watermark's font size. Valid values:
    # 
    # * `30`
    # * `40`
    # * `50`
    # * `60`
    # * `70`
    # * `80`
    # * `90`
    string fontSize?;
    # The ID of the watermark.
    string id?;
    # The Base64 representation of the watermark image.
    # 
    # This property is read-only.
    string imageBase64?;
    # The transparency percentage of the watermark image. Valid values:
    # 
    # * `5`
    # * `10`
    # * `15`
    # * `20`
    # * `25`
    # * `30`
    # * `35`
    # * `40`
    # * `45`
    string transparency?;
    # The text for the watermark.
    string watermarkText?;
};

# 
public type BillingPaymentRequest record {
    # The payment amount for the past due invoices. This value must match the pastDueBalance value retrieved using Get Past Due Invoices.
    string paymentAmount?;
};

# An object used to identify the features and attributes of the account being created.
public type PlanInformation record {
    # Reserved for DocuSign.
    AddOn[] addOns?;
    # Specifies the [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code for the account.
    string currencyCode?;
    # Reserved for DocuSign.
    string freeTrialDaysOverride?;
    # Reserved for DocuSign.
    FeatureSet[] planFeatureSets?;
    # DocuSign's ID for the account plan.
    string planId?;
    # 
    RecipientDomain[] recipientDomains?;
};

# 
public type AccountIdentityVerificationResponse record {
    # Specifies the ID Verification workflow applied on an envelope by workflow ID. <br/>See the [list](/docs/esign-rest-api/reference/accounts/identityverifications/list/) method in the [IdentityVerifications](/docs/esign-rest-api/reference/accounts/identityverifications/) resource for more information on how to retrieve workflow IDs available for an account. <br/>This can be used in addition to other [recipient authentication](https://support.docusign.com/s/document-item?bundleId=gav1643676262430&topicId=kzp1578456318101.html) methods. <br/>Note that ID Verification and ID Check are two distinct methods. ID Verification checks recipients' identity by verifying their ID while ID Check relies on data available on public records (such as current and former address).
    AccountIdentityVerificationWorkflow[] identityVerification?;
};

# A tab that allows the recipient to enter a ZIP code. The ZIP
# code can be five digits or nine digits in the ZIP+4 format.
# The zip code can be typed with or without dashes. It uses
# the same parameters as a Text tab, with the validation
# message and pattern set for ZIP code information.
public type Zip record {
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
    # When **true,** ZIP+4 format is used.
    string useDash4?;
    # Metadata about a property.
    PropertyMetadata useDash4Metadata?;
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

# This object contains information abut a BCC email archive configuration (a BCC email address used to archive DocuSign-generated emails).
public type BccEmailArchive record {
    # The ID of the account that owns the BCC email archive configuration.
    string accountId?;
    # The ID of the BCC email archive configuration.
    string bccEmailArchiveId?;
    # The UTC DateTime when the BCC email archive configuration was created.
    string created?;
    # 
    UserInfo createdBy?;
    # The BCC email address to use for archiving DocuSign messages.
    # 
    # Example: customer_bcc@example.com
    string email?;
    # The GUID of the activation email message sent to the BCC email address.
    string emailNotificationId?;
    # The UTC DateTime when the BCC email archive configuration was last modified.
    string modified?;
    # 
    UserInfo modifiedBy?;
    # The status of the BCC email address. Possible values are:
    # 
    # - `activation_sent`: An activation link has been sent to the BCC email address.
    # - `active`: The BCC email address is actively used for archiving.
    # - `closed`: The BCC email address is no longer used for archiving.
    string status?;
    # The helper URI for retrieving the BCC email archive.
    string uri?;
};

# A collection of document generation fields.
public type DocGenFormFields record {
    # The status of the document. This is a read-only property.
    # Valid values:
    # 
    # - `mergesuceeded`
    # - `created`
    # - `hassyntaxerror`
    string docGenDocumentStatus?;
    # A list of `docGenSyntaxError` objects.
    DocGenSyntaxError[] docGenErrors?;
    # A list of `docGenFormField` objects.
    DocGenFormField[] docGenFormFieldList?;
    # The GUID of the document.
    string documentId?;
};

# 
public type RecipientEvent record {
    # When **true,**
    # the Connect webhook messages
    # will include the envelope's PDF documents.
    # Including the PDF documents
    # greatly increases the size of the notification messages.
    # Ensure that your listener can handle
    # incoming messages that are 25MB or larger.
    string includeDocuments?;
    # Send a webhook notification for the following recipient statuses: Sent, Delivered, Completed, Declined, AuthenticationFailed, and AutoResponded.
    string recipientEventStatusCode?;
};

# 
public type SigningGroupUser record {
    # 
    string email?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The name of the group member. 
    # 
    # Maximum Length: 100 characters. 
    string userName?;
};

# Lists of envelope and transaction IDs to use in the results.
# 
# If you use this request body with Envelopes: listStatus,
# you must set one or both of the following query parameters
# to the special value `request_body`:
# 
# - `envelope_ids=request_body`
# - `transaction_ids=request_body`
public type EnvelopeIdsRequest record {
    # A comma-separated list of envelope IDs to include in the results.
    string[] envelopeIds?;
    # A comma-separated list of transaction IDs to include in the results. Note that transaction IDs are valid for seven days.
    string[] transactionIds?;
};

# A list of PowerForms.
public type PowerFormsResponse record {
    # The last index position in the result set. 
    int:Signed32 endPosition?;
    # The URI for the next chunk of records based on the search request. It is `null` if this is the last set of results for the search. 
    string nextUri?;
    # An array of PowerForm objects.
    PowerForm[] powerForms?;
    # The URI for the prior chunk of records based on the search request. It is `null` if this is the first set of results for the search. 
    string previousUri?;
    # The number of results in this response. Because you can filter which entries are included in the response, this value is always less than or equal to the `totalSetSize`.
    int:Signed32 resultSetSize?;
    # The starting index position of the current result set.
    int:Signed32 startPosition?;
    # The total number of items in the result set. This value is always greater than or equal to the value of `resultSetSize`.
    int:Signed32 totalSetSize?;
};

# Information about shared templates.
public type TemplateSharedItem record {
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # 
    UserInfo owner?;
    # The user's encrypted password hash.
    string password?;
    # How the template is shared. One of:
    # 
    # - `not_shared`
    # - `shared_to`
    string shared?;
    # List of groups that share the template.
    MemberGroupSharedItem[] sharedGroups?;
    # List of users that share the template.
    UserSharedItem[] sharedUsers?;
    # The unique identifier of the template. If this is not provided, DocuSign will generate a value. 
    string templateId?;
    # The name of the shared template.
    string templateName?;
};

# Specifies the area in which a date stamp is placed. This parameter uses pixel positioning to draw a rectangle at the center of the stamp area. The stamp is superimposed on top of this central area.
# 
# This property contains the following information about the central rectangle:
# 
# - `DateAreaX`: The X axis position of the top-left corner.
# - `DateAreaY`: The Y axis position of the top-left corner.
# - `DateAreaWidth`: The width of the rectangle.
# - `DateAreaHeight`: The height of the rectangle.
public type DateStampProperties record {
    # The height of the rectangle.
    string dateAreaHeight?;
    # The width of the rectangle.
    string dateAreaWidth?;
    # The X axis position of the top-left corner.
    string dateAreaX?;
    # The Y axis position of the top-left corner.
    string dateAreaY?;
};

# The CloudStorageProviders resource provides methods that allow you to manage the cloud storage providers associate with an account.
public type CloudStorageProviders record {
    # An Array containing the storage providers associated with the user.
    CloudStorageProvider[] storageProviders?;
};

# A complex element that specifies reminder settings for the envelope.
public type Reminders record {
    # An integer specifying the number of days after the recipient receives the envelope that reminder emails are sent to the recipient. The default value is 0.
    string reminderDelay?;
    # When **true,** reminders are enabled. The default value is **false.**
    string reminderEnabled?;
    # An integer specifying the interval in days between reminder emails. The default value is 0.
    string reminderFrequency?;
};

# 
public type FavoriteTemplatesInfo record {
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The favorite templates acted upon by the call.
    FavoriteTemplatesContentItem[] favoriteTemplates?;
    # The number of templates successfully updated by the call. This property is read-only.
    int:Signed32 templatesUpdatedCount?;
};

# 
public type PayPalLegacySettings record {
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
    # 
    string partner?;
    # The user's encrypted password hash.
    string password?;
    # The name of the user.
    string userName?;
    # 
    string vendor?;
};

# Metadata about a property.
public type PropertyMetadata record {
    # An array of option strings supported by this setting.
    string[] options?;
    # Indicates whether the property is editable. Valid values are:
    # 
    # - `editable`
    # - `read_only`
    string rights?;
};

# 
public type SealIdentifier record {
    # The user-friendly display name for a seal.
    string sealDisplayName?;
    # The name of a seal.
    string sealName?;
};

# Information about folder item results.
public type FolderItem_v2 record {
    # If the item is an envelope, this is the UTC DateTime when the envelope was completed.
    string completedDateTime?;
    # The UTC DateTime when the item was created.
    string createdDateTime?;
    # If the item is an envelope, this is the ID of the envelope.
    string envelopeId?;
    # If the item is an envelope, this is the URI for retrieving it.
    string envelopeUri?;
    # The date and time the envelope is set to expire.
    string expireDateTime?;
    # The ID of the folder.
    string folderId?;
    # If the item is a subfolder, this is the URI for retrieving it.
    string folderUri?;
    # When **true,** indicates compliance with United States Food and Drug Administration (FDA) regulations on electronic records and electronic signatures (ERES).
    string is21CFRPart11?;
    # The date and time that the item was last modified.
    string lastModifiedDateTime?;
    # The name of the user who owns the folder.
    string ownerName?;
    # Envelope recipients
    EnvelopeRecipients recipients?;
    # Contains a URI for an endpoint that you can use to retrieve the recipients.
    string recipientsUri?;
    # The name of the sender's company.
    string senderCompany?;
    # The sender's email address.
    string senderEmail?;
    # The sender's name.
    string senderName?;
    # The sender's id.
    string senderUserId?;
    # The UTC DateTime when the envelope was sent. This property is read-only.
    string sentDateTime?;
    # Indicates the envelope status. Valid values are:
    # 
    # * sent - The envelope is sent to the recipients. 
    # * created - The envelope is saved as a draft and can be modified and sent later.
    string status?;
    # The subject of the envelope.
    string subject?;
    # The unique identifier of the template. If this is not provided, DocuSign will generate a value. 
    string templateId?;
    # The URI for retrieving the template.
    string templateUri?;
};

# This request object contains information about the lock that you want to create or update.
public type LockRequest record {
    # The number of seconds to lock the envelope for editing.  Must be greater than 0 seconds.
    string lockDurationInSeconds?;
    # A friendly name of the application used to lock the envelope.  Will be used in error messages to the user when lock conflicts occur.
    string lockedByApp?;
    # The type of lock.  Currently `edit` is the only supported type.
    string lockType?;
    # The [password for the template](https://support.docusign.com/s/document-item?bundleId=xry1643227563338&topicId=xwo1578456395432.html). If you are using a lock for a template that has a password or an envelope that is based on a template that has a password, you must enter the `templatePassword` to save the changes.
    string templatePassword?;
    # When **true,** a scratchpad is used to edit information.
    #  
    string useScratchPad?;
};

# Describes the workflow for an envelope or template.
public type EnvelopeWorkflowDefinition record {
    # 
    string currentWorkflowStepId?;
    # 
    string resumeDate?;
    # A complex element that specifies the scheduled sending settings for the envelope.
    ScheduledSending scheduledSending?;
    # 
    string workflowStatus?;
    # 
    WorkflowStep[] workflowSteps?;
};

# Authorizations allow you to share access between users on an account.
public type Authorizations record {
    # 
    AuthorizationUser agentUser?;
    # 
    string authorizationId?;
    # The UTC DateTime when the workspace user authorization was created.
    string created?;
    # 
    string createdBy?;
    # 
    string endDate?;
    # 
    string modified?;
    # The user ID (GUID) of the user who last modified this user record. This property is read-only.
    string modifiedBy?;
    # 
    string permission?;
    # 
    AuthorizationUser principalUser?;
    # 
    string startDate?;
};

# Information about a specific step in an Identity Verification workflow.
public type AccountIdentityVerificationStep record {
    # The name of the Identity Verification workflow step.
    string name?;
    # Reserved for DocuSign.
    string 'type?;
};

# 
public type BulkSendBatchActionRequest record {
    # The action to apply. Valid values:
    # 
    # * `Resend`
    # * `Correct`
    # * `Void`
    # 
    # This property is required and case-sensitive. The value must correspond to the `bulkAction` query parameter.
    string action?;
    # A complex element that specifies the notification settings for the envelope.
    Notification notification?;
    # A string explaining why the envelope is voided. This value is shown in a message to the recipients.
    # 
    # This property is required if `action` is `Void`.
    string voidReason?;
};

# 
public type PathExtendedElement record {
    # 
    string name?;
    # The type of this tab. Values are:
    # 
    # - `Approve`
    # - `CheckBox`
    # - `Company`
    # - `Date`
    # - `DateSigned`
    # - `Decline`
    # - `Email`
    # - `EmailAddress`
    # - `EnvelopeId`
    # - `FirstName`
    # - `Formula`
    # - `FullName`
    # - `InitialHere`
    # - `InitialHereOptional`
    # - `LastName`
    # - `List`
    # - `Note`
    # - `Number`
    # - `Radio`
    # - `SignerAttachment`
    # - `SignHere`
    # - `SignHereOptional`
    # - `Ssn`
    # - `Text`
    # - `Title`
    # - `Zip5`
    # - `Zip5Dash4`
    string 'type?;
    # 
    string typeName?;
};

# 
public type TabMetadataList record {
    # A list of tabs, which are represented graphically as symbols on documents at the time of signing. Tabs show recipients where to sign, initial, or enter data. They may also display data to the recipients.
    TabMetadata[] tabs?;
};

# This object contains information about a file or folder in cloud storage.
public type ExternalFile record {
    # The UTC date and time that the file or folder was last modified.
    string date?;
    # 
    string hasCompositeTemplate?;
    # The storage provider's ID for the file or folder.
    string id?;
    # The file extension for a file.
    # 
    # **Note:** If the item is a folder, this value is null.
    string img?;
    # The full name of a file.
    string name?;
    # 
    string ownerName?;
    # The size of the file. The file size limit varies based on the cloud storage provider.
    string size?;
    # When **true,** DocuSign supports the file type for upload.
    string supported?;
    # The type of cloud storage item. Valid values are:
    # 
    # - `file`
    # - `folder`
    string 'type?;
    # The URI for the file or folder.
    string uri?;
};

# This complex type contains summaries that provide basic information about the bulk send lists that belong to the current user.
public type BulkSendingListSummaries record {
    # An array of `bulkSendingListSummary` objects where each summary provides basic information about a bulk send list that belongs to the current user.
    BulkSendingListSummary[] bulkListSummaries?;
};

# Document tabs are tabs that are associated with a document rather than with a recipient.
public type EnvelopeDocumentTabs record {
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

# Contains information about the current envelope purge configuration for an account, which enables account administrators to purge documents from completed and voided envelopes after a set number of days (`retentionDays`). 
public type EnvelopePurgeConfiguration record {
    # When **true,** purging is enabled.
    string purgeEnvelopes?;
    # When **true,** the system also redacts personally identifiable information (PII).
    # 
    # **Note:** To redact PII, you must also set the property `removeTabsAndEnvelopeAttachments` to **true.**
    string redactPII?;
    # When **true,** the system also purges the tabs and attachments associated with the envelopes. 
    string removeTabsAndEnvelopeAttachments?;
    # The number of days to retain envelope documents before purging them. This value must be a number between `0` and `999`.
    string retentionDays?;
};

# Complex type containing:
# 
# * dateOfBirth
# * displayLevelCode
# * receiveInResponse
public type DobInformationInput record {
    # Specifies the recipient's date, month, and year of birth.
    string dateOfBirth?;
    # Specifies the display level for the recipient. Valid values are:
    # * `ReadOnly`
    # * `Editable`
    # * `DoNotDisplay`
    string displayLevelCode?;
    # A Boolean value that specifies whether the information must be returned in the response.
    string receiveInResponse?;
};

# Contains a list of BCC email archive configurations.
public type BccEmailArchiveList record {
    # A list of  BCC email archive configurations.
    BccEmailArchive[] bccEmailArchives?;
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

# Contains a list of account users.
public type UserInformationList record {
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
    # User management information.
    UserInformation[] users?;
};

# 
public type EnvelopeTransferRuleInformation record {
    # The last index position in the result set. 
    string endPosition?;
    # Contains information about a specific envelope transfer rule.
    EnvelopeTransferRule[] envelopeTransferRules?;
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

# A complex type that contains the elements:
# 
# * `recipMayProvideNumber`: A Boolean value that specifies whether the recipient can use the phone number of their choice.
# * `senderProvidedNumbers`: A list of phone numbers that the recipient can use.
# * `recordVoicePrint`: Reserved for DocuSign.
# * `validateRecipProvidedNumber`: Reserved for DocuSign.
public type RecipientPhoneAuthentication record {
    # Boolean. When **true,** the recipient can supply a phone number their choice.
    string recipMayProvideNumber?;
    # Metadata about a property.
    PropertyMetadata recipMayProvideNumberMetadata?;
    # Reserved for DocuSign.
    string recordVoicePrint?;
    # Metadata about a property.
    PropertyMetadata recordVoicePrintMetadata?;
    # An array containing a list of phone numbers that the recipient can use for SMS text authentication. 
    string[] senderProvidedNumbers?;
    # Metadata about a property.
    PropertyMetadata senderProvidedNumbersMetadata?;
    #  Reserved for DocuSign.
    string validateRecipProvidedNumber?;
    # Metadata about a property.
    PropertyMetadata validateRecipProvidedNumberMetadata?;
};

# 
public type Country record {
    # 
    string isoCode?;
    # 
    string name?;
    # 
    Province[] provinces?;
    # 
    string provinceValidated?;
};

# 
public type ServiceVersion record {
    # The version of the rest API.
    string version?;
    # 
    string versionUrl?;
};

# API resource information
public type Resources record {
    # 
    NameValue[] resources?;
};

# 
public type AccountPasswordExpirePasswordDays record {
    # 
    string maximumDays?;
    # 
    string minimumDays?;
};

# A paged list of jurisdictions.
public type NotaryJurisdictionList record {
    # The last index position in the result set. 
    string endPosition?;
    # The URI for the next chunk of records based on the search request. It is `null` if this is the last set of results for the search. 
    string nextUri?;
    # An array of jurisdictions.
    NotaryJurisdiction[] notaryJurisdictions?;
    # The URI for the prior chunk of records based on the search request. It is `null` if this is the first set of results for the search. 
    string previousUri?;
    # The number of results in this response. Because you can filter which entries are included in the response, this value is always less than or equal to the `totalSetSize`.
    string resultSetSize?;
    # The starting index position of the current result set.
    string startPosition?;
    # The total number of items in the result set. This value is always greater than or equal to the value of `resultSetSize`.
    string totalSetSize?;
};

# 
public type BulkSendBatchError record {
    # The server error associated with the Connect post failure.
    string 'error?;
    # 
    string errorDetail?;
};

# 
public type DelegationInfo record {
    # 
    string Email?;
    # 
    string Name?;
    # 
    string UserAuthorizationId?;
    # 
    string UserId?;
};

# Describes a group of recipients.
public type RecipientGroup record {
    # The group message, typically a description of the group.
    string groupMessage?;
    # The name of the group.
    string groupName?;
    # An array of recipient objects that provides details about the recipients of the envelope.
    RecipientOption[] recipients?;
};

# AccountSignatures represent stamps used to sign documents.
public type AccountSignatures record {
    # The UTC date and time when the user adopted the signature.
    string adoptedDateTime?;
    # The UTC DateTime when the item was created.
    string createdDateTime?;
    # 
    string customField?;
    # Specifies the area in which a date stamp is placed. This parameter uses pixel positioning to draw a rectangle at the center of the stamp area. The stamp is superimposed on top of this central area.
    # 
    # This property contains the following information about the central rectangle:
    # 
    # - `DateAreaX`: The X axis position of the top-left corner.
    # - `DateAreaY`: The Y axis position of the top-left corner.
    # - `DateAreaWidth`: The width of the rectangle.
    # - `DateAreaHeight`: The height of the rectangle.
    DateStampProperties dateStampProperties?;
    # When **true,** users may not resize the stamp.
    string disallowUserResizeStamp?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # Optionally specify an external identifier for the user's signature.
    string externalID?;
    # 
    string imageBase64?;
    # Specificies the type of image. Valid values:
    # 
    # - `stamp_image`
    # - `signature_image`
    # - `initials_image`
    string imageType?;
    # The ID of the user's initials image.
    string initials150ImageId?;
    # The URI for retrieving the image of the user's initials.
    string initialsImageUri?;
    # Boolean that specifies whether the signature is the default signature for the user.
    string isDefault?;
    # The date and time that the item was last modified.
    string lastModifiedDateTime?;
    # The National Association of Realtors (NAR) membership ID for a user who is a realtor.
    string nrdsId?;
    # The realtor's last name.
    string nrdsLastName?;
    # The realtor's NAR membership status. The value `active` verifies that the user is a current NAR member. Valid values are:
    # 
    # - `Active`
    # - `Inactive`
    # - `Terminate`
    # - `Provisional`
    # - `Deceased`
    # - `Suspend`
    # - `Unknown`
    string nrdsStatus?;
    # The phonetic spelling of the `signatureName`.
    string phoneticName?;
    # The ID of the user's signature image.
    string signature150ImageId?;
    # The font type to use for the signature if the signature is not drawn. The following font styles  are supported. The quotes are to indicate that these values are strings, not `enums`.
    # 
    # - `"1_DocuSign"`
    # - `"2_DocuSign"`
    # - `"3_DocuSign"`
    # - `"4_DocuSign"`
    # - `"5_DocuSign"`
    # - `"6_DocuSign"`
    # - `"7_DocuSign"`
    # - `"8_DocuSign"`
    # - `"Mistral"`
    # - `"Rage Italic"`
    string signatureFont?;
    # 
    SignatureGroup[] signatureGroups?;
    # Specifies the signature ID associated with the signature name. You can use the signature ID in the URI in place of the signature name, and the value stored in the `signatureName` property in the body is used. This allows the use of special characters (such as "&", "<", ">") in a the signature name. Note that with each update to signatures, the returned signature ID might change, so the caller will need to trigger off the signature name to get the new signature ID.
    string signatureId?;
    # An endpoint URI that you can use to retrieve the user's signature image.
    string signatureImageUri?;
    # Specifies the user's signature in initials format.
    string signatureInitials?;
    # Specifies the user's signature name.
    string signatureName?;
    # The rights that the user has to the signature. Valid values are:
    # 
    # - `none`
    # - `read`
    # - `admin`
    string signatureRights?;
    # Specifies the type of signature.
    string signatureType?;
    # 
    SignatureUser[] signatureUsers?;
    # The format of a stamp. Valid values are:
    # 
    # - `NameHanko`: The stamp represents only the signer's name.
    # - `NameDateHanko`: The stamp represents the signer's name and the date. 
    string stampFormat?;
    # The URI for retrieving the image of the user's stamp.
    string stampImageUri?;
    # The physical height of the stamp image (in millimeters) that the stamp vendor recommends for displaying the image in PDF documents.
    string stampSizeMM?;
    # The type of stamp. Valid values are:
    # 
    # - `signature`: A signature image. This is the default value.
    # - `stamp`: A stamp image.
    # - null
    string stampType?;
    # Indicates the envelope status. Valid values are:
    # 
    # * sent - The envelope is sent to the recipients. 
    # * created - The envelope is saved as a draft and can be modified and sent later.
    string status?;
};

# 
public type BrandResourcesList record {
    # A list of resources that the brand uses.
    BrandResources[] resourcesContentTypes?;
};

# 
public type PolyLine record {
    # 
    string x1?;
    # 
    string x2?;
    # 
    string y1?;
    # 
    string y2?;
};

# 
public type RecipientIdentityInputOption record {
    # 
    string name?;
    # 
    RecipientIdentityPhoneNumber[] phoneNumberList?;
    # 
    string valueType?;
};

# This object defines how to display the HTML
# between the `startAnchor` and `endAnchor`.
public type DocumentHtmlDisplaySettings record {
    # Specifies the valid CSS-formatted styles to use on responsive table cells. Only valid in display sections of `responsive_table` or `responsive_table_single_column` types.
    string cellStyle?;
    # Display settings for collapsible section.
    DocumentHtmlCollapsibleDisplaySettings collapsibleSettings?;
    # Sets the display and behavior properties. Possible  values are:
    # 
    # - `inline`:
    #   Leaves the HTML where it is in the document.
    #   This property lets you add a label or present on a separate page.
    # 
    # - `collapsible`:
    #   The HTML in this section may be expanded or collapsed.
    #   Initially this section is expanded.
    # 
    # - `collapsed`:
    #   The HTML in this section may be expanded or collapsed.
    #   Initially this section is collapsed.
    # 
    # - `continue_button`:
    #   Creates a stop point in the document to draw the reader's
    #   attention before proceeding to the next section.
    # 
    # - `responsive_table`:
    #   Turns this section into a responsive table.
    #   Note that this is only used on HTML tables that fall within the anchor start and end positions.
    # 
    # - `responsive_table_single_column`:
    #   Turns this section into a responsive single-column table.
    #   Note this is only used on HTML tables that fall within the anchor start and end positions.
    #   The table will be converted to one single column where each current column will become a row, then stacked.
    # 
    # - `print_only`:
    #   Do not show this portion of the HTML in the responsive signing view.
    string display?;
    # The label to add to this display section in the signing page.
    string displayLabel?;
    # The position on the page where the display section appears.
    int:Signed32 displayOrder?;
    # The number of the page on which the display section appears.
    int:Signed32 displayPageNumber?;
    # When **true,** the `displayLabel` is hidden when the display section is expanded and the display section is no longer collapsible. This property is valid only when the value of the `display` property is `collapsed`.
    boolean hideLabelWhenOpened?;
    # Specifies the valid CSS-formatted styles to use on inline display sections. This property is valid only when the value of the `display` property is `inline`.
    string inlineOuterStyle?;
    # The label for the display section when it is expanded from a collapsed state. This label displays only on the first opening and is only valid with the value of the `display` property is `collapsed`.
    string labelWhenOpened?;
    # Enables you to add descriptive text that appears before a collapsed section or continue button.
    string preLabel?;
    # When **true** and the section is expanded,
    # the position of the section-close control
    # scrolls to the top of the screen. This property is only valid when the value of the `display` property is `collapsed`.
    boolean scrollToTopWhenOpened?;
    # Specifies the valid CSS-formatted styles to use on responsive tables. This property is valid only when the value of the `display` property is `responsive_table` or `responsive_table_single_column`.
    string tableStyle?;
};

# Request logs
public type RequestLogs record {
    #  When **true,** enables API request logging for the user. 
    string apiRequestLogging?;
    # Specifies the maximum number of API requests to log.
    string apiRequestLogMaxEntries?;
    # Indicates the remaining number of API requests that can be logged.
    string apiRequestLogRemainingEntries?;
};

# 
public type NotaryJournalMetaData record {
    # A freeform comment that the notary can add to the journal entry.
    string comment?;
    # An array of witnesses.
    NotaryJournalCredibleWitness[] credibleWitnesses?;
    # A base64-encoded image of the signature.
    string signatureImage?;
    # A string that describes the ID that the signer presented. For example `drivers license` or `military ID`.
    string signerIdType?;
};

# Cloud storage
public type CloudStorage record {
    # The last index position in the result set. 
    string endPosition?;
    # 
    ExternalDocServiceErrorDetails errorDetails?;
    # A unique ID for the Salesforce object.
    string id?;
    # A list of objects that contain information about a file or folder in cloud storage.
    ExternalFile[] items?;
    # The name of the cloud storage item.
    string name?;
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

# Envelope creation, management
public type Envelopes record {
    # Reserved for DocuSign.
    string accessControlListBase64?;
    # When **true,** users can add comments to the documents in the envelope. For example, if a signer has a question about the text in the document, they can add a comment to the document.
    string allowComments?;
    # When **true,** the Document Markup feature is enabled.
    # 
    # **Note:**  To use this feature, Document Markup must be enabled at both the account and envelope levels. Only Admin users can change this setting at the account level.
    string allowMarkup?;
    # When **true,** the recipient can redirect an envelope to a more appropriate recipient.
    string allowReassign?;
    # When **true,** recipients can view the history of the envelope.
    string allowViewHistory?;
    # Deprecated. This feature has been replaced by signing groups.
    string anySigner?;
    # When **true,** the envelope is queued for
    # processing and the value of the `status` property
    # is set to `Processing`. Additionally, GET status
    # calls return `Processing` until completed.
    # 
    # 
    # **Note:** A `transactionId` is required for this
    # call to work correctly. When the envelope is
    # created, the status is `Processing` and an
    # `envelopeId` is not returned in the response. To
    # get the `envelopeId`, use a GET envelope query by
    # using the
    # [transactionId](/docs/esign-rest-api/reference/envelopes/envelopes/create/) or by checking the
    # Connect notification.
    string asynchronous?;
    # Contains a URL for retrieving the attachments that are associated with the envelope.
    string attachmentsUri?;
    # When **true,** marks all of the documents in the envelope as authoritative copies.
    # 
    # **Note:** You can override this value for a specific document. For example, you can set the `authoritativeCopy` property to **true** at the envelope level, but turn it off for a single document by setting the `authoritativeCopy` property for the document to **false.**
    string authoritativeCopy?;
    # The default `authoritativeCopy` setting for documents in this envelope that do not have `authoritativeCopy` set.
    # If this property is not set, each document defaults to the envelope's `authoritativeCopy`.
    string authoritativeCopyDefault?;
    # When **true,** autonavigation is set for the recipient.
    string autoNavigation?;
    # The ID of the brand.
    string brandId?;
    # When **true,** the `brandId` for the envelope is locked and senders cannot change the brand used for the envelope.
    string brandLock?;
    # 
    string burnDefaultTabData?;
    # The URI for retrieving certificate information.
    string certificateUri?;
    # Specifies the date and time this item was completed.
    string completedDateTime?;
    # 
    string copyRecipientData?;
    # The UTC DateTime when the item was created.
    string createdDateTime?;
    # An `accountCustomField` is an envelope custom field that you set at the account level.
    # Applying custom fields enables account administrators to group and manage envelopes.
    AccountCustomFields customFields?;
    # The URI for retrieving custom fields.
    string customFieldsUri?;
    # The date and time the recipient declined the document. This property is read-only.
    string declinedDateTime?;
    # Reserved for DocuSign.
    string deletedDateTime?;
    # The date and time that the envelope was delivered to the recipient. This property is read-only.
    string deliveredDateTime?;
    # When **true,** responsive documents are disabled for the envelope.
    string disableResponsiveDocument?;
    # The document's bytes. This field can be used to include a base64 version of the document bytes within an envelope definition instead of sending the document using a multi-part HTTP request. The maximum document size is smaller if this field is used due to the overhead of the base64 encoding.
    string documentBase64?;
    # The URI for retrieving all of the documents associated with the envelope as a single PDF file.
    string documentsCombinedUri?;
    # The URI for retrieving all of the documents associated with the envelope as separate files.
    string documentsUri?;
    # This is the same as the email body. If specified it is included in the email body for all envelope recipients.
    string emailBlurb?;
    # A complex element that allows  the sender to override some envelope email setting information. This can be used to override the Reply To email address and name associated with the envelope and to override the BCC email addresses to which an envelope is sent. 
    # 
    # When the emailSettings information is used for an envelope, it only applies to that envelope. 
    # 
    # **IMPORTANT:** The emailSettings information is not returned in the GET for envelope status. Use GET /email_settings to return information about the emailSettings. 
    # 
    # EmailSettings consists of: 
    # 
    # * replyEmailAddressOverride - The Reply To email used for the envelope. DocuSign will verify that a correct email format is used, but does not verify that the email is active. Maximum Length: 100 characters.
    # * replyEmailNameOverride - The name associated with the Reply To email address. Maximum Length: 100 characters.
    # * bccEmailAddresses - An array of up to five email addresses to which the envelope is sent to as a BCC email. Only users with canManageAccount setting set to true can use this option. 
    # DocuSign verifies that the email format is correct, but does not verify that the email is active. Using this overrides the BCC for Email Archive information setting for this envelope. Maximum Length: 100 characters.
    # *Example*: if your account has BCC for Email Archive set up for the email address 'archive@mycompany.com' and you send an envelope using the BCC Email Override to send a BCC email to 'salesarchive@mycompany.com', then a copy of the envelope is only sent to the 'salesarchive@mycompany.com' email address.
    EmailSettings emailSettings?;
    # The subject line of the email message that is sent to all recipients.
    # 
    # For information about adding merge field information to the email subject, see [Template Email Subject Merge Fields](/docs/esign-rest-api/reference/templates/templates/create/#template-email-subject-merge-fields).
    # 
    # **Note:** The subject line is limited to 100 characters, including any merged fields.It is not truncated. It is an error if the text is longer than 100 characters.
    string emailSubject?;
    # When **true,** the signer is allowed to print the document and sign it on paper.
    string enableWetSign?;
    # When **true,** signers can only view the documents on which they have tabs. Recipients that have an administrative role (Agent, Editor, or Intermediaries) or informational role (Certified Deliveries or Carbon Copies) can always see all of the documents in an envelope, unless they are specifically excluded by using this setting when an envelope is sent. Documents that do not have tabs are always visible to all recipients, unless they are specifically excluded by using this setting when an envelope is sent.
    # 
    # **Note:** To use this functionality, [Document Visibility][docviz] must be enabled for the account by making the account setting `allowDocumentVisibility` **true.**
    # 
    # [docviz]: /docs/esign-rest-api/reference/envelopes/envelopedocumentvisibility/
    string enforceSignerVisibility?;
    # An array of attachment objects that provide information about the attachments that are associated with the envelope.
    Attachment[] envelopeAttachments?;
    # 
    EnvelopeCustomMetadata envelopeCustomMetadata?;
    # An array containing information about the documents that are included in the envelope.
    EnvelopeDocument[] envelopeDocuments?;
    # The envelope ID of the envelope status that failed to post.
    string envelopeId?;
    # When **true,** [Envelope ID Stamping](https://support.docusign.com/s/document-item?bundleId=gbo1643332197980&topicId=tfm1578456367923.html) is enabled.
    # After a document or attachment is stamped with an Envelope ID,
    # the ID is seen by all recipients
    # and becomes a permanent part of the document
    # and cannot be removed.
    string envelopeIdStamping?;
    # Reserved for DocuSign.
    string envelopeLocation?;
    # 
    EnvelopeMetadata envelopeMetadata?;
    # The URI for retrieving the envelope or envelopes.
    string envelopeUri?;
    # Not used. Use the
    # [`expirations`](/docs/esign-rest-api/reference/envelopes/envelopes/create/#definition__envelopedefinition_notification_expirations)
    # property in the [`notification`](/docs/esign-rest-api/reference/envelopes/envelopes/create/#definition__envelopedefinition_notification) object instead.
    string expireAfter?;
    # Not used. Use the
    # [`expirations`](/docs/esign-rest-api/reference/envelopes/envelopes/create/#definition__envelopedefinition_notification_expirations)
    # property in the [`notification`](/docs/esign-rest-api/reference/envelopes/envelopes/create/#definition__envelopedefinition_notification) object instead.
    string expireDateTime?;
    # Not used. Use the
    # [`expirations`](/docs/esign-rest-api/reference/envelopes/envelopes/create/#definition__envelopedefinition_notification_expirations)
    # property in the [`notification`](/docs/esign-rest-api/reference/envelopes/envelopes/create/#definition__envelopedefinition_notification) object instead.
    string expireEnabled?;
    # May contain an external identifier for the envelope.
    string externalEnvelopeId?;
    # A list of folder objects.
    Folder[] folders?;
    # When **true,** indicates that users have added comments to the envelope.
    string hasComments?;
    # Specifies if the `EnvelopeFormData` associated with any forms in the envelope has changed.
    string hasFormDataChanged?;
    # When **true,** indicates that a .wav file used for voice authentication is included in the envelope. 
    string hasWavFile?;
    # Reserved for DocuSign.
    string holder?;
    # The date and time the envelope was initially sent.
    string initialSentDateTime?;
    # When **true,** indicates compliance with United States Food and Drug Administration (FDA) regulations on electronic records and electronic signatures (ERES).
    string is21CFRPart11?;
    # When **true,** indicates that the envelope is a dynamic envelope.
    string isDynamicEnvelope?;
    # When **true,** indicates that the envelope is a signature-provided envelope.
    string isSignatureProviderEnvelope?;
    # The date and time that the item was last modified.
    string lastModifiedDateTime?;
    # Reserved for DocuSign.
    string location?;
    # Envelope locks let you lock an envelope to prevent any changes while you are updating an envelope.
    EnvelopeLocks lockInformation?;
    # When **true,** prevents senders from changing the contents of `emailBlurb` and `emailSubject` properties for the envelope. 
    # 
    # Additionally, this prevents users from making changes to the contents of `emailBlurb` and `emailSubject` properties when correcting envelopes. 
    # 
    # However, if the `messageLock` node is set to **true** and the `emailSubject` property is empty, senders and correctors are able to add a subject to the envelope.
    string messageLock?;
    # A complex element that specifies the notification settings for the envelope.
    Notification notification?;
    # The URI for retrieving notifications.
    string notificationUri?;
    # Contains details about a PowerForm.
    PowerForm powerForm?;
    # The date that a purge was completed.
    string purgeCompletedDate?;
    # The date that a purge was requested.
    string purgeRequestDate?;
    # Shows the current purge state for the envelope. Valid values:
    # 
    # - `unpurged`: There has been no successful request to purge documents.
    # - `documents_queued`: The envelope documents have been added to the purge queue, but have not been purged.
    # - `documents_dequeued`: The envelope documents have been taken out of the purge queue.
    # - `documents_purged`: The envelope documents have been successfully purged.
    # - `documents_and_metadata_queued`: The envelope documents and metadata have been added to the purge queue, but have not yet been purged.
    # - `documents_and_metadata_purged`: The envelope documents and metadata have been successfully purged.
    # - `documents_and_metadata_and_redact_queued`: The envelope documents and metadata have been added to the purge queue, but have not yet been purged, nor has personal information been redacted.
    # - `documents_and_metadata_and_redact_purged`: The envelope documents and metadata have been successfully purged, and personal information has been redacted.
    # 
    # **Related topics**
    # 
    # - [Purging documents (eSingature Concepts)](/docs/esign-rest-api/esign101/concepts/documents/purging/)
    # - [Purging documents in an envelope (blog post)](https://www.docusign.com/blog/developers/purging-documents-envelope)
    string purgeState?;
    # Envelope recipients
    EnvelopeRecipients recipients?;
    # When **true,** prevents senders from changing, correcting, or deleting the recipient information for the envelope.
    string recipientsLock?;
    # Contains a URI for an endpoint that you can use to retrieve the recipients.
    string recipientsUri?;
    # 
    UserInfo sender?;
    # The UTC DateTime when the envelope was sent. This property is read-only.
    string sentDateTime?;
    # When **true,** recipients can sign on a mobile device.
    # 
    # **Note:** Only Admin users can change this setting.
    string signerCanSignOnMobile?;
    # Specifies the physical location where the signing takes place. It can have two enumeration values; `inPerson` and `online`. The default value is `online`.
    string signingLocation?;
    # * `completed`: The recipients have finished working with the envelope: the documents are signed and all required tabs are filled in.
    # * `created`: The envelope is created as a draft. It can be modified and sent later.
    # * `declined`: The envelope has been declined by the recipients.
    # * `delivered`: The envelope has been delivered to the recipients.
    # * `sent`: The envelope will be sent to the recipients after the envelope is created.
    # * `signed`: The envelope has been signed by the recipients.
    # * `voided`: The envelope is no longer valid and recipients cannot access or sign the envelope.
    string status?;
    # The data and time that the status changed.
    string statusChangedDateTime?;
    # The DateTime that the envelope changed status (i.e. was created or sent.)
    string statusDateTime?;
    # The URI for retrieving the templates.
    string templatesUri?;
    #  Used to identify an envelope. The ID is a sender-generated value and is valid in the DocuSign system for 7 days. It is recommended that a transaction ID is used for offline signing to ensure that an envelope is not sent multiple times. The `transactionId` property can be used determine an envelope's status (i.e. was it created or not) in cases where the internet connection was lost before the envelope status was returned.
    string transactionId?;
    # When **true,** the disclosure is shown to recipients in accordance with the account's Electronic Record and Signature Disclosure frequency setting. When **false,** the Electronic Record and Signature Disclosure is not shown to any envelope recipients. 
    # 
    # If the `useDisclosure` property is not set, then the account's normal disclosure setting is used and the value of the `useDisclosure` property is not returned in responses when getting envelope information.
    string useDisclosure?;
    # The date and time the envelope or template was voided.
    string voidedDateTime?;
    # The reason the envelope or template was voided.
    # 
    # **Note:** The string is truncated to the first 200 characters.
    string voidedReason?;
    # Describes the workflow for an envelope.
    Workflow workflow?;
};

# 
public type ServerTemplate record {
    # Specifies the order in which templates are overlaid.
    string sequence?;
    # The unique identifier of the template. If this is not provided, DocuSign will generate a value. 
    string templateId?;
};

# Tab settings determine the tab types and tab functionality that are enabled for an account.
public type AccountTabSettings record {
    # When **true,** account users can set a tab order for the signing process.
    # 
    # **Note:** Only Admin users can change this setting.
    string allowTabOrder?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowTabOrderMetadata?;
    # When **true,** approve and decline tabs are enabled.
    string approveDeclineTabsEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata approveDeclineTabsMetadata?;
    # When **true,** [calculated fields](https://support.docusign.com/s/document-item?bundleId=gbo1643332197980&topicId=crs1578456361259.html) are enabled for tabs.
    string calculatedFieldsEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata calculatedFieldsMetadata?;
    # When **true,** checkbox tabs are enabled.
    string checkboxTabsEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata checkBoxTabsMetadata?;
    # When **true,** regular expressions are enabled for tabs that contain data fields.
    string dataFieldRegexEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata dataFieldRegexMetadata?;
    # When **true,** setting character limits for input fields is enabled.
    string dataFieldSizeEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata dataFieldSizeMetadata?;
    # 
    string drawTabsEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata drawTabsMetadata?;
    # Reserved for DocuSign.
    string firstLastEmailTabsEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata firstLastEmailTabsMetadata?;
    # When **true,** list tabs are enabled.
    string listTabsEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata listTabsMetadata?;
    # When **true,** note tabs are enabled.
    string noteTabsEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata noteTabsMetadata?;
    # 
    string numericalTabsEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata numericalTabsMetadata?;
    # 
    string prefillTabsEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata prefillTabsMetadata?;
    # When **true,** radio button tabs are enabled.
    string radioTabsEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata radioTabsMetadata?;
    # When **true,** saving custom tabs is enabled.
    string savingCustomTabsEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata savingCustomTabsMetadata?;
    # Reserved for DocuSign.
    string senderToChangeTabAssignmentsEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata senderToChangeTabAssignmentsMetadata?;
    # When **true,** shared custom tabs are enabled.
    string sharedCustomTabsEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata sharedCustomTabsMetadata?;
    # When **true,** [data
    # labels](https://support.docusign.com/en/videos/Data-Labels) are enabled.
    # 
    # **Note:** Only Admin users can change this setting.
    string tabDataLabelEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata tabDataLabelMetadata?;
    # Reserved for DocuSign.
    string tabLocationEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata tabLocationMetadata?;
    # When **true,** tab locking is enabled.
    # 
    # **Note:** Only Admin users can change this setting.
    string tabLockingEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata tabLockingMetadata?;
    # Reserved for DocuSign.
    string tabScaleEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata tabScaleMetadata?;
    # When **true,** text formatting (such as font type, font size,
    # font color, bold, italic, and underline) is enabled for tabs that
    # support formatting.
    # 
    # **Note:** Only Admin users can change this setting.
    string tabTextFormattingEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata tabTextFormattingMetadata?;
    # When **true,** text tabs are enabled.
    string textTabsEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata textTabsMetadata?;
};

# 
public type BrandsResponse record {
    # A list of brands.
    Brand[] brands?;
    # The brand that envelope recipients see when a brand is not explicitly set.
    string recipientBrandIdDefault?;
    # The brand that envelope senders see when a brand is not explicitly set.
    string senderBrandIdDefault?;
};

# 
public type SignatureGroupDef record {
    # The ID of the group being accessed.
    string groupId?;
    # Indicates whether the property is editable. Valid values are:
    # 
    # - `editable`
    # - `read_only`
    string rights?;
};

# 
public type Stamp record {
    # The UTC date and time when the user adopted the signature.
    string adoptedDateTime?;
    # The UTC DateTime when the item was created.
    string createdDateTime?;
    # 
    string customField?;
    # Specifies the area in which a date stamp is placed. This parameter uses pixel positioning to draw a rectangle at the center of the stamp area. The stamp is superimposed on top of this central area.
    # 
    # This property contains the following information about the central rectangle:
    # 
    # - `DateAreaX`: The X axis position of the top-left corner.
    # - `DateAreaY`: The Y axis position of the top-left corner.
    # - `DateAreaWidth`: The width of the rectangle.
    # - `DateAreaHeight`: The height of the rectangle.
    DateStampProperties dateStampProperties?;
    # When **true,** users may not resize the stamp.
    string disallowUserResizeStamp?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # Optionally specify an external identifier for the user's signature.
    string externalID?;
    # 
    string imageBase64?;
    # Specificies the type of image. Valid values:
    # 
    # - `stamp_image`
    # - `signature_image`
    # - `initials_image`
    string imageType?;
    # The date and time that the item was last modified.
    string lastModifiedDateTime?;
    # The phonetic spelling of the `signatureName`.
    string phoneticName?;
    # Specifies the user's signature name.
    string signatureName?;
    # The format of a stamp. Valid values are:
    # 
    # - `NameHanko`: The stamp represents only the signer's name.
    # - `NameDateHanko`: The stamp represents the signer's name and the date. 
    string stampFormat?;
    # The URI for retrieving the image of the user's stamp.
    string stampImageUri?;
    # The physical height of the stamp image (in millimeters) that the stamp vendor recommends for displaying the image in PDF documents.
    string stampSizeMM?;
    # Indicates the envelope status. Valid values are:
    # 
    # * sent - The envelope is sent to the recipients. 
    # * created - The envelope is saved as a draft and can be modified and sent later.
    string status?;
};

# The `EmailArchive` resource provides methods for managing your email archive configuration, which consists of the BCC email address or addresses that you want to use to archive DocuSign emails. Each account can use up to five BCC email addresses for archiving purposes.
public type BCCEmailArchive record {
    # A list of changes to the BCC email archive configuration.
    BccEmailArchiveHistory[] bccEmailArchiveHistory?;
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

# 
public type TemplateDocumentTabs record {
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

# One of the selectable radio buttons
# in the `radios` property
# of a [`radioGroup`](/docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/) tab.
public type Radio record {
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
    # When **true,** the information in the tab is italic.
    string italic?;
    # Metadata about a property.
    PropertyMetadata italicMetadata?;
    # When **true,** the signer cannot change the data of the custom tab.
    string locked?;
    # Metadata about a property.
    PropertyMetadata lockedMetadata?;
    # Reserved for DocuSign.
    string mergeFieldXml?;
    # Specifies the page number on which the tab is located.
    # Must be 1 for supplemental documents.
    string pageNumber?;
    # Metadata about a property.
    PropertyMetadata pageNumberMetadata?;
    # When **true,** the signer is required to fill out this tab.
    string required?;
    # Metadata about a property.
    PropertyMetadata requiredMetadata?;
    # When **true,** the radio button is selected.
    string selected?;
    # Metadata about a property.
    PropertyMetadata selectedMetadata?;
    # Indicates the envelope status. Valid values are:
    # 
    # * sent - The envelope is sent to the recipients. 
    # * created - The envelope is saved as a draft and can be modified and sent later.
    string status?;
    # Metadata about a property.
    PropertyMetadata statusMetadata?;
    # The unique identifier for the tab.
    string tabId?;
    # Metadata about a property.
    PropertyMetadata tabIdMetadata?;
    # A positive integer that sets the order the tab is navigated to during signing.
    # 
    # Tabs on a page are navigated to in ascending order, starting with the lowest number and moving to the highest. If two or more tabs have the same `tabOrder` value, the normal auto-navigation setting behavior for the envelope is used.
    string tabOrder?;
    # Metadata about a property.
    PropertyMetadata tabOrderMetadata?;
    # When **true,** the information in the tab is underlined.
    string underline?;
    # Metadata about a property.
    PropertyMetadata underlineMetadata?;
    # Specifies the value of the tab. 
    string value?;
    # Metadata about a property.
    PropertyMetadata valueMetadata?;
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

# This response object contains a list of recipients.
public type RecipientNamesResponse record {
    # When **true,** the email address is used by more than one user.
    string multipleUsers?;
    # The names of the recipients associated with the email address.
    string[] recipientNames?;
    # When **true,** new names cannot be added to the email address.
    string reservedRecipientEmail?;
};

# 
public type OauthAccess record {
    # Access token information.
    string access_token?;
    # A Base64-encoded representation of the attachment that is used to upload and download the file. File attachments may be up to 50 MB in size.
    NameValue[] data?;
    # 
    string expires_in?;
    # 
    string refresh_token?;
    # Must be set to "api".
    string scope?;
    # 
    string token_type?;
};

# A list of failed envelope IDs to retry.
public type ConnectFailureFilter record {
    # An array of envelope GUIDs.
    # 
    # Example: `93be49ab-xxxx-xxxx-xxxx-f752070d71ec`
    string[] envelopeIds?;
    # Must be **false.** Setting this property to any other value will result in errors.
    string synchronous?;
};

# 
public type NotaryJournalCredibleWitness record {
    # The address of the witness.
    string address?;
    # The name of the witness.
    string name?;
    # A base64-encoded image of the signature.
    string signatureImage?;
};

# 
public type CommentThread record {
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
    # An array of comment tabs that contain information about users' comments on documents.
    Comment[] comments?;
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
    # The unique identifier for the comment thread.
    string threadId?;
    # The text of a tooltip that appears when a user hovers over a form field or tab.
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
public type UserAuthorizationsDeleteRequest record {
    # 
    string[] authorizations?;
};

# A `connectSalesforceObject` is an object that updates envelope and document status or recipient status in your Salesforce account.
# 
# When you install DocuSign Connect for Salesforce, the service automatically sets up two Connect objects: one that updates envelope status and documents and one that updates recipient status. You can also customize DocuSign Connect for Salesforce by associating DocuSign objects with Salesforce objects so that DocuSign Connect for Salesforce updates or inserts the information into the Salesforce object. For more information, see 
# [DocuSign for Salesforce - Adding Completed Documents to the Notes and Attachments](https://support.docusign.com/s/articles/DocuSign-for-Salesforce-Adding-Completed-Documents-to-the-Notes-and-Attachments-New).
public type ConnectSalesforceObject record {
    # When **true,** the `connectSalesforceObject` is active.
    string active?;
    # A description of the `connectSalesforceObject`.
    string description?;
    # The ID of the `connectSalesforceObject`.
    string id?;
    # 
    string insert?;
    # When **true,** Salesforce is updated only when the envelope is complete.
    string onCompleteOnly?;
    # The DocuSign and Salesforce fields that you want to use to match a Salesforce object with DocuSign information. This information tells Connect when to send updates to Salesforce.
    ConnectSalesforceField[] selectFields?;
    # The Salesforce.com object type, such as `case`, `contact`, or `opportunity`.
    string sfObject?;
    # A name for the Salesforce object.
    # 
    # **Note:** You can enter any name for the object. It does not have to match the `sfObject` property.
    string sfObjectName?;
    # The DocuSign and Salesforce fields that you want to update. 
    # 
    # **Note:** You can choose to update SalesForce (with information from DocuSign) only, update DocuSign only, or both.
    ConnectSalesforceField[] updateFields?;
};

# 
public type IdEvidenceViewLink record {
    # 
    string viewLink?;
};

# A Commission State tab displays the state in which a notary's commission was granted. The tab is populated with the notary's commission information, but the recipient can also edit the value when notarizing. This tab can only be assigned to a remote notary recipient using [DocuSign Notary][notary].
# 
# [notary]: /docs/notary-api/
public type CommissionState record {
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
    # 
    string name?;
    # Metadata about a property.
    PropertyMetadata nameMetadata?;
    # The initial value of the tab. 
    string originalValue?;
    # Metadata about a property.
    PropertyMetadata originalValueMetadata?;
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
    # When **true,** the signer is required to fill out this tab.
    string required?;
    # Metadata about a property.
    PropertyMetadata requiredMetadata?;
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
