//
//  File.swift
//  
//
//  Created by 宮本大新 on 2022/04/23.
//

import Foundation

extension Client {
    /**
     GET statuses/lookup

     - Note: Returns fully-hydrated Tweet objects for up to 100 Tweets per request, as specified by comma-separated values passed to the id parameter.

     - Parameters:
       - id: A comma separated list of Tweet IDs, up to 100 are allowed in a single request.
       - include_entities: The entities node that may appear within embedded statuses will not be included when set to false.
       - trim_user: When set to either true , t or 1 , each Tweet returned in a timeline will include a user object including only the status authors numerical ID. Omit this parameter to receive the complete user object.
       - map: When using the map parameter, Tweets that do not exist or cannot be viewed by the current user will still have their key represented but with an explicitly null value paired with it

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-lookup
     */
    public func statuses_lookup(id: [Int], include_entities: Bool? = nil, trim_user: Bool? = nil, map: Bool? = nil) async throws -> [[String: Any]] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/statuses/lookup.json"
        if !id.isEmpty {
            var idList: [String] = []
            for i in id {
                idList.append(String(i))
            }
            let query: String = idList.joined(separator: ",").addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!
            urlString = "\(urlString)?id=\(query)"
        }
        if include_entities != nil {
            urlString = "\(urlString)&include_entities=\(include_entities!)"
        }
        if trim_user != nil {
            urlString = "\(urlString)&trim_user=\(trim_user!)"
        }
        if map != nil {
            urlString = "\(urlString)&map=\(map!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
        return result ?? [[:]]
    }


