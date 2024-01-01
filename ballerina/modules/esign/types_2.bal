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

import ballerina/http;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
    # Configurations related to client authentication
    http:ClientAuthConfig? auth = ();
|};

# Provides settings related to HTTP/1.x protocol.
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
|};

# Contains information about the BCC email address.
public type BccEmailAddress record {
    # Only users with canManageAccount setting can use this option. An array of up to 5 email addresses the envelope is sent to as a BCC email. 
    #  
    # Example: If your account has BCC for Email Archive set up for the email address 'archive@mycompany.com' and you send an envelope using the BCC Email Override to send a BCC email to 'salesarchive@mycompany.com', then a copy of the envelope is only sent to the 'salesarchive@mycompany.com' email address.
    string bccEmailAddressId?;
    # Specifies the BCC email address. DocuSign verifies that the email format is correct, but does not verify that the email is active.Using this overrides the BCC for Email Archive information setting for this envelope.
    # 
    # Maximum of length: 100 characters. 
    string email?;
};

# Use this object to configure a [DocuSign Connect webhook](/platform/webhooks/connect/).
public type EventNotification record {
    # 
    string deliveryMode?;
    # A list of envelope-level event statuses that will trigger Connect to send updates to the endpoint specified in the `url` property. 
    # 
    # To receive notifications, you must include either an `envelopeEvents` node or a `recipientEvents` node. You do not need to specify both.
    EnvelopeEvent[] envelopeEvents?;
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
    # When **true,** the Connect Service includes the Certificate of Completion with completed envelopes. 
    string includeCertificateOfCompletion?;
    # When **true,**
    # the Connect service will digitally sign
    # the data.
    # The signature will be included in the message.
    string includeCertificateWithSoap?;
    # When **true,** the Document Fields associated with the envelope's documents are included in the notification messages. Document Fields are optional custom name-value pairs added to documents using the API. 
    string includeDocumentFields?;
    # When **true,**
    # the Connect webhook messages
    # will include the envelope's PDF documents.
    # Including the PDF documents
    # greatly increases the size of the notification messages.
    # Ensure that your listener can handle
    # incoming messages that are 25MB or larger.
    string includeDocuments?;
    # When **true,** this tells the Connect Service to include the void reason, as entered by the person that voided the envelope, in the message. 
    string includeEnvelopeVoidReason?;
    # When **true,** HMAC headers will be included with the webhook notifications.
    # 
    # **Note:** [HMAC must enabled](/platform/webhooks/connect/hmac/) at the account level with [one or more HMAC secrets](/platform/webhooks/connect/setting-up-hmac/).
    string includeHMAC?;
    # 
    string includeOAuth?;
    # When **true,** Connect will include the sender account as Custom Field in the data.
    string includeSenderAccountAsCustomField?;
    # When **true,** the envelope's time zone information is included in the webhook messages. 
    string includeTimeZone?;
    # 
    string integratorManaged?;
    # When **true,** the webhook messages are logged. They can be viewed on the DocuSign Administration Web Tool in the Connect section. Logged messages can also be downloaded via the [ConnectEvents resource](/docs/esign-rest-api/reference/connect/connectevents/).
    string loggingEnabled?;
    # A list of recipient event statuses that will trigger Connect to send updates to   the endpoint specified in the URL property.
    # 
    # To receive notifications, you must include either an `envelopeEvents` node or a `recipientEvents` node. You do not need to specify both.
    RecipientEvent[] recipientEvents?;
    # When **true,** the DocuSign Connect service checks that the message was received and retries on failures. 
    string requireAcknowledgment?;
    # When **true,** Mutual TLS will be enabled for notifications. Mutual TLS must be initiated by the listener (the customer's web server) during the TLS handshake protocol. 
    string signMessageWithX509Cert?;
    # The namespace of the SOAP interface.
    # 
    # The namespace value must be set if useSoapInterface is set to true.
    string soapNameSpace?;
    # The endpoint to which Connect should send webhook notification messages via an HTTPS POST request. The URL must start with `https`. The customer's web server must use an SSL/TLS certificate whose CA is in the Microsoft list of trusted CAs. Self-signed certificates are not acceptable, but you can use free certificates from Let's Encrypt.
    # 
    # The maximum length of this property is 4096 bytes.
    string url?;
    # When **true,** this tells the Connect service that the user's endpoint has implemented a SOAP interface. 
    string useSoapInterface?;
};

# 
public type UserSignatureDefinition record {
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
    # Optionally specify an external identifier for the user's signature.
    string externalID?;
    # Specificies the type of image. Valid values:
    # 
    # - `stamp_image`
    # - `signature_image`
    # - `initials_image`
    string imageType?;
    # Boolean that specifies whether the signature is the default signature for the user.
    string isDefault?;
    # The National Association of Realtors (NAR) membership ID for a user who is a realtor.
    string nrdsId?;
    # The realtor's last name.
    string nrdsLastName?;
    # The phonetic spelling of the `signatureName`.
    string phoneticName?;
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
    # Specifies the signature ID associated with the signature name. You can use the signature ID in the URI in place of the signature name, and the value stored in the `signatureName` property in the body is used. This allows the use of special characters (such as "&", "<", ">") in a the signature name. Note that with each update to signatures, the returned signature ID might change, so the caller will need to trigger off the signature name to get the new signature ID.
    string signatureId?;
    # Specifies the user's signature in initials format.
    string signatureInitials?;
    # Specifies the user's signature name.
    string signatureName?;
    # Specifies the type of signature.
    string signatureType?;
    # The format of a stamp. Valid values are:
    # 
    # - `NameHanko`: The stamp represents only the signer's name.
    # - `NameDateHanko`: The stamp represents the signer's name and the date. 
    string stampFormat?;
    # The physical height of the stamp image (in millimeters) that the stamp vendor recommends for displaying the image in PDF documents.
    string stampSizeMM?;
};

# A complex object describing a user authorization.
public type UserAuthorization record {
    # 
    AuthorizationUser agentUser?;
    # The ID of the user authorization.
    string authorizationId?;
    # The UTC DateTime when the workspace user authorization was created.
    string created?;
    # The name and email of the user who created the authorization, in the following format: `[Francis Beagle email@example.com]`
    string createdBy?;
    # The UTC DateTime at which the authorization will expire.
    string endDate?;
    # The UTC DateTime when the workspace user authorization was last updated.
    string modified?;
    # The name and email of the user who created the authorization, in the following format: `[Francis Beagle email@example.com]`
    string modifiedBy?;
    # The [permission level](/docs/esign-rest-api/esign101/concepts/envelopes/shared-access/) to grant the agent. Valid values:
    # * `Send`
    # * `Manage`
    # * `Sign`
    # * `Edit`
    # 
    # This property is required.
    string permission?;
    # 
    AuthorizationUser principalUser?;
    # The UTC DateTime at which the authorization will start.
    string startDate?;
};

