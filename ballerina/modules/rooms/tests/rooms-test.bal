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

import ballerina/test;

Client docuSignClient = test:mock(Client);

@test:BeforeSuite
function initializeClientsForMockServer() returns error? {
    docuSignClient = check new(
        {
            authorization: "de0d6e8d-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
        },
        {
            timeout: 10000,
            auth: {
                token: "eyJ0eXAiOiJNVCIsImFsZyI6IlJTMjU2I"
            }
        },
        serviceUrl = "http://localhost:9095/restapi"
    );
}

@test:Config {
    groups: ["account"]
}
function testGetAccountDetails() returns error? {
    string account_id = "de0d6e8d-xxxx-xxxx-xxxx-xxxxxxxxxxxx";
    AccountSummary response = check docuSignClient->/v2/accounts/[account_id];
    test:assertEquals(response.companyVersion, "v6");
}
