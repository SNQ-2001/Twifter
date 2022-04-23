//
//  Users.swift
//  
//
//  Created by 宮本大新 on 2022/04/23.
//

import Foundation

extension Twifter {
    /**
     GET users/lookup

     - Note: Returns fully-hydrated user objects for up to 100 users per request, as specified by comma-separated values passed to the user_id and/or screen_name parameters.

     - Parameters:
       - user_id: A comma separated list of user IDs, up to 100 are allowed in a single request. You are strongly encouraged to use a POST for larger requests.
       - include_entities: The entities node that may appear within embedded statuses will not be included when set to false.
       - tweet_mode: Valid request values are compat and extended, which give compatibility mode and extended mode, respectively for Tweets that contain over 140 characters

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-users-lookup
     */
    public func users_lookup(user_id: [Int], include_entities: Bool? = nil, tweet_mode: Bool? = nil) async throws -> [[String: Any]] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/users/lookup.json"
        var user_id_list: [String] = []
        for i in user_id {
            user_id_list.append(String(i))
        }
        let query: String = user_id_list.joined(separator: ",").addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!
        urlString = "\(urlString)?user_id=\(query)"
        if include_entities != nil {
            urlString = "\(urlString)&include_entities=\(include_entities!)"
        }
        if tweet_mode != nil {
            urlString = "\(urlString)&tweet_mode=\(tweet_mode!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
        return result ?? [[:]]
    }


    /**
     GET users/lookup

     - Note: Returns fully-hydrated user objects for up to 100 users per request, as specified by comma-separated values passed to the user_id and/or screen_name parameters.

     - Parameters:
       - screen_name: A comma separated list of screen names, up to 100 are allowed in a single request. You are strongly encouraged to use a POST for larger (up to 100 screen names) requests.
       - include_entities: The entities node that may appear within embedded statuses will not be included when set to false.
       - tweet_mode: Valid request values are compat and extended, which give compatibility mode and extended mode, respectively for Tweets that contain over 140 characters

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-users-lookup
     */
    public func users_lookup(screen_name: [String], include_entities: Bool? = nil) async throws -> [[String: Any]] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/users/lookup.json"
        let query: String = screen_name.joined(separator: ",").addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!
        urlString = "\(urlString)?screen_name=\(query)"
        if include_entities != nil {
            urlString = "\(urlString)&include_entities=\(include_entities!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
        return result ?? [[:]]
    }


    /**
     GET users/search

     - Note: Provides a simple, relevance-based search interface to public user accounts on Twitter. Try querying by topical interest, full name, company name, location, or other criteria. Exact match searches are not supported.

     - Parameters:
       - q: The search query to run against people search.
       - page: Specifies the page of results to retrieve.
       - count: The number of potential user results to retrieve per page. This value has a maximum of 20.
       - include_entities: The entities node will not be included in embedded Tweet objects when set to false .

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-users-search
     */
    public func users_search(q: String, page: Int? = nil, count: Int? = nil, include_entities: Bool? = nil) async throws -> [[String: Any]] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/users/search.json?q=\(q.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        if page != nil {
            urlString = "\(urlString)&page=\(page!)"
        }
        if count != nil {
            urlString = "\(urlString)&count=\(count!)"
        }
        if include_entities != nil {
            urlString = "\(urlString)&include_entities=\(include_entities!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
        return result ?? [[:]]
    }


    /**
     GET users/search

     - Note: Returns a variety of information about the user specified by the required user_id or screen_name parameter. The author's most recent Tweet will be returned inline when possible.

     - Parameters:
       - user_id: The ID of the user for whom to return results. Either an id or screen_name is required for this method.
       - include_entities: The entities node will not be included when set to false.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-users-show
     */
    public func user_show(user_id: Int, include_entities: Bool? = nil) async throws -> [String: Any] {
        let guest_token = try await generate_guest_token().guest_token
        let urlString: String = "https://api.twitter.com/1.1/users/show.json?user_id=\(user_id)"
        let data = try await get(url: urlString, guest_token: guest_token)
        let user_info = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return user_info ?? [:]
    }


    /**
     GET users/search

     - Note: Returns a variety of information about the user specified by the required user_id or screen_name parameter. The author's most recent Tweet will be returned inline when possible.

     - Parameters:
       - screen_name: The screen name of the user for whom to return results. Either a id or screen_name is required for this method.
       - include_entities: The entities node will not be included when set to false.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-users-show
     */
    public func user_show(screen_name: String, include_entities: Bool? = nil) async throws -> [String: Any] {
        let guest_token = try await generate_guest_token().guest_token
        let urlString: String = "https://api.twitter.com/1.1/users/show.json?screen_name=\(screen_name)"
        let data = try await get(url: urlString, guest_token: guest_token)
        let user_info = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return user_info ?? [:]
    }
}
