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
public type ConnectDeleteFailureResult record {
};

# This resource is used to create a responsive preview of a specific template document.
public type TemplateDocumentResponsiveHtmlPreview record {
    # Holds the properties that define how to generate the responsive-formatted HTML for the document.
    string[] htmlDefinitions?;
};

# The `NotificationDefaults` resource provides methods that enable you to manage the default notifications for envelopes.
public type NotificationDefaults record {
    # Contains details about the default notification settings for the envelope notifications that senders and signers receive.
    NotificationDefaultSettings apiEmailNotifications?;
    # Contains details about the default notification settings for the envelope notifications that senders and signers receive.
    NotificationDefaultSettings emailNotifications?;
};

# 
public type UserAuthorizationIdWithStatus record {
    # 
    string authorizationId?;
    # 
    string errorMessage?;
    # 
    string success?;
};

# Sets custom email subject and email body for individual
# recipients. **Note:** You must explicitly set `supportedLanguage`
# if you use this feature.
public type RecipientEmailNotification record {
    # The body of the email message.
    string emailBody?;
    # Metadata about a property.
    PropertyMetadata emailBodyMetadata?;
    # The subject line for the email notification.
    string emailSubject?;
    # Metadata about a property.
    PropertyMetadata emailSubjectMetadata?;
    # The language to use for the standard email format and signing view for a recipient.
    # 
    # For example, this setting determines the language of the recipient's email notification message. It also determines the language used for buttons and tabs in both the email notification and the signing experience.
    # 
    # **Note:** This setting affects only DocuSign standard text. Any custom text that you enter for the `emailBody` and `emailSubject` of the notification is not translated, and appears exactly as you enter it.
    # 
    # To retrieve the possible values, use the [Accounts::listSupportedLanguages][ListLang] method.
    # 
    # [ListLang]: /docs/esign-rest-api/reference/accounts/accounts/listsupportedlanguages/
    string supportedLanguage?;
    # Metadata about a property.
    PropertyMetadata supportedLanguageMetadata?;
};

# Provides properties that describe user authorization to a workspace.
public type WorkspaceUserAuthorization record {
    # When **true,** the workspace user can delete items from the workspace.
    string canDelete?;
    # When **true,** the workspace user can move the items in the workspace.
    string canMove?;
    # When **true,** the workspace user can create transactions from the workspace.
    string canTransact?;
    # When **true,** the workspace user can view the items in the workspace.
    string canView?;
    # The UTC DateTime when the workspace user authorization was created.
    string created?;
    # The ID of the user who created the workspace user authorization. 
    string createdById?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The UTC DateTime when the workspace user authorization was last modified.
    string modified?;
    # The ID of the user who last modified the workspace user authorization.
    string modifiedById?;
    # The ID of the workspace user.
    string workspaceUserId?;
    # This object represents the workspace user. This property is only returned in response to user specific GET call. 
    WorkspaceUser workspaceUserInformation?;
};

# 
public type BulkSendBatchRequest record {
    # The new name of the bulk send batch.
    # 
    # This property is required. The maximum length of the string is 500 characters.
    string batchName?;
};

