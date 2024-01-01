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

listener http:Listener ep0 = new (9090, config = {host: "localhost"});

service /restapi on ep0 {
    resource isolated function get service_information() returns ServiceInformation|error {
        ServiceInformation response = {
            buildBranch: "main",
            buildBranchDeployedDateTime: "2022-01-01T00:00:00Z",
            buildSHA: "abcdef123456",
            buildVersion: "1.0.0",
            linkedSites: ["site1", "site2"],
            serviceVersions: [
                {
                    version: "v1",
                    versionUrl: "https://api.example.com/restapi/v1"
                    
                },
                {
                    version: "v2",
                    versionUrl: "https://api.example.com/restapi/v1"
                }
            ]
        };
        return response;
    }

    resource isolated function post accounts/[string accountId]/users/[string userId]/signatures(UserSignaturesInformation payload) returns UserSignaturesInformation|error {
        UserSignaturesInformation userSignInfo = {
            userSignatures: [
                {
                    signatureFont: (<UserSignature[]>payload.userSignatures)[0].signatureFont,
                    signatureId: (<UserSignature[]>payload.userSignatures)[0].signatureId,
                    signatureInitials: (<UserSignature[]>payload.userSignatures)[0].signatureInitials,
                    signatureName: (<UserSignature[]>payload.userSignatures)[0].signatureName,
                    signatureType: (<UserSignature[]>payload.userSignatures)[0].signatureType
                }
            ]
        };
        return userSignInfo;
    }

    resource isolated function get accounts/[string accountId]/users/[string userId]/signatures/[string signatureId]() returns UserSignature|error {
        UserSignature userSign = {
                signatureFont: "Arial",
                signatureId: signatureId,
                signatureInitials: "JD",
                signatureName: "John Doe",
                signatureType: "Electronic"
        };
        return userSign;        
    }

    resource isolated function put accounts/[string accountId]/users/[string userId]/signatures/[string signatureId](UserSignature payload) returns UserSignature|error {
        UserSignature userSign = {
                signatureFont: (<UserSignature>payload).signatureFont,
                signatureId: (<UserSignature>payload).signatureId,
                signatureInitials: (<UserSignature>payload).signatureInitials,
                signatureName: (<UserSignature>payload).signatureName,
                signatureType: (<UserSignature>payload).signatureType
        };
        return userSign;
    }

    resource isolated function delete accounts/[string accountId]/users/[string userId]/signatures/[string signatureId]() returns http:Response|error? {
        http:Response response = new;
        response.statusCode = 204;
        return response;
    }

    resource isolated function get accounts/[string accountId]/users/[string userId]/signatures(string? stamp_type = ()) returns UserSignaturesInformation|error {
        UserSignaturesInformation userSignInfo = {
            userSignatures: [
                {
                    signatureFont: "Arial",
                    signatureId: "123456",
                    signatureInitials: "JD",
                    signatureName: "John Doe",
                    signatureType: "Electronic"
                }
            ]
        };
        return userSignInfo;
    }

    resource isolated function post accounts/[string accountId]/users/[string userId]/signatures/batch(UserSignaturesInformation payload) returns UserSignaturesInformation|error {
        UserSignaturesInformation userSignInfo = {
            userSignatures: [
                {
                    signatureFont: (<UserSignature[]>payload.userSignatures)[0].signatureFont,
                    signatureId: (<UserSignature[]>payload.userSignatures)[0].signatureId,
                    signatureInitials: (<UserSignature[]>payload.userSignatures)[0].signatureInitials,
                    signatureName: (<UserSignature[]>payload.userSignatures)[0].signatureName,
                    signatureType: (<UserSignature[]>payload.userSignatures)[0].signatureType
                }
            ]
        };
        return userSignInfo;
    }
}