# 
public type PageImages record {
    # The last index position in the result set. 
    string endPosition?;
    # The URI for the next chunk of records based on the search request. It is `null` if this is the last set of results for the search. 
    string nextUri?;
    # An array of page objects.
    Page[] pages?;
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
public type SmartSection record {
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
    # When **true,** the `startAnchor` and `endAnchor` for the Smart Section must match both the case and the content of the strings in the HTML.
    boolean caseSensitive?;
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
    # These properties define how a Smart Section displays. A Smart Section is a type of display section.
    SmartSectionDisplaySettings displaySettings?;
    # Specifies the document ID number that the tab is placed on. This must refer to an existing Document's ID attribute.
    string documentId?;
    # Metadata about a property.
    PropertyMetadata documentIdMetadata?;
    # Specifies the end of the area in the HTML where the display settings will be applied. If you do not specify an end anchor, the end of the document will be used by default.
    # 
    # **Note:** A start anchor, an end anchor, or both are required.
    string endAnchor?;
    # 
    SmartSectionAnchorPosition endPosition?;
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
    # The type of overlay to draw on the document. The following overlay types are supported:
    # 
    # - `line`
    # - `outline`
    string overlayType?;
    # Metadata about a property.
    PropertyMetadata overlayTypeMetadata?;
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
    # When **true,** removes the end anchor string for the Smart Section from the HTML, preventing it from displaying.
    boolean removeEndAnchor?;
    # When **true,** removes the start anchor string for the Smart Section from the HTML, preventing it from displaying.
    boolean removeStartAnchor?;
    # When **true,** this custom tab is shared.
    string shared?;
    # Metadata about a property.
    PropertyMetadata sharedMetadata?;
    # 
    SmartContractInformation smartContractInformation?;
    # Reserved for DocuSign.
    string 'source?;
    # Specifies the beginning of the area in the HTML where the display settings will be applied. If you do not specify a start anchor, the beginning of the document will be used by default.
    # 
    # **Note:** A start anchor, an end anchor, or both are required.
    string startAnchor?;
    # 
    SmartSectionAnchorPosition startPosition?;
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

# Contains information about the method used for authentication.
public type AuthenticationMethod record {
    # Indicates the type of authentication. Valid values are: PhoneAuth, STAN, ISCheck, OFAC, AccessCode, AgeVerify, or SSOAuth. 
    string authenticationType?;
    # The last provider that authenticated the user. 
    string lastProvider?;
    #  The data and time the user last used the authentication method. 
    string lastTimestamp?;
    # The number of times the authentication method was used. 
    string totalCount?;
};

# A complex element that has up to four Question/Answer pairs for forgotten password information.
public type ForgottenPasswordInformation record {
    # The answer to the first forgotten password challenge question.
    string forgottenPasswordAnswer1?;
    # The answer to the second forgotten password challenge question.
    string forgottenPasswordAnswer2?;
    # The answer to the third forgotten password challenge question.
    string forgottenPasswordAnswer3?;
    # The answer to the fourth forgotten password challenge question.
    string forgottenPasswordAnswer4?;
    # The first challenge question presented to a user who has forgotten their password.
    string forgottenPasswordQuestion1?;
    # The second challenge question presented to a user who has forgotten their password.
    string forgottenPasswordQuestion2?;
    # The third challenge question presented to a user who has forgotten their password.
    string forgottenPasswordQuestion3?;
    # The fourth challenge question presented to a user who has forgotten their password.
    string forgottenPasswordQuestion4?;
};

# 
public type IntegratedConnectUserInfoList record {
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
    ConnectUserInfo[] users?;
};

#  This object describes an envelope.
public type EnvelopeSummary record {
    # 
    BulkEnvelopeStatus bulkEnvelopeStatus?;
    # The envelope ID of the envelope status that failed to post.
    string envelopeId?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # 
    string recipientSigningUri?;
    # 
    string recipientSigningUriError?;
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
    # The DateTime that the envelope changed status (i.e. was created or sent.)
    string statusDateTime?;
    # A URI containing the user ID.
    string uri?;
};

# Signing groups
public type SigningGroups record {
    # The UTC DateTime when the workspace user authorization was created.
    string created?;
    # The name of the user who created the signing group.
    string createdBy?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The email address for the signing group. You can use a group email address to email all of the group members at the same time.
    string groupEmail?;
    # The name of the group. The search_text provided in the call automatically performs a wild card search on group_name.
    string groupName?;
    # The group type. Possible values include:
    # 
    # - `adminstrators`
    # - `everyone`
    # - `customGroup`
    # - `sharedSigningGroup`
    # 
    # <!-- More? To do -->
    string groupType?;
    # The date and time that the signing group was last modified.
    string modified?;
    # The user ID (GUID) of the user who last modified this user record. This property is read-only.
    string modifiedBy?;
    # The ID of the [signing group](https://support.docusign.com/s/document-item?bundleId=gav1643676262430&topicId=zgn1578456447934.html).
    string signingGroupId?;
    # User management information.
    SigningGroupUser[] users?;
};

# The request body for the [EnvelopeViews: createRecipient](/docs/esign-rest-api/reference/envelopes/envelopeviews/createrecipient/)
# and
# [EnvelopeViews: createSharedRecipient](/docs/esign-rest-api/reference/envelopes/envelopeviews/createsharedrecipient/) methods.
public type RecipientViewRequest record {
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
    # A sender-created value. If provided, the recipient is treated as an embedded (captive) recipient or signer.
    # 
    # Use your application's client ID (user ID) for the recipient. Doing so enables the details of your application's authentication of the recipient to be connected to the recipient's signature if the signature is disputed or repudiated.
    # 
    # Maximum length: 100 characters.
    string clientUserId?;
    # (Required) Specifies the email of the recipient. You can use either `email` and `userName` or `userId` to identify the recipient.
    string email?;
    # 
    string[] frameAncestors?;
    # 
    string[] messageOrigins?;
    # Only used if `pingUrl` is specified. This is the interval, in seconds, between pings on the `pingUrl`.  The default is `300` seconds. Valid values are 60-1200 seconds.
    string pingFrequency?;
    # The client URL that the DocuSign Signing experience should ping to indicate to the client that Signing is active. An HTTP GET call is executed against the client. The response from the client is ignored. The intent is for the client to reset its session timer when the request is received.
    string pingUrl?;
    # Unique for the recipient. It is used by the tab element to indicate which recipient is to sign the Document.
    string recipientId?;
    # (Required) The URL to which the user should be redirected
    # after the signing session has ended.
    # 
    # Maximum Length: 470 characters. If the `returnUrl` exceeds this
    # limit, the user is redirected to a truncated URL
    # Be sure to include `https://` in the URL
    # or redirecting might fail on some browsers.
    # 
    # 
    # When DocuSign redirects to
    # this URL, it will include an `event` query parameter that your app can use:
    # 
    # * `access_code_failed`: Recipient used incorrect access code.
    # * `cancel`: Recipient canceled the signing operation,
    #   possibly by using the **Finish Later** option.
    # * `decline`: Recipient declined to sign.
    # * `exception`: A system error occurred during the signing process.
    # * `fax_pending`: Recipient has a fax pending.
    # * `id_check_failed`: Recipient failed an ID check.
    # * `session_timeout`: The session timed out. An account can control this timeout by using the **Signer Session Timeout** option.
    # * `signing_complete`: The recipient completed the signing ceremony.
    # * `ttl_expired`: The Time To Live token for the envelope has expired.
    #   After being successfully invoked, these tokens expire
    #   after five minutes.
    # * `viewing_complete`: The recipient completed viewing an envelope
    #   that is in a read-only/terminal state,
    #   such as completed, declined, or voided.
    string returnUrl?;
    # The domain in which the user authenticated.
    string securityDomain?;
    # The user ID of the recipient. You can use either the user ID or email and user name to identify the recipient. 
    # 
    # If `userId` is used and a `clientUserId` is provided, the value in the `userId` property must match a `recipientId` (which you can retrieve with a GET recipients call) for the envelope. 
    # 
    # If a `userId` is used and a `clientUserId` is not provided, the `userId` must match the user ID of the authenticating user.
    string userId?;
    # The username of the recipient. You can use either `email` and `userName` or `userId` to identify the recipient.
    string userName?;
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

# This object configures a recipient's read/write access to a document.
public type DocumentVisibility record {
    # Specifies the document ID number that the tab is placed on. This must refer to an existing Document's ID attribute.
    string documentId?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The ID of the recipient to whom the document visibility setting is applied. This value should match the `recipientId` defined in the recipient object.
    string recipientId?;
    # Indicates whether the document is editable:
    # 
    # - `editable`
    # - `read_only`
    string rights?;
    # When **true,** the document is visible to the recipient.
    string visible?;
};

# Describes a single notary jurisdiction.
public type NotaryResult record {
    # 
    Jurisdiction[] jurisdictions?;
    # Use DocuSign eNotary to notarize documents digitally.
    # Check the [DocuSign eNotary support documentation](https://support.docusign.com/s/document-item?bundleId=gko1642535666104&topicId=jiv1635359045452.html)
    # to see which jurisdictions are supported.
    Notary notary?;
};

# Contains API request log information.
public type ApiRequestLog record {
    # The UTC DateTime when the item was created.
    string createdDateTime?;
    # The API endpoint that was called.
    string description?;
    # The ID of the log entry.
    string requestLogId?;
    # The status of the API request.
    string status?;
};

# Defines a billing invoice response object.
public type BillingInvoicesResponse record {
    # Reserved for DocuSign.
    BillingInvoice[] billingInvoices?;
    # The URI for the next chunk of records based on the search request. It is `null` if this is the last set of results for the search. 
    string nextUri?;
    # The URI for the prior chunk of records based on the search request. It is `null` if this is the first set of results for the search. 
    string previousUri?;
};

# 
public type FeatureAvailableMetadata record {
    # 
    string availabilty?;
    # 
    string featureName?;
};

# Contains information about a billing charge.
public type BillingCharge record {
    # Reserved for DocuSign.
    string allowedQuantity?;
    # Reserved for DocuSign.
    string blocked?;
    # Provides information on what services the charge item is for.
    # 
    # The following table provides a description of the different chargeName values available at this time.
    # 
    # | chargeName | Description |
    # | --- | --- |
    # | id_check | ID Check Charge |
    # | in_person_signing | In Person Signing charge |
    # | envelopes Included | Sent Envelopes for the account |
    # | age_verify | Age verification check |
    # | ofac | OFAC Check |
    # | id_confirm | ID confirmation check |
    # | student_authentication | STAN PIN authentication check |
    # | wet_sign_fax | Pages for returning signed documents by fax |
    # | attachment_fax | Pages for returning attachments by fax |
    # | phone_authentication | Phone authentication charge |
    # | powerforms | PowerForm envelopes sent |
    # | signer_payments | Payment processing charge |
    # | outbound_fax | Send by fax charge |
    # | bulk_recipient_envelopes | Bulk Recipient Envelopes sent |
    # | sms_authentications | SMS authentication charge |
    # | saml_authentications | SAML authentication charge |
    # | express_signer_certificate | DocuSign Express Certificate charge |
    # | personal_signer_certificate | Personal Signer Certificate charge |
    # | safe_certificate | SAFE BioPharma Signer Certificate charge |
    # | seats | Included active seats charge |
    # | open_trust_certificate | OpenTrust Signer Certificate charge |
    string chargeName?;
    # Reserved for DocuSign.
    string chargeType?;
    # Reserved for DocuSign.
    string chargeUnitOfMeasure?;
    # 
    BillingDiscount[] discounts?;
    # 
    string firstEffectiveDate?;
    # 
    string includedQuantity?;
    # Reserved for DocuSign.
    string incrementalQuantity?;
    # 
    string lastEffectiveDate?;
    # 
    BillingPrice[] prices?;
    # Reserved for DocuSign.
    string unitPrice?;
    # 
    string usedQuantity?;
};

# Details about consumer disclosures.
public type ConsumerDisclosure record {
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

# This is the response that the API returns after you update recipients.
public type RecipientsUpdateSummary record {
    # An array of `recipientUpdateResults` objects that contain details about the recipients.
    RecipientUpdateResponse[] recipientUpdateResults?;
};

# This object contains information about a payment method that the gateway accepts and the payment options that are compatible with it.
public type PaymentMethodWithOptions record {
    # A list of ISO 4217 currency codes for the currencies that the payment gateway account supports.
    # 
    # Examples: 
    # 
    # - `USD`
    # - `CAD`
    # - `EUR`
    # - `HKD`
    string[] supportedCurrencies?;
    # The payment options that are compatible with the payment method in the `type` property.
    # 
    # Possible values are:
    # 
    # - `save` 
    # - `save_and_authorize`
    # - `authorize`
    string[] supportedOptions?;
    # The name of a payment method that the gateway accepts.
    # 
    # Possible values are:
    # 
    # - `CreditCard`
    # - `ApplePay`
    # - `AndroidPay`
    # - `BankAccount`
    # - `PayPal`
    string 'type?;
};

# Specifies ID Verification applied on an envelope by workflow ID.
# See the [list](/docs/esign-rest-api/reference/accounts/identityverifications/list/)
# method in the [IdentityVerifications](/docs/esign-rest-api/reference/accounts/identityverifications/) resource
# for more information on how to retrieve workflow IDs available for an account.
# This can be used in addition to other [recipient authentication](https://support.docusign.com/s/document-item?bundleId=gav1643676262430&topicId=kzp1578456318101.html) methods.
public type RecipientIdentityVerification record {
    # 
    RecipientIdentityInputOption[] inputOptions?;
    # ID of the Identity Verification worklow used to verify recipients' identity.
    # 
    # This ID must match one of the [workflowId](/docs/esign-rest-api/reference/accounts/identityverifications/list/) available to your account.
    string workflowId?;
    # Metadata about a property.
    PropertyMetadata workflowIdMetadata?;
    # 
    string workflowLabel?;
};

# A complex element that contains information about a user's authentication status.
public type AuthenticationStatus record {
    # Information about the result of an event.
    EventResult accessCodeResult?;
    # Information about the result of an event.
    EventResult ageVerifyResult?;
    # Information about the result of an event.
    EventResult anySocialIDResult?;
    # Information about the result of an event.
    EventResult facebookResult?;
    # Information about the result of an event.
    EventResult googleResult?;
    # Information about the result of an event.
    EventResult identityVerificationResult?;
    # Information about the result of an event.
    EventResult idLookupResult?;
    # Information about the result of an event.
    EventResult idQuestionsResult?;
    # Information about the result of an event.
    EventResult linkedinResult?;
    # Information about the result of an event.
    EventResult liveIDResult?;
    # Information about the result of an event.
    EventResult ofacResult?;
    # Information about the result of an event.
    EventResult openIDResult?;
    # Information about the result of an event.
    EventResult phoneAuthResult?;
    # Information about the result of an event.
    EventResult salesforceResult?;
    # Information about the result of an event.
    EventResult signatureProviderResult?;
    # Information about the result of an event.
    EventResult smsAuthResult?;
    # Information about the result of an event.
    EventResult sTANPinResult?;
    # Information about the result of an event.
    EventResult twitterResult?;
    # Information about the result of an event.
    EventResult yahooResult?;
};

# Deprecated.
public type BrandEmailContent record {
    # Deprecated.
    string content?;
    # Deprecated.
    string emailContentType?;
    # Deprecated.
    string emailToLink?;
    # Deprecated.
    string linkText?;
};

# Describes the jurisdiction of a notary.
# This is read-only object.
public type Jurisdiction record {
    # When **true,** the seal can be generated by the platform.
    string allowSystemCreatedSeal?;
    # When **true,** the seal can be uploaded by the user.
    string allowUserUploadedSeal?;
    # When **true,** the notary's `comissionId` appears in the seal.
    string commissionIdInSeal?;
    # The county of the jurisdiction.
    string county?;
    # When **true,** the county name appears in the seal.
    string countyInSeal?;
    # When **true,** this jurisdiction is enabled.
    string enabled?;
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
    # The name of the jurisdiction. Typically the state name.
    string name?;
    # When **true,** the name of the notary appears in the seal.
    string notaryPublicInSeal?;
    # When **true,** the name of the state appears in the seal.
    string stateNameInSeal?;
};

# Contains the element senderProvidedNumbers which is an Array  of phone numbers the recipient can use for SMS text authentication.
public type RecipientSMSAuthentication record {
    # An array containing a list of phone numbers that the recipient can use for SMS text authentication. 
    string[] senderProvidedNumbers?;
    # Metadata about a property.
    PropertyMetadata senderProvidedNumbersMetadata?;
};

# 
public type MobileNotifierConfigurationInformation record {
    # 
    MobileNotifierConfiguration[] mobileNotifierConfigurations?;
};

# A tab that displays additional information, in the form of a
# note, for the recipient.
public type Note record {
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
    # When **true,** this custom tab is shared.
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
    # **Note:** Note tabs never display this tooltip in the signing interface.
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

# Defines a billing charge response object.
public type BillingChargeResponse record {
    # Reserved for DocuSign.
    BillingCharge[] billingChargeItems?;
};

# 
public type EnvelopeAuditEvent record {
    # 
    NameValue[] eventFields?;
};

# Numerical tabs provide robust display and validation features,
# including formatting for different regions and currencies,
# and minimum and maximum value validation.
# See [Number fields](/docs/esign-rest-api/esign101/concepts/tabs/number-fields/)
# to learn more about this tab type.
public type Numerical record {
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
    # The DocuSign-generated custom tab ID for the custom tab to be applied.
    # This can only be used when adding new tabs for a recipient.
    # When used, the new tab inherits all the custom tab properties.
    string customTabId?;
    # Metadata about a property.
    PropertyMetadata customTabIdMetadata?;
    # When **true,** disables the auto sizing of single line text boxes in the signing screen when the signer enters data. If disabled users will only be able enter as much data as the text box can hold. By default this is false. This property only affects single line text boxes.
    string disableAutoSize?;
    # Metadata about a property.
    PropertyMetadata disableAutoSizeMetadata?;
    # Specifies the document ID number that the tab is placed on. This ID must refer to an existing document.
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
    # The maximum value that the numerical tab can take on.
    # The largest value allowed, and the default if not specified, is
    # `999999999.99`
    string maxNumericalValue?;
    # Contains information for transferring values between Salesforce data fields and DocuSign tabs.
    MergeField mergeField?;
    # Reserved for DocuSign.
    string mergeFieldXml?;
    # The minimum value that the numerical tab can take on.
    # The smallest value allowed, and the default if not specified, is
    # `-999999999.99`
    string minNumericalValue?;
    # The name of the tab. For example, `Sign Here` or `Initial Here`.
    # 
    # If the `tooltip` attribute is not set, this value will be displayed as the custom tooltip text.
    string name?;
    # Metadata about a property.
    PropertyMetadata nameMetadata?;
    # The raw numerical value of the tab.
    # 
    # For example,
    # if the locale policy is `en-US`
    # and the `numericalValue` is `-1234.56`,
    # the `value` property will contain the string
    # `"($ 1,234.56)"`.
    string numericalValue?;
    # The original value of the tab.
    string originalNumericalValue?;
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
    # When **true,** this tab is shared.
    string shared?;
    # Metadata about a property.
    PropertyMetadata sharedMetadata?;
    # Reserved for DocuSign.
    string shareToRecipients?;
    # Metadata about a property.
    PropertyMetadata shareToRecipientsMetadata?;
    # 
    SmartContractInformation smartContractInformation?;
    # 
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
    # Specifies how numerical data is validated. Valid values:
    # 
    # - `number`
    # - `currency`
    string validationType?;
    # The `numericalValue` of the tab
    # displayed according to its locale policy.
    # 
    # For example,
    # if the locale policy is `en-US`
    # and the `numericalValue` is `-1234.56`,
    # this property will contain the string
    # `"($ 1,234.56)"`.
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

# Details about the phone numbers associated with a specific contact.
public type ContactPhoneNumber record {
    # The contact's phone number.
    # 
    # Example: `+12223334444`
    string phoneNumber?;
    # The type of phone number. Valid values are:
    # 
    # - `home`
    # - `mobile`
    # - `work`
    # - `other`
    # - `fax`
    string phoneType?;
};

# The bulk send list resource provides methods that enable you to create and manage bulk sending lists, which you can use to send multiple copies of an envelope in a single batch. 
# 
# **Note:** The Bulk Send feature is only available on Business Pro and Enterprise Pro plans.
public type BulkSend record {
    # An array of `bulkCopy` objects. Each object represents an instance or copy of an envelope and contains details such as the recipient, custom fields, tabs, and other information.
    BulkSendingCopy[] bulkCopies?;
    # The GUID of the bulk send list. This property is created after you post a new bulk send list.
    string listId?;
    # The name of the bulk send list.
    string name?;
};

# Information about the number of password questions required (0 to 4) to confirm a user's identity when a user needs to reset their password.
public type AccountPasswordQuestionsRequired record {
    # The maximum number of password reset questions allowed for the account. This number must be between `0` and `4`, and equal to or greater than `minimumQuestions`.
    string maximumQuestions?;
    # The minimum number of password reset questions allowed for the account. This number must be between `0` and `4`, and equal to or less than `maximumQuestions`.
    string minimumQuestions?;
};

# User information.
public type UserInformation record {
    # Access code provided to the user to activate the account.
    string activationAccessCode?;
    # The name of the user's company.
    string company?;
    # Object representing the user's custom Connect configuration.
    ConnectUserObject[] connectConfigurations?;
    # The two-letter code for the user's country.
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
    # Boolean value that indicates whether the user is currently logged in or not.
    string loginStatus?;
    # The user's middle name. 
    # Limit: 50 characters.
    string middleName?;
    # The user's encrypted password hash.
    string password?;
    # If password expiration is enabled, the date-time when the user's password expires.
    string passwordExpiration?;
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
    # The title of the user.
    string title?;
    # A URI containing the user ID.
    string uri?;
    # The date and time that the user was added to the account.
    string userAddedToAccountDateTime?;
    # The ID of the user to access.
    # 
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    string userId?;
    # The name of the user.
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

# This object contains information used to
# configure [eNote][eNote] functionality.
# To use eNote, the Allow eNote for eOriginal account plan item must be on,
# and the Connect configuration for eOriginal must be set correctly.
# 
# [eNote]: https://support.docusign.com/s/document-item?bundleId=pik1583277475390&topicId=tsn1583277394951.html
public type ENoteConfiguration record {
    # 
    string apiKey?;
    # When **false,** the user must configure Connect and eOriginal for the integration to work.
    string connectConfigured?;
    # When **false,** the user must configure eNote for the feature to work.
    # 
    # **Note:** In the account settings, `allowENoteEOriginal` must be **true**
    # to make changes to the configuration.
    string eNoteConfigured?;
    # The name of the organization.
    string organization?;
    # The user's encrypted password hash.
    string password?;
    # The user's username.
    string userName?;
};

# A complex element that specifies notifications (expirations and reminders) for the envelope.
public type AccountNotification record {
    # A complex element that specifies the expiration settings for the envelope. When an envelope expires, it is voided and no longer available for signing. **Note:** there is a short delay between when the envelope expires and when it is voided.
    Expirations expirations?;
    # A complex element that specifies reminder settings for the envelope.
    Reminders reminders?;
    # When **true,** the user can override envelope expirations.
    string userOverrideEnabled?;
};

# A complex element that specifies the notification settings for the envelope.
public type Notification record {
    # A complex element that specifies the expiration settings for the envelope. When an envelope expires, it is voided and no longer available for signing. **Note:** there is a short delay between when the envelope expires and when it is voided.
    Expirations expirations?;
    # A complex element that specifies reminder settings for the envelope.
    Reminders reminders?;
    # When **true,** the account default notification settings are used for the envelope, overriding the reminders and expirations settings. When **false,** the reminders and expirations settings specified in this request are used. The default value is **false.**
    string useAccountDefaults?;
};

# 
public type NotaryRecipient record {
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
    # Reserved for DocuSign.
    string isBulkRecipient?;
    # Metadata about a property.
    PropertyMetadata isBulkRecipientMetadata?;
    # The user's last name. 
    # Maximum Length: 50 characters.
    string lastName?;
    # Metadata about a property.
    PropertyMetadata lastNameMetadata?;
    # URL that directs the recipient to LiveOak to complete the remote online notarization process. This property is read-only.
    string liveOakStartURL?;
    # Reserved for DocuSign.
    string lockedRecipientPhoneAuthEditable?;
    # Reserved for DocuSign.
    string lockedRecipientSmsEditable?;
    # The full legal name of the recipient. Maximum length: 100 characters.
    # 
    # Note: You must always set a value for this property in requests, even if `firstName` and `lastName` are set.
    string name?;
    # Metadata about a property.
    PropertyMetadata nameMetadata?;
    # Not applicable to Notary tab.
    string notaryId?;
    # 
    string notarySignerEmailSent?;
    # An array of strings that correspond to the `recipientId` of each signer in the notary group. This property is read-only.
    string[] notarySigners?;
    # 
    string notarySourceType?;
    # 
    string notaryThirdPartyPartner?;
    # The notary type. This property is read-only. Valid values:
    # 
    # - `inperson`
    # - `remote`
    string notaryType?;
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
    # Indicates the envelope status. Valid values are:
    # 
    # * sent - The envelope is sent to the recipients. 
    # * created - The envelope is saved as a draft and can be modified and sent later.
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

# 
public type EnvelopePublishTransaction record {
    # 
    string applyConnectSettings?;
    # 
    string envelopeCount?;
    # 
    EnvelopePublishTransactionErrorRollup[] envelopeLevelErrorRollups?;
    # The ID of the publish transaction.
    string envelopePublishTransactionId?;
    # 
    string errorCount?;
    # 
    string[] fileLevelErrors?;
    # 
    string noActionRequiredEnvelopeCount?;
    # 
    string processedEnvelopeCount?;
    # The status of the transaction. Valid values:
    # 
    # * `unprocessed`
    # * `processing`
    # * `complete`
    # * `fatal_error`
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
public type SocialAuthentication record {
    # Reserved for DocuSign.
    string authentication?;
};

# 
public type TemplateInformation record {
    # An array of `templateSummary` objects that contain information about templates.
    TemplateSummary[] templates?;
};

# 
public type EnvelopeTemplate record {
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
    # The envelope ID of an envelope that you want to use as
    # the basis for the template. The state of the envelope
    # can be `draft`, `sent`, or `completed`.
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
    # The ID of the folder.
    string folderId?;
    # 
    string[] folderIds?;
    # 
    string folderName?;
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
    # The date and time that the item was last modified.
    string lastModifiedDateTime?;
    # 
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
    # 
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
    # The user's encrypted password hash.
    string password?;
    # 
    string passwordProtected?;
    # Contains details about a PowerForm.
    PowerForm powerForm?;
    # An array of PowerForm objects.
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
    # which includes all users on the account.
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
    #  Used to identify an envelope.
    # 
    #  The ID is a sender-generated value and is valid in the DocuSign system for 7 days.
    #  It is recommended that a transaction ID is used for offline
    #  signing to ensure that an envelope is not sent multiple times.
    #  The `transactionId` property can be used determine an envelope's
    #  status (i.e. was it created or not) in cases where the internet c
    #  onnection was lost before the envelope status was returned.
    string transactionId?;
    # A URI containing the user ID.
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

# Groups' users
public type GroupUsers record {
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
    # An array of `userInfo` objects containing information about the users in the group.
    UserInfo[] users?;
};

# A Commission County tab displays the county of a notary's commission. The tab is populated with the notary's commission information, but the recipient can also edit the value when notarizing. This tab can only be assigned to a remote notary recipient using [DocuSign Notary](/docs/notary-api/).
public type CommissionCounty record {
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

# Object representing a new user.
public type NewUser record {
    # Contains a token that can be used for authentication in API calls instead of using the user name and password.
    string apiPassword?;
    # The UTC DateTime when the item was created.
    string createdDateTime?;
    # The user's email address.
    string email?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The user's membership ID.
    string membershipId?;
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
    # A URI containing the user ID.
    string uri?;
    # Specifies the user ID for the new user.
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
};

# 
public type FolderSharedItem record {
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The ID of the folder.
    string folderId?;
    # The name of the folder.
    string name?;
    # 
    UserInfo owner?;
    # The ID of the parent folder.
    string parentFolderId?;
    # The URI for the parent folder.
    string parentFolderUri?;
    # Indicates how the folder is shared. Valid values are:
    # 
    # - `not_shared`
    # - `shared_to`
    string shared?;
    # A list of groups that share the folder.
    MemberGroupSharedItem[] sharedGroups?;
    # A list of users that share the folder.
    UserSharedItem[] sharedUsers?;
    # A URI containing the user ID.
    string uri?;
    # 
    UserInfo user?;
};

# Contains details about the password rules for a user.
public type UserPasswordRules record {
    # Contains details about the password rules for an account.
    AccountPasswordRules passwordRules?;
    # The ID of the user to access.
    # 
    # **Note:** Users can only access their own information. A user, even one with Admin rights, cannot access another user's settings.
    string userId?;
};

# This object contains details about a captive (embedded) recipient.
public type CaptiveRecipient record {
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
    # The email address associated with the captive recipient.
    string email?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # The username associated with the captive recipient.
    string userName?;
};

# 
public type MatchBox record {
    # The height of the tab in pixels.
    # Must be an integer.
    string height?;
    # Specifies the page number on which the tab is located.
    # Must be 1 for supplemental documents.
    string pageNumber?;
    # The width of the tab in pixels.
    # Must be an integer.
    string width?;
    # This property indicates the horizontal offset of the object on the page.
    # DocuSign uses 72 DPI when determining position.
    # Required. Must be an integer. May be zero.
    string xPosition?;
    # This property indicates the vertical offset of the object on the page.
    # DocuSign uses 72 DPI when determining position.
    # Required. Must be an integer. May be zero.
    string yPosition?;
};

# 
public type ConnectFailureResults record {
    # Details about a Connect failure result.
    ConnectFailureResult[] retryQueue?;
};

# 
public type AccountPasswordStrengthType record {
    # An array of option strings supported by this setting.
    AccountPasswordStrengthTypeOption[] options?;
};

# 
public type EnvelopeAttachmentsRequest record {
    # An object that contains information about the attachment.
    Attachment[] attachments?;
};

# 
public type TabGroup record {
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
    # A unique identifier for a tab group. To assign a tab to the `tabGroup`, you assign the `TabGroupLabel` to the `tab.TabGroupLabels` array.
    string groupLabel?;
    # Metadata about a property.
    PropertyMetadata groupLabelMetadata?;
    # Specifies how `maximumAllowed` and `minimumRequired`
    # are interpreted when selecting tabs in a `tabGroup`.
    # 
    # Possible values are:
    # 
    # - `SelectAtLeast`
    # - `SelectAtMost`
    # - `SelectExactly`
    # - `SelectARange`
    string groupRule?;
    # Metadata about a property.
    PropertyMetadata groupRuleMetadata?;
    # The height of the tab in pixels.
    # Must be an integer.
    string height?;
    # Metadata about a property.
    PropertyMetadata heightMetadata?;
    # The maximum number of tabs within the `tabGroup` that should be checked, populated, or signed. This property is used for validation.
    string maximumAllowed?;
    # Metadata about a property.
    PropertyMetadata maximumAllowedMetadata?;
    # Contains information for transferring values between Salesforce data fields and DocuSign tabs.
    MergeField mergeField?;
    # Reserved for DocuSign.
    string mergeFieldXml?;
    # The minimum number of of tabs within the `tabGroup` that should be checked, populated, or signed. This property is used for validation.
    string minimumRequired?;
    # Metadata about a property.
    PropertyMetadata minimumRequiredMetadata?;
    # Specifies the page number on which the tab is located.
    string pageNumber?;
    # Metadata about a property.
    PropertyMetadata pageNumberMetadata?;
    # The ID of the recipient to whom the tab group will be assigned. This value should match the `recipientId` defined in the recipient object.
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
    # A positive integer that sets the order the tab is navigated to during signing.
    # 
    # Tabs on a page are navigated to in ascending order, starting with the lowest number and moving to the highest. If two or more tabs have the same `tabOrder` value, the normal auto-navigation setting behavior for the envelope is used.
    string tabOrder?;
    # Metadata about a property.
    PropertyMetadata tabOrderMetadata?;
    # The scope of the tab group. Possible values are:
    # 
    # - `document`
    # - `envelope` (default)
    string tabScope?;
    # Metadata about a property.
    PropertyMetadata tabScopeMetadata?;
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
    # The message displayed if the custom tab fails input validation (either custom of embedded).
    string validationMessage?;
    # Metadata about a property.
    PropertyMetadata validationMessageMetadata?;
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
public type CommentsPublish record {
    # 
    CommentPublish[] commentsToPublish?;
};

# 
public type EnvelopeUpdateSummary record {
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

# Information about the result of an event.
public type EventResult record {
    # Date/time of the event.
    string eventTimestamp?;
    # Reason for failure, if the event failed.
    string failureDescription?;
    # Event status.
    string status?;
    # Failure status code, if the event failed.
    string vendorFailureStatusCode?;
};

# 
public type PowerFormsFormDataResponse record {
    # 
    PowerFormFormDataEnvelope[] envelopes?;
};

# A complex element that specifies the expiration settings for the envelope. When an envelope expires, it is voided and no longer available for signing. **Note:** there is a short delay between when the envelope expires and when it is voided.
public type Expirations record {
    # An integer that sets the number of days the envelope is active. For this value to be used, `expireEnabled` must be explicitly set to **true.**
    string expireAfter?;
    # When **true,** the envelope expires in the number of days set by `expireAfter`. When **false** or not set, the envelope expires in the number of days specified by the [default expiration account setting](https://support.docusign.com/s/document-item?bundleId=pik1583277475390&topicId=rra1583277381176.html).
    string expireEnabled?;
    # An integer that specifying the number of days before the envelope expires that an expiration warning email is sent to the recipient. When 0 (zero), no warning email is sent.
    string expireWarn?;
};

# This object provides details about a feature set, or add-on product that is associated with an account. It is reserved for DocuSign internal use only.
public type FeatureSet record {
    # Reserved for DocuSign.
    CurrencyFeatureSetPrice[] currencyFeatureSetPrices?;
    # Reserved for DocuSign.
    string envelopeFee?;
    # Reserved for DocuSign.
    string featureSetId?;
    # Reserved for DocuSign.
    string fixedFee?;
    # Reserved for DocuSign.
    string is21CFRPart11?;
    # Reserved for DocuSign.
    string isActive?;
    # When **true,** the feature set is actively enabled as part of the plan.
    string isEnabled?;
    # Reserved for DocuSign.
    string name?;
    # Reserved for DocuSign.
    string seatFee?;
};

# A rule that defines a set of recipients and the conditions under which they will be used for the envelope.
public type ConditionalRecipientRule record {
    # An array of conditions that define when the recipients will be used.
    ConditionalRecipientRuleCondition[] conditions?;
    # An integer that specifies the order in which rules are processed.
    # Lower values are processed before higher values.
    string 'order?;
    # Describes a group of recipients.
    RecipientGroup recipientGroup?;
    # The ID of the recipient to whom the condition will be applied. This value should match the `recipientId` defined in the recipient object.
    string recipientId?;
};

# Account management
public type Accounts record {
    # The GUID associated with the account ID.
    string accountIdGuid?;
    # The name on the account.
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
    # The type of billing method on the account. Valid values are: 
    # 
    # - `direct`
    # - `web`
    string billingProfile?;
    # The AccountBrands resource enables you to use account-level brands to customize the styles and text that recipients see.
    AccountBrands brands?;
    # When **true,** specifies that you can upgrade the account through the API. For GET methods, you must set the `include_metadata` query parameter to **true** for this property to appear in the response.
    string canUpgrade?;
    # 
    string connectPermission?;
    # The creation date of the account in UTC timedate format.
    string createdDate?;
    # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code.
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
    # The name of the billing plan used for the account.
    # 
    # Examples: 
    # 
    # - `Personal - Annual`
    # - `Unlimited Envelope Subscription - Annual Billing`
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

# Information about a link that a brand uses.
public type BrandLink record {
    # The text used for the link.
    string linkText?;
    # The type of link. Valid values include:
    # 
    # - `aboutDocusign`
    # - `closeButton`
    string linkType?;
    # When **true,** the link displays to the recipient.
    string showLink?;
    # The URL or mailto address of the link.
    string urlOrMailTo?;
};

# A tab that allows the recipient to enter an email address.
# This is a one-line field that checks that a valid email
# address is entered. It uses the same parameters as a Text
# tab, with the validation message and pattern set for email
# information.
# 
# When getting information that includes
# this tab type, the original value of the tab when the
# associated envelope was sent is included in the response.
public type Email record {
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
    # When **true,** this tab is shared.
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

# Defines a billing plan update response object.
public type BillingPlanUpdateResponse record {
    # The type of payment method used for the account. Valid values are:
    # 
    # - `credit_card`
    # - 
    string accountPaymentMethod?;
    # Information used to provide a preview of a billing plan.
    BillingPlanPreview billingPlanPreview?;
    # Specifies the [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code for the account.
    string currencyCode?;
    # The number of seats (users) included in the plan.
    string includedSeats?;
    # The payment cycle associated with the plan. Valid values: 
    # 
    # - `Monthly`
    # - `Annually` 
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
    # DocuSign's ID for the account plan.
    string planId?;
    # The name of the billing plan used for the account.
    # 
    # Examples: 
    # 
    # - `Personal - Annual`
    # - `Unlimited Envelope Subscription - Annual Billing`
    string planName?;
};

# 
public type DocumentFieldsInformation record {
    # The array of name/value custom data strings to be added to a document. Custom document field information is returned in the status, but otherwise is not used by DocuSign. The array contains the elements: 
    # 
    # * `name`: A string that can be a maximum of 50 characters. 
    # * `value`: A string that can be a maximum of 200 characters.
    # 
    # If you are using XML, the name/value pair is contained in a `nameValue` element. 
    NameValue[] documentFields?;
};

# This object contains details about the envelope transfer rule that you want to create.
public type EnvelopeTransferRuleRequest record {
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
    # Information about the group that triggers the transfer.
    Group[] fromGroups?;
    # Information about the user who triggers the transfer.
    UserInformation[] fromUsers?;
    # The UTC DateTime when the envelope transfer rule was last modified. This property is read-only.
    string modifiedDate?;
    # User information.
    UserInformation modifiedUser?;
    # This object contains details about a folder.
    Folder toFolder?;
    # User information.
    UserInformation toUser?;
};

# Contains information about an attachment.
public type Attachment record {
    # Valid values are `sender` and `senderAndAllRecipients`.
    string accessControl?;
    # The unique identifier for the attachment.
    string attachmentId?;
    # Specifies the type of the attachment for the recipient.
    string attachmentType?;
    # A Base64-encoded representation of the attachment that is used to upload and download the file. File attachments may be up to 50 MB in size.
    string data?;
    # A label for the attachment. Potential values include: 
    # 
    # - `guidedForm`: [Guided forms](https://www.docusign.com/products/guided-forms) provide a step-by-step, mobile-ready experience to help signers easily complete long or complex forms.
    # - `eventNotifications`: A list of envelope-level event statuses that trigger Connect to send updates to the endpoint specified in the `url` property. 
    string label?;
    # The name of the attachment.
    string name?;
    # The URL of a previously staged chunked upload. Using a chunked upload enables you to stage a large, chunkable temp file. You then use the `remoteUrl` property to reference the chunked upload as the content in attachment and document-related requests. The `remoteUrl` property cannot be used for downloads.
    string remoteUrl?;
};

# This response object contains information about the contacts associated with an account.
public type ContactGetResponse record {
    # A list of contacts.
    Contact[] contacts?;
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
public type Ssn4InformationInput record {
    # Specifies the display level for the recipient. Valid values are:
    # * `ReadOnly`
    # * `Editable`
    # * `DoNotDisplay`
    string displayLevelCode?;
    # A Boolean value that specifies whether the information must be returned in the response.
    string receiveInResponse?;
    # The last four digits of the recipient's Social Security Number (SSN).
    string ssn4?;
};

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
public type PrefillTabs record {
    # A list of
    # [Checkbox tabs][checkbox].
    # 
    # 
    # A Checkbox tab enables the recipient to select a yes/no (on/off) option. This value can be set.
    # 
    # 
    # [checkbox]:  /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    Checkbox[] checkboxTabs?;
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
    # A list of [Radio Group tabs][radioGroup].
    # 
    # A Radio Group tab places a group of radio buttons on a document. The `radios` property is used to add and place the radio
    # buttons associated with the group. Only one radio button can be selected in a group. This value can be set.
    # 
    # 
    # [radioGroup]: /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    RadioGroup[] radioGroupTabs?;
    # 
    SenderCompany[] senderCompanyTabs?;
    # 
    SenderName[] senderNameTabs?;
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
    # [Zip tabs][zip].
    # 
    # A Zip tab enables the recipient to enter a ZIP code. The ZIP code can be five digits or nine digits ( in ZIP+4 format), and can be entered with or without dashes. It uses the same parameters as a Text tab, with the validation message and pattern set for ZIP code information.  This value can be set.
    # 
    # 
    # [zip]: /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/
    Zip[] zipTabs?;
};

# A complex element that specifies the delayed routing settings for the workflow step.
public type DelayedRouting record {
    # The ISO 8601 timestamp of when the envelope is scheduled to be sent to the recipients associated with the workflow step. This property is `null` if the workflow step has not been initiated.
    # 
    # This property is read-only.
    string resumeDate?;
    # User-specified rules indicating how and when the envelope should sent for the workflow step and its associated recipients. Only one rule may be specified.
    EnvelopeDelayRule[] rules?;
    # Status of the delayed routing step. Valid values:
    # 
    # * `pending`: The workflow step has not been reached and the delay has not been initiated.
    # * `started`: The workflow step has begun and the delay is in progress. The envelope has not yet been sent to the workflow step's recipients.
    # * `completed`: The delay has elapsed and the envelope has been sent to the workflow step's recipients.
    # 
    # This property is read-only.
    string status?;
};

# A tab that allows the recipient to select a yes/no (on/off) option.
public type Checkbox record {
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
    # The DocuSign-generated custom tab ID for the custom tab to apply. This property can only be used when adding new tabs for a recipient. When used, the new tab inherits all custom tab properties.
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
    # When **true,** the signer cannot change the data of the custom tab.
    string locked?;
    # Metadata about a property.
    PropertyMetadata lockedMetadata?;
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
    # This property does not apply to `checkbox` tabs.
    # 
    # To require users to check
    # at least one, or at most some number
    # of checkboxes,
    # associate the checkbox tabs
    # with a [`tabGroup`][tabGroup].
    # Then set the following `tabGroup` properties:
    # 
    # - [`maximumAllowed`][maximumAllowed]
    # - [`minimumRequired`][minimumRequired]
    # - [`groupRule`][groupRule] specifies how the other two properties are interpreted.
    # 
    # You can find an example
    # at [Stack Overflow][so].
    # 
    # [so]:               https://stackoverflow.com/questions/58209376/checkbox-validation-using-docusign-rest-api/58210277#58210277
    # [tabGroup]:         /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/create/#definition__enveloperecipienttabs_tabgroups
    # [groupRule]:        /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/create/#definition__enveloperecipienttabs_tabgroups_grouprule
    # [maximumAllowed]:   /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/create/#definition__enveloperecipienttabs_tabgroups_maximumallowed
    # [minimumRequired]:  /docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/create/#definition__enveloperecipienttabs_tabgroups_minimumrequired
    string required?;
    # Metadata about a property.
    PropertyMetadata requiredMetadata?;
    # Optional element for field markup. When **true,** the signer is required to initial when they modify a shared field.
    string requireInitialOnSharedChange?;
    # Metadata about a property.
    PropertyMetadata requireInitialOnSharedChangeMetadata?;
    # When **true,** the checkbox is selected.
    string selected?;
    # Metadata about a property.
    PropertyMetadata selectedMetadata?;
    # 
    string selectedOriginal?;
    # Metadata about a property.
    PropertyMetadata selectedOriginalMetadata?;
    # When **true,** this tab is shared.
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
    # by (-7, -6)
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
    # by (-7, -6)
    string yPosition?;
    # Metadata about a property.
    PropertyMetadata yPositionMetadata?;
};

# The AccountBrands resource enables you to use account-level brands to customize the styles and text that recipients see.
public type AccountBrands record {
    # A list of brands.
    Brand[] brands?;
    # The brand that envelope recipients see when a brand is not explicitly set.
    string recipientBrandIdDefault?;
    # The brand that envelope senders see when a brand is not explicitly set.
    string senderBrandIdDefault?;
};

# Holds information about connected payment accounts.
public type PaymentGatewayAccountsInfo record {
    # A list of payment gateway accounts.
    PaymentGatewayAccount[] paymentGatewayAccounts?;
};

# 
public type FavoriteTemplatesContentItem record {
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # Time at which the template was marked as favorite.
    string favoritedDate?;
    # The ID of the template.
    string templateId?;
};

# This tab offers a list of options to choose from.
# The `listItems`
# property contains a list of
# [`listItem`](/docs/esign-rest-api/reference/envelopes/enveloperecipienttabs/create/)
# objects to specify the selectable options.
public type List record {
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
    # The list of values that can be selected by senders. The list values are separated by semi-colons. Example: [one;two;three;four]
    # 
    # Maximum Length of listItems:  2048 characters.
    # Maximum Length of items in the list: 100 characters. 
    ListItem[] listItems?;
    # The value in the list that is selected by default.
    string listSelectedValue?;
    # Metadata about a property.
    PropertyMetadata listSelectedValueMetadata?;
    # Allows you to customize locale settings.
    LocalePolicyTab localePolicy?;
    # When **true,** the signer cannot change the data of the custom tab.
    string locked?;
    # Metadata about a property.
    PropertyMetadata lockedMetadata?;
    # Contains information for transferring values between Salesforce data fields and DocuSign tabs.
    MergeField mergeField?;
    # Reserved for DocuSign.
    string mergeFieldXml?;
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
    # The value to use when the item is selected.
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

# An object for document generation responses.
public type DocGenFormFieldResponse record {
    # A list of `docGenFormFields` objects.
    DocGenFormFields[] docGenFormFields?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
};

# 
public type PowerFormFormDataEnvelope record {
    # The envelope ID of the envelope status that failed to post.
    string envelopeId?;
    # An array of recipient objects that provides details about the recipients of the envelope.
    PowerFormFormDataRecipient[] recipients?;
};

# An `accountCustomField` is an envelope custom field that you set at the account level.
# Applying custom fields enables account administrators to group and manage envelopes.
public type AccountCustomFields record {
    # An array of list custom fields.
    ListCustomField[] listCustomFields?;
    # An array of text custom fields.
    TextCustomField[] textCustomFields?;
};

# Template documents
public type TemplateDocuments record {
    # An array of document objects that contain information about the documents associated with the template.
    EnvelopeDocument[] templateDocuments?;
    # The ID of the template. If a value is not provided, DocuSign generates a value. 
    string templateId?;
};

# Contains information about an item on a billing invoice.
public type BillingInvoiceItem record {
    # Reserved for DocuSign.
    string chargeAmount?;
    # Reserved for DocuSign.
    string chargeName?;
    # Reserved for DocuSign.
    string invoiceItemId?;
    # The quantity of envelopes to add to the account.
    string quantity?;
    # 
    string taxAmount?;
    # 
    string taxExemptAmount?;
    # Reserved for DocuSign.
    string unitPrice?;
};

# 
public type TemplateTabs record {
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
public type CommentPublish record {
    # A unique ID for the Salesforce object.
    string id?;
    # An array of userIds that are mentioned directly in the body of a comment.
    string[] mentions?;
    # Specifies the text that is shown in the dropdown list. 
    string text?;
    # 
    record {|string...;|} threadAnchorKeys?;
    # The unique identifier for the comment thread.
    string threadId?;
    # 
    string[] visibleTo?;
};

# 
public type SigningGroupInformation record {
    # A collection group objects containing information about the groups.
    SigningGroup[] groups?;
};

# 
public type AccountSignatureDefinition record {
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
    # Optionally specify an external identifier for the user's signature.
    string externalID?;
    # Specificies the type of image. Valid values:
    # 
    # - `stamp_image`
    # - `signature_image`
    # - `initials_image`
    string imageType?;
    # Boolean that specifies whether the signature is the default signature for the user.
    string isDefault?;
    # The National Association of Realtors (NAR) membership ID for a user who is a realtor.
    string nrdsId?;
    # The realtor's last name.
    string nrdsLastName?;
    # The phonetic spelling of the `signatureName`.
    string phoneticName?;
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
    SignatureGroupDef[] signatureGroups?;
    # Specifies the signature ID associated with the signature name. You can use the signature ID in the URI in place of the signature name, and the value stored in the `signatureName` property in the body is used. This allows the use of special characters (such as "&", "<", ">") in a the signature name. Note that with each update to signatures, the returned signature ID might change, so the caller will need to trigger off the signature name to get the new signature ID.
    string signatureId?;
    # Specifies the user's signature in initials format.
    string signatureInitials?;
    # Specifies the user's signature name.
    string signatureName?;
    # Specifies the type of signature.
    string signatureType?;
    # 
    SignatureUserDef[] signatureUsers?;
    # The format of a stamp. Valid values are:
    # 
    # - `NameHanko`: The stamp represents only the signer's name.
    # - `NameDateHanko`: The stamp represents the signer's name and the date. 
    string stampFormat?;
    # The physical height of the stamp image (in millimeters) that the stamp vendor recommends for displaying the image in PDF documents.
    string stampSizeMM?;
};

# Information about a brand that is associated with an account. A brand applies custom styles and text to an envelope.
public type Brand record {
    # The name of the company associated with the brand.
    string brandCompany?;
    # The ID used to identify a specific brand in API calls.
    string brandId?;
    # An array of two-letter codes for the languages that you want to use with the brand. The supported languages are:
    # 
    # - Arabic (`ar`)
    # - Armenian (`hy`)
    # - Bahasa Indonesia (`id`)
    # - Bahasa Malay (`ms`)
    # - Bulgarian (`bg`)
    # - Chinese Simplified (`zh_CN`)
    # - Chinese Traditional (`zh_TW`)
    # - Croatian (`hr`)
    # - Czech (`cs`)
    # - Danish (`da`)
    # - Dutch (`nl`)
    # - English UK (`en_GB`)
    # - English US (`en`)
    # - Estonian (`et`)
    # - Farsi (`fa`)
    # - Finnish (`fi`)
    # - French (`fr`)
    # - French Canada (`fr_CA`)
    # - German (`de`)
    # - Greek (`el`)
    # - Hebrew (`he`)
    # - Hindi (`hi`)
    # - Hungarian (`hu`)
    # - Italian (`it`)
    # - Japanese (`ja`)
    # - Korean (`ko`)
    # - Latvian (`lv`)
    # - Lithuanian (`lt`)
    # - Norwegian (`no`)
    # - Polish (`pl`)
    # - Portuguese (`pt`)
    # - Portuguese Brasil (`pt_BR`)
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
    # - Ukranian (`uk`)
    # - Vietnamese (`vi`)
    string[] brandLanguages?;
    # The name of the brand.
    string brandName?;
    # An array of name-value pairs specifying the colors that the brand uses for the following elements:
    # 
    # - Button background
    # - Button text
    # - Header background
    # - Header text
    NameValue[] colors?;
    # The two-letter code for the language that you want to use as the brand default. The supported languages are:
    # 
    # - Arabic (`ar`)
    # - Armenian (`hy`)
    # - Bahasa Indonesia (`id`)
    # - Bahasa Malay (`ms`)
    # - Bulgarian (`bg`)
    # - Chinese Simplified (`zh_CN`)
    # - Chinese Traditional (`zh_TW`)
    # - Croatian (`hr`)
    # - Czech (`cs`)
    # - Danish (`da`)
    # - Dutch (`nl`)
    # - English UK (`en_GB`)
    # - English US (`en`)
    # - Estonian (`et`)
    # - Farsi (`fa`)
    # - Finnish (`fi`)
    # - French (`fr`)
    # - French Canada (`fr_CA`)
    # - German (`de`)
    # - Greek (`el`)
    # - Hebrew (`he`)
    # - Hindi (`hi`)
    # - Hungarian (`hu`)
    # - Italian (`it`)
    # - Japanese (`ja`)
    # - Korean (`ko`)
    # - Latvian (`lv`)
    # - Lithuanian (`lt`)
    # - Norwegian (`no`)
    # - Polish (`pl`)
    # - Portuguese (`pt`)
    # - Portuguese Brasil (`pt_BR`)
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
    # - Ukranian (`uk`)
    # - Vietnamese (`vi`)
    string defaultBrandLanguage?;
    # Deprecated.
    BrandEmailContent[] emailContent?;
    # This object describes errors that occur. It is only valid for responses and ignored in requests.
    ErrorDetails errorDetails?;
    # 
    string isOrganizationBrand?;
    # When **true,** the `brandCompany` property is overriding the name of the company in the account settings.
    boolean isOverridingCompanyName?;
    # When **true,** the sending brand is the default brand for sending new envelopes.
    boolean isSendingDefault?;
    # When **true,** the siging brand is the default brand for the signing experience.
    boolean isSigningDefault?;
    # An array of name/value pairs specifying the pages to which the user is redirected after the following events occur:
    # 
    # - Signing Completed
    # - Viewed Exit
    # - Finish Later
    # - Decline
    # - Session Timeout
    # - Authentication Failure
    # 
    # If you do not specify landing pages, the DocuSign default pages are used.
    NameValue[] landingPages?;
    # An array of `brandLink` objects that contain information about the links that the brand uses.
    BrandLink[] links?;
    # The URIs for retrieving the logos that are associated with the brand.
    # 
    # These are read-only properties that provide a URI to logos in use.
    # To update a logo use
    # [AccountBrands: updateLogo](/docs/esign-rest-api/reference/accounts/accountbrands/updatelogo/).
    BrandLogos logos?;
    # 
    string organizationBrandLogo?;
    # Brands use resource files to style the following experiences: 
    # 
    # - Email
    # - Sending
    # - Signing
    # - Captive (embedded) signing 
    # 
    # You can modify these resource files to customize these experiences.
    BrandResourceUrls resources?;
};
