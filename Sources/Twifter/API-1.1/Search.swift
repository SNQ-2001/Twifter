//
//  Search.swift
//  
//
//  Created by 宮本大新 on 2022/04/23.
//

import Foundation

public extension TwifterClient {
    /**
     GET search/tweets

     - Note: Returns a collection of relevant Tweets matching a specified query.

     - Parameters:
     - q: A UTF-8, URL-encoded search query of 500 characters maximum, including operators. Queries may additionally be limited by complexity.
     - geocode: See official documentation
     - lang: Restricts tweets to the given language, given by an ISO 639-1 code. Language detection is best-effort.
     - locale: Specify the language of the query you are sending (only ja is currently effective). This is intended for language-specific consumers and the default should work in the majority of cases.
     - result_type: Optional. Specifies what type of search results you would prefer to receive. The current default is "mixed." Valid values include:
     * mixed : Include both popular and real time results in the response.
     * recent : return only the most recent results in the response
     * popular : return only the most popular results in the response.
     - count: The number of tweets to return per page, up to a maximum of 100. Defaults to 15. This was formerly the "rpp" parameter in the old Search API.
     - until: Returns tweets created before the given date. Date should be formatted as YYYY-MM-DD. Keep in mind that the search index has a 7-day limit. In other words, no tweets will be found for a date older than one week.
     - since_id: Returns results with an ID greater than (that is, more recent than) the specified ID. There are limits to the number of Tweets which can be accessed through the API. If the limit of Tweets has occured since the since_id, the since_id will be forced to the oldest ID available.
     - max_id: Returns results with an ID less than (that is, older than) or equal to the specified ID.
     - include_entities: The entities node will not be included when set to false.
     - tweet_mode: Valid request values are compat and extended, which give compatibility mode and extended mode, respectively for Tweets that contain over 140 characters

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/tweets/search/api-reference/get-search-tweets
     */
    func search_tweets(q: String, geocode: String? = nil, lang: Languages? = nil, locale: Locale? = nil, result_type: Result_Type? = nil, count: Int? = nil, until: (year: Int, month: Int, day: Int)? = nil, since_id: Int? = nil, max_id: Int? = nil, include_entities: Bool? = nil, tweet_mode: TweetMode? = nil) async throws -> [String: Any] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/search/tweets.json?q=\(q.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        if geocode != nil {
            urlString = "\(urlString)&geocode=\(geocode!.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        }
        if lang != nil {
            urlString = "\(urlString)&lang=\(lang!.rawValue)"
        }
        if locale != nil {
            urlString = "\(urlString)&locale=\(locale!.rawValue)"
        }
        if result_type != nil {
            urlString = "\(urlString)&result_type=\(result_type!.rawValue)"
        }
        if count != nil {
            urlString = "\(urlString)&count=\(count!)"
        }
        if until != nil {
            urlString = "\(urlString)&until=\(until!.year)-\(until!.month)-\(until!.day)"
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
        if tweet_mode != nil {
            urlString = "\(urlString)&tweet_mode=\(tweet_mode!.rawValue)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return result ?? [:]
    }
}
