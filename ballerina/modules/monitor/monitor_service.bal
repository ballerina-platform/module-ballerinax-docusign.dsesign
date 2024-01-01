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

listener http:Listener ep0 = new (9094, config = {host: "localhost"});

service /restapi on ep0 {
    # Gets customer event data for an organization.
    #
    # + version - Must be `2`. 
    # + dataSetName - Must be `monitor`. 
    # + cursor - Specifies a pointer into the dataset where your query will begin. You can either provide an ISO DateTime or a string cursor (from the `endCursor` value in the response). If no value is provided, the query begins from seven days ago. For example, to fetch event data beginning from January 1, 2022, set this value to `2022-01-01T00:00:00Z`. The response will include data about events starting from that date in chronological order. The response also includes an `endCursor` property. To fetch the next page of event data, call this endpoint again with `cursor` set to the previous `endCursor` value. 
    # + 'limit - The maximum number of records to return. The default value is 1000. 
    # + return - Success 
    resource function get api/[string version]/datasets/[string dataSetName]/'stream(string? cursor, int:Signed32 'limit = 1000) returns CursoredResult {
        CursoredResult cursoredRes = {
            endCursor: "your_end_cursor_value",
            data: []
        };
        return cursoredRes;
    }
}
