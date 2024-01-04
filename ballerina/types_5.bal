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
public type TemplateUpdateSummary record {
    # 
    BulkEnvelopeStatus bulkEnvelopeStatus?;
    # The envelope ID of the envelope status that failed to post.
    string envelopeId?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # 
    ListCustomField[] listCustomFieldUpdateResults?;
    # Envelope locks let you lock an envelope to prevent any changes while you are updating an envelope.
    EnvelopeLocks lockInformation?;
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
    # An array of `recipientUpdateResults` objects that contain details about the recipients.
    RecipientUpdateResponse[] recipientUpdateResults?;
    # All of the tabs associated with a recipient. Each property is a list of a type of tab.
    EnvelopeRecipientTabs tabUpdateResults?;
    # 
    TextCustomField[] textCustomFieldUpdateResults?;
};

# This object represents the workspace user. This property is only returned in response to user specific GET call. 
public type WorkspaceUser record {
    # The account ID associated with the workspace user.
    string accountId?;
    # The name of the account that the workspace user belongs to.
    string accountName?;
    # The UTC DateTime when the user joined the workspace.
    string activeSince?;
    # The UTC DateTime when the workspace user was created.
    string created?;
    # The ID of the user who created this workspace user.
    string createdById?;
    # The workspace user's email address.
    string email?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The text of the workspace invitation email message sent to the user.
    string invitationEmailBlurb?;
    # The subject line of the workspace invitation email message sent to the user.
    string invitationEmailSubject?;
    # The UTC DateTime that the workspace user was last modified.
    string lastModified?;
    # The ID of the user who last modified the workspace user.
    string lastModifiedById?;
    # Filters the results by user status.
    # You can specify a comma-separated
    # list of the following statuses:
    # 
    # * ActivationRequired 
    # * ActivationSent 
    # * Active
    # * Closed 
    # * Disabled
    string status?;
    # Type of the user. Valid values: type_owner, type_participant.
    string 'type?;
    # The ID of the workspace user.
    string userId?;
    # The name of workspace user.
    string userName?;
    # The ID of the workspace.
    string workspaceId?;
    # The URL for accessing the workspace user.
    string workspaceUserBaseUrl?;
    # The ID of the workspace user.
    string workspaceUserId?;
    # The URI for accessing the workspace user.
    string workspaceUserUri?;
};

# 
public type Comment record {
    # The Guid of the envelope the comment thread belongs to.
    string envelopeId?;
    # Reserved for DocuSign.
    string hmac?;
    # The unique identifier for the comment.
    string id?;
    # An array of userIds that are mentioned directly in the body of a comment.
    string[] mentions?;
    # When **true,** indicates that the comment was read.
    boolean read?;
    # The email address of the user who created the comment.
    string sentByEmail?;
    # The full name of the user who created the comment.
    string sentByFullName?;
    # Reserved for DocuSign.
    string sentByImageId?;
    # The initials of the user who created the comment.
    string sentByInitials?;
    # The recipient ID of the user who created the comment.
    string sentByRecipientId?;
    # The user ID of the user who created the comment.
    string sentByUserId?;
    # The ID of the signing group that can view the comment or that created the comment.
    string signingGroupId?;
    # Optional. The name of the signing group. 
    # 
    # Maximum Length: 100 characters. 
    string signingGroupName?;
    # The subject of the envelope.
    string subject?;
    # The unique identifier for the tab that represents the comment thread.
    string tabId?;
    # The content of the comment, as UTF-8 text. 
    # 
    # Maximum Length: 500 characters.
    # 
    # **Note:** The maximum size allowed for the entire message body is 32 KB. 
    string text?;
    # The unique identifier for the comment thread.
    string threadId?;
    # The userId of the user who created the thread.
    string threadOriginatorId?;
    # The time the comment was created.
    string timestamp?;
    # The time the comment was created, formatted according to the format of the user who created the comment.
    string timeStampFormatted?;
    # The user IDs of the users that the comment is visible to.
    string[] visibleTo?;
};

# 
public type EnvelopeAuditEventResponse record {
    # Reserved for DocuSign.
    EnvelopeAuditEvent[] auditEvents?;
};

# 
public type SignatureGroup record {
    # The ID of the group being accessed.
    string groupId?;
    # The name of the group. The search_text provided in the call automatically performs a wild card search on group_name.
    string groupName?;
    # Indicates whether the property is editable. Valid values are:
    # 
    # - `editable`
    # - `read_only`
    string rights?;
};

# Details about envelope comments.
public type Comments record {
    # The envelope ID of the envelope status that failed to post.
    string envelopeId?;
    # Reserved for DocuSign.
    string hmac?;
    # A unique ID for the Salesforce object.
    string id?;
    # An array of userIds that are mentioned directly in the body of a comment.
    string[] mentions?;
    # Indicates if the comment has been read by the target recipient of the comment.
    boolean read?;
    # 
    string sentByEmail?;
    # 
    string sentByFullName?;
    # Reserved for DocuSign.
    string sentByImageId?;
    # 
    string sentByInitials?;
    # 
    string sentByRecipientId?;
    # 
    string sentByUserId?;
    # The ID of the [signing group](https://support.docusign.com/s/document-item?bundleId=gav1643676262430&topicId=zgn1578456447934.html).
    string signingGroupId?;
    # Optional. The name of the signing group. 
    # 
    # Maximum Length: 100 characters. 
    string signingGroupName?;
    # 
    string subject?;
    # The unique identifier for the tab.
    string tabId?;
    # Specifies the text that is shown in the dropdown list. 
    string text?;
    # The unique identifier for the comment thread.
    string threadId?;
    # The userId of the user who created the thread.
    string threadOriginatorId?;
    # 
    string timestamp?;
    # 
    string timeStampFormatted?;
    # 
    string[] visibleTo?;
};

# 
public type ReservedDomains record {
};

# 
public type UserInfoList record {
    # An array of `userInfo` objects containing information about the users in the group.
    UserInfo[] users?;
};