    /**
     GET statuses/retweeters/ids

     - Note: Returns a collection of up to 100 user IDs belonging to users who have retweeted the Tweet specified by the id parameter.

     - Parameters:
       - id: A comma separated list of Tweet IDs, up to 100 are allowed in a single request.
       - count: Specifies the number of records to retrieve. Must be less than or equal to 100.
       - cursor: See official documentation
       - stringify_ids: Many programming environments will not consume Tweet ids due to their size. Provide this option to have ids returned as strings instead.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-retweeters-ids
     */
    public func statuses_retweeters_ids(id: Int, cursor: String? = nil, stringify_ids: Bool? = nil) async throws -> [String: Any] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/statuses/retweeters/ids.json?id=\(id)"
        if cursor != nil {
            urlString = "\(urlString)&cursor=\(cursor!.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        }
        if stringify_ids != nil {
            urlString = "\(urlString)&stringify_ids=\(stringify_ids!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return result ?? [:]
    }


    /**
     GET statuses/retweets/:id

     - Note: Returns a collection of the 100 most recent retweets of the Tweet specified by the id parameter.

     - Parameters:
       - id: The numerical ID of the desired status.
       - count: Specifies the number of records to retrieve. Must be less than or equal to 100.
       - trim_user: When set to either true , t or 1 , each tweet returned in a timeline will include a user object including only the status authors numerical ID. Omit this parameter to receive the complete user object.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-retweets-id
     */
    public func statuses_retweets(id: Int, count: Int? = nil, trim_user: Bool? = nil) async throws -> [[String: Any]] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/statuses/retweets/\(id).json"
        if count != nil {
            urlString = "\(urlString)?count=\(count!)"
        }
        if trim_user != nil {
            urlString = "\(urlString)&trim_user=\(trim_user!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
        return result ?? [[:]]
    }


    /**
     GET statuses/show/:id

     - Note: Returns a single Tweet, specified by the id parameter. The Tweet's author will also be embedded within the Tweet.

     - Parameters:
       - id: The numerical ID of the desired Tweet.
       - trim_user: When set to either true , t or 1 , each Tweet returned in a timeline will include a user object including only the status authors numerical ID. Omit this parameter to receive the complete user object.
       - include_entities: The entities node will not be included when set to false.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-show-id
     */
    public func statuses_show(id: Int, trim_user: Bool? = nil, include_entities: Bool? = nil) async throws -> [String: Any] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/statuses/show.json?id=\(id)"
        if trim_user != nil {
            urlString = "\(urlString)&trim_user=\(trim_user!)"
        }
        if include_entities != nil {
            urlString = "\(urlString)&include_entities=\(include_entities!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return result ?? [:]
    }


    /**
     GET statuses/user_timeline

     - Note: Returns a collection of the most recent Tweets posted by the user indicated by the screen_name or user_id parameters.

     - Parameters:
       - user_id: The ID of the user for whom to return results.
       - since_id: Returns results with an ID greater than (that is, more recent than) the specified ID. There are limits to the number of Tweets that can be accessed through the API. If the limit of Tweets has occured since the since_id, the since_id will be forced to the oldest ID available.
       - count: Specifies the number of Tweets to try and retrieve, up to a maximum of 200 per distinct request. The value of count is best thought of as a limit to the number of Tweets to return because suspended or deleted content is removed after the count has been applied. We include retweets in the count, even if include_rts is not supplied. It is recommended you always send include_rts=1 when using this API method.
       - max_id: Returns results with an ID less than (that is, older than) or equal to the specified ID.
       - trim_user: When set to either true , t or 1 , each Tweet returned in a timeline will include a user object including only the status authors numerical ID. Omit this parameter to receive the complete user object.
       - exclude_replies: This parameter will prevent replies from appearing in the returned timeline. Using exclude_replies with the count parameter will mean you will receive up-to count tweets — this is because the count parameter retrieves that many Tweets before filtering out retweets and replies.
       - include_rts: When set to false , the timeline will strip any native retweets (though they will still count toward both the maximal length of the timeline and the slice selected by the count parameter). Note: If you're using the trim_user parameter in conjunction with include_rts, the retweets will still contain a full user object.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/tweets/timelines/api-reference/get-statuses-user_timeline
     */
    public func statuses_user_timeline(user_id: Int, since_id: Int? = nil, max_id: Int? = nil, count: Int? = nil, trim_user: Bool? = nil, exclude_replies: Bool? = nil, contributor_details: Bool? = nil, include_rts: Bool? = nil) async throws -> [[String: Any]] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/statuses/user_timeline.json?user_id=\(user_id)"
        if since_id != nil {
            urlString = "\(urlString)&since_id=\(since_id!)"
        }
        if max_id != nil {
            urlString = "\(urlString)&max_id=\(max_id!)"
        }
        if count != nil {
            urlString = "\(urlString)&count=\(count!)"
        }
        if max_id != nil {
            urlString = "\(urlString)&max_id=\(max_id!)"
        }
        if trim_user != nil {
            urlString = "\(urlString)&trim_user=\(trim_user!)"
        }
        if exclude_replies != nil {
            urlString = "\(urlString)&exclude_replies=\(exclude_replies!)"
        }
        if contributor_details != nil {
            urlString = "\(urlString)&contributor_details=\(contributor_details!)"
        }
        if include_rts != nil {
            urlString = "\(urlString)&include_rts=\(include_rts!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
        return result ?? [[:]]
    }


    /**
     GET statuses/user_timeline

     - Note: Returns a collection of the most recent Tweets posted by the user indicated by the screen_name or user_id parameters.

     - Parameters:
       - screen_name: The screen name of the user for whom to return results.
       - since_id: Returns results with an ID greater than (that is, more recent than) the specified ID. There are limits to the number of Tweets that can be accessed through the API. If the limit of Tweets has occured since the since_id, the since_id will be forced to the oldest ID available.
       - count: Specifies the number of Tweets to try and retrieve, up to a maximum of 200 per distinct request. The value of count is best thought of as a limit to the number of Tweets to return because suspended or deleted content is removed after the count has been applied. We include retweets in the count, even if include_rts is not supplied. It is recommended you always send include_rts=1 when using this API method.
       - max_id: Returns results with an ID less than (that is, older than) or equal to the specified ID.
       - trim_user: When set to either true , t or 1 , each Tweet returned in a timeline will include a user object including only the status authors numerical ID. Omit this parameter to receive the complete user object.
       - exclude_replies: This parameter will prevent replies from appearing in the returned timeline. Using exclude_replies with the count parameter will mean you will receive up-to count tweets — this is because the count parameter retrieves that many Tweets before filtering out retweets and replies.
       - include_rts: When set to false , the timeline will strip any native retweets (though they will still count toward both the maximal length of the timeline and the slice selected by the count parameter). Note: If you're using the trim_user parameter in conjunction with include_rts, the retweets will still contain a full user object.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/tweets/timelines/api-reference/get-statuses-user_timeline
     */
    public func statuses_user_timeline(screen_name: String, since_id: Int? = nil, max_id: Int? = nil, count: Int? = nil, trim_user: Bool? = nil, exclude_replies: Bool? = nil, contributor_details: Bool? = nil, include_rts: Bool? = nil) async throws -> [[String: Any]] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=\(screen_name.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        if since_id != nil {
            urlString = "\(urlString)&since_id=\(since_id!)"
        }
        if max_id != nil {
            urlString = "\(urlString)&max_id=\(max_id!)"
        }
        if count != nil {
            urlString = "\(urlString)&count=\(count!)"
        }
        if max_id != nil {
            urlString = "\(urlString)&max_id=\(max_id!)"
        }
        if trim_user != nil {
            urlString = "\(urlString)&trim_user=\(trim_user!)"
        }
        if exclude_replies != nil {
            urlString = "\(urlString)&exclude_replies=\(exclude_replies!)"
        }
        if contributor_details != nil {
            urlString = "\(urlString)&contributor_details=\(contributor_details!)"
        }
        if include_rts != nil {
            urlString = "\(urlString)&include_rts=\(include_rts!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
        return result ?? [[:]]
    }
}
