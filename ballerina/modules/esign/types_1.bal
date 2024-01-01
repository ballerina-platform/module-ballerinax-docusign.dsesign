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

# A tab that displays the recipient's company name.
public type Company record {
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

# Specifies the envelope recipients.
public type Recipients record {
    # A list of agent recipients assigned to the documents.
    Agent[] agents?;
    # A list of carbon copy recipients assigned to the documents.
    CarbonCopy[] carbonCopies?;
    # A complex type containing information on a recipient the must receive the completed documents for the envelope to be completed, but the recipient does not need to sign, initial, date, or add information to any of the documents.
    CertifiedDelivery[] certifiedDeliveries?;
    # The routing order of the current recipient. If this value equals a particular signer's routing order, it indicates that the envelope has been sent to that recipient, but he or she has not completed the required actions.
    string currentRoutingOrder?;
    # A list of users who can edit the envelope.
    Editor[] editors?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # Specifies a signer that is in the same physical location as a DocuSign user who will act as a Signing Host for the transaction. The recipient added is the Signing Host and new separate Signer Name field appears after Sign in person is selected.
    InPersonSigner[] inPersonSigners?;
    # Identifies a recipient that can, but is not required to, add name and email information for recipients at the same or subsequent level in the routing order (until subsequent Agents, Editors or Intermediaries recipient types are added).
    Intermediary[] intermediaries?;
    # A list of notary recipients on the envelope.
    NotaryRecipient[] notaries?;
    # 
    Participant[] participants?;
    # The number of recipients in the envelope.
    string recipientCount?;
    # A list of electronic seals to apply to documents.
    SealSign[] seals?;
    # A list of signers on the envelope.
    Signer[] signers?;
    # A list of signers who act as witnesses on the envelope.
    Witness[] witnesses?;
};

# 
public type TabAccountSettings record {
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

# Contains information about the address associated with the account.
public type AccountAddress record {
    # The first line of the address. Maximum length: 100 characters.
    string address1?;
    # The second line of the address. Maximum length: 100 characters.
    string address2?;
    # The city associated with the address. Maximum length: 40 characters.
    string city?;
    # The country associated with the address. Maximum length: 50 characters.
    string country?;
    # The email address associated with the account.
    string email?;
    # The fax number associated with the account.
    string fax?;
    # The first name of the user associated with the account. Maximum Length: 50 characters.
    string firstName?;
    # The last name of the user associated with the account.
    string lastName?;
    # The phone number associated with the account.
    string phone?;
    # The postal code associated with the address. Maximum length: 20 characters.
    string postalCode?;
    # The state or province associated with the address. Maximum length: 40 characters.
    string state?;
    # An array of supported countries associated with the account.
    Country[] supportedCountries?;
};

# 
public type LinkedExternalPrimaryAccount record {
    # The name on the account.
    string accountName?;
    # 
    string configurationId?;
    # 
    string email?;
    # 
    string linkId?;
    # 
    string pdfFieldHandlingOption?;
    # 
    ExternalPrimaryAccountRecipientAuthRequirements recipientAuthRequirements?;
    # Indicates the envelope status. Valid values are:
    # 
    # * `sent` - The envelope is sent to the recipients. 
    # * `created` - The envelope is saved as a draft and can be modified to be sent later.
    string status?;
    # The ID of the user to access.
    # 
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    string userId?;
};

# 
public type EnvelopeTransactionStatus record {
    # The envelope ID of the envelope status that failed to post.
    string envelopeId?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # Indicates the envelope status. Valid values are:
    # 
    # * `completed`: The recipients have finished working with the envelope: the documents are signed and all required tabs are filled in.
    # * `created`: The envelope is created as a draft. It can be modified and sent later.
    # * `declined`: The envelope has been declined by the recipients.
    # * `delivered`: The envelope has been delivered to the recipients.
    # * `sent`: The envelope will be sent to the recipients after the envelope is created.
    # * `signed`: The envelope has been signed by the recipients.
    # * `voided`: The envelope is no longer valid and recipients cannot access or sign the envelope.
    string status?;
    #  Used to identify an envelope. The ID is a sender-generated value and is valid in the DocuSign system for 7 days. It is recommended that a transaction ID is used for offline signing to ensure that an envelope is not sent multiple times. The `transactionId` property can be used determine an envelope's status (i.e. was it created or not) in cases where the internet connection was lost before the envelope status was returned.
    string transactionId?;
};

# Option settings for the signature provider. Different providers require or use different options. [The current provider list and the options they require.](/docs/esign-rest-api/esign101/concepts/standards-based-signatures/)
public type RecipientSignatureProviderOptions record {
    # Reserved for DocuSign.
    string cpfNumber?;
    # Metadata about a property.
    PropertyMetadata cpfNumberMetadata?;
    # A pre-shared secret that the signer must enter to complete the signing process. Eg last six digits of the signer's government ID or Social Security number. Or a newly created pre-shared secret for the transaction. Note: some signature providers may require an exact (case-sensitive) match if alphabetic characters are included in the field.
    string oneTimePassword?;
    # Metadata about a property.
    PropertyMetadata oneTimePasswordMetadata?;
    # The role or capacity of the signing recipient. Examples: Manager, Approver, etc.
    string signerRole?;
    # Metadata about a property.
    PropertyMetadata signerRoleMetadata?;
    # The mobile phone number used to send the recipient an access code for the signing ceremony. Format: a string starting with +, then the country code followed by the full mobile phone number without any spaces or special characters. Omit leading zeroes before a city code. Examples: +14155551234, +97235551234, +33505551234.
    string sms?;
    # Metadata about a property.
    PropertyMetadata smsMetadata?;
};

# 
public type DocumentResponsiveHtml record {
    # Holds the properties that define how to generate the responsive-formatted HTML for the document.
    DocumentHtmlDefinitionOriginal[] htmlDefinitions?;
};

# Document Visibility enables senders to control the visibility of the documents in an envelope at the recipient level. For example, if the parties associated with a legal proceeding should have access to different documents, the Document Visibility feature enables you to keep all of the documents in the same envelope and set view permissions for the documents by recipient. This functionality is enabled for envelopes and templates. It is not available for PowerForms.
# 
# **Note:** Before you use Document Visibility, you should be aware of the following information:
# 
# - Document Visibility must be enabled for your account by your DocuSign administrator. 
# - A document cannot be hidden from a recipient if the recipient has tabs assigned to them on the document. 
# - When the Document Visibility setting hides a document from a recipient, the document also does not appear in the recipient's list of envelopes, documents, or page images.
# - Carbon Copy, Certified Delivery (Needs to Sign), Editor, and Agent recipients can always see all of the documents associated with the envelope or template.
# 
# The Document Visibility feature has multiple settings that specify the options that senders have when sending documents. For more information, see [Use Document Visibility to Control Recipient Access](https://support.docusign.com/s/document-item?bundleId=gbo1643332197980&topicId=eui1578456411411.html).
public type TemplateDocumentVisibility record {
    # An array of `documentVisibility` objects that specifies which documents are visible to which recipients.
    DocumentVisibility[] documentVisibility?;
};

# 
public type AccountSealProviders record {
    # A list of electronic seals to apply to documents.
    SealIdentifier[] seals?;
};

# 
public type DowngradeRequestInformation record {
    # 
    string downgradeRequestCreation?;
    # 
    string downgradeRequestProductId?;
    # 
    string downgradeRequestStatus?;
};

# Summary status of a single batch.
public type BulkSendBatchSummary record {
    # 
    string action?;
    # 
    string actionStatus?;
    # The batch ID.
    string batchId?;
    # The name of the batch.
    string batchName?;
    # The number of envelopes in the batch.
    string batchSize?;
    # The batch details URI.
    string batchUri?;
    # Number of envelopes that failed to send.
    string failed?;
    # Number of envelopes peding processing.
    string queued?;
    # Number of envelopes that have been sent.
    string sent?;
    # The time stamp of when the batch was created in ISO 8601 format.
    string submittedDate?;
};

# Defines a billing plans response object.
public type BillingPlansResponse record {
    # Reserved for DocuSign.
    BillingPlan[] billingPlans?;
};

# Contains information for transferring values between Salesforce data fields and DocuSign tabs.
public type MergeField record {
    # When **true,** the sender can modify the value of the `mergeField` tab during the sending process.
    string allowSenderToEdit?;
    # Metadata about a property.
    PropertyMetadata allowSenderToEditMetadata?;
    # If you are using merge fields, this property specifies the type of the merge field. The only supported value is `salesforce`.
    string configurationType?;
    # Metadata about a property.
    PropertyMetadata configurationTypeMetadata?;
    # Sets the object associated with the custom tab. Currently this is the Salesforce Object.
    string path?;
    # Reserved for DocuSign.
    PathExtendedElement[] pathExtended?;
    # Metadata about a property.
    PropertyMetadata pathExtendedMetadata?;
    # Metadata about a property.
    PropertyMetadata pathMetadata?;
    # Specifies the row number in a Salesforce table that the merge field value corresponds to.
    string row?;
    # Metadata about a property.
    PropertyMetadata rowMetadata?;
    # When **true,** data entered into the merge field during Signing will update the mapped Salesforce field.
    string writeBack?;
    # Metadata about a property.
    PropertyMetadata writeBackMetadata?;
};

# 
public type AccountWatermarks record {
    # 
    string displayAngle?;
    # 
    string enabled?;
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
    # A unique ID for the Salesforce object.
    string id?;
    # 
    string imageBase64?;
    # 
    string transparency?;
    # 
    string watermarkText?;
};

# 
public type BulkProcessResponse record {
    # Identifier used to query the status of an individual bulk recipient batch.
    string batchId?;
    # 
    string batchName?;
    # The total number of items in the batch being queried.
    string batchSize?;
    # Error details.
    string[] errorDetails?;
    # 
    string[] errors?;
    # 
    string queueLimit?;
    # 
    string totalQueued?;
};

# 
public type SmartSectionCollapsibleDisplaySettings record {
    # Indicates the direction of the disclosure arrow
    # when the collapsible section is in the closed state.
    # 
    # One of the following:
    # 
    # - `up`: In the closed state, the disclosure arrow points up.
    # - `down`: In the closed state, the disclosure arrow points down.
    # - `left`: In the closed state, the disclosure arrow points left.
    # - `right`: In the closed state, the disclosure arrow points right.
    string arrowClosed?;
    # A CSS color value (such as `#DCF851`) that indicates the color of the arrow.
    string arrowColor?;
    # The location of the arrow relative to the collapsible section's label. Possible values are:
    # 
    # - `right` (default)
    # - `left`
    string arrowLocation?;
    # Indicates the direction of the disclosure arrow
    # when the collapsible section is in the open state.
    # 
    # One of the following:
    # 
    # - `up`: In the open state, the disclosure arrow points up.
    # - `down`: In the open state, the disclosure arrow points down.
    # - `left`: In the open state, the disclosure arrow points left.
    # - `right`: In the open state, the disclosure arrow points right.
    string arrowOpen?;
    # Indicates the size of the collapsible arrows. Possible values are:
    # 
    # - `small`
    # - `large` (default)
    string arrowSize?;
    # The name of the CSS style to be used on collapsible arrow section.
    string arrowStyle?;
    # The name of the CSS style to be used for the collapsible container.
    string containerStyle?;
    # The name of the CSS style to be used for the collapsible container's label.
    string labelStyle?;
    # When **true,** only the arrow is clickable to expand or collapse the section.
    # When **false** (the default), both the label and the arrow are clickable.
    # 
    # If no arrow is used, this setting is ignored.
    boolean onlyArrowIsClickable?;
    # The name of the CSS style to be used for the collapsible container's outer label and arrow style.
    string outerLabelAndArrowStyle?;
};

# 
public type CreditCardTypes record {
    # An array containing supported credit card types.
    string[] cardTypes?;
};

# Defines a billing payments response object.
public type BillingPaymentsResponse record {
    # Reserved for DocuSign.
    BillingPaymentItem[] billingPayments?;
    # The URI for the next chunk of records based on the search request. It is `null` if this is the last set of results for the search. 
    string nextUri?;
    # The URI for the prior chunk of records based on the search request. It is `null` if this is the first set of results for the search. 
    string previousUri?;
};

# This object contains details about a custom field for a bulk send copy. In a bulk send request, each custom field in the bulk send list must match a custom field in the envelope or template that you want to send.
public type BulkSendingCopyCustomField record {
    # The name of the custom field.
    string name?;
    # The value of the custom field.
    string value?;
};

# Contains details about the permission profiles associated with an account.
public type PermissionProfileInformation record {
    # A complex type containing a collection of permission profiles.
    PermissionProfile[] permissionProfiles?;
};

# 
public type ExternalPrimaryAccountRecipientAuthRequirements record {
    # If a value is provided, the recipient must enter the value as the access code to view and sign the envelope. 
    # 
    # Maximum Length: 50 characters and it must conform to the account's access code format setting.
    # 
    # If blank, but the signer `accessCode` property is set in the envelope, then that value is used.
    # 
    # If blank and the signer `accessCode` property is not set, then the access code is not required.
    string accessCode?;
    # 
    string idVerification?;
    # 
    string kba?;
    # 
    string phone?;
};

# An object that contains information about the chunked upload part.
public type ChunkedUploadPart record {
    # The order of the part in the chunked upload.
    string sequence?;
    # The size of the part in bytes. 
    # 
    # DocuSign recommends that a chunked upload part is no larger than a few MB in size.
    string size?;
};

# 
public type Province record {
    # 
    string isoCode?;
    # 
    string name?;
};

# Information about a specific role.
public type TemplateRole record {
    # If a value is provided, the recipient must enter the value as the access code to view and sign the envelope. 
    # 
    # Maximum Length: 50 characters and it must conform to the account's access code format setting.
    # 
    # If blank, but the signer `accessCode` property is set in the envelope, then that value is used.
    # 
    # If blank and the signer `accessCode` property is not set, then the access code is not required.
    string accessCode?;
    # An array of additional notification objects.
    RecipientAdditionalNotification[] additionalNotifications?;
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
    # When **true,** this recipient is the default recipient and any tabs generated by the `transformPdfFields` option are mapped to this recipient.
    string defaultRecipient?;
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
    # The email address of the person associated with a role name. It is the email address of the person specified in the `name` property.
    # 
    # For an in-person signer, this is the email address of the host.
    string email?;
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
    # The full legal name of the in-person signer.
    # 
    # Maximum Length: 100 characters.
    string inPersonSignerName?;
    # Specifies the recipient's name.
    # 
    # For an in-person signer, this is the name of the host.
    string name?;
    # Describes the recipient phone number.
    RecipientPhoneNumber phoneNumber?;
    # The default signature provider is the DocuSign Electronic signature system. This parameter is used to specify one or more Standards Based Signature (digital signature) providers for the signer to use. [More information.](/docs/esign-rest-api/esign101/concepts/standards-based-signatures/)
    RecipientSignatureProvider[] recipientSignatureProviders?;
    # Optional element. Specifies the role name associated with the recipient.<br/><br/>This property is required when you are working with template recipients.
    string roleName?;
    # Specifies the routing order of the recipient in the envelope. 
    string routingOrder?;
    # The ID of the [signing group](https://support.docusign.com/s/document-item?bundleId=gav1643676262430&topicId=zgn1578456447934.html).
    string signingGroupId?;
    # All of the tabs associated with a recipient. Each property is a list of a type of tab.
    EnvelopeRecipientTabs tabs?;
};

# Contains information about an account billing plan.
public type AccountBillingPlan record {
    # Reserved for DocuSign.
    AddOn[] addOns?;
    # 
    string appStoreReceiptExpirationDate?;
    # 
    string appStoreReceiptPurchaseDate?;
    # Reserved for DocuSign.
    string canCancelRenewal?;
    # When **true,** specifies that you can upgrade the account through the API. For GET methods, you must set the `include_metadata` query parameter to **true** for this property to appear in the response.
    string canUpgrade?;
    # Specifies the [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code to use for the account.
    string currencyCode?;
    # 
    DowngradePlanUpdateResponse downgradePlanInformation?;
    # When **true,** customer support is provided as part of the account plan.
    string enableSupport?;
    # The number of seats (users) included in the plan.
    string includedSeats?;
    # Reserved for DocuSign.
    string incrementalSeats?;
    # When **true,** the account has been downgraded from a premium account type. Otherwise **false.**
    string isDowngrade?;
    # 
    string notificationType?;
    #  Any other percentage discount for the plan. 
    string otherDiscountPercent?;
    # The payment cycle associated with the plan. Valid values: 
    # 
    # - `Monthly`
    # - `Annually` 
    string paymentCycle?;
    #  The payment method used with the plan. Valid values: CreditCard, PurchaseOrder, Premium, or Freemium. 
    string paymentMethod?;
    # The per-seat price associated with the plan.
    # 
    # Example: `"456.0000"`
    string perSeatPrice?;
    # Identifies the type of plan. Examples include:
    # 
    # - `business`
    # - `corporate`
    # - `enterprise` 
    # - `free`
    string planClassification?;
    # A complex type that sets the feature sets for the account. It contains the following information (all string content):
    # 
    # * currencyFeatureSetPrices - Contains the currencyCode and currencySymbol for the alternate currency values for envelopeFee, fixedFee, seatFee that are configured for this plan feature set.
    # * envelopeFee - An incremental envelope cost for plans with envelope overages (when isEnabled=true).
    # * featureSetId - A unique ID for the feature set.
    # * fixedFee - A one-time fee associated with the plan (when isEnabled=true).
    # * isActive - Specifies whether the feature set is actively set as part of the plan.
    # * isEnabled - Specifies whether the feature set is actively enabled as part of the plan.
    # * name - The name of the feature set.
    # * seatFee - An incremental seat cost for seat-based plans (when isEnabled=true).
    FeatureSet[] planFeatureSets?;
    # DocuSign's ID for the account plan.
    string planId?;
    # The name of the Billing Plan.
    string planName?;
    # The date that the Account started using the current plan.
    string planStartDate?;
    # The Product ID from the AppStore.
    string productId?;
    # 
    string renewalDate?;
    # The renewal status for the account. Valid values are:
    # 
    # * `auto`: The account automatically renews.
    # * `queued_for_close`: The account will be closed at the `billingPeriodEndDate`.
    # * `queued_for_downgrade`: The account will be downgraded at the `billingPeriodEndDate`.
    # 
    # **Note:** For GET methods, you must set the `include_metadata` query parameter to **true** for this property to appear in the response.
    string renewalStatus?;
    #  A complex type that contains any seat discount information. Valid values:
    #  
    #  - `BeginSeatCount` 
    #  - `EndSeatCount`
    #  - `SeatDiscountPercent`
    #  
    SeatDiscount[] seatDiscounts?;
    # 
    string subscriptionStartDate?;
    # The support incident fee charged for each support incident.
    # 
    # Example: `"$0.00"`
    string supportIncidentFee?;
    # The support plan fee charged for this plan.
    # 
    # Example: `"$0.00"`
    string supportPlanFee?;
    # 
    string taxExemptId?;
};

# 
public type NotaryJournalList record {
    # The last index position in the result set. 
    string endPosition?;
    # The URI for the next chunk of records based on the search request. It is `null` if this is the last set of results for the search. 
    string nextUri?;
    # 
    NotaryJournal[] notaryJournals?;
    # The URI for the prior chunk of records based on the search request. It is `null` if this is the first set of results for the search. 
    string previousUri?;
    # The number of results in this response. Because you can filter which entries are included in the response, this value is always less than or equal to the `totalSetSize`.
    string resultSetSize?;
    # The starting index position of the current result set.
    string startPosition?;
    # The total number of items in the result set. This value is always greater than or equal to the value of `resultSetSize`.
    string totalSetSize?;
};

# The request object for the [EnvelopeViews: createConsole](/docs/esign-rest-api/reference/envelopes/envelopeviews/createconsole/) method.
public type ConsoleViewRequest record {
    # The ID of an envelope. If the envelope has been sent, the endpoint returns a URL for a view of the documents. If the envelope has not yet been sent, the endpoint returns a URL for the sender view.
    # 
    # This property is optional. If no value is provided, the endpoint returns a URL for the front page of the demo UI.
    string envelopeId?;
    # The URL to which the user should be redirected. This is only used when the `envelopeId` is specified as a draft envelope. In this case, the endpoint returns a URL for the sender view. When the user exits the sender view, they will be redirected to the `returnUrl` value. If no value is provided, there is no option to leave the sender view.
    # 
    # In other cases, the user is not redirected out of the console view.
    string returnUrl?;
};

# Contains information about custom fields.
public type CustomFields record {
    # An array of list custom fields.
    ListCustomField[] listCustomFields?;
    # An array of text custom fields.
    TextCustomField[] textCustomFields?;
};

# 
public type BillingPrice record {
    # Reserved for DocuSign.
    string beginQuantity?;
    # 
    string endQuantity?;
    # Reserved for DocuSign.
    string unitPrice?;
};

# 
public type UserSocialIdResult record {
    # Contains properties that map a DocuSign user to a social account such as Facebook or Yahoo.
    SocialAccountInformation[] socialAccountInformation?;
    # The ID of the user to access.
    # 
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    string userId?;
};

# 
public type NotaryJournals record {
    # The creation date of the account in UTC timedate format.
    string createdDate?;
    # 
    string documentName?;
    # Describes the jurisdiction of a notary.
    # This is read-only object.
    Jurisdiction jurisdiction?;
    # 
    string notaryJournalId?;
    # 
    NotaryJournalMetaData notaryJournalMetaData?;
    # The in-person signer's full legal name.
    # 
    # Required when `inPersonSigningType` is `inPersonSigner`.
    # For eNotary flow, use `name` instead.
    # 
    # Maximum Length: 100 characters.
    string signerName?;
};

# Contains information about captive (embedded) recipients.
public type CaptiveRecipientInformation record {
    # A complex type containing information about one or more captive recipients.
    CaptiveRecipient[] captiveRecipients?;
};

# Result of `getBulkSendBatchStatus`
public type BulkSendBatchStatus record {
    # 
    string action?;
    # 
    string actionStatus?;
    # The batch ID.
    string batchId?;
    # The batch name.
    string batchName?;
    # The number of of bulk envelopes submitted in the current batch
    string batchSize?;
    # An array of error statuses.
    BulkSendErrorStatus[] bulkErrors?;
    # The ID of the draft envelope or template that was used to create the batch.
    string envelopeIdOrTemplateId?;
    # 
    BulkSendEnvelopesInfo envelopesInfo?;
    # The URI to get all envelopes sent in the batch.
    string envelopesUri?;
    # The number of envelopes that failed to process or send.
    string failed?;
    # The ID of the mailing list used to create the batch.
    string mailingListId?;
    # 
    string mailingListName?;
    # 
    string ownerUserId?;
    # The number of envelopes waiting in pending queue
    string queued?;
    # 
    string resendsRemaining?;
    # The ID of the sender.
    string senderUserId?;
    # The number of envelopes sent successfully.
    string sent?;
    # The timestamp of  when the batch was submitted in ISO 8601 format.
    string submittedDate?;
};

# Tabs indicate to recipients where they should sign, initial, or enter data on a document. They are represented graphically as symbols on documents at the time of signing. Tabs can also display data to the recipients.
public type Tabs record {
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

# Information about the price and currency associated with the feature set. Reserved for internal DocuSign use only.
public type CurrencyFeatureSetPrice record {
    # Specifies the alternate ISO currency code for the account. 
    string currencyCode?;
    # Reserved for DocuSign.
    string currencySymbol?;
    # Reserved for DocuSign.
    string envelopeFee?;
    # Reserved for DocuSign.
    string fixedFee?;
    # Reserved for DocuSign.
    string seatFee?;
};

# The value of a formula tab is calculated
# from the values of other
# number or date tabs in the document.
# When the recipient completes the underlying fields,
# the formula tab calculates and displays the result.
# 
# The `formula` property of the tab
# contains the references
# to the underlying tabs.
# See [Calculated Fields][calculatedfields]
# in the DocuSign Support Center
# to learn more about formulas.
# 
# If a formula tab contains
# a `paymentDetails` property,
# the tab is considered a payment item.
# See [Requesting Payments Along with Signatures][paymentguide]
# in the DocuSign Support Center
# to learn more about payments.
# 
# [calculatedfields]: https://support.docusign.com/s/document-item?bundleId=gbo1643332197980&topicId=crs1578456361259.html
# [paymentguide]:     https://support.docusign.com/s/document-item?bundleId=juu1573854950452&topicId=fyw1573854935374.html
public type FormulaTab record {
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
    # If this is a regular formula (no `paymentDetails` property is present):
    # 
    # * **true:** The tab is hidden.
    # * **false:** The tab is shown.
    # 
    # If the formula is payment item (a `paymentDetails` property is present):
    # 
    # * **true:** The tab is displayed as a payment.
    # * **false:** The tab is displayed as a regular formula.
    string hidden?;
    # Metadata about a property.
    PropertyMetadata hiddenMetadata?;
    # Metadata about a property.
    PropertyMetadata isPaymentAmountMetadata?;
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
    # When a formula tab
    # has a `paymentDetails` property,
    # the formula tab
    # is a payment item.
    # See [Requesting Payments Along with Signatures][paymentguide]
    # in the DocuSign Support Center
    # to learn more about payments.
    # 
    # [paymentguide]:     https://support.docusign.com/s/document-item?bundleId=juu1573854950452&topicId=fyw1573854935374.html
    PaymentDetails paymentDetails?;
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
    # The number of decimal places to round to.
    string roundDecimalPlaces?;
    # Metadata about a property.
    PropertyMetadata roundDecimalPlacesMetadata?;
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
    # by (+35, -2)
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
    # by (+35, -2)
    string yPosition?;
    # Metadata about a property.
    PropertyMetadata yPositionMetadata?;
};

# 
public type ConnectLogs record {
    # An array of containing failure information from the Connect failure log.
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

# Users' custom settings
public type UserCustomSettings record {
    # The name/value pair information for the user custom setting.
    NameValue[] customSettings?;
};

# 
public type ProvisioningInformation record {
    # 
    string defaultConnectionId?;
    # 
    string defaultPlanId?;
    # The code that identifies the billing plan groups and plans for the new account.
    string distributorCode?;
    # The password for the `distributorCode`.
    string distributorPassword?;
    # 
    string passwordRuleText?;
    # 
    string planPromotionText?;
    # 
    string purchaseOrderOrPromAllowed?;
};

# 
public type PageRequest record {
    # The user's encrypted password hash.
    string password?;
    # Sets the direction the page image is rotated. The possible settings are: left or right
    string rotate?;
};

# This object contains details about the envelope document.
public type EnvelopeDocument record {
    # If recipients were added by converting form fields into tabs, their IDs appear here. This property is read-only.
    string[] addedRecipientIds?;
    # If this document is an attachment to another document in the envelope, this is the ID of the attachment tab it is associated with on the other document.
    string attachmentTabId?;
    # When **true,** marks all of the documents in the envelope as authoritative copies.
    # 
    # **Note:** You can override this value for a specific document. For example, you can set the `authoritativeCopy` property to **true** at the envelope level, but turn it off for a single document by setting the `authoritativeCopy` property for the document to **false.**
    string authoritativeCopy?;
    # Metadata about a property.
    PropertyMetadata authoritativeCopyMetadata?;
    # 
    SignatureType[] availableDocumentTypes?;
    # When **true,** the document has editable form fields that are made available through a PDF format.
    string containsPdfFormFields?;
    # This string sets the display and behavior properties of
    # the document during signing. Valid values:
    # 
    # * `modal`<br>
    #   The document is shown as a supplement action strip
    #   and can be viewed, downloaded, or printed in a modal window.
    #   This is the recommended value for supplemental documents. 
    # 
    # * `inline`<br>
    #   The document is shown in the normal signing window.
    #   This value is not used with supplemental documents,
    #   but is the default value for all other documents.
    string display?;
    # Metadata about a property.
    PropertyMetadata displayMetadata?;
    # 
    string docGenDocumentStatus?;
    # 
    DocGenSyntaxError[] docGenErrors?;
    # 
    DocGenFormField[] docGenFormFields?;
    # The document's bytes. This field can be used to include a base64 version of the document bytes within an envelope definition instead of sending the document using a multi-part HTTP request. The maximum document size is smaller if this field is used due to the overhead of the base64 encoding.
    string documentBase64?;
    # An object containing information about the custom fields on the document.
    NameValue[] documentFields?;
    # The ID of the document that the tab is placed on. This value must refer to the ID of an existing document.
    string documentId?;
    # The GUID of the document.
    string documentIdGuid?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # When **true,**
    # the document is included in the combined document download (`documentsCombinedUri`). 
    # The default value is **true.**
    string includeInDownload?;
    # Metadata about a property.
    PropertyMetadata includeInDownloadMetadata?;
    # 
    string isAceGenDocument?;
    # 
    string isDocGenDocument?;
    # The document's file name. 
    # 
    # Example: `Q1-Report.docx`
    string name?;
    # Metadata about a property.
    PropertyMetadata nameMetadata?;
    # The order in which to sort the results.
    # 
    # Valid values are: 
    # 
    # 
    # * `asc`: Ascending order.
    # * `desc`: Descending order. 
    string 'order?;
    # An array of page objects that contain information about the pages in the document.
    Page[] pages?;
    # Sets how the signer interacts with the supplemental document.
    # Valid values:
    # 
    # * `no_interaction`<br>
    #   No recipient action is required.
    # 
    # * `view`<br>
    #   The recipient is required to view the document.
    # 
    # * `accept`<br>
    #   The recipient is required to accept the document by selecting accept during signing, but is not required to view the document.
    # 
    # * `view_accept`<br>
    #   The recipient is required to view and accept the document.
    string signerMustAcknowledge?;
    # Metadata about a property.
    PropertyMetadata signerMustAcknowledgeMetadata?;
    # 
    string sizeBytes?;
    # When **true,** the sender cannot change any attributes of the recipient. Used only when working with template recipients. 
    string templateLocked?;
    # When **true,** the sender may not remove the recipient. Used only when working with template recipients.
    string templateRequired?;
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
    # The URI for retrieving the document.
    string uri?;
};

# Contains information about a DocuSign Connect configuration.
public type ConnectConfigurations record {
    # When **true,** data is sent to the `urlToPublishTo` web address. The default value for this property is **false,** which will stop sending data while maintaining the Connect configuration information.
    string allowEnvelopePublish?;
    # When **true,** DocuSign sends data to the designated Salesforce account through Connect. The default value is **true.**
    string allowSalesforcePublish?;
    # When **true,** the tracked envelope and recipient events for all users, including users that are added a later time, are sent through Connect. The default value is **false.**
    # 
    # **Note:** If this property is **false,** make sure you set the `userIds` property to a non-empty array of user IDs.
    string allUsers?;
    # This flag allows you to toggle between including and excluding specified users from the configuration. When **false,** the users corresponding to the IDs in `userIds` will be included in the configuration. Conversely, when **true,** the users will be excluded from the configuration. The default value is **false.**
    string allUsersExcept?;
    # If you are using merge fields, this property specifies the type of the merge field. The only supported value is `salesforce`.
    string configurationType?;
    # The DocuSign-generated ID for the Connect configuration. This property is read-only.
    string connectId?;
    # 
    string deliveryMode?;
    # 
    string disabledBy?;
    # When **true,** Connect logging is turned on. DocuSign recommends that you enable this functionality to help troubleshoot any issues. 
    # 
    # You can have a maximum of 100 active logs in your account. You can view the entries in active logs in the **Logs** tab in the Connect console.
    string enableLog?;
    # An array of strings that lists envelope-related events to track through Connect. The possible event values are: 
    # 
    # - `sent`: An envelope has the status `sent` in the following scenarios:
    #    - When the envelope has been sent to recipients.
    #    - When using remote signing, this event is triggered when the email notification with a link to the documents is sent to at least one recipient.
    #    - When using embedded signing, this event is triggered when the link is ready for the recipient to sign the envelope.
    # 
    #    An envelope remains in this state until all recipients have viewed or taken action on the envelope.
    # 
    # - `delivered`: This status is triggered when all recipients have opened the envelope, selected the **Continue** button in the interface, and viewed the documents.
    # - `completed`: This status is triggered when all recipients have completed their assigned actions on an envelope.
    # - `declined`: This status is triggered when a recipient has declined to sign the envelope.
    # - `voided`: The voided status indicates that the sender has voided the envelope.
    # 
    # **Note:** In previous versions of the API, this value was a single comma-separated string.
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
    # When **true,** a certificate for a SOAP header is included in messages sent through Connect.
    string includeCertSoapHeader?;
    # When **true,** the Document Fields associated with the envelope's documents are included in the notification messages. Document Fields are optional custom name-value pairs added to documents using the API. 
    string includeDocumentFields?;
    # When **true,**
    # Connect attaches the envelope documents
    # to the payloads of your event notification messages.
    # 
    # **Note:** Consider resources and scaling when adding documents
    # to your event payloads. Documents attached to these messages
    # are sent as base64 strings,
    # which are larger than binary document data.
    # This can significantly increase your payload size,
    # opening up windows for failure.
    # If you include documents,
    # you must build your application to scale in these situations.
    string includeDocuments?;
    # When **true,** Connect will include the voidedReason for voided envelopes.
    string includeEnvelopeVoidReason?;
    # When **true,** a Hash-based Message Authentication Code (HMAC) signature is included in messages sent through Connect.
    # For more information, see [Using HMAC Security with DocuSign Connect](/platform/webhooks/connect/hmac/).
    string includeHMAC?;
    # 
    string includeOAuth?;
    # When **true,** Connect will include the sender account as Custom Field in the data.
    string includeSenderAccountasCustomField?;
    # When **true,** Connect will include the envelope time zone information.
    string includeTimeZoneInformation?;
    # 
    string integratorManaged?;
    # The name of the Connect configuration. The name helps identify the configuration in the list.
    string name?;
    # The user's encrypted password hash.
    string password?;
    # An array of strings that lists of recipient-related events that trigger a notification
    # to your webhook Connect listener. The possible event values are:
    # 
    # - `sent`: If a recipient type is set to receive an email notification to take action on an envelope, the recipient status is set to `sent` upon delivery of the email.
    # - `delivered`: The recipient has viewed the documents in the envelope. This recipient status does not indicate email delivery of the documents in the envelope.
    # - `completed`: The recipient has completed their assigned actions on an envelope.
    # - `declined`: The recipient has declined to sign a document in the envelope.
    # - `authenticationfailed`: At least one signer has failed the authentication check on the document. If this occurs, you have two options:
    #    - Send a reminder to the recipients, which provides the signer with another chance to access and pass the authentication.
    #    - Correct the document and modify the authentication setting.
    # - `autoresponded`: The recipient's email system sent back an automatic response. This status is only used when **Send-on-behalf-of** is turned off for the account.
    # 
    # **Note:** In previous versions of the API, this value was a single comma-separated string.
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
    # The endpoint to which Connect should send webhook notification messages via an HTTPS POST request. The URL must start with `https`. The customer's web server must use an SSL/TLS certificate whose CA is in the Microsoft list of trusted CAs. Self-signed certificates are not acceptable, but you can use free certificates from Let's Encrypt.
    # 
    # The maximum length of this property is 4096 bytes.
    string urlToPublishTo?;
    # A comma-separated list of user IDs. This sets the users associated with the tracked envelope and recipient events. When a tracked event occurs for a set user, the a notification message is sent to your Connect listener.
    # 
    # By default, the users will be included in the configuration. If you want to exclude the users, set the `allUsersExcept` property to **true.**
    # 
    # **Note:** If `allUsers` is set to `false`, then you must provide a list of user IDs.
    string[] userIds?;
    # The name of the user.
    string userName?;
    # When **true,** indicates that the `urlToPublishTo` property contains a SOAP endpoint.
    string useSoapInterface?;
};

# 
public type AccountMinimumPasswordLength record {
    # The maximum number of entry characters supported by the custom tab.
    string maximumLength?;
    # Minimum length of the access code string.
    string minimumLength?;
};

# Provides a URL that you can embed in your application
# to provide access to the DocuSign UI.
# 
# ### Related topics
# 
# - [Embedded signing and sending](/docs/esign-rest-api/esign101/concepts/embedding/)
# - [Send an envelope via your app](/docs/esign-rest-api/how-to/embedded-sending/)
# - [Introducing customizable embedded sending](https://www.docusign.com/blog/developers/introducing-customizable-embedded-sending)
public type EnvelopeViews record {
    # The view URL to be navigated to.
    string url?;
};

# 
public type IntegratedUserInfoList record {
    # 
    string allUsersSelected?;
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
    UserInfo[] users?;
};

# This response objects shows the updated details for the contacts.
public type ContactUpdateResponse record {
    # A list of contacts.
    Contact[] contacts?;
};

# 
public type PaymentSignerValues record {
    # This property specifies how the signer's collected payment details will be used.
    # 
    # Valid values:
    # 
    # - `authorize`: The payment details will be used to collect payment. This is the default value.
    # - `save`: The signer's payment method (credit card or bank account) will be saved to the sender's payment gateway.
    # - `save_and_authorize`: The signer's payment method (credit card or bank account) will be saved to the sender's payment gateway and will also be used to collect payment.
    string paymentOption?;
};

# Folders allow you to organize envelopes and templates.
public type Folders record {
    # The last index position in the result set. 
    string endPosition?;
    # A list of envelopes in this folder.
    EnvelopeSummary[] envelopes?;
    # A list of folder objects.
    Folder[] folders?;
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

# This object contains details about a bulk send recipient.
public type BulkSendingCopyRecipient record {
    # If a value is provided, the recipient must enter the value as the access code to view and sign the envelope. 
    # 
    # Maximum Length: 50 characters and it must conform to the account's access code format setting.
    # 
    # If blank, but the signer `accessCode` property is set in the envelope, then that value is used.
    # 
    # If blank and the signer `accessCode` property is not set, then the access code is not required.
    string accessCode?;
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
    # An optional array of strings that allows the sender to provide custom data about the recipient. This information is returned in the envelope status but otherwise not used by DocuSign. Each customField string can be a maximum of 100 characters.
    string[] customFields?;
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
    # The recipient's email address.
    string email?;
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
    # Reserved for DocuSign.
    string faxNumber?;
    # The email address of the signing host.
    # This is the DocuSign user that is hosting the in-person signing session.
    # 
    # Required when `inPersonSigningType` is `inPersonSigner`.
    # For eNotary flow, use `email` instead.
    # 
    # Maximum Length: 100 characters.
    string hostEmail?;
    # The name of the signing host.
    # This is the DocuSign user that is hosting the in-person signing session.
    # 
    # Required when `inPersonSigningType` is `inPersonSigner`.
    # For eNotary flow, use `name` instead.
    # 
    # Maximum Length: 100 characters.
    string hostName?;
    # The name of the authentication check to use. This value must match one of the authentication types that the account uses. The names of these authentication types appear in the web console sending interface in the Identify list for a recipient. This setting overrides any default authentication setting. Valid values are:
    # 
    # - `Phone Auth $`: The recipient must authenticate by using two-factor authentication (2FA). You provide the phone number to use for 2FA in the `phoneAuthentication` object.
    # - `SMS Auth $`: The recipient must authenticate via SMS. You provide the phone number to use in the `smsAuthentication` object.
    # - `ID Check $`: The  recipient must answer detailed security questions. 
    # 
    # **Example:** Your account has ID Check and SMS Authentication available. In the web console Identify list, these appear as ID Check $ and SMS Auth $. To use ID Check in an envelope, the idCheckConfigurationName should be ID Check $. For SMS, you would use SMS Auth $, and you would also need to add a phone number to the smsAuthentication node.
    string idCheckConfigurationName?;
    # A complex element that contains input information related to a recipient ID check.
    IdCheckInformationInput idCheckInformationInput?;
    # 
    string identificationMethod?;
    # Specifies ID Verification applied on an envelope by workflow ID.
    # See the [list](/docs/esign-rest-api/reference/accounts/identityverifications/list/)
    # method in the [IdentityVerifications](/docs/esign-rest-api/reference/accounts/identityverifications/) resource
    # for more information on how to retrieve workflow IDs available for an account.
    # This can be used in addition to other [recipient authentication](https://support.docusign.com/s/document-item?bundleId=gav1643676262430&topicId=kzp1578456318101.html) methods.
    RecipientIdentityVerification identityVerification?;
    # 
    string name?;
    # A note sent to the recipient in the signing email.
    # This note is unique to this recipient.
    # In the user interface,
    # it appears near the upper left corner
    # of the document
    # on the signing screen.
    # 
    # Maximum Length: 1000 characters.
    string note?;
    # A complex type that contains the elements:
    # 
    # * `recipMayProvideNumber`: A Boolean value that specifies whether the recipient can use the phone number of their choice.
    # * `senderProvidedNumbers`: A list of phone numbers that the recipient can use.
    # * `recordVoicePrint`: Reserved for DocuSign.
    # * `validateRecipProvidedNumber`: Reserved for DocuSign.
    RecipientPhoneAuthentication phoneAuthentication?;
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
    # The default signature provider is the DocuSign Electronic signature system. This parameter is used to specify one or more Standards Based Signature (digital signature) providers for the signer to use. [More information.](/docs/esign-rest-api/esign101/concepts/standards-based-signatures/)
    RecipientSignatureProvider[] recipientSignatureProviders?;
    # The name of the role associated with the recipient.
    # 
    # **Note:** Every recipient must be assigned either a `recipientId` or a `roleName` but not both. You cannot use `roleName` and `recipientId` in the same list.
    string roleName?;
    # The in-person signer's full legal name.
    # 
    # Required when `inPersonSigningType` is `inPersonSigner`.
    # For eNotary flow, use `name` instead.
    # 
    # Maximum Length: 100 characters.
    string signerName?;
    # The ID of the [signing group](https://support.docusign.com/s/document-item?bundleId=gav1643676262430&topicId=zgn1578456447934.html).
    string signingGroupId?;
    # Contains the element senderProvidedNumbers which is an Array  of phone numbers the recipient can use for SMS text authentication.
    RecipientSMSAuthentication smsAuthentication?;
    # Deprecated.
    SocialAuthentication[] socialAuthentications?;
    # A list of tabs associated with the recipient. In a bulk send request, each of these recipient tabs must match a recipient tab on the envelope or template that you want to send. To match up, the `tabLabel` for this tab and the `tabLabel` for the corresponding tab on the envelope or template must be the same.
    # 
    # For example, if the envelope has a placeholder text tab with the `tabLabel` `childName`, you must assign the same `tabLabel` `childName` to the tab here that you are populating with that information.
    # 
    #  You can use the following types of tabs to match bulk send recipients to an envelope:
    # 
    # - Text tabs
    # - Radio group tabs (where the name of the `radioGroup` on the envelope is used as the `tabLabel` in the bulk send list)
    # - List tabs
    BulkSendingCopyTab[] tabs?;
};

# Describes an additional notification method.
public type RecipientAdditionalNotification record {
    # Describes the recipient phone number.
    RecipientPhoneNumber phoneNumber?;
    # The secondary delivery method. One of:
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
    string secondaryDeliveryMethod?;
    # Metadata about a property.
    PropertyMetadata secondaryDeliveryMethodMetadata?;
    # The status of the delivery. This property is read-only.
    # 
    # One of:
    # 
    # - `autoresponded`
    # - `optedout`
    # - `limitreached`
    string secondaryDeliveryStatus?;
};

# 
public type TabMetadata record {
    # An optional string that is used to auto-match tabs to strings located in the documents of an envelope.
    string anchor?;
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
    # This property controls how [anchor tabs][AnchorTabs] are aligned in relation to the anchor text. Possible values are :
    # 
    # - `left`: Aligns the left side of the tab with the beginning of the first character of the matching anchor word. This is the default value.
    # - `right`: Aligns the tab’s left side with the last character of the matching anchor word.
    # 
    # **Note:** You can only specify the value of this property in POST requests.
    # 
    # [AnchorTabs]: /docs/esign-rest-api/esign101/concepts/tabs/auto-place/
    string anchorHorizontalAlignment?;
    # When **true,** this tab is ignored if the `anchorString` is not found in the document.
    string anchorIgnoreIfNotPresent?;
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
    # Specifies units of the `anchorXOffset` and `anchorYOffset`. Valid units are:
    # 
    # - `pixels` (default)
    # - `inches`
    # - `mms`
    # - `cms`
    string anchorUnits?;
    # Specifies the X axis location of the tab in `anchorUnits` relative to the `anchorString`.
    string anchorXOffset?;
    # Specifies the Y axis location of the tab in `anchorUnits` relative to the `anchorString`.
    string anchorYOffset?;
    # When **true,** the information in the tab is bold.
    string bold?;
    # 
    string collaborative?;
    # When **true,** the field appears normally while the recipient is adding or modifying the information in the field, but the data is not visible (the characters are hidden by asterisks) to any other signer or the sender.
    # 
    # When an envelope is completed the information is only available to the sender through the Form Data link in the DocuSign Console. The information on the downloaded document remains masked by asterisks.
    # 
    # This setting applies only to text boxes and does not affect list boxes, radio buttons, or check boxes.
    string concealValueOnDocument?;
    # The user name of the DocuSign user who created this object.
    string createdByDisplayName?;
    # The userId of the DocuSign user who created this object.
    string createdByUserId?;
    # The DocuSign generated custom tab ID for the custom tab to be applied. This can only be used when adding new tabs for a recipient. When used, the new tab inherits all the custom tab properties.
    string customTabId?;
    # When **true,** disables the auto sizing of single line text boxes in the signing screen when the signer enters data. If disabled users will only be able enter as much data as the text box can hold. By default this is false. This property only affects single line text boxes.
    string disableAutoSize?;
    # When **true,** the custom tab is editable. Otherwise the custom tab cannot be modified.
    string editable?;
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
    # The height of the tab in pixels.
    # Must be an integer.
    string height?;
    # When **true,** the tab is included in e-mails related to the envelope on which it exists. This applies to only specific tabs.
    string includedInEmail?;
    # The original value of the tab.
    string initialValue?;
    # When **true,** the information in the tab is italic.
    string italic?;
    # If the tab is a list, this represents the values that are possible for the tab.
    string[] items?;
    # The UTC DateTime this object was last modified. This is in ISO 8601 format.
    string lastModified?;
    # The User Name of the DocuSign user who last modified this object.
    string lastModifiedByDisplayName?;
    # The userId of the DocuSign user who last modified this object.
    string lastModifiedByUserId?;
    # Allows you to customize locale settings.
    LocalePolicyTab localePolicy?;
    # When **true,** the signer cannot change the data of the custom tab.
    string locked?;
    # The maximum number of entry characters supported by the custom tab.
    string maximumLength?;
    # 
    string maxNumericalValue?;
    # Contains information for transferring values between Salesforce data fields and DocuSign tabs.
    MergeField mergeField?;
    # 
    string minNumericalValue?;
    # 
    string name?;
    # 
    string numericalValue?;
    # If the custom tab is for a payment request, this is the external code for the item associated with the charge. For example, this might be your product id.
    # 
    # Example: `SHAK1`
    # 
    # Maximum Length: 100 characters.
    string paymentItemCode?;
    # If the custom tab is for a payment request, this is the description of the item associated with the charge.
    # 
    # Example: `The Danish play by Shakespeare`
    # 
    # Maximum Length: 100 characters.
    string paymentItemDescription?;
    # If the custom tab is for a payment request, this is the name of the item associated with the charge.
    # 
    # Maximum Length: 100 characters.
    # 
    # Example: `Hamlet`
    string paymentItemName?;
    # When **true** and shared is true, information must be entered in this field to complete the envelope. 
    string requireAll?;
    # When **true,** the signer is required to fill out this tab.
    string required?;
    # Optional element for field markup. When **true,** the signer is required to initial when they modify a shared field.
    string requireInitialOnSharedChange?;
    # Sets the size of the tab. This field accepts values from `0.5` to `1.0`, where `1.0` represents full size and `0.5` is 50% of full size.
    string scaleValue?;
    # When **true,** the radio button is selected.
    string selected?;
    # When **true,** this custom tab is shared.
    string shared?;
    # Reserved for DocuSign.
    string signatureProviderId?;
    # The type of stamp. Valid values are:
    # 
    # - `signature`: A signature image. This is the default value.
    # - `stamp`: A stamp image.
    # - null
    string stampType?;
    # Metadata about a property.
    PropertyMetadata stampTypeMetadata?;
    # The label associated with the tab. This value may be an empty string.
    # If no value is provided, the tab type is used as the value.
    # 
    # Maximum Length: 500 characters.
    string tabLabel?;
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
    # When **true,** the information in the tab is underlined.
    string underline?;
    # The message displayed if the custom tab fails input validation (either custom of embedded).
    string validationMessage?;
    # A regular expression used to validate input for the tab.
    string validationPattern?;
    # Specifies how numerical data is validated. Valid values:
    # 
    # - `number`
    # - `currency`
    string validationType?;
    # The width of the tab in pixels.
    # Must be an integer.
    string width?;
};

# The object contains the response to a bulk send request.
public type BulkSendResponse record {
    # A batch identifier that you can use to get the status of the batch.
    string batchId?;
    # 
    string batchName?;
    # The total number of items in the batch being queried.
    string batchSize?;
    # The GUID of the envelope or template that was sent.
    string envelopeOrTemplateId?;
    # A human-readable object that describes errors that occur. It is only valid for responses and ignored in requests.
    string[] errorDetails?;
    # A list of errors that occurred. This information is intended to be parsed by machine.
    string[] errors?;
    # 
    string queueLimit?;
    # 
    string totalQueued?;
};

# This object is used for both requests and responses. Some properties (such as `endPosition`) only apply to the response of [Groups: list](/docs/esign-rest-api/reference/usergroups/groups/list/).
public type GroupInformation record {
    # The last index position in the result set. 
    string endPosition?;
    # A collection group objects containing information about the groups.
    Group[] groups?;
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
public type ResponsiveHtml record {
    # Holds the properties that define how to generate the responsive-formatted HTML for the document.
    DocumentHtmlDefinitionOriginal[] htmlDefinitions?;
};

# 
public type BillingEntityInformationResponse record {
    # The type of billing method on the account. Valid values are: 
    # 
    # - `direct`
    # - `web`
    string billingProfile?;
    # 
    string entityName?;
    # 
    string externalEntityId?;
    # 
    string isExternallyBilled?;
};

# Contains additional information that a specific signature provider requires.
public type SignatureProviderRequiredOption record {
    # Reserved for DocuSign.
    string[] requiredSignatureProviderOptionIds?;
    # Reserved for DocuSign.
    string signerType?;
};

# The request body for the `createHistoricalEnvelopePublishTransaction` endpoint.
public type ConnectHistoricalEnvelopeRepublish record {
    # The `connectCustomConfiguration` object describes a Connect configuration for your account.
    ConnectCustomConfiguration config?;
    # An array of envelope IDs as comma-separated strings. This property is required.
    # 
    # For example: `["4280f274-xxxx-xxxx-xxxx-b218b7eeda08","9586h293-xxxx-xxxx-xxxx-m923b8opre71","2347w948-xxxx-xxxx-xxxx-t096b8krno89"]`
    string[] envelopes?;
};

# An array of objects that describe the items in a workspace.
public type WorkspaceItemList record {
    # A list of workspace items.
    WorkspaceItem[] items?;
};

# A tab that allows the recipient to enter a date. Date tabs
# are one-line fields that allow date information to be
# entered in any format. The tooltip for this tab recommends
# entering the date as MM/DD/YYYY, but this is not enforced.
# The format entered by the signer is retained. If you need a
# particular date format enforced, DocuSign recommends using a
# Text tab with a validation pattern and a validation message
# to enforce the format.
public type Date record {
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
    # The DocuSign-generated custom tab ID for the custom tab to be applied. This can only be used when adding new tabs for a recipient. When used, the new tab inherits all the custom tab properties.
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

# 
public type RecipientIdentityPhoneNumber record {
    # The numeric country calling code for the phone number. For example, the country calling code for the US and Canada is 1. For the UK, the country calling code is 44.
    # 
    # Do not include the + symbol.
    string countryCode?;
    # 
    string countryCodeLock?;
    # Metadata about a property.
    PropertyMetadata countryCodeMetadata?;
    # The telephone extension, if any.
    string extension?;
    # Metadata about a property.
    PropertyMetadata extensionMetadata?;
    # The telephone number. Use only the digits `0`-`9`. Remove any non-numeric characters.
    # 
    # Do not include the `countryCode`. For US, Canada, and other
    # [North American Numbering Plan](https://en.wikipedia.org/wiki/North_American_Numbering_Plan) countries, do not include a leading `1` or `0`.
    string number?;
    # Metadata about a property.
    PropertyMetadata numberMetadata?;
};

# 
public type Contact record {
    # The cloud service that provided the contact. Valid values are:
    # 
    # - `rooms`
    # - `docusignCore` (default)
    # 
    # <!-- Future:
    # 
    # - `Box`
    # - `GoogleDrive`
    # - `Dropbox`
    # - `SalesForce`
    # - `SkyDrive`
    # 
    # -->
    string cloudProvider?;
    # The ID of the container at the cloud provider. For example, this might be the room ID for a DocuSign Transaction Room.
    string cloudProviderContainerId?;
    # The ID of a contact person in the account's address book.
    string contactId?;
    # A list of the contact's phone numbers.
    # 
    # **Note:** The phone numbers associated with shared contacts do not display to users other than the user who added the contact. Additionally, in the following scenarios, the phone number of a shared contact does not populate automatically for anyone other than the user who added the contact:
    # 
    # - Sending an envelope by using SMS
    # - Using phone authentication
    # 
    # You must ask the user who added the contact for the phone number and then manually enter it into the authentication box.
    ContactPhoneNumber[] contactPhoneNumbers?;
    # The URI for retrieving information about the contact.
    string contactUri?;
    # An array of email addresses.
    string[] emails?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # 
    boolean isOwner?;
    # The name of the contact.
    string name?;
    # 
    NotaryContactDetails notaryContactDetails?;
    # 
    string organization?;
    # 
    string roomContactType?;
    # When **true,** this contact is shared.
    string shared?;
    # The ID of the signing group.
    string signingGroup?;
    # Optional. The name of the signing group. 
    # 
    # Maximum Length: 100 characters. 
    string signingGroupName?;
};

# Contains details about the default notification settings for the envelope notifications that senders and signers receive.
public type NotificationDefaultSettings record {
    # Contains the settings for the email notifications that senders receive about the envelopes that they send.
    SenderEmailNotifications senderEmailNotifications?;
    # An array of email notifications that specifies the email the user receives when they are a recipient. When the specific email notification is set to true, the user receives those types of email notifications from DocuSign. The user inherits the default account email notification settings when the user is created.
    SignerEmailNotifications signerEmailNotifications?;
};

# Contains information about a certified delivery recipient. Certified delivery recipients must receive the completed documents for the envelope to be completed. However, they don't need to sign, initial, date or add information to any of the documents.
public type CertifiedDelivery record {
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
    # The status of the recipient. This property is read-only. 
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
public type EnvelopeMetadata record {
    # Specifies if the Advanced Correct feature is enabled for the envelope. This feature enables you to correct the details of in process envelopes that you sent or are shared with you. It offers more functionality than the Correct feature.
    string allowAdvancedCorrect?;
    # Specifies if the Correct feature is enabled for the envelope. This feature enables you to correct the details of in process envelopes that you sent or are shared with you, including the recipient, envelope, and document information.
    string allowCorrect?;
    # Specifies if DocuSign eNotary service is enabled for the envelope.
    string enableSignWithNotary?;
};

# 
public type LoginAccount record {
    # The account ID associated with the envelope.
    string accountId?;
    # The GUID associated with the account ID.
    string accountIdGuid?;
    # The URL that should be used for successive calls to this account. It includes the protocal (https), the DocuSign server where the account is located, and the account number. Use this Url to make API calls against this account. Many of the API calls provide Uri's that are relative to this baseUrl.
    string baseUrl?;
    # The email address for the user.
    string email?;
    # This value is true if this is the default account for the user, otherwise false is returned.
    string isDefault?;
    # A list of settings on the account that indicate what features are available.
    NameValue[] loginAccountSettings?;
    # A list of user-level settings that indicate what user-specific features are available.
    NameValue[] loginUserSettings?;
    # The name associated with the account.
    string name?;
    # An optional descirption of the site that hosts the account.
    string siteDescription?;
    # The ID of the user to access.
    # 
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    string userId?;
    # The name of this user as defined by the account.
    string userName?;
};

# 
public type RecipientDomain record {
    # 
    string active?;
    # 
    string domainCode?;
    # 
    string domainName?;
    # 
    string recipientDomainId?;
};

# 
public type SocialAccountInformation record {
    # The users email address.
    string email?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The social account provider (Facebook, Yahoo, etc.)
    string provider?;
    # The ID provided by the Socal Account.
    string socialId?;
    # The full user name for the account.
    string userName?;
};

# This object provides details about a custom field.
public type CustomField record {
    # The type of custom field. Valid values are:
    # 
    # - `text` (default)
    # - `list`
    string customFieldType?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The ID of the custom field.
    string fieldId?;
    # For a list custom field, this is an array of strings that represent the items in a list. 
    # 
    # Maximum Length: 2,000 characters.
    string[] listItems?;
    # The name of the custom field.
    string name?;
    # When **true,** the signer must complete the custom field.
    string required?;
    # When **true,** the custom field displays at the top of the Certificate of Completion.
    string show?;
    # Specifies the value of the custom field. 
    # 
    # Maximum Length: 2,000 characters.
    string value?;
};

# This section provides information about template locks. You use template locks to prevent others from making changes to a template while you are modifying it.
public type TemplateLocks record {
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The number of seconds until the lock expires when there is no activity on the template.
    # 
    # If no value is entered, then the default value of 300 seconds is used. The maximum value is 1,800 seconds.
    # 
    # The lock duration can be extended.
    string lockDurationInSeconds?;
    # Specifies the friendly name of  the application that is locking the envelope.
    string lockedByApp?;
    # 
    UserInfo lockedByUser?;
    # The date and time that the lock expires.
    string lockedUntilDateTime?;
    # A unique identifier provided to the owner of the lock. You must use this token with subsequent calls to prove ownership of the lock.
    string lockToken?;
    # The type of lock.  Currently `edit` is the only supported type.
    string lockType?;
    # When **true,** a scratchpad is used to edit information.
    #  
    string useScratchPad?;
};

# The request body for the [TemplateViews: createEdit](/docs/esign-rest-api/reference/templates/templateviews/createedit/) method.
public type ReturnUrlRequest record {
    # The URL to which the user should be redirected after the editing session is complete. It must be an absolute URL (e.g. `https://www.example.com` not `www.example.com`).
    # 
    # The maximum length is 470 characters. If the value exceeds this limit, the user is redirected to a truncated URL.
    # 
    # **Note:** If this property is not provided, the user will have full access to the sending account.
    string returnUrl?;
};
