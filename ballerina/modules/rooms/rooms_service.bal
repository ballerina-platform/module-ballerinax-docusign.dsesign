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

listener http:Listener ep0 = new (9095, config = {host: "localhost"});

service /restapi on ep0 {
    # Gets account information.
    #
    # + accountId - The globally unique identifier (GUID) for the account. 
    # + return - returns can be any of following types
    # string (AccountSummary)
    # BadRequestStringApierrorXml (Bad request. See ErrorCode and Message for details)
    # UnauthorizedStringApierrorXml (Not authorized to make this request.)
    resource function get v2/accounts/[string accountId]() returns string|AccountSummary|xml|BadRequestStringApierrorXml|UnauthorizedStringApierrorXml {
        AccountSummary accountSummary = {
            companyId: 12345,
            name: "WSO2 LLC",
            companyVersion: "v6",
            docuSignAccountGuid: "b6f8cd3e-98a4-4d8e-b2a2-6e2d3e5572d2",
            defaultFieldSetId: "abc123",
            requireOfficeLibraryAssignments: true
        };
        return accountSummary;
    }
}
