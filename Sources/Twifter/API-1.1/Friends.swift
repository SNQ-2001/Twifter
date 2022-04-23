//
//  Friends.swift
//  
//
//  Created by 宮本大新 on 2022/04/23.
//

import Foundation

public extension Client {
    /**
     GET friends/ids

     - Note: Returns a cursored collection of user IDs for every user the specified user is following (otherwise known as their "friends").

     - Parameters:
       - user_id: The ID of the user for whom to return results.
       - cursor: See official documentation
       - stringify_ids: Some programming environments will not consume Twitter IDs due to their size. Provide this option to have IDs returned as strings instead. More about Twitter IDs.
       - count: Specifies the number of IDs attempt retrieval of, up to a maximum of 5,000 per distinct request. The value of count is best thought of as a limit to the number of results to return. When using the count parameter with this method, it is wise to use a consistent count value across all requests to the same user's collection. Usage of this parameter is encouraged in environments where all 5,000 IDs constitutes too large of a response.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friends-ids
     */
    public func friends_ids(user_id: Int, cursor: String? = nil, stringify_ids: Bool? = nil, count: Int? = nil) async throws -> [String: Any] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/friends/ids.json?user_id=\(user_id)"
        if cursor != nil {
            urlString = "\(urlString)&cursor=\(cursor!.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        }
        if stringify_ids != nil {
            urlString = "\(urlString)&stringify_ids=\(stringify_ids!)"
        }
        if count != nil {
            urlString = "\(urlString)&count=\(count!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return result ?? [:]
    }


    /**
     GET friends/ids

     - Note: Returns a cursored collection of user IDs for every user the specified user is following (otherwise known as their "friends").

     - Parameters:
       - screen_name: The screen name of the user for whom to return results.
       - cursor: See official documentation
       - stringify_ids: Some programming environments will not consume Twitter IDs due to their size. Provide this option to have IDs returned as strings instead. More about Twitter IDs.
       - count: Specifies the number of IDs attempt retrieval of, up to a maximum of 5,000 per distinct request. The value of count is best thought of as a limit to the number of results to return. When using the count parameter with this method, it is wise to use a consistent count value across all requests to the same user's collection. Usage of this parameter is encouraged in environments where all 5,000 IDs constitutes too large of a response.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friends-ids
     */
    public func friends_ids(screen_name: String, cursor: String? = nil, stringify_ids: Bool? = nil, count: Int? = nil) async throws -> [String: Any] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/friends/ids.json?screen_name=\(screen_name.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        if cursor != nil {
            urlString = "\(urlString)&cursor=\(cursor!.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        }
        if stringify_ids != nil {
            urlString = "\(urlString)&stringify_ids=\(stringify_ids!)"
        }
        if count != nil {
            urlString = "\(urlString)&count=\(count!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return result ?? [:]
    }


    /**
     GET friends/list

     - Note: Returns a cursored collection of user objects for every user the specified user is following (otherwise known as their "friends").

     - Parameters:
       - user_id: The ID of the user for whom to return results.
       - cursor: See official documentation
       - count: The number of users to return per page, up to a maximum of 200.
       - skip_status: When set to either true, t or 1 statuses will not be included in the returned user objects.
       - include_user_entities: The user object entities node will not be included when set to false.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friends-list
     */
    public func friends_list(user_id: Int, cursor: String? = nil, count: Int? = nil, skip_status: Bool? = nil, include_user_entities: Bool? = nil) async throws -> [String: Any] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/friends/list.json?user_id=\(user_id)"
        if cursor != nil {
            urlString = "\(urlString)&cursor=\(cursor!.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        }
        if count != nil {
            urlString = "\(urlString)&count=\(count!)"
        }
        if skip_status != nil {
            urlString = "\(urlString)&skip_status=\(skip_status!)"
        }
        if include_user_entities != nil {
            urlString = "\(urlString)&include_user_entities=\(include_user_entities!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return result ?? [:]
    }


    /**
     GET friends/list

     - Note: Returns a cursored collection of user objects for every user the specified user is following (otherwise known as their "friends").

     - Parameters:
       - screen_name: The screen name of the user for whom to return results.
       - cursor: See official documentation
       - count: The number of users to return per page, up to a maximum of 200.
       - skip_status: When set to either true, t or 1 statuses will not be included in the returned user objects.
       - include_user_entities: The user object entities node will not be included when set to false.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friends-list
     */
    public func friends_list(screen_name: String, cursor: String? = nil, count: Int? = nil, skip_status: Bool? = nil, include_user_entities: Bool? = nil) async throws -> [String: Any] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/friends/list.json?screen_name=\(screen_name.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        if cursor != nil {
            urlString = "\(urlString)&cursor=\(cursor!.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        }
        if count != nil {
            urlString = "\(urlString)&count=\(count!)"
        }
        if skip_status != nil {
            urlString = "\(urlString)&skip_status=\(skip_status!)"
        }
        if include_user_entities != nil {
            urlString = "\(urlString)&include_user_entities=\(include_user_entities!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return result ?? [:]
    }
}
