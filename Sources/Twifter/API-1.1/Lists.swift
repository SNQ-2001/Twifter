//
//  Lists.swift
//  
//
//  Created by 宮本大新 on 2022/04/23.
//

import Foundation

public extension Client {
    /**
     GET lists/list

     - Note: Returns all lists the authenticating or specified user subscribes to, including their own.

     - Parameters:
       - user_id: The ID of the user for whom to return results. Helpful for disambiguating when a valid user ID is also a valid screen name. Note: : Specifies the ID of the user to get lists from. Helpful for disambiguating when a valid user ID is also a valid screen name.
       - reverse: Set this to true if you would like owned lists to be returned first. See description above for information on how this parameter works.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-list
     */
    public func lists_list(user_id: Int, reverse: Bool? = nil) async throws -> [String: Any] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/lists/list.json?user_id=\(user_id)"
        if reverse != nil {
            urlString = "\(urlString)&reverse=\(reverse!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return result ?? [:]
    }


    /**
     GET lists/list

     - Note: Returns all lists the authenticating or specified user subscribes to, including their own.

     - Parameters:
       - screen_name: The screen name of the user for whom to return results. Helpful for disambiguating when a valid screen name is also a user ID.
       - reverse: Set this to true if you would like owned lists to be returned first. See description above for information on how this parameter works.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-list
     */
    public func lists_list(screen_name: String, reverse: Bool? = nil) async throws -> [[String: Any]] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/lists/list.json?screen_name=\(screen_name.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        if reverse != nil {
            urlString = "\(urlString)&reverse=\(reverse!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
        return result ?? [[:]]
    }


    /**
     GET lists/members

     - Note: Returns the members of the specified list. Private list members will only be shown if the authenticated user owns the specified list.

     - Parameters:
       - list_id: The numerical id of the list.
       - count: Specifies the number of results to return per page (see cursor below). The default is 20, with a maximum of 5,000.
       - cursor: Causes the collection of list members to be broken into "pages" of consistent sizes (specified by the count parameter). If no cursor is provided, a value of -1 will be assumed, which is the first "page."
       - include_entities: The entities node will not be included when set to false.
       - skip_status: When set to either true, t or 1 statuses will not be included in the returned user objects.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-members
     */
    public func lists_members(list_id: Int, count: Int? = nil, cursor: String? = nil, include_entities: Bool? = nil, skip_status: Bool? = nil) async throws -> [String: Any] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/lists/members.json?list_id=\(list_id)"
        if count != nil {
            urlString = "\(urlString)&count=\(count!)"
        }
        if cursor != nil {
            urlString = "\(urlString)&cursor=\(cursor!.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        }
        if include_entities != nil {
            urlString = "\(urlString)&include_entities=\(include_entities!)"
        }
        if skip_status != nil {
            urlString = "\(urlString)&skip_status=\(skip_status!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return result ?? [:]
    }


    /**
     GET lists/memberships

     - Note: Returns the members of the specified list. Private list members will only be shown if the authenticated user owns the specified list.

     - Parameters:
       - user_id: The ID of the user for whom to return results. Helpful for disambiguating when a valid user ID is also a valid screen name.
       - count: The amount of results to return per page. Defaults to 20. No more than 1000 results will ever be returned in a single page.
       - cursor: Breaks the results into pages. Provide a value of -1 to begin paging. Provide values as returned in the response body's next_cursor and previous_cursor attributes to page back and forth in the list. It is recommended to always use cursors when the method supports them. See Cursoring for more information.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-memberships
     */
    public func lists_memberships(user_id: Int, count: Int? = nil, cursor: String? = nil) async throws -> [String: Any] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/lists/memberships.json?user_id=\(user_id)"
        if count != nil {
            urlString = "\(urlString)&count=\(count!)"
        }
        if cursor != nil {
            urlString = "\(urlString)&cursor=\(cursor!.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return result ?? [:]
    }


    /**
     GET lists/memberships

     - Note: Returns the members of the specified list. Private list members will only be shown if the authenticated user owns the specified list.

     - Parameters:
       - screen_name: The screen name of the user for whom to return results. Helpful for disambiguating when a valid screen name is also a user ID.
       - count: The amount of results to return per page. Defaults to 20. No more than 1000 results will ever be returned in a single page.
       - cursor: Breaks the results into pages. Provide a value of -1 to begin paging. Provide values as returned in the response body's next_cursor and previous_cursor attributes to page back and forth in the list. It is recommended to always use cursors when the method supports them. See Cursoring for more information.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-memberships
     */
    public func lists_memberships(screen_name: String, count: Int? = nil, cursor: String? = nil) async throws -> [String: Any] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/lists/memberships.json?screen_name=\(screen_name.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        if count != nil {
            urlString = "\(urlString)&count=\(count!)"
        }
        if cursor != nil {
            urlString = "\(urlString)&cursor=\(cursor!.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return result ?? [:]
    }


    /**
     GET lists/ownerships

     - Note: Returns the lists owned by the specified Twitter user. Private lists will only be shown if the authenticated user is also the owner of the lists.

     - Parameters:
       - user_id: The ID of the user for whom to return results. Helpful for disambiguating when a valid user ID is also a valid screen name.
       - count: The amount of results to return per page. Defaults to 20. No more than 1000 results will ever be returned in a single page.
       - cursor: Breaks the results into pages. Provide a value of -1 to begin paging. Provide values as returned in the response body's next_cursor and previous_cursor attributes to page back and forth in the list. It is recommended to always use cursors when the method supports them. See Cursoring for more information.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-ownerships
     */
    public func lists_ownerships(user_id: Int, count: Int? = nil, cursor: String? = nil) async throws -> [String: Any] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/lists/ownerships.json?user_id=\(user_id)"
        if count != nil {
            urlString = "\(urlString)&count=\(count!)"
        }
        if cursor != nil {
            urlString = "\(urlString)&cursor=\(cursor!.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return result ?? [:]
    }


    /**
     GET lists/ownerships

     - Note: Returns the lists owned by the specified Twitter user. Private lists will only be shown if the authenticated user is also the owner of the lists.

     - Parameters:
       - screen_name: The screen name of the user for whom to return results. Helpful for disambiguating when a valid screen name is also a user ID.
       - count: The amount of results to return per page. Defaults to 20. No more than 1000 results will ever be returned in a single page.
       - cursor: Breaks the results into pages. Provide a value of -1 to begin paging. Provide values as returned in the response body's next_cursor and previous_cursor attributes to page back and forth in the list. It is recommended to always use cursors when the method supports them. See Cursoring for more information.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-ownerships
     */
    public func lists_ownerships(screen_name: String, count: Int? = nil, cursor: String? = nil) async throws -> [String: Any] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/lists/ownerships.json?screen_name=\(screen_name.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        if count != nil {
            urlString = "\(urlString)&count=\(count!)"
        }
        if cursor != nil {
            urlString = "\(urlString)&cursor=\(cursor!.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return result ?? [:]
    }


    /**
     GET lists/show

     - Note: Returns the specified list. Private lists will only be shown if the authenticated user owns the specified list.

     - Parameters:
       - list_id: The numerical id of the list.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-show
     */
    public func lists_show(list_id: Int) async throws -> [String: Any] {
        let guest_token = try await generate_guest_token().guest_token
        let urlString: String = "https://api.twitter.com/1.1/lists/show.json?list_id=\(list_id)"
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return result ?? [:]
    }


    /**
     GET lists/statuses

     - Note: Returns a timeline of tweets authored by members of the specified list. Retweets are included by default. Use the include_rts=false parameter to omit retweets.

     - Parameters:
       - list_id: The numerical id of the list.
       - since_id: Returns results with an ID greater than (that is, more recent than) the specified ID. There are limits to the number of Tweets which can be accessed through the API. If the limit of Tweets has occured since the since_id, the since_id will be forced to the oldest ID available.
       - max_id: Returns results with an ID less than (that is, older than) or equal to the specified ID.
       - count: Specifies the number of results to retrieve per "page."
       - include_entities: Entities are ON by default in API 1.1, each tweet includes a node called "entities". This node offers a variety of metadata about the tweet in a discreet structure, including: user_mentions, urls, and hashtags. You can omit entities from the result by using include_entities=false
       - include_rts: When set to either true , t or 1 , the list timeline will contain native retweets (if they exist) in addition to the standard stream of tweets. The output format of retweeted tweets is identical to the representation you see in home_timeline.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-statuses
     */
    public func lists_statuses(list_id: Int, since_id: Int? = nil, max_id: Int? = nil, count: Int? = nil, include_entities: Bool? = nil, include_rts: Bool? = nil) async throws -> [[String: Any]] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/lists/statuses.json?list_id=\(list_id)"
        if since_id != nil {
            urlString = "\(urlString)&since_id=\(since_id!)"
        }
        if max_id != nil {
            urlString = "\(urlString)&max_id=\(max_id!)"
        }
        if count != nil {
            urlString = "\(urlString)&count=\(count!)"
        }
        if include_entities != nil {
            urlString = "\(urlString)&include_entities=\(include_entities!)"
        }
        if include_rts != nil {
            urlString = "\(urlString)&include_rts=\(include_rts!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
        return result ?? [[:]]
    }


    /**
     GET lists/subscribers

     - Note: Returns the subscribers of the specified list. Private list subscribers will only be shown if the authenticated user owns the specified list.

     - Parameters:
       - list_id: The numerical id of the list.
       - count: Specifies the number of results to return per page (see cursor below). The default is 20, with a maximum of 5,000.
       - cursor: Breaks the results into pages. A single page contains 20 lists. Provide a value of -1 to begin paging. Provide values as returned in the response body's next_cursor and previous_cursor attributes to page back and forth in the list. See Using cursors to navigate collections for more information.
       - include_entities: When set to either true , t or 1 , each tweet will include a node called "entities". This node offers a variety of metadata about the tweet in a discreet structure, including: user_mentions, urls, and hashtags. While entities are opt-in on timelines at present, they will be made a default component of output in the future. See Tweet Entities for more details.
       - skip_status: When set to either true , t or 1 statuses will not be included in the returned user objects.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-subscribers
     */
    public func lists_subscribers(list_id: Int, count: Int? = nil, cursor: String? = nil, include_entities: Bool? = nil, skip_status: Bool? = nil) async throws -> [String: Any] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/lists/subscribers.json?list_id=\(list_id)"
        if count != nil {
            urlString = "\(urlString)&count=\(count!)"
        }
        if cursor != nil {
            urlString = "\(urlString)&cursor=\(cursor!.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        }
        if include_entities != nil {
            urlString = "\(urlString)&include_entities=\(include_entities!)"
        }
        if skip_status != nil {
            urlString = "\(urlString)&skip_status=\(skip_status!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return result ?? [:]
    }


    /**
     GET lists/subscriptions

     - Note: Obtain a collection of the lists the specified user is subscribed to, 20 lists per page by default. Does not include the user's own lists.

     - Parameters:
       - user_id: The ID of the user for whom to return results. Helpful for disambiguating when a valid user ID is also a valid screen name.
       - count: The amount of results to return per page. Defaults to 20. No more than 1000 results will ever be returned in a single page.
       - cursor: Breaks the results into pages. Provide a value of -1 to begin paging. Provide values as returned in the response body's next_cursor and previous_cursor attributes to page back and forth in the list. It is recommended to always use cursors when the method supports them. See Cursoring for more information.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-subscriptions
     */
    public func lists_subscriptions(user_id: Int, count: Int? = nil, cursor: String? = nil) async throws -> [String: Any] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/lists/subscriptions.json?user_id=\(user_id)"
        if count != nil {
            urlString = "\(urlString)&count=\(count!)"
        }
        if cursor != nil {
            urlString = "\(urlString)&cursor=\(cursor!.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return result ?? [:]
    }


    /**
     GET lists/subscriptions

     - Note: Obtain a collection of the lists the specified user is subscribed to, 20 lists per page by default. Does not include the user's own lists.

     - Parameters:
       - screen_name: The screen name of the user for whom to return results. Helpful for disambiguating when a valid screen name is also a user ID.
       - count: The amount of results to return per page. Defaults to 20. No more than 1000 results will ever be returned in a single page.
       - cursor: Breaks the results into pages. Provide a value of -1 to begin paging. Provide values as returned in the response body's next_cursor and previous_cursor attributes to page back and forth in the list. It is recommended to always use cursors when the method supports them. See Cursoring for more information.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-subscriptions
     */
    public func lists_subscriptions(screen_name: String, count: Int? = nil, cursor: String? = nil) async throws -> [String: Any] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/lists/subscriptions.json?screen_name=\(screen_name.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        if count != nil {
            urlString = "\(urlString)&count=\(count!)"
        }
        if cursor != nil {
            urlString = "\(urlString)&cursor=\(cursor!.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return result ?? [:]
    }
}

