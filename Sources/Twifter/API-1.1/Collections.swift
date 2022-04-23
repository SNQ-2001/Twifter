//
//  Collections.swift
//  
//
//  Created by 宮本大新 on 2022/04/23.
//

import Foundation

extension Client {
    /**
     GET collections/entries

     - Note: Retrieve the identified Collection, presented as a list of the Tweets curated within.

     - Parameters:
       - id: The identifier of the Collection for which to return results.
       - count: Specifies the maximum number of results to include in the response. Specify a count between 1 and 200. A next_cursor value will be provided in the response if additional results are available.
       - max_position: Returns results with a position value less than or equal to the specified position.
       - min_position: Returns results with a position greater than the specified position.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/tweets/curate-a-collection/api-reference/get-collections-entries
     */
    public func collections_entries(id: String, count: Int? = nil, max_position: Int? = nil, min_position: Int? = nil) async throws -> [String: Any] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/collections/entries.json?id=\(id.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        if count != nil {
            urlString = "\(urlString)&count=\(count!)"
        }
        if max_position != nil {
            urlString = "\(urlString)&max_position=\(max_position!)"
        }
        if min_position != nil {
            urlString = "\(urlString)&min_position=\(min_position!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return result ?? [:]
    }
}