# A one-line field that allows the recipient to enter a Social
# Security Number. The SSN can be typed with or without
# dashes. It uses the same parameters as a Text tab, with the
# validation message and pattern set for SSN information.
public type Ssn record {
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

# A tab that allows the recipient the option of declining an
# envelope. If the recipient clicks the tab during the signing
# process, the envelope is voided.
public type Decline record {
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
    #  Specifies the decline text displayed in the tab.
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
    # The reason the recipient declined the document.
    string declineReason?;
    # Metadata about a property.
    PropertyMetadata declineReasonMetadata?;
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
    # **Note:** Decline tabs never display this tooltip in the signing interface.
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

# Information about templates.
public type EnvelopeTemplateResults record {
    # The last index position in the result set. 
    string endPosition?;
    # The list of requested templates.
    EnvelopeTemplate[] envelopeTemplates?;
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

# A name-value pair that describes an item and provides a value for the item.
public type NameValue record {
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The name of the item.
    string name?;
    # The initial value of the item.
    string originalValue?;
    # The current value of the item.
    string value?;
};

# 
public type RecipientAttachment record {
    # The unique identifier for the attachment.
    string attachmentId?;
    # Specifies the type of the attachment for the recipient. Possible values are:
    # 
    # - `.htm`
    # - `.xml`
    string attachmentType?;
    # A Base64-encoded representation of the attachment that is used to upload and download the file. File attachments may be up to 50 MB in size.
    string data?;
    # An optional label for the attachment.
    string label?;
    # The name of the attachment.
    string name?;
    # The URL of a previously staged chunked upload. Using a chunked upload enables you to stage a large, chunkable temp file. You then use the `remoteUrl` property to reference the chunked upload as the content in attachment and document-related requests. The `remoteUrl` property cannot be used for downloads.
    string remoteUrl?;
};

# Users' signatures
public type UserSignatures record {
    # The date and time the user adopted their signature.
    string adoptedDateTime?;
    # The UTC date and time when the user created the signature.
    string createdDateTime?;
    # Serialized information about any custom [eHanko stamps](https://support.docusign.com/s/articles/Sending-and-Signing-with-eHanko) that have been ordered from an eHanko provider, including the order status, purchase order id, time created, and time modified.
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
    # An external ID for the signature or stamp.
    # 
    # **Note:** If a recipient uses a stamp instead of a signature, this is the stamp vendor's serial number for the stamp.
    string externalID?;
    # A Base64-encoded representation of the signature image.
    string imageBase64?;
    # The format of the signature image, such as:
    # 
    # - `GIF`
    # - `PNG`
    # - `JPG`
    # - `PDF`
    # - `BMP`
    string imageType?;
    # The ID of the user's initials image.
    string initials150ImageId?;
    # The URI for retrieving the image of the user's initials.
    string initialsImageUri?;
    # Boolean that specifies whether the signature is the default signature for the user.
    string isDefault?;
    # The UTC date and time when the signature was last modified.
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
    # The font type for the signature, if the signature is not drawn. The supported font types are:
    # 
    # "7_DocuSign", "1_DocuSign", "6_DocuSign", "8_DocuSign", "3_DocuSign", "Mistral", "4_DocuSign", "2_DocuSign", "5_DocuSign", "Rage Italic"
    string signatureFont?;
    # The ID associated with the signature name. You can use this property in the URI in place of the signature name. This enables the use of special characters (such as "&", "<", and ">") in a signature name.
    # 
    # **Note:** When you update a signature, its signature ID might change. In that case you need to use `signatureName` to get the new `signatureId`.
    string signatureId?;
    # An endpoint URI that you can use to retrieve the user's signature image.
    string signatureImageUri?;
    #  The initials associated with the signature.
    string signatureInitials?;
    # Specifies the user's signature name.
    string signatureName?;
    # The rights that the user has to the signature. Valid values are:
    # 
    # - `none`
    # - `read`
    # - `admin`
    string signatureRights?;
    # Specifies the type of signature. Possible values include:
    # 
    # - `RubberStamp`: A DocuSign pre-formatted signature style. This is the default value.
    # - `Imported`: A signature image that the user uploaded.
    # - `Drawn`: A freehand drawing of the user's signature and initials.
    string signatureType?;
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
public type BulksendingCopyDocGenFormField record {
    # 
    string name?;
    # Specifies the value of the tab. 
    string value?;
};

# Envelope email settings
public type EnvelopeEmailSettings record {
    # An array containing the email address that should receive a copy of all email communications related to an envelope for archiving purposes. Maximum Length: 100 characters.
    # 
    # While this property is an array, note that it takes only a single email address.
    # 
    # **Note:** Only users with the `canManageAccount` setting set to **true** can use this option. 
    # 
    # DocuSign verifies that the email format is correct, but does not verify that the email address is active. You can use this for archiving purposes. However, using this property overrides the BCC for Email Archive information setting for this envelope. 
    # 
    # **Example:** if your account has BCC for Email Archive set up for the email address archive@mycompany.com and you send an envelope using the BCC Email Override to send a BCC email to salesarchive@mycompany.com, then a copy of the envelope is only sent to the salesarchive@mycompany.com email address.
    BccEmailAddress[] bccEmailAddresses?;
    # The Reply To email address to use for email replies, instead of the one that is configured at the account level. DocuSign verifies that the email address is in a correct format, but does not verify that it is active. Maximum Length: 100 characters.
    string replyEmailAddressOverride?;
    # The name to associate with the Reply To email address, instead of the name that is configured at the account level. Maximum Length: 100 characters.
    string replyEmailNameOverride?;
};

# The request object containing the new information for the contacts.
public type ContactModRequest record {
    # A list of contacts.
    Contact[] contactList?;
};

# 
public type NewAccountSummary record {
    # The account ID associated with the envelope.
    string accountId?;
    # The GUID associated with the account ID.
    string accountIdGuid?;
    # The account name for the new account.
    string accountName?;
    # Contains a token that can be used for authentication in API calls instead of using the user name and password.
    string apiPassword?;
    # The URL that should be used for successive calls to this account. It includes the protocal (https), the DocuSign server where the account is located, and the account number. Use this Url to make API calls against this account. Many of the API calls provide Uri's that are relative to this baseUrl.
    string baseUrl?;
    # Information used to provide a preview of a billing plan.
    BillingPlanPreview billingPlanPreview?;
    # Specifies the user ID of the new user.
    string userId?;
};

# The PowerForms resource enables you to create fillable forms that you can email or make available for self service on the web.
public type PowerForms record {
    # The ID of the user who created the PowerForm. This property is returned in a response only when you set the `include_created_by` query parameter to **true.**
    string createdBy?;
    # The date and time that the PowerForm was created.
    string createdDateTime?;
    # For a PowerForm that is sent by email, this is the body of the email message sent to the recipients.
    # 
    # Maximum length: 10000 characters.
    string emailBody?;
    # Sets the envelope name for the envelopes that the PowerForm generates. One option is to make this property the same as the subject from the template.
    # 
    # You can customize the subject line to include a recipient's name or email address by using merge fields. For information about adding merge fields to the email subject, see [Template Email Subject Merge Fields](/docs/esign-rest-api/reference/templates/templates/create/).
    string emailSubject?;
    # An array of envelope objects that contain information about the envelopes that are associated with the PowerForm.
    Envelope[] envelopes?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The instructions that display on the landing page for the first recipient. These instructions are important if the recipient accesses the PowerForm by a method other than email. When you include instructions, they display as an introduction after the recipient accesses the PowerForm.
    string instructions?;
    # When **true,** indicates that the PowerForm is active and can be sent to recipients. This is the default value.
    # 
    # 
    # When **false,** the PowerForm cannot be emailed or accessed by a recipient, even if they arrive at the PowerForm URL. 
    # 
    # If a recipient attempts to sign an inactive PowerForm, an error message informs the recipient that the document is not active and suggests that they contact the sender.
    string isActive?;
    # The date and time that the PowerForm was last used.
    string lastUsed?;
    # The length of time before the same recipient can sign the same PowerForm again. This property is used in combination with the `limitUseIntervalUnits` property.
    string limitUseInterval?;
    # When **true,** the `limitUseInterval` is enabled.
    string limitUseIntervalEnabled?;
    # The units associated with the `limitUseInterval`. Valid values are:
    # 
    # - `minutes`
    # - `hours`
    # - `days`
    # - `weeks`
    # - `months`
    # 
    # For example, to limit a recipient to signing once per year, set the `limitUseInterval` to 365 and the `limitUseIntervalUnits` to `days`.
    string limitUseIntervalUnits?;
    # When **true,** you can set a maximum number of uses for the PowerForm.
    string maxUseEnabled?;
    # The name of the PowerForm.
    string name?;
    # The ID of the PowerForm.
    string powerFormId?;
    # The URL for the PowerForm.
    string powerFormUrl?;
    # An array of `powerFormRecipient` objects.
    # 
    # **Note:** For self-service documents where you do not know who the recipients are in advance, you can enter generic information for the `role` property and leave other details (such as `name` and `email`) blank.
    PowerFormRecipient[] recipients?;
    # The name of the sender. 
    # 
    # **Note:** The default sender for a PowerForm is the PowerForm Administrator who created it.
    string senderName?;
    # The ID of the sender.
    string senderUserId?;
    # The signing method to use. Valid values are:
    # 
    # - `email`: This mode verifies the recipient's identity by using email authentication before the recipient can sign a document.
    # 
    # - `direct`: This mode does not require any verification. DocuSign recommends that you use this signing method only when another form of authentication is in use.
    # 
    # **Note:** In the account settings, `enablePowerFormDirect` must be **true** to use `direct` as the `signingMode`.
    # 
    # For more information about signing modes, see the [overview of the Create method](/docs/esign-rest-api/reference/powerforms/powerforms/create/).
    string signingMode?;
    # The ID of the template used to create the PowerForm.
    string templateId?;
    # The name of the template used to create the PowerForm.
    string templateName?;
    # The number of times the PowerForm has been used. 
    string timesUsed?;
    # The URI for the PowerForm.
    string uri?;
    # The number of times that the PowerForm can still be used. If no use limit is set, the value is `Unlimited`. 
    string usesRemaining?;
};

# A list of bulk send batch summaries. 
public type BulkSendBatchSummaries record {
    # The maximum number of envelopes the account is permitted to submit in a given batch.
    string batchSizeLimit?;
    # An array of batch summaries.
    BulkSendBatchSummary[] bulkBatchSummaries?;
    # 
    string bulkProcessQueueLimit?;
    # 
    string bulkProcessTotalQueued?;
    # The last index position in the result set. 
    string endPosition?;
    # The URI for the next chunk of records based on the search request. It is `null` if this is the last set of results for the search. 
    string nextUri?;
    # The URI for the prior chunk of records based on the search request. It is `null` if this is the first set of results for the search. 
    string previousUri?;
    # Maximum number of envelopes an account is permitted to have in the queue at any one time.
    string queueLimit?;
    # The number of results in this response. Because you can filter which entries are included in the response, this value is always less than or equal to the `totalSetSize`.
    string resultSetSize?;
    # The starting index position of the current result set.
    string startPosition?;
    # The number of envelopes currently pending processing for the entire account.
    string totalQueued?;
    # The total number of items in the result set. This value is always greater than or equal to the value of `resultSetSize`.
    string totalSetSize?;
};

# A DocuSign workspace is a collaboration area for sharing files and data.
public type Workspace record {
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
    # Indicates the envelope status. Valid values are:
    # 
    # * sent - The envelope is sent to the recipients. 
    # * created - The envelope is saved as a draft and can be modified and sent later.
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

# Allows the sender to pre-specify the signature name, signature initials and signature font used in the signature stamp for the recipient.
# 
# Used only with recipient types In Person Signers and Signers.
public type RecipientSignatureInformation record {
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
    string fontStyle?;
    # Specifies the user's signature in initials format.
    string signatureInitials?;
    # Specifies the user's signature name.
    string signatureName?;
};

# 
public type IdCheckSecurityStep record {
    # Type of authorization used for the security check.
    string authType?;
};

# This group tab is used to place radio buttons on a document.
# The `radios` property
# contains a list of
# [`radio`](/docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/)
# objects  associated with the group. Only one radio button can
# be selected in a group.
public type RadioGroup record {
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
    # Specifies the document ID number that the tab is placed on. This must refer to an existing Document's ID attribute.
    string documentId?;
    # Metadata about a property.
    PropertyMetadata documentIdMetadata?;
    # The name of the group. The search_text provided in the call automatically performs a wild card search on group_name.
    string groupName?;
    # Metadata about a property.
    PropertyMetadata groupNameMetadata?;
    # The initial value of the tab. 
    string originalValue?;
    # Metadata about a property.
    PropertyMetadata originalValueMetadata?;
    # Specifies the locations and status for radio buttons that are grouped together.
    Radio[] radios?;
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
    # Optional element for field markup. When **true,** the signer is required to initial when they modify a shared field.
    string requireInitialOnSharedChange?;
    # Metadata about a property.
    PropertyMetadata requireInitialOnSharedChangeMetadata?;
    # When **true,** this custom tab is shared.
    string shared?;
    # Metadata about a property.
    PropertyMetadata sharedMetadata?;
    # Reserved for DocuSign.
    string shareToRecipients?;
    # Metadata about a property.
    PropertyMetadata shareToRecipientsMetadata?;
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
    PropertyMetadata tooltipMetadata?;
    # Specifies the value of the tab. 
    string value?;
    # Metadata about a property.
    PropertyMetadata valueMetadata?;
};

# The recipient details that are returned after you update the recipient.
public type RecipientUpdateResponse record {
    # When you use the query parameter 'combine_same_order_recipients' on the PUT Recipients call, the `recipientUpdateResponse` returns this property. When **true,** it indicates that the recipient has been combined or merged with a matching recipient. Recipient matching occurs as part of template matching, and is based on Recipient Role and Routing Order.
    string combined?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # Unique for the recipient. It is used by the tab element to indicate which recipient is to sign the Document.
    string recipientId?;
    # The globally-unique identifier (GUID) for a specific recipient on a specific envelope. If the same recipient is associated with multiple envelopes, they will have a different GUID for each one. This property is read-only.
    string recipientIdGuid?;
    # All of the tabs associated with a recipient. Each property is a list of a type of tab.
    EnvelopeRecipientTabs tabs?;
};

# 
public type SmartContractInformation record {
    # Reserved for DocuSign.
    string code?;
    # Reserved for DocuSign.
    string uri?;
};

# Envelope recipients
public type EnvelopeRecipients record {
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
public type ExternalFolder record {
    # The last index position in the result set. 
    string endPosition?;
    # 
    ExternalDocServiceErrorDetails errorDetails?;
    # A unique ID for the Salesforce object.
    string id?;
    # If the tab is a list, this represents the values that are possible for the tab.
    ExternalFile[] items?;
    # 
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

# Summary of a template request.
public type TemplateSummary record {
    # Reserved for DocuSign.
    string applied?;
    # Specifies the document ID number that the tab is placed on. This must refer to an existing document's ID attribute.
    string documentId?;
    # The name of the document.
    string documentName?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The name of the template.
    string name?;
    # The unique identifier of the template. If this is not provided, DocuSign will generate a value. 
    string templateId?;
    # 
    TemplateMatch templateMatch?;
    # A URI containing the user ID.
    string uri?;
};

# Describes the recipient routing rules.
public type RecipientRouting record {
    # 
    RecipientRules rules?;
};

# This object represents a free text custom field where envelope creators and senders can enter custom data.
public type TextCustomField record {
    # If you are using merge fields, this property specifies the type of the merge field. The only supported value is `salesforce`.
    string configurationType?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The ID of the custom field.
    string fieldId?;
    # The name of the custom field.
    string name?;
    # When **true,** senders are required to enter or select information for the field before they can send the envelope.
    string required?;
    # When **true,** the field displays in the **Envelope Custom Fields** section when a user creates or sends an envelope.
    string show?;
    # The value of the custom field. The user who creates or sends the envelope provides this value. Maximum length: 100 characters.
    string value?;
};

# Reserved for DocuSign.
public type AccountSignatureProviderOption record {
    # Reserved for DocuSign.
    string signatureProviderOptionDisplayName?;
    # Reserved for DocuSign.
    string signatureProviderOptionId?;
    # Reserved for DocuSign.
    string signatureProviderOptionName?;
};

# A tab associated with the bulk send recipient. In a bulk send request, each recipient tab must match a recipient tab on the envelope or template that you want to send. To match up, the `tabLabel` for this tab and the `tabLabel` for the corresponding tab on the envelope or template must be the same.
# 
# For example, if the envelope has a placeholder text tab with the `tabLabel` `childName`, you must assign the same `tabLabel` `childName` to the tab here that you are populating with that information.
public type BulkSendingCopyTab record {
    # The initial value that you want to assign to the tab.
    string initialValue?;
    # The label associated with the recipient tab. In a bulk send request, the `tabLabel` for this tab and the `tabLabel` for the corresponding tab on the envelope or template must be the same.
    # 
    # Maximum Length: 500 characters.
    string tabLabel?;
};

# 
public type EnvelopeAttachment record {
    # Valid values are `sender` and `senderAndAllRecipients`.
    string accessControl?;
    # The unique identifier for the attachment.
    string attachmentId?;
    # Specifies the type of the attachment for the recipient. Possible values are:
    # 
    # - `.htm`
    # - `.xml`
    string attachmentType?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # 
    string label?;
    # 
    string name?;
};

# This object includes information about the users who have sent PowerForms.
public type PowerFormSendersResponse record {
    # The last index position in the result set. 
    int:Signed32 endPosition?;
    # The URI for the next chunk of records based on the search request. It is `null` if this is the last set of results for the search. 
    string nextUri?;
    # An array of `userInfo` objects containing information about users who have sent PowerForms.
    UserInfo[] powerFormSenders?;
    # The URI for the prior chunk of records based on the search request. It is `null` if this is the first set of results for the search. 
    string previousUri?;
    # The number of results in this response. Because you can filter which entries are included in the response, this value is always less than or equal to the `totalSetSize`.
    int:Signed32 resultSetSize?;
    # The starting index position of the current result set.
    int:Signed32 startPosition?;
    # The total number of items in the result set. This value is always greater than or equal to the value of `resultSetSize`.
    int:Signed32 totalSetSize?;
};

# A document object.
public type Document record {
    # Reserved for DocuSign.
    string applyAnchorTabs?;
    # 
    string assignTabsToRecipientId?;
    # When **true,** this document is considered an authoritative copy.
    # 
    # If this property is not set, it gets its value from the envelope's `authoritativeCopyDefault` property if it's set, or the envelope's `authoritativeCopy` property.
    # 
    # When **false,** this document is not an authoritative copy regardless of the envelope's `authoritativeCopyDefault` or `authoritativeCopy` property.
    boolean authoritativeCopy?;
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
    # 
    DocGenFormField[] docGenFormFields?;
    # The document's bytes. This field can be used to include a base64 version of the document bytes within an envelope definition instead of sending the document using a multi-part HTTP request. The maximum document size is smaller if this field is used due to the overhead of the base64 encoding.
    string documentBase64?;
    # The array of name/value custom data strings to be added to a document. Custom document field information is returned in the status, but otherwise is not used by DocuSign. The array contains the elements: 
    # 
    # * `name`: A string that can be a maximum of 50 characters. 
    # * `value`: A string that can be a maximum of 200 characters.
    # 
    # If you are using XML, the name/value pair is contained in a `nameValue` element. 
    NameValue[] documentFields?;
    # Specifies the document ID of this document. This value is used by tabs to determine which document they appear in.
    string documentId?;
    # When **true,** the document has been encrypted by the sender for use with the DocuSign Key Manager Security Appliance.
    #  
    string encryptedWithKeyManager?;
    # The file extension type of the document. Non-PDF documents are converted to PDF.
    # 
    # If the document is not a PDF, `fileExtension` is required.
    # 
    # If you try to upload a non-PDF document without a `fileExtension`, you will receive an "unable to load document" error message.  
    #  
    string fileExtension?;
    # 
    string fileFormatHint?;
    # Holds the properties that define how to generate the responsive-formatted HTML for the document.
    # See [Responsive signing](/docs/esign-rest-api/esign101/concepts/responsive/)
    # in the [eSignature concepts guide](/docs/esign-rest-api/esign101/concepts/).
    DocumentHtmlDefinition htmlDefinition?;
    # When **true,**
    # the document is included in the combined document download (`documentsCombinedUri`). 
    # The default value is **true.**
    string includeInDownload?;
    # 
    string isDocGenDocument?;
    # Matchboxes define areas in a document for document matching when you are creating envelopes.
    # They are only used when you upload and edit a template.
    MatchBox[] matchBoxes?;
    # The name of the document.
    string name?;
    # The order in which to sort the results.
    # 
    # Valid values are: 
    # 
    # 
    # * `asc`: Ascending order.
    # * `desc`: Descending order. 
    string 'order?;
    # The number of pages in the document. This property is read-only.
    string pages?;
    # The user's encrypted password hash.
    string password?;
    # 
    string pdfFormFieldOption?;
    # The file ID from the cloud storage service where
    # the document is located. This information is
    # returned using
    # [CloudStorage: listFolders](/docs/esign-rest-api/reference/cloudstorage/cloudstorage/listfolders/) or
    # [CloudStorage: list](/docs/esign-rest-api/reference/cloudstorage/cloudstorage/list/).
    string remoteUrl?;
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
    # When **true,** the account default setting for the required recipient option is used. If this property is set, `signerMustAcknowledge` cannot be set (and vice versa).
    boolean signerMustAcknowledgeUseAccountDefault?;
    # All of the tabs associated with a recipient. Each property is a list of a type of tab.
    EnvelopeRecipientTabs tabs?;
    # When **true,** the sender cannot change any attributes of the recipient. Used only when working with template recipients. 
    string templateLocked?;
    # When **true,** the sender may not remove the recipient. Used only when working with template recipients.
    string templateRequired?;
    # When **true,** PDF form field data is transformed into document tab values when the PDF form field name matches the DocuSign custom tab tabLabel. The resulting PDF form data is also returned in the PDF meta data when requesting the document PDF.
    string transformPdfFields?;
    # A URI containing the user ID.
    string uri?;
};

# An object that defines the options that are available to non-administrators in the UI.
public type AccountUISettings record {
    # 
    AdminMessage adminMessage?;
    # 
    string allowUsersToEditSharedAccess?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowUsersToEditSharedAccessMetadata?;
    # 
    AskAnAdmin askAnAdmin?;
    # 
    string clickwrapSchemaVersion?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata clickwrapSchemaVersionMetadata?;
    # 
    string enableAdminMessage?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableAdminMessageMetadata?;
    # 
    string enableEasySignCanUseMultiTemplateApply?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableEasySignCanUseMultiTemplateApplyMetadata?;
    # 
    string enableEasySignTemplateUpload?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableEasySignTemplateUploadMetadata?;
    # 
    string enableEnvelopeCopyWithData?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableEnvelopeCopyWithDataMetadata?;
    # 
    string enableLegacySendflowLink?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableLegacySendflowLinkMetadata?;
    # 
    string hasExternalLinkedAccounts?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata hasExternalLinkedAccountsMetadata?;
    # 
    string hideSendAnEnvelope?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata hideSendAnEnvelopeMetadata?;
    # When **true,** the **Templates** menu is hidden from account users who are not Admins. The default value is **false.**
    string hideUseATemplate?;
    # 
    string hideUseATemplateInPrepare?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata hideUseATemplateInPrepareMetadata?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata hideUseATemplateMetadata?;
    # 
    string orderBasedRecipientIdGeneration?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata orderBasedRecipientIdGenerationMetadata?;
    # 
    string removeEnvelopeForwarding?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata removeEnvelopeForwardingMetadata?;
    # 
    string shouldRedactAccessCode?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata shouldRedactAccessCodeMetadata?;
    # 
    string uploadNewImageToSignOrInitial?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata uploadNewImageToSignOrInitialMetadata?;
};

# Describes the recipient phone number.
public type RecipientPhoneNumber record {
    # The numeric country calling code for `number`. For example, the country calling code for the US and Canada is `1`, for the UK: `44`,
    # 
    # Do not include the `+` symbol.
    string countryCode?;
    # Metadata about a property.
    PropertyMetadata countryCodeMetadata?;
    # The telephone number. Use only the digits `0`-`9`. Remove any non-numeric characters.
    # 
    # Do not include the `countryCode`. For US, Canada, and other
    # [North American Numbering Plan](https://en.wikipedia.org/wiki/North_American_Numbering_Plan) countries, do not include a leading `1` or `0`.
    string number?;
    # Metadata about a property.
    PropertyMetadata numberMetadata?;
};

# Contains the settings for the email notifications that senders receive about the envelopes that they send.
public type SenderEmailNotifications record {
    # When **true,** the sender receives an email notification if the signer changes.
    string changedSigner?;
    # 
    string clickwrapResponsesLimitNotificationEmail?;
    # When **true,** the user receives only comments that mention their own user name.
    string commentsOnlyPrivateAndMention?;
    # When **true,** the user receives all comments.
    string commentsReceiveAll?;
    # When **true,** the sender receives an email notification if envelope delivery fails.
    string deliveryFailed?;
    # When **true,** the user receives an email notification when the envelope has been completed.
    string envelopeComplete?;
    # When **true,** the user receives an email notification if offline signing failed.
    string offlineSigningFailed?;
    # 
    string powerformResponsesLimitNotificationEmail?;
    # When **true,** the user receives an email notification when a document purge occurs.
    string purgeDocuments?;
    # When **true,** the sender receives notification that a recipient viewed the envelope.
    string recipientViewed?;
    # When **true,** the sender receives notification that the envelope was declined.
    string senderEnvelopeDeclined?;
    # When **true,** the user receives an email notification if consent is withdrawn.
    string withdrawnConsent?;
};

# 
public type EnvelopePublishTransactionErrorRollup record {
    # The maximum number of results to return.
    string count?;
    # 
    string errorType?;
};

# 
public type FoldersResponse record {
    # The last index position in the result set. 
    string endPosition?;
    # 
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

# 
public type LockInformation record {
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The number of seconds to lock the envelope for editing.  This value must be greater than `0` seconds.
    string lockDurationInSeconds?;
    # The human-readable name of the application that is locking the envelope or template. This value displays to the user in error messages when lock conflicts occur.
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

# Template document fields
public type TemplateDocumentFields record {
    # The array of name/value custom data strings to add to a document. Custom document field information is returned in the status, but otherwise is not used by DocuSign. The array contains the following elements: 
    # 
    # * `name` - A string that can be a maximum of 50 characters. 
    # * `value` - A string that can be a maximum of 200 characters.
    # 
    # **Important:** If you are using XML, the name/value pair is contained in a `nameValue` element. 
    NameValue[] documentFields?;
};

# 
public type AccountSeals record {
    # A list of electronic seals to apply to documents.
    SealIdentifier[] seals?;
};

# 
public type ViewUrl record {
    # URL to the Review ID page.
    string url?;
};

# Contains information about an in-person recipient. This is a DocuSign user,
# acting as a Signing Host,
# who is in the same physical location as the signer.
# To learn about the fields used
# for the eNotary feature,
# see the [EnvelopeRecipients resource][resource].
# 
# [resource]: /docs/esign-rest-api/reference/envelopes/enveloperecipients/#in-person-signer-recipient
public type InPersonSigner record {
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
    # When **true,** autonavigation is set for the recipient.
    string autoNavigation?;
    # Error message provided by the destination email system. This field is only provided if the email notification to the recipient fails to send. This property is read-only.
    string autoRespondedReason?;
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
    # Indicates the number of times that the recipient has been through a signing completion. 
    # 
    # If this number is greater than `0` for a signing group, only the user who previously completed may sign again.
    string completedCount?;
    # The reason why the recipient was created (for example, `sender`). This property is read-only.
    string creationReason?;
    # An optional array of strings that allows the sender to provide custom data about the recipient. This information is returned in the envelope status but otherwise not used by DocuSign. Each customField string can be a maximum of 100 characters.
    string[] customFields?;
    # The date and time the recipient declined the document. This property is read-only.
    string declinedDateTime?;
    # The reason the recipient declined the document. This property is read-only.
    string declinedReason?;
    # When **true,**
    # this is the default recipient for the envelope.
    # This option is used when creating an envelope from a template.
    string defaultRecipient?;
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
    # The signer's email address in an eNotary flow.
    # 
    # Use only when `inPersonSigningType` is `notary`.
    # For regular in-person-signer flow, use `signerEmail` instead.
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
    # Specifies the documents that are not visible to this recipient. Document Visibility must be enabled for the account and the `enforceSignerVisibility` property must be set to **true** for the envelope to use this.
    # 
    # When enforce signer visibility is enabled, documents with tabs can only be viewed by signers that have a tab on that document. Recipients that have an administrative role (Agent, Editor, or Intermediaries) or informational role (Certified Deliveries or Carbon Copies) can always see all the documents in an envelope, unless they are specifically excluded using this setting when an envelope is sent. Documents that do not have tabs are always visible to all recipients, unless they are specifically excluded using this setting when an envelope is sent.
    string[] excludedDocuments?;
    # Reserved for DocuSign.
    string faxNumber?;
    # Metadata about a property.
    PropertyMetadata faxNumberMetadata?;
    # The email address of the signing host.
    # This is the DocuSign user that is hosting the in-person signing session.
    # 
    # Required when `inPersonSigningType` is `inPersonSigner`.
    # For eNotary flow, use `email` instead.
    # 
    # Maximum Length: 100 characters.
    string hostEmail?;
    # Metadata about a property.
    PropertyMetadata hostEmailMetadata?;
    # The name of the signing host.
    # This is the DocuSign user that is hosting the in-person signing session.
    # 
    # Required when `inPersonSigningType` is `inPersonSigner`.
    # For eNotary flow, use `name` instead.
    # 
    # Maximum Length: 100 characters.
    string hostName?;
    # Metadata about a property.
    PropertyMetadata hostNameMetadata?;
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
    # Specifies whether the envelope uses the eNotary feature.
    # Valid values:
    # 
    # * `inPersonSigner`: The envelope uses the normal in-person signing flow.
    # * `notary`: The envelope uses the eNotary in-person signing flow.
    string inPersonSigningType?;
    # Metadata about a property.
    PropertyMetadata inPersonSigningTypeMetadata?;
    # Reserved for DocuSign.
    string lockedRecipientPhoneAuthEditable?;
    # Reserved for DocuSign.
    string lockedRecipientSmsEditable?;
    # The signer's full legal name in an eNotary flow.
    # 
    # Required when `inPersonSigningType` is `notary`.
    # For a regular in-person-signer flow, use `signerName` instead.
    # 
    # Maximum Length: 100 characters.
    string name?;
    # Metadata about a property.
    PropertyMetadata nameMetadata?;
    # This object is used only when `inPersonSigningType` in the `inPersonSigner` object is `notary`.
    # 
    # It describes information about the notary host.
    # The following information is required
    # when using the eNotary in-person signing flow:
    # 
    # * `name`: Specifies the notary's full legal name.
    # * `email`: Specifies the notary's email address.
    # * `recipientId`: A unique ID number for the notary signing host.
    NotaryHost notaryHost?;
    # 
    string notaryId?;
    # A note sent to the in-person signer in the signing email.
    # This note is visible only to this recipient.
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
    # The in-person signer's email address.
    # 
    # Required when `inPersonSigningType` is `inPersonSigner`.
    # For eNotary flow, use `email` instead.
    # 
    # Maximum Length: 100 characters.
    string signerEmail?;
    # Metadata about a property.
    PropertyMetadata signerEmailMetadata?;
    # The signer's first name.
    string signerFirstName?;
    # Metadata about a property.
    PropertyMetadata signerFirstNameMetadata?;
    # The signer's last name.
    string signerLastName?;
    # Metadata about a property.
    PropertyMetadata signerLastNameMetadata?;
    # Required. The full legal name of a signer for the envelope. 
    # 
    # Maximum Length: 100 characters.
    string signerName?;
    # Metadata about a property.
    PropertyMetadata signerNameMetadata?;
    # When **true** and the feature is enabled in the sender's account, the signing recipient is required to draw signatures and initials at each signature/initial tab (instead of adopting a signature/initial style or only drawing a signature/initial once).
    string signInEachLocation?;
    # Metadata about a property.
    PropertyMetadata signInEachLocationMetadata?;
    # Not applicable. You cannot use a signing group for an in-person signer.
    string signingGroupId?;
    # Metadata about a property.
    PropertyMetadata signingGroupIdMetadata?;
    # Not applicable.
    string signingGroupName?;
    # Not applicable.
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

# Envelope document fields
public type EnvelopeDocumentFields record {
    # The array of name/value custom data strings to be added to a document. Custom document field information is returned in the status, but otherwise is not used by DocuSign. The array contains the elements: 
    # 
    # * name - A string that can be a maximum of 50 characters. 
    # * value - A string that can be a maximum of 200 characters.
    # 
    # *IMPORTANT*: If you are using xml, the name/value pair is contained in a nameValue element. 
    NameValue[] documentFields?;
};

# Custom tabs
public type CustomTabs record {
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
    # The DocuSign-generated custom tab ID for the custom tab to be applied. This property can only be used when adding new tabs for a recipient. When used, the new tab inherits all of the custom tab properties.
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
    # The name of the custom tab.
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

# This request object contains the information necessary to create a recipient preview.
public type RecipientPreviewRequest record {
    # A unique identifier of the authentication event executed by the client application.
    string assertionId?;
    # A sender-generated value that indicates the date and time that the signer was authenticated.
    string authenticationInstant?;
    # Required. Choose a value that most closely matches the technique your application used to authenticate the recipient / signer. 
    # 
    # Choose a value from this list: 
    # * Biometric 
    # * Email
    # * HTTPBasicAuth
    # * Kerberos
    # * KnowledgeBasedAuth
    # * None
    # * PaperDocuments
    # * Password
    # * RSASecureID
    # * SingleSignOn_CASiteminder
    # * SingleSignOn_InfoCard
    # * SingleSignOn_MicrosoftActiveDirectory
    # * SingleSignOn_Other
    # * SingleSignOn_Passport
    # * SingleSignOn_SAML
    # * Smartcard
    # * SSLMutualAuth
    # * X509Certificate
    # 
    # This information is included in the Certificate of Completion.
    string authenticationMethod?;
    # 
    RecipientTokenClientURLs clientURLs?;
    # Only used if `pingUrl` is specified. This is the interval, in seconds, between pings on the `pingUrl`.  The default is `300` seconds. Valid values are 60-1200 seconds.
    string pingFrequency?;
    # The client URL that the DocuSign Signing experience should ping to indicate to the client that Signing is active. An HTTP GET call is executed against the client. The response from the client is ignored. The intent is for the client to reset its session timer when the request is received.
    string pingUrl?;
    # Unique for the recipient. It is used by the tab element to indicate which recipient is to sign the Document.
    string recipientId?;
    # This property is not supported.
    string returnUrl?;
    # The domain in which the user authenticated.
    string securityDomain?;
    # Specifies whether a browser should be allowed to render a page in a frame or IFrame. Setting this property ensures that your content is not embedded into unauthorized pages or frames.
    # 
    # Valid values are:
    # 
    # - `deny`: The page cannot be displayed in a frame.
    # - `same_origin`: The page can only be displayed in a frame on the same origin as the page itself.
    # - `allow_from`: The page can only be displayed in a frame on the origin specified by the `xFrameOptionsAllowFromUrl` property.
    string xFrameOptions?;
    # When the value of `xFrameOptions` is `allow_from`, this property specifies the origin on which the page is allowed to display in a frame. If the value of `xFrameOptions` is `allow_from`, you must include a value for this property.
    string xFrameOptionsAllowFromUrl?;
};

# The results of this method.
public type TemplateDocumentsResult record {
    # An array of document objects that contain information about the documents associated with the template.
    EnvelopeDocument[] templateDocuments?;
    # The unique identifier of the template. If this is not provided, DocuSign will generate a value. 
    string templateId?;
};

# For which envelope events should your webhook be called?
public type EnvelopeEvent record {
    # An envelope status for which your webhook should be called. Valid values:
    # 
    # * `Sent` 
    # * `Delivered`
    # * `Completed`
    # * `Declined`
    # * `Voided`
    string envelopeEventStatusCode?;
    # When **true,**
    # the Connect webhook messages
    # will include the envelope's PDF documents.
    # Including the PDF documents
    # greatly increases the size of the notification messages.
    # Ensure that your listener can handle
    # incoming messages that are 25MB or larger.
    string includeDocuments?;
};

# 
public type Ssn9InformationInput record {
    # Specifies the display level for the recipient. Valid values are:
    # * `ReadOnly`
    # * `Editable`
    # * `DoNotDisplay`
    string displayLevelCode?;
    # The recipient's full Social Security Number (SSN).
    string ssn9?;
};

# Describes the workflow for an envelope.
public type Workflow record {
    # The `workflowStepId` of the current step.
    # This is not an index into the `workflowSteps` array in this object.
    # See the `workflowStep` object.
    string currentWorkflowStepId?;
    # The ISO 8601 timestamp of when the envelope is scheduled to be sent, if applicable. Its value is the maximum of the `resumeDate` property on `scheduledSending` and the `resumeDate` property on the current `workflowStep`.
    # 
    # This property is read-only.
    string resumeDate?;
    # A complex element that specifies the scheduled sending settings for the envelope.
    ScheduledSending scheduledSending?;
    # The status of the workflow:
    # 
    # - `paused` if the workflow is paused
    # - `in_progress` if the workflow is in progress
    string workflowStatus?;
    # An array of workflow steps.
    WorkflowStep[] workflowSteps?;
};

# Details about envelope consumer disclosures.
public type EnvelopeConsumerDisclosures record {
    # The GUID of the account associated with the consumer disclosure.
    string accountEsignId?;
    # When **true,** indicates that the customer can withdraw their consent to the consumer disclosure when they decline to sign documents. If these recipients sign documents sent to them from your account in the future, they will be required to agree to the terms in the disclosure. The default value is **false.**
    # **Note:** Only Admin users can change this setting.
    string allowCDWithdraw?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowCDWithdrawMetadata?;
    # If the customer needs to change their email address, this is the email address to which they should the change request.
    string changeEmail?;
    # Other information about the requirements for the user to change their email address.
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
    # The simple type enumeration for the language to use when displaying the disclosure. The following languages are supported:
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

# 
public type TemplateDocumentHtmlDefinitions record {
    # Holds the properties that define how to generate the responsive-formatted HTML for the document.
    DocumentHtmlDefinitionOriginal[] htmlDefinitions?;
};

# 
public type DocumentHtmlDefinitionOriginal record {
    # Specifies the document ID number that the tab is placed on. This must refer to an existing Document's ID attribute.
    string documentId?;
    # The GUID of the document.
    string documentIdGuid?;
    # Holds the properties that define how to generate the responsive-formatted HTML for the document.
    # See [Responsive signing](/docs/esign-rest-api/esign101/concepts/responsive/)
    # in the [eSignature concepts guide](/docs/esign-rest-api/esign101/concepts/).
    DocumentHtmlDefinition htmlDefinition?;
};

# 
public type Participant record {
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
    # An optional array of strings that allows the sender to provide custom data about the recipient. This information is returned in the envelope status but otherwise not used by DocuSign. Each string can be a maximum of 100 characters.
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
    # 
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
    # The user's first name. 
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
    # The user's last name. 
    # Maximum Length: 50 characters.
    string lastName?;
    # Metadata about a property.
    PropertyMetadata lastNameMetadata?;
    # Reserved for DocuSign.
    string lockedRecipientPhoneAuthEditable?;
    # Reserved for DocuSign.
    string lockedRecipientSmsEditable?;
    # 
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
    # 
    string participateFor?;
    # 
    string participateForGuid?;
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
    # Indicates the envelope status. Valid values are:
    # 
    # * sent - The envelope is sent to the recipients. 
    # * created - The envelope is saved as a draft and can be modified and sent later.
    string status?;
    # Reserved for DocuSign.
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

# Contains information about multiple API request logs.
public type ApiRequestLogsResult record {
    # Reserved for DocuSign.
    ApiRequestLog[] apiRequestLogs?;
};

# 
public type PaymentGatewayAccountSetting record {
    # 
    string apiFields?;
    # 
    string authorizationCode?;
    # 
    string credentialStatus?;
    # 
    string merchantId?;
};

# 
public type PurchasedEnvelopesInformation record {
    # The total amount of the purchase.
    string amount?;
    # The AppName of the client application.
    string appName?;
    # Specifies the [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code of the purchase.
    string currencyCode?;
    # The Platform of the client application
    string platform?;
    # The Product ID from the AppStore.
    string productId?;
    # The quantity of envelopes to add to the account.
    string quantity?;
    # The encrypted Base64 encoded receipt data.
    string receiptData?;
    # The name of the AppStore.
    string storeName?;
    # Specifies the Transaction ID from the AppStore.
    string transactionId?;
};

# Information about a connected payment gateway account.
public type PaymentGatewayAccounts record {
    # When **true,** the sender can pass custom metadata about the payment to the payment gateway. You pass in this metadata on an EnvelopeRecipientTab, in the `customMetadata` property under `paymentDetails`. 
    # 
    # For example, this property is set to **true** for the Authorize.net gateway by default. As a result, the extra metadata that you send displays for the Authorize.net transaction in the merchant gateway portal under **Description.**
    # 
    # **Note:** This property is read-only and cannot be changed.
    boolean allowCustomMetadata?;
    # 
    PaymentGatewayAccountSetting config?;
    # A user-defined name for a connected gateway account.
    # 
    # This name is used in the Admin panel in the list of connected accounts and in Tagger in the payment gateway selector.
    # 
    # The human-readable version of `paymentGatewayAccountId`.
    string displayName?;
    # When **true,** the payment gateway account is enabled.
    string isEnabled?;
    # Reserved for DocuSign.
    string isLegacy?;
    # The UTC DateTime that the payment gateway account was last updated.
    string lastModified?;
    # Payment gateway used by the connected gateway account.
    # This is the name used by the API.
    # For a human-readable version use `paymentGatewayDisplayName`.
    # 
    # Possible values are:
    # 
    # * `Stripe`
    # * `Braintree`
    # * `AuthorizeDotNet`
    # * `CyberSource`
    # * `Zuora`
    # * `Elavon`
    string paymentGateway?;
    # A GUID that identifies the payment gateway account. For a human-readable version use `displayName`.
    string paymentGatewayAccountId?;
    # The display name of the payment gateway that the connected gateway account uses.
    # This is the human-readable version of `paymentGateway`.
    # 
    # Possible values are:
    # 
    # * Stripe
    # * Braintree
    # * Authorize.Net
    # * CyberSource
    # * Zuora
    # * Elavon
    string paymentGatewayDisplayName?;
    # 
    PayPalLegacySettings payPalLegacySettings?;
    # A list of ISO 4217 currency codes for the currencies that the payment gateway account supports.
    # 
    # Examples: 
    # 
    # - `USD`
    # - `CAD`
    # - `EUR`
    # - `HKD`
    string[] supportedCurrencies?;
    # An array of paymentMethodWithOptions objects that specify the payment methods that are available for the gateway.
    string[] supportedPaymentMethods?;
    # An array of `paymentMethodWithOptions` objects that specify the payment methods that are available for the gateway, as well as the payment options that are compatible with each payment method.
    PaymentMethodWithOptions[] supportedPaymentMethodsWithOptions?;
    # 
    string[] zeroDecimalCurrencies?;
};

# Defines a billing plan response object.
public type BillingPlanResponse record {
    # Contains information about a billing plan.
    BillingPlan billingPlan?;
    # A list of billing plans that the current billing plan can be rolled into.
    BillingPlan[] successorPlans?;
};

# This object contains information about a group.
public type Group record {
    # Reserved for DocuSign.
    string dsGroupId?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The DocuSign group ID for the group.
    # This is a read-only property.
    string groupId?;
    # The name of the group.
    string groupName?;
    # The group type.
    string groupType?;
    # The ID of the permission profile associated with the group.
    # 
    # Use [AccountPermissionProfiles: list](/docs/esign-rest-api/reference/accounts/accountpermissionprofiles/list/)
    # to get a list of permission profiles and their IDs.
    string permissionProfileId?;
    # A list of the users in the group. This property is not used by [Groups: list](/docs/esign-rest-api/reference/usergroups/groups/list/). To get a list of users see [GroupUsers: list](/docs/esign-rest-api/reference/usergroups/groupusers/list/)
    UserInfo[] users?;
    # The total number of users in the group.
    string usersCount?;
};

# Display settings for collapsible section.
public type DocumentHtmlCollapsibleDisplaySettings record {
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

# Contains address information.
public type AddressInformation record {
    # The first line of the user's address.
    # Maximum length: 100 characters.
    string address1?;
    # The second line of the user's address.
    # Maximum length: 100 characters.
    string address2?;
    # The user's city. Maximum length: 40 characters.
    string city?;
    # The user's country. Maximum length: 50 characters.
    string country?;
    # A fax number associated with the address, if one is available.
    string fax?;
    # A phone number associated with the address.
    string phone?;
    # The user's postal code. Maximum length: 20 characters.
    string postalCode?;
    # The user's state or province. Maximum length: 40 characters.
    string stateOrProvince?;
    # 
    string zipPlus4?;
};

# 
public type RecipientTokenClientURLs record {
    # 
    string onAccessCodeFailed?;
    # 
    string onCancel?;
    # 
    string onDecline?;
    # 
    string onException?;
    # 
    string onFaxPending?;
    # 
    string onIdCheckFailed?;
    # 
    string onSessionTimeout?;
    # 
    string onSigningComplete?;
    # 
    string onTTLExpired?;
    # 
    string onViewingComplete?;
};

# 
public type FolderItemsResponse record {
    # The last index position in the result set. 
    string endPosition?;
    # 
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

# The document fields available for document generation.
# 
# This object is used in reponses (GET) and requests (PUT).
# When used with [DocumentGeneration: updateEnvelopeDocGenFormFields](/docs/esign-rest-api/reference/envelopes/documentgeneration/updateenvelopedocgenformfields/)
# (PUT) the `name` and `value` properties are required,
# and any other values are ignored.
public type DocGenFormField record {
    # A sender-defined description of the line item.
    string description?;
    # Reserved for DocuSign.
    string label?;
    # The name of the form field. The name must be unique to the document.
    # 
    # Required for PUT requests.
    string name?;
    # An array of option strings supported by this setting.
    DocGenFormFieldOption[] options?;
    # 
    string predefinedValidation?;
    # When **true,** the field is required. This value comes from the the document.
    string required?;
    # Always `TextBox`.  You do not need to provide this value.
    string 'type?;
    # 
    DocGenFormFieldValidation validation?;
    # The value of the form field.
    # 
    # Required for PUT requests.
    string value?;
};

# 
public type TemplateNotificationRequest record {
    # A complex element that specifies the expiration settings for the envelope. When an envelope expires, it is voided and no longer available for signing. **Note:** there is a short delay between when the envelope expires and when it is voided.
    Expirations expirations?;
    # The user's encrypted password hash.
    string password?;
    # A complex element that specifies reminder settings for the envelope.
    Reminders reminders?;
    # When **true,** the account default notification settings are used for the envelope, overriding the reminders and expirations settings. When **false,** the reminders and expirations settings specified in this request are used. The default value is **false.**
    string useAccountDefaults?;
};

# 
public type BulkProcessingListSummary record {
    # 
    string bulkProcessListId?;
    # 
    string createdByUser?;
    # The creation date of the account in UTC timedate format.
    string createdDate?;
    # 
    string name?;
};

# This object describes errors that occur. It is only valid for responses and ignored in requests.
public type ErrorDetails record {
    # The code associated with the error condition.
    string errorCode?;
    # A brief message describing the error condition.
    string message?;
};

# 
public type Envelope record {
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
    # This is the same as the email body. If specified it is included in email body for all envelope recipients.
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
    # The date and time that the envelope is set to expire. This value is determined by the `InitialSentDateTime` of the envelope and the `expireAfter` property of the `notification` object. (Note that the `expireAfter` property of the envelope itself is not used.)
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
    # When **true,** indicates that the data collected through form fields on a document has changed.
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
    # The data and time that the status changed.
    string statusChangedDateTime?;
    # The DateTime that the envelope changed status (i.e. was created or sent.)
    string statusDateTime?;
    # The URI for retrieving the templates.
    string templatesUri?;
    #  Used to identify an envelope.
    # 
    #  The ID is a sender-generated value and is valid in the DocuSign system for 7 days.
    #  It is recommended that a transaction ID is used for offline
    #  signing to ensure that an envelope is not sent multiple times.
    #  The `transactionId` property can be used determine an envelope's
    #  status (i.e. was it created or not) in cases where the internet c
    #  onnection was lost before the envelope status was returned.
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

# This object contains details about a Connect failure result.
public type ConnectFailureResult record {
    # Reserved for DocuSign.
    string configId?;
    # Reserved for DocuSign.
    string configUrl?;
    # The envelope ID of the envelope status that failed to post.
    string envelopeId?;
    # The connection status.
    string status?;
    # A human-readable message describing the connection status.
    string statusMessage?;
};

# A list of `documentVisibility` objects that specify whether documents are visible to recipients.
public type DocumentVisibilityList record {
    # An array of `documentVisibility` objects that specifies which documents are visible to which recipients.
    DocumentVisibility[] documentVisibility?;
};

# Group information
public type Groups record {
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

# The EnvelopeAttachments resource provides methods that allow you to
# associate files with an envelope.
public type EnvelopeAttachments record {
    # Valid values are `sender` and `senderAndAllRecipients`.
    string accessControl?;
    # The unique identifier for the attachment.
    string attachmentId?;
    # Specifies the type of the attachment for the recipient. Possible values are:
    # 
    # - `.htm`
    # - `.xml`
    string attachmentType?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # A label for the attachment. Potential values include: 
    # 
    # - `guidedForm`: [Guided forms](https://www.docusign.com/products/guided-forms) provide a step-by-step, mobile-ready experience to help signers easily complete long or complex forms.
    # - `eventNotifications`: A list of envelope-level event statuses that trigger Connect to send updates to the endpoint specified in the `url` property. 
    string label?;
    # The name of the attachment.
    string name?;
};

# 
public type CustomSettingsInformation record {
    # The name/value pair information for the user custom setting.
    NameValue[] customSettings?;
};

# Data that recipients have entered in PowerForm fields.
public type PowerFormData record {
    # The envelope ID of the envelope status that failed to post.
    string envelopeId?;
    # An array of powerform recipients.
    PowerFormFormDataRecipient[] recipients?;
};

# 
public type LoginInformation record {
    # Contains a token that can be used for authentication in API calls instead of using the user name and password. Only returned if the `api_password=true` query string is added to the URL.
    string apiPassword?;
    # The list of accounts that authenticating user is a member of.
    LoginAccount[] loginAccounts?;
};

# 
public type ExternalDocServiceErrorDetails record {
    # Reserved for DocuSign.
    string authenticationUrl?;
    # A code associated with the error condition.
    string errorCode?;
    # 
    string message?;
};

# This resource provides information on the Standards Based Signature providers that have been provisioned for an account.
public type AccountSignatureProviders record {
    # Names of electronic or digital signature providers that can be used.
    AccountSignatureProvider[] signatureProviders?;
};

# Contains information about an intermediary recipient. An intermediary is a recipient who can, but is not required to, add name and email information for recipients at the same or subsequent level in the routing order, unless subsequent agents, editors or intermediaries are added.
public type Intermediary record {
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
    # - `autoresponded`: The recipientÃ¢ÂÂs email system auto-responded to the email from DocuSign. This status is used in the web console to inform senders about the bounced-back email. This recipient status is only used if **Send-on-behalf-of** is turned off for the account.
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

# All of the tabs associated with a recipient. Each property is a list of a type of tab.
public type EnvelopeRecipientTabs record {
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
public type ConnectUserObject record {
    # The type of custom Connect configuration being accessed.
    string configurationtype?;
    # The ID of the custom Connect configuration being accessed.
    string connectId?;
    # Boolean value that indicates whether the custom Connect configuration is enabled or not.
    string enabled?;
    # 
    string hasAccess?;
    # 
    string[] senderSearchableItems?;
};

# A tab that displays the recipient's first name. This tab
# takes the recipient's name as entered in the recipient
# information, splits it into sections based on spaces and
# uses the first section as the first name.
public type FirstName record {
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

# Contains shared access information.
public type AccountSharedAccess record {
    # The account ID associated with the envelope.
    string accountId?;
    # The last index position in the result set. 
    string endPosition?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The URI for the next chunk of records based on the search request. It is `null` if this is the last set of results for the search. 
    string nextUri?;
    # The URI for the prior chunk of records based on the search request. It is `null` if this is the first set of results for the search. 
    string previousUri?;
    # The number of results in this response. Because you can filter which entries are included in the response, this value is always less than or equal to the `totalSetSize`.
    string resultSetSize?;
    # A list of shared access information of envelope and templates for the users specified in the request.
    MemberSharedItems[] sharedAccess?;
    # The starting index position of the current result set.
    string startPosition?;
    # The total number of items in the result set. This value is always greater than or equal to the value of `resultSetSize`.
    string totalSetSize?;
};

# Creating, updating, and deleting notary jurisdiction objects.
public type NotaryJurisdiction record {
    # 
    string commissionExpiration?;
    # 
    string commissionId?;
    # 
    string county?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # Describes the jurisdiction of a notary.
    # This is read-only object.
    Jurisdiction jurisdiction?;
    # 
    string registeredName?;
    # 
    string sealType?;
};

# API service information
public type Services record {
    # Reserved for DocuSign.
    string buildBranch?;
    # Reserved for DocuSign.
    string buildBranchDeployedDateTime?;
    # Reserved for DocuSign.
    string buildSHA?;
    # Reserved for DocuSign.
    string buildVersion?;
    # 
    string[] linkedSites?;
    # 
    ServiceVersion[] serviceVersions?;
};

# 
public type JurisdictionSummary record {
    # 
    string authorizedForIPen?;
    # 
    string authorizedForRon?;
    # The ID of the jurisdiction.
    # The following jurisdictions
    # are supported:
    # 
    # -  `5 - California`
    # -  `6 - Colorado`
    # -  `9 - Florida`
    # -  `10 - Georgia`
    # -  `12 - Idaho`
    # -  `13 - Illinois`
    # -  `14 - Indiana`
    # -  `15 - Iowa`
    # -  `17 - Kentucky`
    # -  `23 - Minnesota`
    # -  `25 - Missouri`
    # -  `30 - New Jersey`
    # -  `32 - New York`
    # -  `33 - North Carolina`
    # -  `35 - Ohio`
    # -  `37 - Oregon`
    # -  `38 - Pennsylvania`
    # -  `40 - South Carolina`
    # -  `43 - Texas`
    # -  `44 - Utah`
    # -  `47 - Washington`
    # -  `48 - West Virginia`
    # -  `49 - Wisconsin`
    # -  `62 - Florida Commissioner of Deeds`
    string jurisdictionId?;
    # 
    string jurisdictionName?;
};

# 
public type AdminMessage record {
    # 
    string baseMessage?;
    # 
    string moreInformation?;
};

# This request object contains information about a specific brand.
public type BrandRequest record {
    # The ID of the brand used in API calls
    string brandId?;
};

# Information about the resource files that the brand uses for the email, signing, sending, and captive (embedded) signing experiences.
public type BrandResources record {
    # 
    UserInfo createdByUserInfo?;
    # The date and time that the brand resource was created.
    string createdDate?;
    # Deprecated.
    string[] dataNotSavedNotInMaster?;
    # 
    UserInfo modifiedByUserInfo?;
    # The date on which this user record was last modified.
    string modifiedDate?;
    # This property is returned in the response to the [AccountBrands::listResources][listResources] request. It contains a list of any email templates that have been modified to differ from the master resource files.
    # 
    # [listResources]: /docs/esign-rest-api/reference/accounts/accountbrands/listresources/
    string[] modifiedTemplates?;
    # The type of brand resource file. A brand uses a different resource file to control each of the following experiences:
    # 
    # - Sending (`sending`)
    # - Signing (`signing`)
    # - Email messages (`email`)
    # - Captive (embedded) signing (`signing_captive`)
    # 
    # You can modify the default email messages and formats in these files and upload them to your brand to customize the user experience.
    string resourcesContentType?;
    # The URI for the brand resource file.
    string resourcesContentUri?;
};

# The `Contacts` resource enables you to manage the contact in an account's address book.
public type Contacts record {
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
    # The email address or addresses associated with the contact.
    string[] emails?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # When **true,** the current user is the owner of the contact.
    boolean isOwner?;
    # The name of the contact.
    string name?;
    # 
    NotaryContactDetails notaryContactDetails?;
    # The name of the contact's organization.
    string organization?;
    # 
    string roomContactType?;
    # When **true,** the contact is shared. For more information, see [Shared Contacts](https://support.docusign.com/s/document-item?bundleId=jux1643235969954&topicId=twh1578456324503.html).
    # 
    # **Note:** The phone numbers associated with shared contacts do not display to users other than the user who added the contact. Additionally, in the following scenarios, the phone number of a shared contact does not populate automatically for anyone other than the user who added the contact:
    # 
    # - Sending an envelope by using SMS
    # - Using phone authentication
    # 
    # You must ask the user who added the contact for the phone number and then manually enter it into the authentication box.
    string shared?;
    # If the contact belongs to a signing group, this property contains the `signingGroupId`.
    string signingGroup?;
    # The name of the signing group that the contact belongs to.
    string signingGroupName?;
};

# A Phone Number tab enables a recipient to enter a phone number.
# 
# **Note:** This tab can only be assigned to a remote notary recipient using [DocuSign Notary][notary].
# 
# [notary]: /docs/notary-api/
public type PhoneNumber record {
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

# This object contains the results of a bulk send test.
public type BulkSendTestResponse record {
    # When **true,** the envelope or template is compatible with the bulk send list and can be sent by using the [BulkSend: createBulkSendRequest][BulkSendRequest] method.
    # 
    # **Note:** This property is only returned in responses and ignored in requests.
    # 
    # [BulkSendRequest]:  /docs/esign-rest-api/reference/bulkenvelopes/bulksend/createbulksendrequest/
    boolean canBeSent?;
    # Human-readable details about any validation errors that occurred.
    string[] validationErrorDetails?;
    # A list of validation errors that were encountered during the bulk send test.
    # 
    # **Note:** This information is intended to be parsed by machine.
    string[] validationErrors?;
};

# Information used to provide a preview of a billing plan.
public type BillingPlanPreview record {
    # Specifies the [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code for the account.
    string currencyCode?;
    # Contains information about a billing invoice.
    BillingInvoice invoice?;
    # When **true,** the billing plan is prorated.
    string isProrated?;
    # 
    string subtotalAmount?;
    # 
    string taxAmount?;
    # 
    string totalAmount?;
};

# A tab that allows the recipient to attach supporting
# documents to an envelope.
public type SignerAttachment record {
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
    # The height of the tab in pixels.
    # Must be an integer.
    string height?;
    # Metadata about a property.
    PropertyMetadata heightMetadata?;
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
    # Sets the size of the tab. This field accepts values from `0.5` to `1.0`, where `1.0` represents full size and `0.5` is 50% of full size.
    string scaleValue?;
    # Metadata about a property.
    PropertyMetadata scaleValueMetadata?;
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
    # by (+0, -24)
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
    # by (+0, -24)
    string yPosition?;
    # Metadata about a property.
    PropertyMetadata yPositionMetadata?;
};

# Information about items shared among groups.
public type MemberGroupSharedItem record {
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # This object contains information about a group.
    Group group?;
    # How the item is shared. One of:
    # 
    # 
    # - `not_shared`: The item is not shared.
    # 
    # - `shared_to`: The item is shared.
    string shared?;
};

# Contains details about a PowerForm.
public type PowerForm record {
    # The ID of the user who created the PowerForm.
    string createdBy?;
    # The UTC DateTime when the item was created.
    string createdDateTime?;
    # The body of the email message sent to the recipients. 
    # 
    # Maximum length: 10000 characters.
    string emailBody?;
    # The subject line of the email message that is sent to all recipients.
    # 
    # For information about adding merge field information to the email subject, see [Template Email Subject Merge Fields](/docs/esign-rest-api/reference/templates/templates/create/#template-email-subject-merge-fields).
    # 
    # **Note:** The subject line is limited to 100 characters, including any merged fields.It is not truncated. It is an error if the text is longer than 100 characters.
    string emailSubject?;
    # 
    Envelope[] envelopes?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The instructions that display on the landing page for the first recipient. These instructions are important if the recipient accesses the PowerForm by a method other than email. If instructions are entered, they display as an introduction after the recipient accesses the PowerForm.  Limit: 2000 characters.
    string instructions?;
    # When **true,** indicates that the PowerForm is active and can be sent to recipients. This is the default value.
    # 
    # When **false,** the PowerForm cannot be emailed or accessed by a recipient, even if they arrive at the PowerForm URL. 
    # 
    # If a recipient attempts to sign an inactive PowerForm, an error message informs the recipient that the document is not active and suggests that they contact the sender.
    string isActive?;
    # The UTC DateTime when the PowerForm was last used.
    string lastUsed?;
    # The length of time before the same recipient can sign the same PowerForm. This property is used in combination with the `limitUseIntervalUnits` property.
    string limitUseInterval?;
    # When **true,** the `limitUseInterval` is enabled.
    string limitUseIntervalEnabled?;
    # The units associated with the `limitUseInterval`. Valid values are:
    # 
    # - `minutes`
    # - `hours`
    # - `days`
    # - `weeks`
    # - `months`
    # 
    # For example, to limit a recipient to signing once per year, set the `limitUseInterval` to 365 and the `limitUseIntervalUnits` to `days`.
    string limitUseIntervalUnits?;
    # When **true,** you can set a maximum number of uses for the PowerForm.
    string maxUseEnabled?;
    # The name of the PowerForm.
    string name?;
    # The ID of the PowerForm.
    string powerFormId?;
    # The URL for the PowerForm.
    string powerFormUrl?;
    # An array of recipient objects that provides details about the recipients of the envelope.
    PowerFormRecipient[] recipients?;
    # The sender's name.
    string senderName?;
    # The ID of the sender.
    string senderUserId?;
    # The signing mode to use. Valid values are:
    #  
    # - `email`: Verifies the recipient's identity using email authentication before the recipient can sign a document. The recipient enters their email address and then clicks **Begin Signing** to begin the signing process. The system then sends an email message with a validation code for the PowerForm to the recipient. If the recipient does not provide a valid email address, they cannot open and sign the document.  
    # - `direct`: Does not require any verification. After a recipient enters their email address and clicks **Begin Signing,** a new browser tab opens and the recipient can immediately begin the signing process. Because the recipient's identity is not verified by using email authentication, we strongly recommend that you only use the `direct` signing mode when the PowerForm is accessible behind a secure portal where the recipient's identity is already authenticated, or where another form of authentication is specified for the recipient in the DocuSign template (for example, an access code, phone authentication, or ID check).  
    # 
    # **Note:** In the account settings, `enablePowerFormDirect` must be **true** to use `direct` as the `signingMode`.
    string signingMode?;
    # The ID of the template used to create the PowerForm.
    string templateId?;
    # The name of the template used to create the PowerForm.
    string templateName?;
    # The number of times the PowerForm has been used. 
    string timesUsed?;
    # The URI for the PowerForm.
    string uri?;
    # The number of times the PowerForm can still be used.
    string usesRemaining?;
};

# 
public type BulkEnvelope record {
    # The row of the recipient in the CSV file used to create the bulk recipient list.
    string bulkRecipientRow?;
    # Indicates the status of the bulk send operation. Returned values can be:
    # - `queued`
    # - `processing`
    # - `sent`
    # - `failed`
    string bulkStatus?;
    # The email address of the recipient assigned to this envelope transaction.
    string email?;
    # GUID of the bulk envelope.
    string envelopeId?;
    # The URI for retrieving the envelope or envelopes.
    string envelopeUri?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The name of the recipient assigned to this envelope transaction.
    string name?;
    # The date and time on which the bulk envelope was created.
    string submittedDateTime?;
    # Identifier for the envelope transaction. The ID is a sender-generated value and is valid in the DocuSign system for 7 days. DocuSign recommends that you use a transaction ID for offline signing to ensure that an envelope is not sent multiple times. You can use the transaction ID to determine an envelope's status (queued, processing, sent, or failed) in cases where the Internet connection is lost before envelope status is returned.
    string transactionId?;
};

# 
public type ConnectDebugLog record {
    # The name of the Connect configuration.
    string connectConfig?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The UTC date and time of the event.
    string eventDateTime?;
    # A description of the event.
    string eventDescription?;
    # Log output.
    string payload?;
};

# A complex object describing a Connect OAuth configuration.
public type ConnectOAuthConfig record {
    # The token URL for your authorization server or OAuth service.
    # 
    # This property is required.
    string authorizationServerUrl?;
    # The client ID assigned to your app by your authorization server or OAuth service.
    # 
    # This property is required.
    string clientId?;
    # The secret value provided by your authorization server.
    # 
    # This property is required.
    string clientSecret?;
    # 
    string customParameters?;
    # The scopes that your app will request from the authorization server.
    # 
    # This property is optional.
    # 
    # **Note:** If you are using Azure, this value is the application ID URI of the secified resource affixed with the `.default`. For example: `api://{{clientId}}/.default`
    string scope?;
};

# 
public type PowerFormFormDataRecipient record {
    # 
    string email?;
    # 
    NameValue[] formData?;
    # The name of the recipient.
    string name?;
    # Unique for the recipient. It is used by the tab element to indicate which recipient is to sign the Document.
    string recipientId?;
};

# Template management
public type Templates record {
    # Reserved for DocuSign.
    string accessControlListBase64?;
    # When **true,** indicates that comments are allowed on the envelope.
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
    # By default, templates that have been used within
    # the last 60 days are included in auto-matching.
    # 
    # By explicitly setting `autoMatch`,
    # you can permanently include or exclude the template
    # in auto matching.
    # 
    # When **true** the template is included in auto-matching
    # regardless of when it was last used.
    # 
    # When **false** the template is never included in auto-matching.
    string autoMatch?;
    # When **true,** the template has been explicitly included in or excluded from auto-matching. The default is false.
    # This is a read-only property.
    string autoMatchSpecifiedByUser?;
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
    # The UTC DateTime when the workspace user authorization was created.
    string created?;
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
    # A sender-defined description of the line item.
    string description?;
    # When **true,** responsive documents are disabled for the envelope.
    string disableResponsiveDocument?;
    # The document's bytes. This field can be used to include a base64 version of the document bytes within an envelope definition instead of sending the document using a multi-part HTTP request. The maximum document size is smaller if this field is used due to the overhead of the base64 encoding.
    string documentBase64?;
    # A complex element that contains details about the documents associated with the envelope.
    Document[] documents?;
    # The URI for retrieving all of the documents associated with the envelope as a single PDF file.
    string documentsCombinedUri?;
    # The URI for retrieving all of the documents associated with the envelope as separate files.
    string documentsUri?;
    # This is the same as the email body. If the sender enters an email blurb, it is included in the email body for all envelope recipients.
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
    # 
    string favoritedByMe?;
    # The unique identifier for the folder that the template belongs to.
    string folderId?;
    # An array of folder IDs that the template is in.
    string[] folderIds?;
    # The name of the folder the template belongs to.
    string folderName?;
    # A list of folder objects.
    Folder[] folders?;
    # When **true,** indicates that users have added comments to the envelope.
    string hasComments?;
    # Specifies if the `EnvelopeFormData` associated with any forms in the template has changed.
    string hasFormDataChanged?;
    # When **true,** indicates that the template includes a .wav file.
    string hasWavFile?;
    # Reserved for DocuSign.
    string holder?;
    # The date and time the envelope that used the template was initially sent.
    string initialSentDateTime?;
    # When **true,** indicates compliance with United States Food and Drug Administration (FDA) regulations on electronic records and electronic signatures (ERES).
    string is21CFRPart11?;
    # 
    string isAceGenTemplate?;
    # 
    string isDocGenTemplate?;
    # When **true,** indicates that the envelope is a dynamic envelope.
    string isDynamicEnvelope?;
    # When **true,** indicates that the envelope is a signature-provided envelope.
    string isSignatureProviderEnvelope?;
    # The UTC date and time that the comment was last updated.
    # 
    # **Note:** This can only be done by the creator.
    string lastModified?;
    # 
    UserInfo lastModifiedBy?;
    # The date and time the template was last modified.
    string lastModifiedDateTime?;
    # The date and time the template was last used.
    string lastUsed?;
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
    # The name of the template.
    string name?;
    # The user's new password.
    string newPassword?;
    # A complex element that specifies the notification settings for the envelope.
    Notification notification?;
    # The URI for retrieving notifications.
    string notificationUri?;
    # 
    UserInfo owner?;
    # An integer value specifying the number of document pages in the template. 
    string pageCount?;
    # The password for editing the template.
    string password?;
    # When **true,** a password is required to edit the template.
    string passwordProtected?;
    # Contains details about a PowerForm.
    PowerForm powerForm?;
    # An array of PowerForm objects that contain information about any PowerForms that are included in the template.
    PowerForm[] powerForms?;
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
    # When **true,** indicates the template is shared with the **Everyone** group,
    # and is shared with all users on the account.
    # 
    # When **false,** the template is shared only with the groups you specify.
    string shared?;
    # When **true,** recipients can sign on a mobile device.
    # 
    # **Note:** Only Admin users can change this setting.
    string signerCanSignOnMobile?;
    # Specifies the physical location where the signing takes place. It can have two enumeration values; `inPerson` and `online`. The default value is `online`.
    string signingLocation?;
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
    # The data and time that the status changed.
    string statusChangedDateTime?;
    # The DateTime that the envelope changed status (i.e. was created or sent.)
    string statusDateTime?;
    # The unique identifier of the template. If this is not provided, DocuSign will generate a value. 
    string templateId?;
    # The URI for retrieving the templates.
    string templatesUri?;
    #  Used to identify an envelope. The ID is a sender-generated value and is valid in the DocuSign system for 7 days. It is recommended that a transaction ID is used for offline signing to ensure that an envelope is not sent multiple times. The `transactionId` property can be used determine an envelope's status (i.e. was it created or not) in cases where the internet connection was lost before the envelope status was returned.
    string transactionId?;
    # Contains a URI that you can use to retreve the template.
    string uri?;
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

# Description of a page of a document.
public type Page record {
    # The number of dots per inch used for the page image.
    string dpi?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The height of the page in pixels.
    # Must be an integer.
    string height?;
    # The number of image bytes.
    string imageBytes?;
    # The MIME type.
    string mimeType?;
    # The ID of the page.
    string pageId?;
    # The sequence of the page in the document, or page number.
    string sequence?;
    # The width of the page in pixels.
    # Must be an integer.
    string width?;
};

# A line item describes details
# about an individual line item
# in a payment request.
public type PaymentLineItem record {
    # This is a the `tabLabel`
    # that specifies the amount paid
    # for the line items.
    string amountReference?;
    # A sender-defined description of the line item.
    string description?;
    # This is the sender-defined
    # SKU, inventory number, or other item code
    # for the line item.
    string itemCode?;
    # This is a sender-defined
    # product name, service name,
    # or other designation for the line item.
    string name?;
};

# This object contains a list of available workspaces.
public type WorkspaceList record {
    # The last index position in the result set. 
    string endPosition?;
    # The number of results in this response. Because you can filter which entries are included in the response, this value is always less than or equal to the `totalSetSize`.
    string resultSetSize?;
    # The starting index position of the current result set.
    string startPosition?;
    # The total number of items in the result set. This value is always greater than or equal to the value of `resultSetSize`.
    string totalSetSize?;
    # A list of workspaces.
    Workspace[] workspaces?;
};

# 
public type BccEmailArchiveHistoryList record {
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

# If your account includes multiple signing brands, you can use the groups functionality to assign different brands to different groups. This resource enables you to manage group brands.
public type GroupBrands record {
    # The brand that envelope recipients see when a brand is not explicitly set.
    string recipientBrandIdDefault?;
    # The brand that envelope senders see when a brand is not explicitly set.
    string senderBrandIdDefault?;
    # A list of brands.
    Brand[] brandOptions?;
};

# Contains information about a Connect log entry.
public type ConnectLog record {
    # The account ID associated with the envelope.
    string accountId?;
    # The web address of the listener or retrieving service endpoint for Connect.
    string configUrl?;
    # A complex element containing information about the Connect configuration, error details, date/time, description and payload.
    # This information is included in the response only when the `additional_info` query is set to **true.**
    # This additional information is only available when retrieving general logs with [ConnectEvents:get](/docs/esign-rest-api/reference/connect/connectevents/get/), but not when retrieving failure logs with [ConnectEvents:listFailures](/docs/esign-rest-api/reference/connect/connectevents/listfailures/).
    ConnectDebugLog[] connectDebugLog?;
    # The ID of the Connect configuration that failed. If an account has multiple Connect configurations, this value is used to look up the Connect configuration for the failed post.
    string connectId?;
    # The UTC DateTime when the Connect post was created.
    string created?;
    # The email address of the envelope sender.
    string email?;
    # The ID of the envelope that failed to post.
    string envelopeId?;
    # The error that caused the Connect post to fail.
    string 'error?;
    # The failure log ID for the failure.
    string failureId?;
    # The URI for the Connect post failure.
    string failureUri?;
    # The UTC DateTime of the last attempt to post.
    string lastTry?;
    # The Connect log ID for the entry.
    string logId?;
    # The URI for the Connect log entry.
    string logUri?;
    # The number of times the Connect post has been retried.
    string retryCount?;
    # A URI that you can use to retry to publish the Connect post.
    string retryUri?;
    # The envelope status for the Connect post. Possible values are:
    # - `Any`
    # - `Voided`
    # - `Created`
    # - `Deleted`
    # - `Sent`
    # - `Delivered`
    # - `Signed`
    # - `Completed`
    # - `Declined`
    # - `TimedOut`
    # - `Template`
    # - `Processing`
    # 
    # For details about these statuses, see [Envelope Status Code Descriptions](/docs/esign-rest-api/esign101/rules-and-limits/responses/).
    string status?;
    # The subject of the envelope.
    string subject?;
    # The name of the sender of the envelope.
    string userName?;
};

# 
public type SignatureUserDef record {
    # Boolean that specifies whether the signature is the default signature for the user.
    string isDefault?;
    # Indicates whether the property is editable. Valid values are:
    # 
    # - `editable`
    # - `read_only`
    string rights?;
    # The ID of the user to access.
    # 
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    string userId?;
};

# 
public type TemplateMatch record {
    # 
    string documentEndPage?;
    # 
    string documentStartPage?;
    # 
    string matchPercentage?;
};

# Reserved for DocuSign.
public type TabsBlob record {
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
public type UserSignaturesInformation record {
    # An array of  `userSignature` objects.
    UserSignature[] userSignatures?;
};

# 
public type DowngradePlanUpdateResponse record {
    # The type of payment method used for the account. Valid values are:
    # 
    # - `credit_card`
    # - 
    string accountPaymentMethod?;
    # 
    string discountApplied?;
    # 
    string downgradeEffectiveDate?;
    # 
    string downgradePaymentCycle?;
    # 
    string downgradePlanId?;
    # 
    string downgradePlanName?;
    # 
    string downgradeRequestStatus?;
    # 
    string message?;
    # The Product ID from the AppStore.
    string productId?;
    # 
    string promoCode?;
    # 
    string saleDiscount?;
    # Reserved for DocuSign.
    string saleDiscountPeriods?;
    # 
    string saleDiscountType?;
};

# This object defines account permissions for users who are associated with the account permission profile. 
public type AccountRoleSettings record {
    # When **true,** users have full administrative access to the account.
    string allowAccountManagement?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowAccountManagementMetadata?;
    # When **true,** users can manage documents by using the API.
    string allowApiAccess?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowApiAccessMetadata?;
    # When **true,** users can access the account by using the eSignature API.
    string allowApiAccessToAccount?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowApiAccessToAccountMetadata?;
    # When **true,** users can send envelopes on behalf of others.
    string allowApiSendingOnBehalfOfOthers?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowApiSendingOnBehalfOfOthersMetadata?;
    # When **true,** users may specify sequential signing recipients when they send documents by using the API.
    string allowApiSequentialSigning?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowApiSequentialSigningMetadata?;
    #  When **true,** auto-tagging is enabled for the account.
    string allowAutoTagging?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowAutoTaggingMetadata?;
    # When **true,** bulk sending is enabled for users.
    string allowBulkSending?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowBulkSendingMetadata?;
    # When **true,** the DocuSign Desktop Client is enabled for users.
    string allowDocuSignDesktopClient?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowDocuSignDesktopClientMetadata?;
    # Specifies the level of access that users have to the account's address book. Valid values are:
    # 
    # - `personal`
    # - `useShared`
    # - `usePersonalAndShared`
    # - `personalAndShared`
    string allowedAddressBookAccess?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowedAddressBookAccessMetadata?;
    # 
    string allowedClickwrapsAccess?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowedClickwrapsAccessMetadata?;
    # 
    string allowedOrchestrationAccess?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowedOrchestrationAccessMetadata?;
    # Specifies the level of access that users have to account templates. Valid values are: 
    # 
    # - `none` 
    # - `use`
    # - `create`
    # - `share`
    string allowedTemplateAccess?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowedTemplateAccessMetadata?;
    # When **true,** users can be recipients of envelopes transferred to them by administrators of other accounts. 
    string allowedToBeEnvelopeTransferRecipient?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowedToBeEnvelopeTransferRecipientMetadata?;
    # When **true,** users can send envelopes.
    string allowEnvelopeSending?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowEnvelopeSendingMetadata?;
    # When **true,** users can add electronic seal ([eSeal](https://support.docusign.com/s/document-item?bundleId=xcm1643837555908&topicId=isl1578456577247.html)) recipients.
    string allowESealRecipients?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowESealRecipientsMetadata?;
    # When **true,** PowerForm Administrators can access all of the PowerForm envelopes associated with the account.
    string allowPowerFormsAdminToAccessAllPowerFormEnvelopes?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowPowerFormsAdminToAccessAllPowerFormEnvelopesMetadata?;
    # When **true,** senders can set the language of the email that is sent to recipients.
    string allowSendersToSetRecipientEmailLanguage?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowSendersToSetRecipientEmailLanguageMetadata?;
    # When **true,** users can add requests for attachments from signers.
    string allowSignerAttachments?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowSignerAttachmentsMetadata?;
    # When **true,** senders can include supplemental documents.
    string allowSupplementalDocuments?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowSupplementalDocumentsMetadata?;
    # When **true,** the tagger palette is visible during the sending and correct flows and users can add tabs to documents.
    string allowTaggingInSendAndCorrect?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowTaggingInSendAndCorrectMetadata?;
    # 
    string allowTransactions?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowTransactionsMetadata?;
    # Reserved for DocuSign.
    string allowVaulting?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowVaultingMetadata?;
    # When **true,** users can override the default account setting that controls whether recipients can sign documents on paper. The option to overrride this setting occurs during the sending process on a per-envelope basis.
    string allowWetSigningOverride?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowWetSigningOverrideMetadata?;
    # 
    string canCreateTransaction?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canCreateTransactionMetadata?;
    # Reserved for DocuSign.
    string canCreateWorkspaces?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canCreateWorkspacesMetadata?;
    # 
    string canDeleteDocumentsInTransaction?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canDeleteDocumentsInTransactionMetadata?;
    # 
    string canDeleteTransaction?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canDeleteTransactionMetadata?;
    # 
    string canSendEnvelopesViaSMS?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canSendEnvelopesViaSMSMetadata?;
    # When **true,** users cannot upload documents.
    string disableDocumentUpload?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata disableDocumentUploadMetadata?;
    # When **true,** users can access the **Other Actions** menu.
    string disableOtherActions?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata disableOtherActionsMetadata?;
    # When **true,** API request logging is enabled.
    # 
    # **Note:** Logging limits apply.
    string enableApiRequestLogging?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableApiRequestLoggingMetadata?;
    # 
    string enableKeyTermsSuggestionsByDocumentType?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableKeyTermsSuggestionsByDocumentTypeMetadata?;
    # When **true,** senders are notified when recipients view the documents that they send.
    string enableRecipientViewingNotifications?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableRecipientViewingNotificationsMetadata?;
    # When **true,** the sequential signing user interface is enabled.
    string enableSequentialSigningInterface?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableSequentialSigningInterfaceMetadata?;
    # Reserved for DocuSign.
    string enableTransactionPointIntegration?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableTransactionPointIntegrationMetadata?;
    # The PowerForms rights associated with the account permission profile. Valid values are:
    # 
    # - `none` 
    # - `user` 
    # - `admin`
    string powerFormRole?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata powerFormRoleMetadata?;
    # When **true,** senders receive emails about completed, self-signed documents that contain links to the completed documents instead of PDF attachments.
    string receiveCompletedSelfSignedDocumentsAsEmailLinks?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata receiveCompletedSelfSignedDocumentsAsEmailLinksMetadata?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata signingUiVersionMetadata?;
    # When **true,** senders can require recipients to accept supplemental documents.
    string supplementalDocumentsMustAccept?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata supplementalDocumentsMustAcceptMetadata?;
    # When **true,** senders can require recipients to read supplemental documents.
    string supplementalDocumentsMustRead?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata supplementalDocumentsMustReadMetadata?;
    # When **true,** users can require recipients to view supplemental documents.
    string supplementalDocumentsMustView?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata supplementalDocumentsMustViewMetadata?;
    # Reserved for DocuSign.
    string useNewDocuSignExperienceInterface?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata useNewDocuSignExperienceInterfaceMetadata?;
    # Reserved for DocuSign.
    string useNewSendingInterface?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata useNewSendingInterfaceMetadata?;
    # Reserved for DocuSign.
    string vaultingMode?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata vaultingModeMetadata?;
    # 
    string webForms?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata webFormsMetadata?;
};

# This object contains details about a payment gateway account.
public type PaymentGatewayAccount record {
    # When **true,** the sender can pass custom metadata about the payment to the payment gateway. You pass in this metadata on an EnvelopeRecipientTab, in the `customMetadata` property under `paymentDetails`. 
    # 
    # For example, this property is set to **true** for the Authorize.net gateway by default. As a result, the extra metadata that you send displays for the Authorize.net transaction in the merchant gateway portal under **Description.**
    # 
    # **Note:** This property is read-only and cannot be changed.
    boolean allowCustomMetadata?;
    # 
    PaymentGatewayAccountSetting config?;
    # A user-defined name for a connected gateway account.
    # 
    # This name is used in the Admin panel in the list of connected accounts and in Tagger in the payment gateway selector.
    # 
    # The human-readable version of `paymentGatewayAccountId`.
    string displayName?;
    # When **true,** the payment gateway account is enabled.
    string isEnabled?;
    # Reserved for DocuSign.
    string isLegacy?;
    # The UTC DateTime that the payment gateway account was last updated.
    string lastModified?;
    # Payment gateway used by the connected gateway account.
    # This is the name used by the API.
    # For a human-readable version use `paymentGatewayDisplayName`.
    # 
    # Possible values are:
    # 
    # * `Stripe`
    # * `Braintree`
    # * `AuthorizeDotNet`
    # * `CyberSource`
    # * `Zuora`
    # * `Elavon`
    string paymentGateway?;
    # A GUID that identifies the payment gateway account. For a human-readable version use `displayName`.
    string paymentGatewayAccountId?;
    # The display name of the payment gateway that the connected gateway account uses.
    # This is the human-readable version of `paymentGateway`.
    # 
    # Possible values are:
    # 
    # * Stripe
    # * Braintree
    # * Authorize.Net
    # * CyberSource
    # * Zuora
    # * Elavon
    string paymentGatewayDisplayName?;
    # 
    PayPalLegacySettings payPalLegacySettings?;
    # A list of ISO 4217 currency codes for the currencies that the payment gateway account supports.
    # 
    # Examples: 
    # 
    # - `USD`
    # - `CAD`
    # - `EUR`
    # - `HKD`
    string[] supportedCurrencies?;
    # An array of paymentMethodWithOptions objects that specify the payment methods that are available for the gateway.
    string[] supportedPaymentMethods?;
    # An array of `paymentMethodWithOptions` objects that specify the payment methods that are available for the gateway, as well as the payment options that are compatible with each payment method.
    PaymentMethodWithOptions[] supportedPaymentMethodsWithOptions?;
    # 
    string[] zeroDecimalCurrencies?;
};

# An array of email notifications that specifies the email the user receives when they are a recipient. When the specific email notification is set to true, the user receives those types of email notifications from DocuSign. The user inherits the default account email notification settings when the user is created.
public type SignerEmailNotifications record {
    # When **true,** the user receives agent notification emails.
    string agentNotification?;
    # When **true,** the user receives notifications of carbon copy deliveries.
    string carbonCopyNotification?;
    # When **true,** the user receives notifications of certified deliveries.
    string certifiedDeliveryNotification?;
    # When **true,** the user receives only comments that mention their own user name.
    string commentsOnlyPrivateAndMention?;
    # When **true,** the user receives all comments.
    string commentsReceiveAll?;
    # When **true,** the user receives notification that document markup has been activated.
    string documentMarkupActivation?;
    # When **true,** the user receives notification that the envelope has been activated.
    string envelopeActivation?;
    # When **true,** the user receives an email notification when the envelope has been completed.
    string envelopeComplete?;
    # When **true,** the user receives notification that the envelope has been corrected.
    string envelopeCorrected?;
    # When **true,** the user receives notification that the envelope has been declined.
    string envelopeDeclined?;
    # When **true,** the user receives notification that the envelope has been voided.
    string envelopeVoided?;
    # Reserved for DocuSign.
    string faxReceived?;
    # When **true,** the user receives an email notification if offline signing failed.
    string offlineSigningFailed?;
    # When **true,** the user receives an email notification when a document purge occurs.
    string purgeDocuments?;
    # When **true,** the user receives notification that the envelope has been reassigned.
    string reassignedSigner?;
    # When **true,** the user receives notification that he or she is a member of the signing group.
    string whenSigningGroupMember?;
};

# A list of `documentVisibility` objects that specify whether the documents associated with a template are visible to recipients.
public type TemplateDocumentVisibilityList record {
    # An array of `documentVisibility` objects that specifies which documents are visible to which recipients.
    DocumentVisibility[] documentVisibility?;
};

# Result set for the Envelopes: listStatusChanges method
public type EnvelopesInformation record {
    # Reserved for DocuSign.
    string continuationToken?;
    # The last index position in the result set. 
    string endPosition?;
    # Array of envelope information.
    Envelope[] envelopes?;
    # 
    string envelopeSearchSource?;
    # Array of envelope statuses and transaction IDs in the result set.
    EnvelopeTransactionStatus[] envelopeTransactionStatuses?;
    # A list of folder objects.
    Folder[] folders?;
    # The last time that a query was performed.
    string lastQueriedDateTime?;
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

# This object contains information about a credit card that is associated with an account.
public type CreditCardInformation record {
    # Contains address information.
    AddressInformation address?;
    # 
    string cardLastDigits?;
    # The credit card number.
    string cardNumber?;
    # The type of credit card. Valid values are: 
    # 
    # - `visa` 
    # - `mastercard` 
    # - `amex`
    string cardType?;
    # The 3 or 4-digit card verification value (CVV) number associated with the credit card. CVV numbers are also referred to as card security codes (CSCs).
    string cvNumber?;
    # The month that the credit card expires, expressed as a number from 1 to 12.
    string expirationMonth?;
    # The year in which the credit card expires, in 4-digit format.
    string expirationYear?;
    # The exact name as it appears on the credit card.
    string nameOnCard?;
    # 
    string tokenizedCard?;
};

# 
public type MobileNotifierConfiguration record {
    # 
    string deviceId?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The Platform of the client application
    string platform?;
};

# Envelope object definition.
public type EnvelopeDefinition record {
    # Reserved for DocuSign.
    string accessControlListBase64?;
    # Sets the document reading zones for screen reader applications.  This element can only be used if Document Accessibility is enabled for the account.
    # 
    # **Note:** This information is currently generated from the DocuSign web console by setting the reading zones when creating a template, exporting the reading zone string information, and adding it here.
    string accessibility?;
    # When **true,** comments are allowed on the envelope.
    string allowComments?;
    # When **true,** the Document Markup feature is enabled.
    # 
    # **Note:**  To use this feature, Document Markup must be enabled at both the account and envelope levels. Only Admin users can change this setting at the account level.
    string allowMarkup?;
    # When **true,** the recipient can redirect an envelope to a more appropriate recipient.
    string allowReassign?;
    # When **true,** this enables the Recursive Recipients feature and allows a recipient to appear more than once in the routing order.
    string allowRecipientRecursion?;
    # When **true,** users can view the history of the envelope.
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
    # An array of attachment objects containing details about any envelope attachments.
    Attachment[] attachments?;
    # The URI for retrieving the envelope attachments.
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
    # The ID of the brand, or text and formatting, to use for the envelope. To use brands, account branding must be enabled for the account.
    # 
    # **Note:** When creating an envelope using a branded template, include this value to ensure that the brand is applied.
    string brandId?;
    # When **true,** the `brandId` for the envelope is locked and senders cannot change the brand used for the envelope.
    string brandLock?;
    # 
    string burnDefaultTabData?;
    # The URI for retrieving certificate information.
    string certificateUri?;
    # The date and time that the envelope was completed.
    string completedDateTime?;
    # A complex type that can be added to create envelopes from a combination of DocuSign templates and PDF forms. The basic envelope remains the same, while the Composite Template adds new document and template overlays into the envelope. There can be any number of Composite Template structures in the envelope.
    CompositeTemplate[] compositeTemplates?;
    # This value is only applicable when copying an existing envelope. Provide the ID of the envelope to clone in `envelopeId`.
    # 
    # When **true,** the recipient field values of the existing envelope are included. Only values from data entry fields, like checkboxes and radio buttons, will be copied. Fields that require an action, like signatures and initials, will not be included.
    string copyRecipientData?;
    # The date and time that the envelope was created.
    string createdDateTime?;
    # An `accountCustomField` is an envelope custom field that you set at the account level.
    # Applying custom fields enables account administrators to group and manage envelopes.
    AccountCustomFields customFields?;
    # The URI for retrieving custom fields.
    string customFieldsUri?;
    # The date and time that the recipient declined the envelope.
    string declinedDateTime?;
    # The date and time that the envelope was deleted.
    string deletedDateTime?;
    # The date and time that the envelope was delivered to the recipient. This property is read-only.
    string deliveredDateTime?;
    # When **true,** the responsive document feature is turned off for the envelope.
    string disableResponsiveDocument?;
    # The document's bytes. This field can be used to include a base64 version of the document bytes within an envelope definition instead of sending the document using a multi-part HTTP request. The maximum document size is smaller if this field is used due to the overhead of the base64 encoding.
    string documentBase64?;
    # A complex element that contains details about the documents associated with the envelope.
    Document[] documents?;
    # The URI for retrieving all of the documents associated with the envelope as a single PDF file.
    string documentsCombinedUri?;
    # The URI for retrieving all of the documents associated with the envelope as separate files.
    string documentsUri?;
    # This optional element holds the body of the email message that is sent to all envelope recipients. 
    # 
    # Maximum Length: 10000 characters.
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
    # The envelope ID.
    # 
    # When used as a request body in [Envelopes: create](/docs/esign-rest-api/reference/envelopes/envelopes/create/), this is the ID of the envelope to clone.
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
    # Use this object to configure a [DocuSign Connect webhook](/platform/webhooks/connect/).
    EventNotification eventNotification?;
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
    # An array of folders that the envelope belongs to.
    Folder[] folders?;
    # When **true,** indicates that users have added comments to the envelope.
    string hasComments?;
    # When **true,** indicates that the form data associated with the envelope has changed since it was sent. When **false,** this property does not appear in the response.
    string hasFormDataChanged?;
    # When **true,** indicates that a wave file (voice recording) is part of the envelope.
    string hasWavFile?;
    # Reserved for DocuSign.
    string holder?;
    # The date and time that the envelope was first sent.
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
    # The user's encrypted password hash.
    string password?;
    # Contains details about a PowerForm.
    PowerForm powerForm?;
    # The date that a purge was completed.
    string purgeCompletedDate?;
    # The date that a purge was requested.
    string purgeRequestDate?;
    # Initiates a purge request. Valid values are:
    # 
    # - `documents_queued`: Places envelope documents in the purge queue.
    # - `documents_and_metadata_queued`: Places envelope documents
    #    and metadata in the purge queue.
    # - `documents_and_metadata_and_redact_queued`: Places envelope documents
    #    and metadata in the purge queue and redacts personal information.
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
    # The request body for the [EnvelopeViews: createRecipient](/docs/esign-rest-api/reference/envelopes/envelopeviews/createrecipient/)
    # and
    # [EnvelopeViews: createSharedRecipient](/docs/esign-rest-api/reference/envelopes/envelopeviews/createsharedrecipient/) methods.
    RecipientViewRequest recipientViewRequest?;
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
    # Indicates the envelope status. Valid values when creating an envelope are: 
    # 
    # * `created`: The envelope is created as a draft. It can be modified and sent later.
    # * `sent`: The envelope will be sent to the recipients after the envelope is created.
    # 
    # You can query these additional statuses once the recipients have interacted with the envelope.
    # 
    # * `completed`: The recipients have finished working with the envelope: the documents are signed and all required tabs are filled in.
    # * `declined`: The envelope has been declined by the recipients.
    # * `delivered`: The envelope has been delivered to the recipients.
    # * `signed`: The envelope has been signed by the recipients.
    # * `voided`: The envelope is no longer valid and recipients cannot access or sign the envelope.
    string status?;
    # The data and time that the status changed.
    string statusChangedDateTime?;
    # The DateTime that the envelope changed status (i.e. was created or sent.)
    string statusDateTime?;
    # The ID of the template. If a value is not provided, DocuSign generates a value. 
    string templateId?;
    # This object specifies the template recipients. Each `roleName` in the template must have a recipient assigned to it. This object is comprised of the following elements:
    # 
    # * `email`: The recipient's email address.
    # * `name`: The recipient's name.
    # * `roleName`: The template roleName associated with the recipient.
    # * `clientUserId`: An optional property that specifies whether the recipient is embedded or remote. If the `clientUserId` is not null, then the recipient is embedded. Note that if a `clientUserId` is used and the account settings `signerMustHaveAccount` or `signerMustLoginToSign` are **true,** an error is generated on sending.
    # * `defaultRecipient`: Optional, When **true,** this recipient is the default recipient and any tabs generated by the `transformPdfFields` option are mapped to this recipient.
    # * `routingOrder`: This specifies the routing order of the recipient in the envelope.
    # * `accessCode`: This optional element specifies the access code a recipient has to enter to validate the identity. Maximum Length: 50 characters.
    # * `inPersonSignerName`: Optional. If the template role is an in-person signer, this is the full legal name of the signer. Maximum Length: 100 characters.
    # * `emailNotification`: This is an optional complex element that has a role-specific `emailSubject`, `emailBody`, and `language`. It follows the same format as the `emailNotification` property for recipients.
    # * `tabs`: This property enables the tab values to be specified for matching to tabs in the template.
    TemplateRole[] templateRoles?;
    # The URI for retrieving any templates associated with the envelope.
    string templatesUri?;
    #  Used to identify an envelope. The ID is a sender-generated value and is valid in the DocuSign system for 7 days. DocuSign recommends that you use a transaction ID for offline signing to ensure that an envelope is not sent multiple times. You can use the `transactionId` property to determine an envelope's status (i.e. was it created or not) in cases where the Internet connection was lost before the envelope status was returned.
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

# This object contains information about the type of signature.
public type SignatureType record {
    # When **true,** the signature type is the default type.
    string isDefault?;
    # The type of signature. Valid values are:
    # 
    # - `electronic`: Indicates an **electronic** signature that is used by common law countries such as the United States, United Kingdom, and Australia. This is the default signature type that DocuSign uses.
    # - `universal`: Indicates a **digital** signature that is accepted by both common law and civil law countries. To use digital signatures, you must use the [DocuSign Signature Appliance](/docs/dsa-api/).
    # 
    # For more information, see [Standards Based Signatures](/docs/esign-rest-api/esign101/concepts/standards-based-signatures/).
    string 'type?;
};

# The URIs for retrieving the logos that are associated with the brand.
# 
# These are read-only properties that provide a URI to logos in use.
# To update a logo use
# [AccountBrands: updateLogo](/docs/esign-rest-api/reference/accounts/accountbrands/updatelogo/).
public type BrandLogos record {
    # The URI for the brand's secondary logo.
    # 
    # This is a read-only property that provides a URI to the logo in use.
    # To update a logo use
    # [AccountBrands: updateLogo](/docs/esign-rest-api/reference/accounts/accountbrands/updatelogo/).
    string email?;
    # The URI for the brand's secondary logo.
    # 
    # This is a read-only property that provides a URI to the logo in use.
    # To update a logo use
    # [AccountBrands: updateLogo](/docs/esign-rest-api/reference/accounts/accountbrands/updatelogo/).
    string primary?;
    # The URI for the brand's secondary logo.
    # 
    # This is a read-only property that provides a URI to the logo in use.
    # To update a logo use
    # [AccountBrands: updateLogo](/docs/esign-rest-api/reference/accounts/accountbrands/updatelogo/).
    string secondary?;
};

# 
public type LocalePolicy record {
    # Specifies the address format. Valid values:
    # 
    # - `en_us`
    # - `ja_jp`
    # - `zh_cn_tw`
    string addressFormat?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata addressFormatMetadata?;
    # 
    string allowRegion?;
    # Specifies the type of calendar. Valid values:
    # 
    # - `gregorian`
    # - `japanese`
    # - `buddhist`
    string calendarType?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata calendarTypeMetadata?;
    # The two letter [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language code.
    string cultureName?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata cultureNameMetadata?;
    # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code.
    string currencyCode?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata currencyCodeMetadata?;
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
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata currencyNegativeFormatMetadata?;
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
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata currencyPositiveFormatMetadata?;
    # 
    string customDateFormat?;
    # 
    string customSignDateFormat?;
    # 
    string customSignTimeFormat?;
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
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata dateFormatMetadata?;
    # 
    string effectiveAddressFormat?;
    # 
    string effectiveCalendarType?;
    # 
    string effectiveCurrencyCode?;
    # 
    string effectiveCurrencyNegativeFormat?;
    # 
    string effectiveCurrencyPositiveFormat?;
    # 
    string effectiveCustomDateFormat?;
    # 
    string effectiveCustomTimeFormat?;
    # 
    string effectiveDateFormat?;
    # 
    string effectiveInitialFormat?;
    # 
    string effectiveNameFormat?;
    # 
    string effectiveTimeFormat?;
    # 
    string effectiveTimeZone?;
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
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata initialFormatMetadata?;
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
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata nameFormatMetadata?;
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
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata timeFormatMetadata?;
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
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata timeZoneMetadata?;
};

# 
public type AccountIdentityInputOption record {
    # 
    boolean isRequired?;
    # 
    string optionName?;
    # 
    string valueType?;
};

# Defines an account billing plan response object.
public type AccountBillingPlanResponse record {
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

# 
public type PrefillFormData record {
    # 
    FormDataItem[] formData?;
    # The sender's email address.
    string senderEmail?;
    # The sender's name.
    string senderName?;
    # The ID of the sender.
    string senderUserId?;
};

# A Commission Expiration tab displays the expiration date of a notary's commission. The tab is populated with the notary's commission information, but the recipient can also edit the value when notarizing. This tab can only be assigned to a remote notary recipient using [DocuSign Notary](/docs/notary-api/).
public type CommissionExpiration record {
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

# This object lets you choose the data format of your Connect response.
public type ConnectEventData record {
    # Reserved for DocuSign.
    string format?;
    # A string array of the data to be included.
    # The default is the empty array `[]`.
    # 
    # - `attachments`: Include attachments associated with the envelope.
    # - `custom_fields`: Include the custom fields associated with the envelope.
    # - `documents`: Include the documents associated with the envelope.
    # - `extensions`: Include information about the email settings associated with the envelope.
    # - `folders`: Include the folder where the envelope exists.
    # - `payment_tabs`: Include the payment tabs associated with the envelope.
    # - `powerform`: Include the PowerForms associated with the envelope.
    # - `prefill_tabs`: Include the [pre-filled tabs](/docs/esign-rest-api/esign101/concepts/tabs/prefilled-tabs/) associated with the envelope.
    # - `recipients`: Include the recipients associated with the envelope.
    # - `tabs`: Include the tabs associated with the envelope.
    string[] includeData?;
    # Set this property to `restv2.1` to return event data in JSON. If the property is not set, the event data will be returned in XML by default.
    string version?;
};