# A tab that allows the recipient to add a free-form drawing to the document.
public type Draw record {
    # When **true,** the recipient can upload an image to use as the background of the drawing field. The default value is **false.**
    string allowSignerUpload?;
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
    # When **true,** the signer cannot change the data of the custom tab.
    string locked?;
    # Metadata about a property.
    PropertyMetadata lockedMetadata?;
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
    # When **true,** the signer is required to fill out this tab.
    string required?;
    # Metadata about a property.
    PropertyMetadata requiredMetadata?;
    # When **true,** this custom tab is shared.
    string shared?;
    # Metadata about a property.
    PropertyMetadata sharedMetadata?;
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
    # 
    string useBackgroundAsCanvas?;
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

# A tab that displays the envelope ID.
# 
# **Note:**  The eSignature API uses the name `envelopeId` two ways:
# 
# - As a _property_ of type `string` used to identify an envelope  by its GUID.
# - As an _object_ used to represent an envelope tab that displays
#   the envelope's GUID.
public type EnvelopeId record {
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
public type TemplateHtmlDefinitions record {
    # Holds the properties that define how to generate the responsive-formatted HTML for the document.
    DocumentHtmlDefinitionOriginal[] htmlDefinitions?;
};

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
public type EmailSettings record {
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

# A Commission Number tab displays a notary's commission number. The tab is populated with the notary's commission information, but the recipient can also edit the value when notarizing. This tab can only be assigned to a remote notary recipient using [DocuSign Notary][notary].
# 
# [notary]: /docs/notary-api/
public type CommissionNumber record {
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

# This object contains information about a seat discount.
public type SeatDiscount record {
    # Reserved for DocuSign.
    string beginSeatCount?;
    # The percent of the discount. 
    # 
    # Example: `"0.00"`
    string discountPercent?;
    # Reserved for DocuSign.
    string endSeatCount?;
};

# Information about the shared item.
public type SharedItem record {
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # How the item is shared. One of:
    # 
    # - `not_shared`
    # - `shared_to`
    # - `shared_from`
    # - `shared_to_and_from`
    string shared?;
    # 
    UserInfo user?;
};

# This object contains details about a folder.
public type Folder record {
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # Use this object to create a filtered view of the items in a folder.
    Filter filter?;
    # The ID of the folder.
    string folderId?;
    # A list of envelopes and templates that the folder contains.
    FolderItem_v2[] folderItems?;
    # A collection of folder objects returned in a response.
    Folder[] folders?;
    # When **true,** the current user has access to the folder.
    string hasAccess?;
    # When **true,** the folder has subfolders.
    string hasSubFolders?;
    # The number of items in the folder.
    string itemCount?;
    # The name of the folder.
    string name?;
    # 
    UserInfo owner?;
    # The ID of the parent folder, or the special value `root` for the root folder.
    string parentFolderId?;
    # The URI of the parent folder.
    string parentFolderUri?;
    # The number of subfolders.
    string subFolderCount?;
    # The type of folder. Possible values include:
    # 
    # - `draft`
    # - `inbox`
    # - `normal` (a system-generated folder)
    # - `recyclebin`
    # - `sentitems`
    # - `custom` (a custom folder created by a user)
    string 'type?;
    # The URI for the folder.
    string uri?;
};

# This object contains the data that recipients have entered into the form fields associated with an envelope.
public type EnvelopeFormData record {
    # The subject line of the email message that is sent to all recipients.
    # 
    # For information about adding merge field information to the email subject, see [Template Email Subject Merge Fields](/docs/esign-rest-api/reference/templates/templates/create/#template-email-subject-merge-fields).
    # 
    # **Note:** The subject line is limited to 100 characters, including any merged fields.It is not truncated. It is an error if the text is longer than 100 characters.
    string emailSubject?;
    # The ID of the envelope.
    string envelopeId?;
    # An array of form data objects.
    FormDataItem[] formData?;
    # 
    PrefillFormData prefillFormData?;
    # An array of form data objects that are associated with specific recipients.
    RecipientFormData[] recipientFormData?;
    # The UTC DateTime when the envelope was sent. This property is read-only.
    string sentDateTime?;
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
};

# 
public type NotaryJournal record {
    # The creation date of the account in UTC timedate format.
    string createdDate?;
    # The name of the document.
    string documentName?;
    # Describes the jurisdiction of a notary.
    # This is read-only object.
    Jurisdiction jurisdiction?;
    # A unique GUID for this journal entry.
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

# 
public type UserPasswordInformation record {
    # The user's current password to be changed.
    string currentPassword?;
    # The user's email address for the associated account.
    string email?;
    # A complex element that has up to four Question/Answer pairs for forgotten password information.
    ForgottenPasswordInformation forgottenPasswordInfo?;
    # The user's new password.
    string newPassword?;
};

# Contains information about an APP store product.
public type AppStoreProduct record {
    # 
    string marketPlace?;
    # The Product ID from the AppStore.
    string productId?;
};

# 
public type BulkEnvelopeStatus record {
    # Specifies an identifier which can be used to retrieve a more detailed status of individual bulk recipient batches.
    string batchId?;
    # The number of items returned in this response.
    string batchSize?;
    # A list of bulk envelope objects.
    BulkEnvelope[] bulkEnvelopes?;
    # URI at which you can retrieve the batch envelopes.
    string bulkEnvelopesBatchUri?;
    # The last index position in the result set. 
    string endPosition?;
    # The number of entries with a status of failed. 
    string failed?;
    # The URI for the next chunk of records based on the search request. It is `null` if this is the last set of results for the search. 
    string nextUri?;
    # The URI for the prior chunk of records based on the search request. It is `null` if this is the first set of results for the search. 
    string previousUri?;
    # The number of entries with a status of queued. 
    string queued?;
    # The number of results in this response. Because you can filter which entries are included in the response, this value is always less than or equal to the `totalSetSize`.
    string resultSetSize?;
    # The number of entries with a status of sent.
    string sent?;
    # The starting index position of the current result set.
    string startPosition?;
    # The date on which the bulk envelope was created.
    string submittedDate?;
    # The total number of items in the result set. This value is always greater than or equal to the value of `resultSetSize`.
    string totalSetSize?;
};

# 
public type EnvelopeAttachmentsResult record {
    # An array of attachment objects that contain information about the attachments.
    EnvelopeAttachment[] attachments?;
};

# 
public type FileTypeList record {
    # A collection of file types.
    FileType[] fileTypes?;
};

# Brands use resource files to style the following experiences: 
# 
# - Email
# - Sending
# - Signing
# - Captive (embedded) signing 
# 
# You can modify these resource files to customize these experiences.
public type BrandResourceUrls record {
    # The URI for the email resource file that the brand uses.
    string email?;
    # The URI for the sending resource file that the brand uses.
    string sending?;
    # The URI for the signing resource file that the brand uses.
    string signing?;
    # The URI for the captive (embedded) signing resource file that the brand uses.
    string signingCaptive?;
};

# This tab enables users to strike through the text of a document. The tab is implemented as a line represented as a pair of x and y coordinates.
public type PolyLineOverlay record {
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
    # 
    GraphicsContext graphicsContext?;
    # The height of the tab in pixels.
    # Must be an integer.
    string height?;
    # Metadata about a property.
    PropertyMetadata heightMetadata?;
    # When **true,** the signer cannot change the data of the custom tab.
    string locked?;
    # Metadata about a property.
    PropertyMetadata lockedMetadata?;
    # Contains information for transferring values between Salesforce data fields and DocuSign tabs.
    MergeField mergeField?;
    # Reserved for DocuSign.
    string mergeFieldXml?;
    # The type of overlay to use. The API currently supports only the `outline` overlay type.
    string overlayType?;
    # Metadata about a property.
    PropertyMetadata overlayTypeMetadata?;
    # Specifies the page number on which the tab is located.
    string pageNumber?;
    # Metadata about a property.
    PropertyMetadata pageNumberMetadata?;
    # An array of `polyLine` objects that contain x- and y-coordinates representing the locations of the lines.
    PolyLine[] polyLines?;
    # The ID of the recipient to whom the tab will be assigned. This value should match the `recipientId` defined in the recipient object.
    string recipientId?;
    # The globally-unique identifier (GUID) for a specific recipient on a specific envelope. If the same recipient is associated with multiple envelopes, they will have a different GUID for each one. This property is read-only.
    string recipientIdGuid?;
    # Metadata about a property.
    PropertyMetadata recipientIdGuidMetadata?;
    # Metadata about a property.
    PropertyMetadata recipientIdMetadata?;
    # When **true,** indicates that the tab is shared.
    string shared?;
    # Metadata about a property.
    PropertyMetadata sharedMetadata?;
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

# 
public type EnvelopeCustomMetadata record {
    # 
    NameValue[] envelopeCustomMetadataDetails?;
};

# A single bulk send error report.
public type BulkSendErrorStatus record {
    # The timestamp of when the error occurred in ISO 8601 format.
    string created?;
    # The envelope ID of the envelope status that failed to post.
    string envelopeId?;
    # The error message generated during processing, if any.
    string errorMessage?;
    # An array of email addresses for the failed bulk envelope.
    # 
    # Recipient email/info of the failed bulk envelope.
    string[] recipientEmails?;
};

# A tab that alerts notary recipients that
# they must take action on the page.
# Only one notarize tab can appear on a page.
public type Notarize record {
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
    # When **true,** the signer cannot change the data of the custom tab.
    string locked?;
    # Metadata about a property.
    PropertyMetadata lockedMetadata?;
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

# This object contains the results of a ConnectConfigurations::GET method.
public type ConnectConfigResults record {
    # An array of DocuSign Connect configurations.
    ConnectCustomConfiguration[] configurations?;
    # The number of results.
    string totalRecords?;
};

# The ChunkedUploads resource provides methods to complete integrity checks, and to add, commit, retrieve, initiate and delete chunked uploads.
public type ChunkedUploads record {
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
    # **Note:** The length of time before expiration is configurable, and begins when you initiate the chunked upload. You must fully upload and use a chunked upload within this time. The default value for this duration is 20 minutes.
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

# This is the request object for uploading a chunked upload.
public type ChunkedUploadRequest record {
    # The ID of the chunked upload.
    # 
    # **Note:** This property is ignored in requests, and overridden with an auto-generated value in responses.
    string chunkedUploadId?;
    # A base64-encoded representation of the content that is used to upload the file. 
    # 
    # Maximum size: 50 MB. However, data is also subject to REST API limits regarding request sizes, and Internet Information Systems (IIS) might place further constraints on file size.
    string data?;
};

# A tab that displays the date that the recipient signed the
# document.
public type DateSigned record {
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
    # **Note:** Date Signed tabs never display this tooltip in the signing interface.
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

# This object contains the details for the bulk send list.
public type BulkSendingList record {
    # An array of `bulkCopy` objects. Each object represents an instance or copy of an envelope and contains details such as the recipient, custom fields, tabs, and other information.
    BulkSendingCopy[] bulkCopies?;
    # The GUID of the bulk send list.
    string listId?;
    # The name of the bulk send list.
    string name?;
};

# A tab that allows the recipient to enter any type of text.
public type Text record {
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
    # The value of the text tab.
    # 
    # Maximum length: 4000 bytes.
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

# Defines a billing payment request object.
public type BillingPaymentItem record {
    # The total amount of the purchase.
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

# Contains details about a specific cloud storage provider.
public type CloudStorageProvider record {
    # The authentication URL used for the cloud storage provider. This information is only included in the response if the user has not passed authentication for the cloud storage provider. If the redirectUrl query string is provided, the returnUrl is appended to the authenticationUrl. 
    string authenticationUrl?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The URL the user is redirected to after the cloud storage provider authenticates the user. Using this will append the redirectUrl to the authenticationUrl.
    # 
    # The redirectUrl is restricted to URLs in the docusign.com or docusign.net domains.
    string redirectUrl?;
    # The service name for the cloud storage provider.
    string 'service?;
    # The DocuSign-generated ID for the cloud storage provider.
    string serviceId?;
};

# 
public type DocumentHtmlDefinitions record {
    # Holds the properties that define how to generate the responsive-formatted HTML for the document.
    string[] htmlDefinitions?;
};

# 
public type BillingDiscount record {
    # Reserved for DocuSign.
    string beginQuantity?;
    # 
    string discount?;
    # 
    string endQuantity?;
};

# 
public type RecipientFormData record {
    # The date and time the recipient declined the envelope.
    string DeclinedTime?;
    # The date and time the recipient viewed the documents in the envelope in the DocuSign signing UI.
    string DeliveredTime?;
    # The recipient's email address.
    string email?;
    # An array of form data objects.
    FormDataItem[] formData?;
    # The name of the recipient.
    string name?;
    # Unique for the recipient. It is used by the tab element to indicate which recipient is to sign the Document.
    string recipientId?;
    # The date and time the envelope was sent to the recipient.
    string SentTime?;
    # The date and time the recipient signed the documents.
    string SignedTime?;
};

# **Note:** For a self-service PowerForm on a website, you can specify the intended recipients generically (for example, use `Member` as the `Name`), and omit personal details such as `email`.
public type PowerFormRecipient record {
    # (Optional) The access code that the recipient must enter to access the PowerForm.
    # 
    # Maximum Length: 50 characters. The code must also conform to the account's access code format setting.
    # 
    # If blank but the signer accessCode property is set in the envelope, then that value is used.
    # 
    # If blank and the signer accessCode property is not set, then the access code is not required.
    string accessCode?;
    # When **true,** the `accessCode` property is locked and cannot be edited.
    string accessCodeLocked?;
    # When **true,** the recipient must enter the `accessCode` to access the PowerForm.
    string accessCodeRequired?;
    # The email address of the recipient.
    # 
    # **Note:** For self-service documents where you do not know who the recipients are in advance, you can leave this property blank.
    string email?;
    # When **true,** the recipient's email address is locked and cannot be edited.
    string emailLocked?;
    # The name of the authentication check to use. This value must match one of the authentication types that the account uses. The names of these authentication types appear in the web console sending interface in the Identify list for a recipient. This setting overrides any default authentication setting. Valid values are:
    # 
    # - `Phone Auth $`: The recipient must authenticate by using two-factor authentication (2FA). You provide the phone number to use for 2FA in the `phoneAuthentication` object.
    # - `SMS Auth $`: The recipient must authenticate via SMS. You provide the phone number to use in the `smsAuthentication` object.
    # - `ID Check $`: The  recipient must answer detailed security questions. 
    # 
    # **Example:** Your account has ID Check and SMS Authentication available. In the web console Identify list, these appear as ID Check $ and SMS Auth $. To use ID Check in an envelope, the idCheckConfigurationName should be ID Check $. For SMS, you would use SMS Auth $, and you would also need to add a phone number to the smsAuthentication node.
    string idCheckConfigurationName?;
    # Indicates if authentication is configured for the account. Valid values are:
    # 
    # - `always`: Authentication checks are performed on every envelope. 
    # - `never`: Authentication checks are not performed on any envelopes. 
    # - `optional:` Authentication is configurable per envelope.
    string idCheckRequired?;
    # The name of the PowerForm recipient.
    # 
    # **Note:** For self-service documents where you do not know who the recipients are in advance, you can leave this property blank.
    string name?;
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
    # The role associated with the recipient (for example, `Member`).
    # 
    # This property is required when you are working with template recipients and PowerForm recipients.
    string roleName?;
    # Specifies the routing order of the recipient in the envelope. 
    string routingOrder?;
    # When **true,** the template used to create the PowerForm requires ID lookup for the recipient.
    string templateRequiresIdLookup?;
    # When **true,** the `userName` property for the recipient is locked and cannot be edited.
    string userNameLocked?;
};

# Connect event logging information. This object contains sections for regular Connect logs and for Connect failures. 
public type ConnectEvents record {
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

# 
public type IdEvidenceResourceToken record {
    # 
    string proofBaseURI?;
    # 
    string resourceToken?;
};

# Properties that configure the settings for a user. Some elements of this object have a `metadata` property, which includes the following:
# - `rights`: The calling users permissions to edit this setting (can be `editable` or `read_only`)
# - `uiHint`: Internally used to build UIs (can be `available` or `hidden`)
# - `options`: The values supported for this setting (not all settings have this element)
public type UserSettingsInformation record {
    # Describes which account management capabilities a user has.
    UserAccountManagementGranularInformation accountManagementGranular?;
    # Reserved for DocuSign.
    string adminOnly?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata adminOnlyMetadata?;
    # When **true,** the API returns suggested tabs for documents for this user.
    string allowAutoTagging?;
    # 
    string allowedOrchestrationAccess?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowedOrchestrationAccessMetadata?;
    # When **true,** this user can participate in envelope transfers on the account.
    string allowEnvelopeTransferTo?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowEnvelopeTransferToMetadata?;
    # When **true,** this user can create [electronic seal recipients][eseal].
    # 
    # [eseal]: /docs/esign-rest-api/reference/envelopes/enveloperecipients/#seal-recipient
    string allowEsealRecipients?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowEsealRecipientsMetadata?;
    # When **true** and this user is an administrator, they can view all of the envelopes generated from PowerForms. The default value is **false.**
    string allowPowerFormsAdminToAccessAllPowerFormEnvelope?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowPowerFormsAdminToAccessAllPowerFormEnvelopeMetadata?;
    # When **true,** this user can set the language used in the standard email format for a recipient when creating an envelope.
    string allowRecipientLanguageSelection?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowRecipientLanguageSelectionMetadata?;
    # When **true,** this user can send envelopes "on behalf of" other users through the API.
    string allowSendOnBehalfOf?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowSendOnBehalfOfMetadata?;
    # When **true,** this user can include supplemental documents.
    string allowSupplementalDocuments?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowSupplementalDocumentsMetadata?;
    # 
    string allowTransactions?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata allowTransactionsMetadata?;
    # Reserved for DocuSign.
    string anchorTagVersionedPlacementEnabled?;
    # When **true,** indicates that this user can send envelope-specific API requests on the account.
    string apiAccountWideAccess?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata apiAccountWideAccessMetadata?;
    # When **true,** this user can export authoritative copy for the account.
    string apiCanExportAC?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata apiCanExportACMetadata?;
    # When **true,** this user can use the bulk send feature for the account.
    string bulkSend?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata bulkSendMetadata?;
    # Reserved for DocuSign.
    string canChargeAccount?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canChargeAccountMetadata?;
    # 
    string canCreateTransaction?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canCreateTransactionMetadata?;
    # 
    string canDeleteDocumentsInTransaction?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canDeleteDocumentsInTransactionMetadata?;
    # 
    string canDeleteTransaction?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canDeleteTransactionMetadata?;
    # When true, this user can edit the shared address book for the account.
    string canEditSharedAddressbook?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canEditSharedAddressbookMetadata?;
    # Reserved for DocuSign.
    string canLockEnvelopes?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canLockEnvelopesMetadata?;
    # When **true,** this user is an administrator for the account.
    string canManageAccount?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canManageAccountMetadata?;
    # Reserved for DocuSign.
    string canManageDistributor?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canManageDistributorMetadata?;
    # When **true,** this user can manage templates for the account.
    string canManageTemplates?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canManageTemplatesMetadata?;
    # When **true,** this user can send API requests on the account.
    string canSendAPIRequests?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canSendAPIRequestsMetadata?;
    # When **true,** this user can send envelopes on the account.
    string canSendEnvelope?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canSendEnvelopeMetadata?;
    # 
    string canSendEnvelopesViaSMS?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canSendEnvelopesViaSMSMetadata?;
    # When **true,** this user can sign envelopes.
    string canSignEnvelope?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canSignEnvelopeMetadata?;
    # When **true,** this user can use a scratchpad to edit information.
    string canUseScratchpad?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canUseScratchpadMetadata?;
    # Reserved for DocuSign.
    string canUseSmartContracts?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canUseSmartContractsMetadata?;
    # When **true,** this user is prohibited from uploading documents during sending.
    string disableDocumentUpload?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata disableDocumentUploadMetadata?;
    # When **true,** this user can access the **Other Actions** menu.
    string disableOtherActions?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata disableOtherActionsMetadata?;
    # Reserved for DocuSign.
    string enableDSPro?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableDSProMetadata?;
    # 
    string enableKeyTermsSuggestionsByDocumentType?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableKeyTermsSuggestionsByDocumentTypeMetadata?;
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
    # When **true,** this user can use the signing attachments feature.
    string enableSignerAttachments?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableSignerAttachmentsMetadata?;
    # When **true,** a user can override the default default account setting for the Sign on Paper option, which specifies whether signers can sign documents on paper as an option to signing electronically.
    # 
    # **Note:** Only Admin users can change this setting.
    string enableSignOnPaperOverride?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableSignOnPaperOverrideMetadata?;
    # Reserved for DocuSign.
    string enableTransactionPoint?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableTransactionPointMetadata?;
    # When **true,** Vaulting is enabled for the account.
    string enableVaulting?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata enableVaultingMetadata?;
    # When **false,** this user can apply tabs to documents during the sending experience.
    string expressSendOnly?;
    # The user's locale code. Valid values are:
    # - `zh_CN`
    # - `zh_TW`
    # - `nl`
    # - `en`
    # - `fr`
    # - `de`
    # - `it`
    # - `ja`
    # - `ko`
    # - `pt`
    # - `pt_BR`
    # - `ru`
    # - `es`
    string locale?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata localeMetadata?;
    # 
    LocalePolicy localePolicy?;
    # When **true,** this user can create and manage [Clickwraps](/docs/click-api/).
    string manageClickwrapsMode?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata manageClickwrapsModeMetadata?;
    # The user ID (GUID) of the user who last modified this user record. This property is read-only.
    string modifiedBy?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata modifiedByMetadata?;
    # The date on which this user record was last modified.
    string modifiedDate?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata modifiedDateMetadata?;
    # Note referencing the page that modified this user record.
    string modifiedPage?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata modifiedPageMetadata?;
    # Reserved for DocuSign.
    string newSendUI?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata newSendUIMetadata?;
    # Indicates the Power Form mode setting for the user:
    # - `none`
    # - `admin`
    # - `user`
    string powerFormMode?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata powerFormModeMetadata?;
    # When **true,** this user receives notifications when envelopes are viewed.
    string recipientViewedNotification?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata recipientViewedNotificationMetadata?;
    # Information about the seals associated with this user.
    SealIdentifier[] sealIdentifiers?;
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
    # Contains the settings for the email notifications that senders receive about the envelopes that they send.
    SenderEmailNotifications senderEmailNotifications?;
    # An array of email notifications that specifies the email the user receives when they are a recipient. When the specific email notification is set to true, the user receives those types of email notifications from DocuSign. The user inherits the default account email notification settings when the user is created.
    SignerEmailNotifications signerEmailNotifications?;
    # When **true,** this user gets supplemental documents when downloading documents.
    string supplementalDocumentIncludeInDownload?;
    # When **true,** this user must accept supplemental documents.
    string supplementalDocumentsMustAccept?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata supplementalDocumentsMustAcceptMetadata?;
    # When **true,** this user must both view and accept supplemental documents.
    string supplementalDocumentsMustRead?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata supplementalDocumentsMustReadMetadata?;
    # When **true,** this user must view supplemental documents.
    string supplementalDocumentsMustView?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata supplementalDocumentsMustViewMetadata?;
    # When **true,** a new template is created each time the user sends an envelope.
    string templateActiveCreation?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata templateActiveCreationMetadata?;
    # When **true,** the system notifies this user before applying a matching template.
    string templateApplyNotify?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata templateApplyNotifyMetadata?;
    # When **true,** the system automatically applies a matching template to a document if only one template matches. If there are multiple matches, it displays a list of matches to select from.
    string templateAutoMatching?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata templateAutoMatchingMetadata?;
    # Percentage used when matching templates.
    string templateMatchingSensitivity?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata templateMatchingSensitivityMetadata?;
    # When **true,** users see template matching functionality.
    string templatePageLevelMatching?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata templatePageLevelMatchingMetadata?;
    # When true, daylight savings time is in effect for this user's time zone.
    string timezoneDST?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata timezoneDSTMetadata?;
    # The custom DateTime format setting for this user.
    string timezoneMask?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata timezoneMaskMetadata?;
    # The timezone offset for the user. Valid values:
    # - `tz_01_afghanistan`
    # - `tz_02_alaskan`
    # - `tz_03_arab`
    # - `tz_04_arabian`
    # - `tz_05_arabic`
    # - `tz_06_argentina`
    # - `tz_07_atlantic`
    # - `tz_08_aus_central`
    # - `tz_09_aus_eastern`
    # - `tz_10_azerbaijan`
    # - `tz_11_azores`
    # - `tz_12_bangladesh`
    # - `tz_13_canada_central`
    # - `tz_14_cape_verde`
    # - `tz_15_caucasus`
    # - `tz_16_central_australia`
    # - `tz_17_central_america`
    # - `tz_18_central_asia`
    # - `tz_19_central_brazilian`
    # - `tz_20_central_europe`
    # - `tz_21_central_european`
    # - `tz_22_central_pacific`
    # - `tz_23_central`
    # - `tz_24_central_mexico`
    # - `tz_25_china`
    # - `tz_26_dateline`
    # - `tz_27_east_africa`
    # - `tz_28_east_australia`
    # - `tz_29_east_europe`
    # - `tz_30_east_south_america`
    # - `tz_31_eastern`
    # - `tz_32_egypt`
    # - `tz_33_ekaterinburg`
    # - `tz_34_fiji`
    # - `tz_35_fli`
    # - `tz_36_georgian`
    # - `tz_37_gmt`
    # - `tz_38_greenland`
    # - `tz_39_greenwich`
    # - `tz_40_gtb`
    # - `tz_41_hawaiian`
    # - `tz_42_india`
    # - `tz_43_iran`
    # - `tz_44_israel`
    # - `tz_45_jordan`
    # - `tz_46_kaliningrad`
    # - `tz_47_kamchatka`
    # - `tz_48_korea`
    # - `tz_49_magadan`
    # - `tz_50_mauritius`
    # - `tz_51_mid_atlantic`
    # - `tz_52_middle_east`
    # - `tz_53_montevideo`
    # - `tz_54_morocco`
    # - `tz_55_mountain`
    # - `tz_56_mountain_mexico`
    # - `tz_57_myanmar`
    # - `tz_58_north_central_asia`
    # - `tz_59_namibia`
    # - `tz_60_nepal`
    # - `tz_61_new_zealand`
    # - `tz_62_new_foundland`
    # - `tz_63_north_asia_east`
    # - `tz_64_north_asia`
    # - `tz_65_pacific_sa`
    # - `tz_66_pacific`
    # - `tz_67_pacific_mexico`
    # - `tz_68_pakistan`
    # - `tz_69_paraguay`
    # - `tz_70_romance`
    # - `tz_71_russian`
    # - `tz_72_sa_eastern`
    # - `tz_73_sa_pacific`
    # - `tz_74_sa_western`
    # - `tz_75_samoa`
    # - `tz_76_se_asia`
    # - `tz_77_singapore`
    # - `tz_78_south_africa`
    # - `tz_79_sriLanka`
    # - `tz_80_syria`
    # - `tz_81_taipei`
    # - `tz_82_tasmania`
    # - `tz_83_tokyo`
    # - `tz_84_tonga`
    # - `tz_85_turkey`
    # - `tz_86_ulaanbaatar`
    # - `tz_87_us_eastern`
    # - `tz_88_us_mountain`
    # - `tz_89_venezuela`
    # - `tz_90_vladivostok`
    # - `tz_91_west_australia`
    # - `tz_92_west_central_africa`
    # - `tz_93_west_europe`
    # - `tz_94_west_asia`
    # - `tz_95_west_pacific`
    # - `tz_96_yakutsk`
    string timezoneOffset?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata timezoneOffsetMetadata?;
    # Reserved for DocuSign.
    string timezoneSendingPref?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata timezoneSendingPrefMetadata?;
    # Reserved for DocuSign.
    string timezoneSigningPref?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata timezoneSigningPrefMetadata?;
    # Reserved for DocuSign.
    string transactionPointSiteNameURL?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata transactionPointSiteNameURLMetadata?;
    # Reserved for DocuSign.
    string transactionPointUserName?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata transactionPointUserNameMetadata?;
    # Indicates the specified Vaulting mode:
    # - `none`
    # - `estored`
    # - `electronic_original`
    string vaultingMode?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata vaultingModeMetadata?;
    # 
    string webForms?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata webFormsMetadata?;
};

# 
public type NewUsersDefinition record {
    # A list of one or more new users.
    UserInformation[] newUsers?;
};

# Describes which account management capabilities a user has.
public type UserAccountManagementGranularInformation record {
    # **True** if the user can manage account security settings.
    string canManageAccountSecuritySettings?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canManageAccountSecuritySettingsMetadata?;
    # **True** if the user can manage account settings.
    string canManageAccountSettings?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canManageAccountSettingsMetadata?;
    # **True** if the user can manage administrators.
    string canManageAdmins?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canManageAdminsMetadata?;
    # 
    string canManageConnect?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canManageConnectMetadata?;
    # 
    string canManageDocumentRetention?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canManageDocumentRetentionMetadata?;
    # 
    string canManageEnvelopeTransfer?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canManageEnvelopeTransferMetadata?;
    # 
    string canManageGroupsButNotUsers?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canManageGroupsButNotUsersMetadata?;
    # 
    string canManageJointAgreements?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canManageJointAgreementsMetadata?;
    # **True** if the user can manage reporting.
    string canManageReporting?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canManageReportingMetadata?;
    # **True** if the user can manage sharing.
    string canManageSharing?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canManageSharingMetadata?;
    # **True** if the user can manage signing groups.
    string canManageSigningGroups?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canManageSigningGroupsMetadata?;
    # 
    string canManageStamps?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canManageStampsMetadata?;
    # **True** if the user can manage users.
    string canManageUsers?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata canManageUsersMetadata?;
    # 
    string canViewUsers?;
};

# Contains information about the signature provider associated with the Identity Verification workflow.
# If empty, then this specific workflow is not intended for signers.
public type AccountSignatureProvider record {
    # Reserved for DocuSign.
    string isRequired?;
    # Reserved for DocuSign.
    string priority?;
    # Reserved for DocuSign.
    string signatureProviderDisplayName?;
    # Reserved for DocuSign.
    string signatureProviderId?;
    # The name of an Electronic or Standards Based Signature (digital signature) provider for the signer to use. For details, see [the current provider list](/docs/esign-rest-api/esign101/concepts/standards-based-signatures/). You can also retrieve the list by using the [AccountSignatureProviders: List](/docs/esign-rest-api/reference/accounts/accountsignatureproviders/list/) method.
    # 
    # Example: `universalsignaturepen_default`
    string signatureProviderName?;
    # Reserved for DocuSign.
    AccountSignatureProviderOption[] signatureProviderOptionsMetadata?;
    # Reserved for DocuSign.
    SignatureProviderRequiredOption[] signatureProviderRequiredOptions?;
};

# Details about one or more brands.
public type BrandsRequest record {
    # A list of brands.
    BrandRequest[] brands?;
};

# 
public type ConsentDetails record {
    # 
    string consentKey?;
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
    # 
    string signerConsentStatus?;
};

# Contains information about add ons.
public type AddOn record {
    # Reserved for DocuSign.
    string active?;
    # Reserved for DocuSign.
    string addOnId?;
    # A unique ID for the Salesforce object.
    string id?;
    # Reserved for DocuSign.
    string name?;
};

# 
public type EnvelopeDocumentsResult record {
    # An array containing information about the documents that are included in the envelope.
    EnvelopeDocument[] envelopeDocuments?;
    # The envelope ID.
    string envelopeId?;
};

# Information about a shared item.
public type UserSharedItem record {
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # How the item is shared. One of:
    # 
    # - `not_shared`
    # - `shared_to`
    # - `shared_from`
    # - `shared_to_and_from`
    string shared?;
    # 
    UserInfo user?;
};

# Contains information about a carbon copy recipient. Carbon copy recipients get a copy of the envelope but don't need to sign, initial, date or add information to any of the documents. 
public type CarbonCopy record {
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
    # Not applicable for Carbon Copy recipients.
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
    # 
    string linkedAccountConfigurationId?;
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

# Describes a single step in a workflow.
public type WorkflowStep record {
    # Indicates the action to perform. Valid values:
    # 
    # - `pause_before`: The workflow should pause before the trigger described by `triggerOnItem` is reached.
    string action?;
    # The timestamp of when the workflow step transitioned to `completed` status.
    # 
    # This property is read-only.
    string completedDate?;
    # A complex element that specifies the delayed routing settings for the workflow step.
    DelayedRouting delayedRouting?;
    # The unique ID of the item being triggered.
    string itemId?;
    # Describes the recipient routing rules.
    RecipientRouting recipientRouting?;
    # The status of the step. Valid values:
    # 
    # - `inactive`
    # - `in_progress`
    # - `paused`
    # - `pending`
    # - `completed`
    # 
    # This property is read-only.
    string status?;
    # The timestamp of when the workflow step transitioned to `in_progress` status.
    # 
    # This property is read-only.
    string triggeredDate?;
    # The type of item that triggers this workflow step. Valid values:
    # 
    # * `routing_order`
    string triggerOnItem?;
    # A unique identifier for this workflow step.
    # 
    # This property is read-only.
    string workflowStepId?;
};

# 
public type PowerFormsRequest record {
    # An array of PowerForm objects.
    PowerForm[] powerForms?;
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
public type EnvelopeDocumentVisibility record {
    # An array of `documentVisibility` objects that specifies which documents are visible to which recipients.
    DocumentVisibility[] documentVisibility?;
};

# Document Generation for eSignature allows you to
# dynamically generate
# documents from a Word template to send for
# signature within the eSignature sending workflow.
public type DocumentGeneration record {
    # 
    DocGenFormFields[] docGenFormFields?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
};

# 
public type AccountSignature record {
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

# A TemplateView contains a URL that you can embed in your application to generate a template view that uses the DocuSign user interface (UI).
public type TemplateViews record {
    # The URL that you navigate to in order to start the view.
    string url?;
};

# Contains information about an APP store receipt.
public type AppStoreReceipt record {
    # 
    string downgradeProductId?;
    # 
    string isDowngradeCancellation?;
    # The Product ID from the AppStore.
    string productId?;
    # Reserved for DocuSign.
    string receiptData?;
};

# 
public type DocumentHtmlDisplayAnchor record {
    # When **true,** the start or end anchor strings must match the strings specified by the start and end anchor settings in case as well as in content.
    boolean caseSensitive?;
    # This object defines how to display the HTML
    # between the `startAnchor` and `endAnchor`.
    DocumentHtmlDisplaySettings displaySettings?;
    # Specifies the end of the area in the HTML where the display settings will be applied. If you do not specify an end anchor, the end of the document will be used by default.
    # 
    # **Note:** A start anchor, an end anchor, or both are required.
    string endAnchor?;
    # When **true,** removes the end anchor string for the Smart Section from the HTML, preventing it from displaying.
    boolean removeEndAnchor?;
    # When **true,** removes the start anchor string for the Smart Section from the HTML, preventing it from displaying.
    boolean removeStartAnchor?;
    # Specifies the beginning of the area in the HTML where the display settings will be applied. If you do not specify a start anchor, the beginning of the document will be used by default.
    # 
    # **Note:** A start anchor, an end anchor, or both are required.
    string startAnchor?;
};

# 
public type AccountSignaturesInformation record {
    # 
    AccountSignature[] accountSignatures?;
};

# Envelope locks let you lock an envelope to prevent any changes while you are updating an envelope.
public type EnvelopeLocks record {
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # 
    # The number of seconds until the lock expires when there is no activity on the envelope.
    # 
    # The default value is 300 seconds. The maximum value is 1,800 seconds.
    # 
    # The lock duration can be extended.
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

public type Resources_resourceContentType_body record {
    # Brand resource XML file.
    record {byte[] fileContent; string fileName;} file\.xml;
};

# This resource provides methods that enable account administrators to create and manage envelope transfer rules.
public type EnvelopeTransferRules record {
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

# 
public type RecipientRules record {
    # 
    ConditionalRecipientRule[] conditionalRecipients?;
};

# 
public type UserSignature record {
    # The date and time the user adopted their signature.
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
    # A Base64-encoded representation of the signature image.
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
    # The font type for the signature, if the signature is not drawn. The supported font types are:
    # 
    # "7_DocuSign", "1_DocuSign", "6_DocuSign", "8_DocuSign", "3_DocuSign", "Mistral", "4_DocuSign", "2_DocuSign", "5_DocuSign", "Rage Italic"
    string signatureFont?;
    # Specifies the signature ID associated with the signature name. You can use the signature ID in the URI in place of the signature name, and the value stored in the `signatureName` property in the body is used. This allows the use of special characters (such as "&", "<", ">") in a the signature name. Note that with each update to signatures, the returned signature ID might change, so the caller will need to trigger off the signature name to get the new signature ID.
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
    # Specifies the type of signature.
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
public type AccountPasswordLockoutDurationType record {
    # An array of option strings supported by this setting.
    string[] options?;
};

# These properties define how a Smart Section displays. A Smart Section is a type of display section.
public type SmartSectionDisplaySettings record {
    # Specifies the valid CSS-formatted styles to use on responsive table cells. Only valid in display sections of `responsive_table` or `responsive_table_single_column` types.
    string cellStyle?;
    # 
    SmartSectionCollapsibleDisplaySettings collapsibleSettings?;
    # Indicates the display type. Must be one of the following enum values:
    # 
    # - **inline:** Leaves the HTML where it is in the document. This allows for adding a label or presenting on a separate page.
    # - **collapsible:** The HTML in the section may be expanded or collapsed. By default, the section is expanded.
    # - **collapsed:** The HTML in the section may be expanded or collapsed. By default, the section is collapsed.
    # - **responsive_table:** Converts the section into a responsive table. Note that this style is applied only on HTML tables that fall within the `startAnchor` and `endAnchor` positions.
    # - **responsive_table_single_column:** Converts the section into a responsive, single-column table. Note that this style is applied only on HTML tables that fall within the `startAnchor` and `endAnchor` positions. The table is converted to a single column in which each column becomes a row and is stacked.
    # - **print_only:** Prevents this portion of the HTML from displaying in the responsive signing view.
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

# This resource is used to create a responsive preview of all of the documents in an envelope.
public type ResponsiveHtmlPreview record {
    # Holds the properties that define how to generate the responsive-formatted HTML for the document.
    string[] htmlDefinitions?;
};

# 
public type ConditionalRecipientRuleCondition record {
    # 
    ConditionalRecipientRuleFilter[] filters?;
    # An integer that specifies the order in which rules are processed.
    # Lower values are processed before higher values.
    string 'order?;
    # An identifier for the recipient. After assigning this value in a `recipient` object, you can reference it in the `conditions` object to set the recipient as a conditional recipient. For an example, see [How to use conditional recipients](/docs/esign-rest-api/how-to/use-conditional-recipients/).
    string recipientLabel?;
};

# An object that describes the user authorizations to create or update.
public type UserAuthorizationsRequest record {
    # The list of user authorizations to create and/or update.
    UserAuthorizationCreateRequestWithId[] authorizations?;
};

# 
public type DocumentHtmlDefinitionOriginals record {
    # Holds the properties that define how to generate the responsive-formatted HTML for the document.
    DocumentHtmlDefinitionOriginal[] htmlDefinitions?;
};

# Reserved for DocuSign.
public type OfflineAttributes record {
    # Reserved for DocuSign.
    string accountEsignId?;
    # Reserved for DocuSign.
    string deviceModel?;
    # Reserved for DocuSign.
    string deviceName?;
    # Reserved for DocuSign.
    string gpsLatitude?;
    # Reserved for DocuSign.
    string gpsLongitude?;
    # Reserved for DocuSign.
    string offlineSigningHash?;
};

# The request object to create a user authorization.
public type UserAuthorizationCreateRequest record {
    # 
    AuthorizationUser agentUser?;
    # The UTC DateTime to end the authorization. The default value is the max UTC value (`9999-12-31T23:59:59.0000000+00:00`).
    string endDate?;
    # The permission level to grant the agent. Valid values:
    # * `Send`
    # * `Manage`
    # * `Sign`
    # 
    # This property is required.
    string permission?;
    # The UTC DateTime to initiate the authorization. The default value is the current date and time.
    string startDate?;
};

# Object specifying the format of the string provided to a recipient in order to access an envelope.
public type AccessCodeFormat record {
    # Boolean specifying whether this format configuration is required.
    string formatRequired?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata formatRequiredMetadata?;
    # Boolean specifying whether alphabetical characters are required in the access code string.
    string letterRequired?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata letterRequiredMetadata?;
    # Minimum length of the access code string.
    string minimumLength?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata minimumLengthMetadata?;
    # Boolean specifying whether numerical characters (0-9) are required in the access code string.
    string numberRequired?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata numberRequiredMetadata?;
    # Boolean specifying whether special characters are required in the access code string. The string cannot contain the special characters '<', '>', '&', or '#'.
    string specialCharacterRequired?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata specialCharacterRequiredMetadata?;
};

# A complex element consisting of: 
# 
# * lastSentDateTime - the date and time the user last sent an envelope. 
# * lastSignedDateTime - the date and time the user last signed an envelope.
# * sentCount - the number of envelopes the user has sent.
# * signedCount - the number of envelopes the user has signed.
public type UsageHistory record {
    # The date and time the user last sent an envelope. 
    string lastSentDateTime?;
    # The date and time the user last signed an envelope.
    string lastSignedDateTime?;
    # The number of envelopes the user has sent. 
    string sentCount?;
    # The number of envelopes the user has signed. 
    string signedCount?;
};

# 
public type ServiceInformation record {
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

# Holds the properties that define how to generate the responsive-formatted HTML for the document.
# See [Responsive signing](/docs/esign-rest-api/esign101/concepts/responsive/)
# in the [eSignature concepts guide](/docs/esign-rest-api/esign101/concepts/).
public type DocumentHtmlDefinition record {
    # Contains text that all display anchors must start with. Using at least four characters will improve anchor processing performance.
    string displayAnchorPrefix?;
    # An object that defines how to handle a section of the HTML in signing. This property enables an incoming request to make a section of the HTML collapsible and expandable or hidden from view.
    # 
    # A start anchor, end anchor, or both are required.
    # If the anchors are not found, the display anchor will be ignored.
    # 
    # For a list of the available types, see the
    # [`display` property](/docs/esign-rest-api/reference/envelopes/envelopes/create/#schema__envelopedefinition_documents_htmldefinition_displayanchors_displaysettings_display)
    # of the
    # [`displaySettings` object.](/docs/esign-rest-api/reference/envelopes/envelopes/create/#schema__envelopedefinition_documents_htmldefinition_displayanchors_displaysettings)
    DocumentHtmlDisplayAnchor[] displayAnchors?;
    # The position on the page where the display section appears.
    string displayOrder?;
    # The number of the page on which the display section appears.
    string displayPageNumber?;
    # The GUID of the document.
    string documentGuid?;
    # Specifies the document ID number that the tab is placed on. This must refer to an existing Document's ID attribute.
    string documentId?;
    # Header text or an HTML tag to place above the responsive HTML block.
    string headerLabel?;
    # If set, the responsive HTML version of the signing document will only display on screens with the specified pixel width or less. If the screen is larger than the value that you specify, the default PDF version of the content displays instead.
    # 
    # This setting can also be configured at the account level.
    string maxScreenWidth?;
    # Holds a comma-separated list of HTML tags to remove if they have no text within their node (including child nodes).
    string removeEmptyTags?;
    # When **true** (the default), the **Mobile-Friendly** toggle displays at the top of the screen on the user's mobile device. When **false,** the toggle will not be displayed.
    # 
    # the **Mobile-Friendly** toggle lets the user switch between the mobile-friendly and the PDF versions of a document. For example, the recipient can use this toggle to review the document using the PDF view before they finish signing.
    string showMobileOptimizedToggle?;
    # Specifies the type of responsive signing that will be used with the document.
    # 
    # If the value of this property is valid HTML,
    # and the [smart sections feature][] is enabled,
    # the HTML code is used to display the signing page:
    # 
    # ```
    # source: "<html> ... <body><p>hello world</p></body></html>"
    # ```
    # 
    # If the value of this property is the string `document`,
    # the HTML signing page is generated from the provided document.
    # 
    # ```
    # source: "document"
    # ```
    # 
    # **Related topics**
    # 
    # - [How to create a signable HTML document](/docs/esign-rest-api/how-to/creating-signable-html/)
    # - [How to convert a PDF file into a signable HTML document](/docs/esign-rest-api/how-to/converting-pdf/)
    # - [Responsive signing](/docs/esign-rest-api/esign101/concepts/responsive/)
    # 
    # 
    # [smart sections feature]: https://support.docusign.com/s/document-item?bundleId=gbo1643332197980&topicId=qlx1578456478178.html
    string 'source?;
};

# 
public type AccountPasswordStrengthTypeOption record {
    # Minimum length of the access code string.
    string minimumLength?;
    # 
    string name?;
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
};

# Use DocuSign eNotary to notarize documents digitally.
# Check the [DocuSign eNotary support documentation](https://support.docusign.com/s/document-item?bundleId=gko1642535666104&topicId=jiv1635359045452.html)
# to see which jurisdictions are supported.
public type Notary record {
    # The creation date of the account in UTC timedate format.
    string createdDate?;
    # 
    string enabled?;
    # 
    string searchable?;
    # User information.
    UserInformation userInfo?;
};

# 
public type FavoriteTemplates record {
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # 
    FavoriteTemplatesContentItem[] favoriteTemplates?;
    # The number of templates successfully updated by the call. This property is read-only.
    int:Signed32 templatesUpdatedCount?;
};

# Metadata that indicates whether a property is editable and describes setting-specific options.
public type SettingsMetadata record {
    # When **true,** indicates compliance with United States Food and Drug Administration (FDA) regulations on electronic records and electronic signatures (ERES).
    string is21CFRPart11?;
    # An array of option strings supported by this setting.
    string[] options?;
    # Indicates whether the property is editable. Valid values are:
    # 
    # - `editable`
    # - `read_only`
    string rights?;
    # Reserved for DocuSign.
    string uiHint?;
    # Reserved for DocuSign.
    string uiOrder?;
    # Reserved for DocuSign.
    string uiType?;
};

# Describes document generation errors.
public type DocGenSyntaxError record {
    # A code associated with the error condition.
    string errorCode?;
    # The error message.
    string message?;
    # The tag that caused the syntax error.
    # See [Document Generation Syntax](https://support.docusign.com/s/document-item?bundleId=als1679428547895&topicId=ftc1679700030026.html)
    # to learn more about document generation syntax rules.
    string tagIdentifier?;
};

# Template recipients
public type TemplateRecipients record {
    # A list of agent recipients assigned to the documents.
    Agent[] agents?;
    # A list of carbon copy recipients assigned to the documents.
    CarbonCopy[] carbonCopies?;
    # A complex type containing information on a recipient the must receive the completed documents for the envelope to be completed, but the recipient does not need to sign, initial, date, or add information to any of the documents.
    CertifiedDelivery[] certifiedDeliveries?;
    # The routing order of the current recipient. If this value equals a particular signer's routing order, it indicates that the envelope has been sent to that recipient, but he or she has not completed the required actions.
    string currentRoutingOrder?;
    # A complex type defining the management and access rights of a recipient assigned assigned as an editor on the document.
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
    # Specifies one or more electronic seals to apply on documents. For more information on Electronic Seals , see https://support.docusign.com/s/document-item?bundleId=xcm1643837555908&topicId=isl1578456577247.html
    SealSign[] seals?;
    # A list of signers on the envelope.
    Signer[] signers?;
    # A list of signers who act as witnesses on the envelope.
    Witness[] witnesses?;
};

# 
public type SenderCompany record {
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
public type UserProfile record {
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
    # The title of the user.
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

# 
public type UsersResponse record {
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

# 
public type ENoteConfigurations record {
    # 
    string apiKey?;
    # 
    string connectConfigured?;
    # 
    string eNoteConfigured?;
    # 
    string organization?;
    # The user's encrypted password hash.
    string password?;
    # The name of the user.
    string userName?;
};

# A complex object specifying the external document sources.
public type ExternalDocumentSources record {
    # The account is enabled to allow external documents to be attached from BoxNet.
    string boxnetEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata boxnetMetadata?;
    # The account is enabled to allow external documents to be attached from DropBox.
    string dropboxEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata dropboxMetadata?;
    # The account is enabled to allow external documents to be attached from Google Drive.
    string googleDriveEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata googleDriveMetadata?;
    # The account is enabled to allow external documents to be attached from OneDrive.
    string oneDriveEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata oneDriveMetadata?;
    # The account is enabled to allow external documents to be attached from Salesforce.
    string salesforceEnabled?;
    # Metadata that indicates whether a property is editable and describes setting-specific options.
    SettingsMetadata salesforceMetadata?;
};

# 
public type ConnectUserInfo record {
    # 
    string email?;
    # 
    string isIncluded?;
    # The ID of the user to access.
    # 
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    string userId?;
    # The name of the user.
    string userName?;
};

# 
public type DocumentTemplateList record {
    # 
    DocumentTemplate[] documentTemplates?;
};

# The request body for the [EnvelopeViews: createCorrect](/docs/esign-rest-api/reference/envelopes/envelopeviews/createcorrect/) method.
public type CorrectViewRequest record {
    # 
    string beginOnTagger?;
    # (Required) The URL to which the user should be redirected after
    # the view session has ended.
    # 
    # Maximum Length: 470 characters. If the `returnUrl` exceeds this
    # limit, the user is redirected to a truncated URL
    # Be sure to include `https://` in the URL
    # or redirecting might fail on some browsers.
    # 
    # When DocuSign redirects to
    # this URL, it will include an `event` query parameter that your app can use:
    # 
    # * `send`: User corrected and sent the envelope.
    # * `save`: User saved the envelope.
    # * `cancel`: User canceled the transaction.
    # * `error`: There was an error when performing the correct or send.
    # * `sessionEnd`: The session ended before the user completed a different action.
    string returnUrl?;
    # Specifies whether the window is displayed with or without dressing.
    string suppressNavigation?;
    # 
    string viewUrl?;
};

# This object maps the document generation fields to their values.
public type DocGenFormFieldRequest record {
    # A list of `docGenFormFields` objects.
    DocGenFormFields[] docGenFormFields?;
};

# Contains information about a billing invoice.
public type BillingInvoice record {
    # The total amount of the purchase.
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

# 
public type CurrencyPlanPrice record {
    # Specifies the [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code for the account.
    string currencyCode?;
    # Specifies the currency symbol.
    # Valid values:
    # 
    # - `AED` <br>  "د.إ"
    # - `AFN` <br>  "؋"
    # - `ALL` <br>  "L"
    # - `AMD` <br>  "֏"
    # - `ANG` <br>  "ƒ"
    # - `AOA` <br>  "Kz"
    # - `ARS` <br>  "$"
    # - `AUD` <br>  "$"
    # - `AWG` <br>  "ƒ"
    # - `AZN` <br>  "₼"
    # - `BAM` <br>  "KM"
    # - `BBD` <br>  "$"
    # - `BDT` <br>  "৳"
    # - `BGN` <br>  "лв"
    # - `BHD` <br>  ".د.ب"
    # - `BIF` <br>  "FBu"
    # - `BMD` <br>  "$"
    # - `BND` <br>  "$"
    # - `BOB` <br>  "$b"
    # - `BOV` <br>  "BOV"
    # - `BRL` <br>  "R$"
    # - `BSD` <br>  "$"
    # - `BTN` <br>  "Nu."
    # - `BWP` <br>  "P"
    # - `BYN` <br>  "Br"
    # - `BYR` <br>  "Br"
    # - `BZD` <br>  "BZ$"
    # - `CAD` <br>  "$"
    # - `CDF` <br>  "FC"
    # - `CHE` <br>  "CHE"
    # - `CHF` <br>  "CHF"
    # - `CHW` <br>  "CHW"
    # - `CLF` <br>  "CLF"
    # - `CLP` <br>  "$"
    # - `CNY` <br>  "¥"
    # - `COP` <br>  "$"
    # - `COU` <br>  "COU"
    # - `CRC` <br>  "₡"
    # - `CUC` <br>  "$"
    # - `CUP` <br>  "₱"
    # - `CVE` <br>  "$"
    # - `CZK` <br>  "Kč"
    # - `DJF` <br>  "Fdj"
    # - `DKK` <br>  "kr"
    # - `DOP` <br>  "RD$"
    # - `DZD` <br>  "دج"
    # - `EGP` <br>  "£"
    # - `ERN` <br>  "Nfk"
    # - `ETB` <br>  "Br"
    # - `EUR` <br>  "€"
    # - `FJD` <br>  "$"
    # - `FKP` <br>  "£"
    # - `GBP` <br>  "£"
    # - `GEL` <br>  "₾"
    # - `GHS` <br>  "GH₵"
    # - `GIP` <br>  "£"
    # - `GMD` <br>  "D"
    # - `GNF` <br>  "FG"
    # - `GTQ` <br>  "Q"
    # - `GYD` <br>  "$"
    # - `HKD` <br>  "$"
    # - `HNL` <br>  "L"
    # - `HRK` <br>  "kn"
    # - `HTG` <br>  "G"
    # - `HUF` <br>  "Ft"
    # - `IDR` <br>  "Rp"
    # - `ILS` <br>  "₪"
    # - `INR` <br>  "₹"
    # - `IQD` <br>  "ع.د"
    # - `IRR` <br>  "﷼"
    # - `ISK` <br>  "kr"
    # - `JMD` <br>  "J$"
    # - `JOD` <br>  "JD"
    # - `JPY` <br>  "¥"
    # - `KES` <br>  "KSh"
    # - `KGS` <br>  "лв"
    # - `KHR` <br>  "៛"
    # - `KMF` <br>  "CF"
    # - `KPW` <br>  "₩"
    # - `KRW` <br>  "₩"
    # - `KWD` <br>  "KD"
    # - `KYD` <br>  "$"
    # - `KZT` <br>  "₸"
    # - `LAK` <br>  "₭"
    # - `LBP` <br>  "£"
    # - `LKR` <br>  "₨"
    # - `LRD` <br>  "$"
    # - `LSL` <br>  "M"
    # - `LYD` <br>  "LD"
    # - `MAD` <br>  "MAD"
    # - `MDL` <br>  "lei"
    # - `MGA` <br>  "Ar"
    # - `MKD` <br>  "ден"
    # - `MMK` <br>  "K"
    # - `MNT` <br>  "₮"
    # - `MOP` <br>  "MOP$"
    # - `MRO` <br>  "UM"
    # - `MUR` <br>  "₨"
    # - `MVR` <br>  "Rf"
    # - `MWK` <br>  "MK"
    # - `MXN` <br>  "$"
    # - `MXV` <br>  "MXV"
    # - `MYR` <br>  "RM"
    # - `MZN` <br>  "MT"
    # - `NAD` <br>  "$"
    # - `NGN` <br>  "₦"
    # - `NIO` <br>  "C$"
    # - `NOK` <br>  "kr"
    # - `NPR` <br>  "₨"
    # - `NZD` <br>  "$"
    # - `OMR` <br>  "﷼"
    # - `PAB` <br>  "B/."
    # - `PEN` <br>  "S/."
    # - `PGK` <br>  "K"
    # - `PHP` <br>  "₱"
    # - `PKR` <br>  "₨"
    # - `PLN` <br>  "zł"
    # - `PYG` <br>  "Gs"
    # - `QAR` <br>  "﷼"
    # - `RON` <br>  "lei"
    # - `RSD` <br>  "Дин."
    # - `RUB` <br>  "₽"
    # - `RWF` <br>  "R₣"
    # - `SAR` <br>  "﷼"
    # - `SBD` <br>  "$"
    # - `SCR` <br>  "₨"
    # - `SDG` <br>  "ج.س."
    # - `SEK` <br>  "kr"
    # - `SGD` <br>  "S$"
    # - `SHP` <br>  "£"
    # - `SLL` <br>  "Le"
    # - `SOS` <br>  "S"
    # - `SRD` <br>  "$"
    # - `SSP` <br>  "£"
    # - `STD` <br>  "Db"
    # - `SVC` <br>  "$"
    # - `SYP` <br>  "£"
    # - `SZL` <br>  "E"
    # - `THB` <br>  "฿"
    # - `TJS` <br>  "SM"
    # - `TMT` <br>  "T"
    # - `TND` <br>  "د.ت"
    # - `TOP` <br>  "T$"
    # - `TRY` <br>  "₺"
    # - `TTD` <br>  "TT$"
    # - `TWD` <br>  "NT$"
    # - `TZS` <br>  "TSh"
    # - `UAH` <br>  "₴"
    # - `UGX` <br>  "USh"
    # - `USD` <br>  "$"
    # - `USN` <br>  "$"
    # - `UYI` <br>  "UYI"
    # - `UYU` <br>  "$U"
    # - `UZS` <br>  "лв"
    # - `VEF` <br>  "Bs"
    # - `VND` <br>  "₫"
    # - `VUV` <br>  "VT"
    # - `WST` <br>  "WS$"
    # - `XAF` <br>  "FCFA"
    # - `XAG` <br>  "XAG"  Silver
    # - `XAU` <br>  "XAU"  Gold
    # - `XBA` <br>  "XBA"  Bond Markets Units European Composite Unit (EURCO)
    # - `XBB` <br>  "XBB"  European Monetary Unit (E.M.U.-6)
    # - `XBC` <br>  "XBC"  European Unit of Account 9(E.U.A.-9)
    # - `XBD` <br>  "XBD"  European Unit of Account 17(E.U.A.-17)
    # - `XCD` <br>  "$"
    # - `XDR` <br>  "XDR" }` <br>  // Special Drawing Rights (SDRs)` <br>  units of account for IMF
    # - `XOF` <br>  "CFA"
    # - `XPD` <br>  "XPD"  Palladium
    # - `XPF` <br>  "₣"
    # - `XPT` <br>  "XPT"  Platinum
    # - `XSU` <br>  "Sucre"
    # - `XTS` <br>  "XTS" Reserved for testing purposes
    # - `XUA` <br>  "XUA"
    # - `XXX` <br>  "XXX" Denotes transaction involving no currency
    # - `YER` <br>  "﷼"
    # - `ZAR` <br>  "R"
    # - `ZMW` <br>  "ZK"
    # - `ZWL` <br>  "$"
    string currencySymbol?;
    # The per-seat price associated with the plan.
    # 
    # Example: `"456.0000"`
    string perSeatPrice?;
    # 
    CreditCardTypes supportedCardTypes?;
    # The support incident fee charged for each support incident.
    # 
    # Example: `"$0.00"`
    string supportIncidentFee?;
    # The support plan fee charged for this plan.
    # 
    # Example: `"$0.00"`
    string supportPlanFee?;
};

# 
public type SignatureUser record {
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
    # The name of the user.
    string userName?;
};

# This object contains basic information about a bulk send list.
public type BulkSendingListSummary record {
    # The GUID of the bulk send list. This property is created after you post a new bulk send list.
    string bulkSendListId?;
    # The GUID of the user who created the bulk send list.
    string createdByUser?;
    # The UTC DateTime that the bulk send list was created.
    string createdDate?;
    # The name of the bulk send list.
    string name?;
};

# This object defines the account permissions for a profile that you can apply to a group of users.
public type PermissionProfile record {
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

# A tab that allows the recipient to initial the document. May
# be optional.
public type InitialHere record {
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
    #  Sets the size for the InitialHere tab. It can be value from 0.5 to 1.0, where 1.0 represents full size and 0.5 is 50% size.
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
    # by (+2, -7)
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
    # by (+2, -7)
    string yPosition?;
    # Metadata about a property.
    PropertyMetadata yPositionMetadata?;
};
