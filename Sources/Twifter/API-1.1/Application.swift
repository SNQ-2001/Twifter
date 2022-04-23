//
//  Application.swift
//  
//
//  Created by 宮本大新 on 2022/04/23.
//

import Foundation

extension Twifter {
    /**
     GET application/rate_limit_status

     - Note: Returns the current rate limits for methods belonging to the specified resource families.

     - Parameters:
       - resources: A comma-separated list of resource families you want to know the current rate limit disposition for.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/developer-utilities/rate-limit-status/api-reference/get-application-rate_limit_status
     */
    public func rate_limit_status(resources: [Resources]? = nil) async throws -> [String: Any] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/application/rate_limit_status.json"
        if resources != nil {
            var queryList: [String] = []
            for i in resources! {
                queryList.append(i.rawValue)
            }
            let query: String = queryList.joined(separator: ",").addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!
            urlString = "\(urlString)?resources=\(query)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return result ?? [:]
    }
}
