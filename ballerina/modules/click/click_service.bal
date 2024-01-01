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

listener http:Listener ep0 = new (9092, config = {host: "localhost"});

service /clickapi on new http:Listener(9092) {
    # Gets the current version and other information about the Click API.
    #
    # + return - returns can be any of following types
    # anydata (Successful response.)
    # BadRequestAnydata (Error encountered.)
    resource function get service_information() returns anydata {
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
}
