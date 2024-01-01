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

service /management on new http:Listener(9091) {
    # Returns a list of organizations that the authenticated user belongs to.
    #
    # + mode - Specifies how to select the organizations. Valid values: - `org_admin`: Returns organizations for which the authenticated user is an admin. - `account_membership`: Returns organizations that contain an account of which the authenticated user is a member Default value: `org_admin` 
    # + return - OK 
    resource function get v2/organizations(string? mode) returns OrganizationsResponse {
        OrganizationsResponse organizationsResponse = {
            organizations: [
                {
                    id: "org1",
                    name: "Organization 1",
                    default_account_id: "acc1"
                }
            ]
        };
        return organizationsResponse;
    }
}
