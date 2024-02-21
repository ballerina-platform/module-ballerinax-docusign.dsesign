// Copyright (c) 2024, WSO2 LLC. (http://www.wso2.com) All Rights Reserved.
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

import ballerina/io;
import ballerina/lang.array;
import ballerina/os;
import ballerinax/docusign.dsesign;

configurable string accountId = os:getEnv("ACCOUNT_ID");
configurable string userId = os:getEnv("USER_ID");
configurable string clientId = os:getEnv("CLIENT_ID");
configurable string clientSecret = os:getEnv("CLIENT_SECRET");
configurable string refreshToken = os:getEnv("REFRESH_TOKEN");
configurable string refreshUrl = os:getEnv("REFRESH_URL");

public function main() returns error? {
    dsesign:Client docusignClient = check new (
        {
            auth: {
                clientId: clientId,
                clientSecret: clientSecret,
                refreshToken: refreshToken,
                refreshUrl: refreshUrl
            }
        },
        serviceUrl = "https://demo.docusign.net/restapi/"
    );

    string base64Encoded = array:toBase64(check io:fileReadBytes("./resources/README.pdf"));
    string documentId = "1";

    dsesign:EnvelopeSummary envResult = check docusignClient->/accounts/[accountId]/envelopes.post({
        documents: [
            {
                documentBase64: base64Encoded,
                documentId: documentId,
                fileExtension: "pdf",
                name: "document"
            }
        ],
        emailSubject: "Simple Signing Example",
        recipients: {
            signers: [
                {
                    email: "randomtester12@corp.com",
                    name: "randomtester12",
                    recipientId: "12",
                    tabs: {
                        signHereTabs: [
                            {
                                xPosition: "100",
                                yPosition: "100",
                                documentId: documentId,
                                pageNumber: "1",
                                height: "10"
                            }
                        ]
                    }
                }
            ]
        },
        status: "sent"
    });

    io:println(envResult);

    string? envelopeId = envResult.envelopeId;
    if envelopeId is () {
        return error("Envelope ID is not available");
    }

    dsesign:EnvelopeDocumentsResult envelopeDocumentsResult = check docusignClient->/accounts/[accountId]/envelopes/[envelopeId]/documents();
    io:println(envelopeDocumentsResult);
}
