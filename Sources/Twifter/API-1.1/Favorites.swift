//
//  Favorites.swift
//  
//
//  Created by 宮本大新 on 2022/04/23.
//

import Foundation

public extension Client {
    /**
     GET favorites/list

     - Note: Returns the 20 most recent Tweets liked by the authenticating or specified user.

     - Parameters:
       - user_id: The ID of the user for whom to return results.
       - count: Specifies the number of records to retrieve. Must be less than or equal to 200; defaults to 20. The value of count is best thought of as a limit to the number of Tweets to return because suspended or deleted content is removed after the count has been applied.
       - since_id: Returns results with an ID greater than (that is, more recent than) the specified ID. There are limits to the number of Tweets which can be accessed through the API. If the limit of Tweets has occured since the since_id, the since_id will be forced to the oldest ID available.
       - max_id: Returns results with an ID less than (that is, older than) or equal to the specified ID.
       - include_entities: The entities node will be omitted when set to false .

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-favorites-list
     */
    public func favorites_list(user_id: String, count: Int? = nil, since_id: Int? = nil, max_id: Int? = nil, include_entities: Bool? = nil) async throws -> [[String: Any]] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/favorites/list.json?user_id=\(user_id)"
        if count != nil {
            urlString = "\(urlString)&count=\(count!)"
        }
        if since_id != nil {
            urlString = "\(urlString)&since_id=\(since_id!)"
        }
        if max_id != nil {
            urlString = "\(urlString)&max_id=\(max_id!)"
        }
        if include_entities != nil {
            urlString = "\(urlString)&include_entities=\(include_entities!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
        return result ?? [[:]]
    }


    /**
     GET favorites/list

     - Note: Returns the 20 most recent Tweets liked by the authenticating or specified user.

     - Parameters:
       - screen_name: The screen name of the user for whom to return results.
       - count: Specifies the number of records to retrieve. Must be less than or equal to 200; defaults to 20. The value of count is best thought of as a limit to the number of Tweets to return because suspended or deleted content is removed after the count has been applied.
       - since_id: Returns results with an ID greater than (that is, more recent than) the specified ID. There are limits to the number of Tweets which can be accessed through the API. If the limit of Tweets has occured since the since_id, the since_id will be forced to the oldest ID available.
       - max_id: Returns results with an ID less than (that is, older than) or equal to the specified ID.
       - include_entities: The entities node will be omitted when set to false .

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-favorites-list
     */
    public func favorites_list(screen_name: String, count: Int? = nil, since_id: Int? = nil, max_id: Int? = nil, include_entities: Bool? = nil) async throws -> [[String: Any]] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/favorites/list.json?screen_name=\(screen_name.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        if count != nil {
            urlString = "\(urlString)&count=\(count!)"
        }
        if since_id != nil {
            urlString = "\(urlString)&since_id=\(since_id!)"
        }
        if max_id != nil {
            urlString = "\(urlString)&max_id=\(max_id!)"
        }
        if include_entities != nil {
            urlString = "\(urlString)&include_entities=\(include_entities!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
        return result ?? [[:]]
    }
}
