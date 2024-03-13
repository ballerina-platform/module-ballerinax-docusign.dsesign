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
configurable string serviceUrl = os:getEnv("SERVICE_URL");

public function main() returns error? {
    dsesign:Client docusignClient = check new (
        serviceUrl,
        {
            auth: {
                clientId: clientId,
                clientSecret: clientSecret,
                refreshToken: refreshToken,
                refreshUrl: refreshUrl
            }
        }
    );

    dsesign:UserSignaturesInformation addSignature = check docusignClient->/accounts/[accountId]/users/[userId]/signatures.post({
        userSignatures: [
            {
                imageBase64: array:toBase64(check io:fileReadBytes("./resources/signature.png")),
                signatureName: "test signature"
            }
        ]
    });
    io:println(addSignature);

    dsesign:UserSignaturesInformation usageSignatureInfo = check docusignClient->/accounts/[accountId]/users/[userId]/signatures("signature");
    io:println("All signatures: ", usageSignatureInfo);

    string signatureId = <string>(<dsesign:UserSignature[]>usageSignatureInfo.userSignatures)[0].signatureId;
    dsesign:UserSignature userSignature = check docusignClient->/accounts/[accountId]/users/[userId]/signatures/[signatureId];
    io:println("Signature Info: ", userSignature);
}
