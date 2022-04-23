//
//  TwifterProtocol.swift
//  
//
//  Created by 宮本大新 on 2022/04/23.
//

import Foundation

public protocol ClientProtocol {
    // MARK: - Guest -
    func generate_guest_token(
    ) async throws -> GuestToken


    // MARK: - Application -
    func rate_limit_status(
        resources: [Resources]?
    ) async throws -> [String: Any]


    // MARK: - Collections -
    func collections_entries(
        id: String,
        count: Int?,
        max_position: Int?,
        min_position: Int?
    ) async throws -> [String: Any]


    // MARK: - Followers -
    func followers_ids(
        user_id: Int,
        cursor: String?,
        stringify_ids: Bool?,
        count: Int?
    ) async throws -> [String: Any]

    func followers_ids(
        screen_name: String,
        cursor: String?,
        stringify_ids: Bool?,
        count: Int?
    ) async throws -> [String: Any]

    func followers_list(
        user_id: Int,
        cursor: String?,
        count: Int?,
        skip_status: Bool?,
        include_user_entities: Bool?
    ) async throws -> [String: Any]

    func followers_list(
        screen_name: String,
        cursor: String?,
        count: Int?,
        skip_status: Bool?,
        include_user_entities: Bool?
    ) async throws -> [String: Any]


    // MARK: - Friends -
    func friends_ids(
        user_id: Int,
        cursor: String?,
        stringify_ids: Bool?,
        count: Int?
    ) async throws -> [String: Any]

    func friends_ids(
        screen_name: String,
        cursor: String?,
        stringify_ids: Bool?,
        count: Int?
    ) async throws -> [String: Any]

    func friends_list(
        user_id: Int,
        cursor: String?,
        count: Int?,
        skip_status: Bool?,
        include_user_entities: Bool?
    ) async throws -> [String: Any]

    func friends_list(
        screen_name: String,
        cursor: String?,
        count: Int?,
        skip_status: Bool?,
        include_user_entities: Bool?
    ) async throws -> [String: Any]

    func friendships_show(
        source_id: Int,
        target_id: Int
    ) async throws -> [String: Any]


    // MARK: - Geo -
    func geo_id(
        place_id: String
    ) async throws -> [String: Any]

    func geo_reverse_geocode(
        lat: Double,
        long: Double,
        accuracy: Int?,
        granularity: Granularity?,
        max_results: Int?
    ) async throws -> [String: Any]

    func geo_search(
        query: String,
        granularity: Granularity?,
        accuracy: Int?,
        max_results: Int?,
        contained_within: String?,
        attribute_street_address: String?
    ) async throws -> [String: Any]

    func geo_search(
        lat: Double,
        long: Double,
        granularity: Granularity?,
        accuracy: Int?,
        max_results: Int?,
        contained_within: String?,
        attribute_street_address: String?
    ) async throws -> [String: Any]

    func geo_search(
        ip: String,
        granularity: Granularity?,
        accuracy: Int?,
        max_results: Int?,
        contained_within: String?,
        attribute_street_address: String?
    ) async throws -> [String: Any]


    // MARK: - Lists -
    func lists_list(
        user_id: Int,
        reverse: Bool?
    ) async throws -> [String: Any]

    func lists_list(
        screen_name: String,
        reverse: Bool?
    ) async throws -> [[String: Any]]

    func lists_members(
        list_id: Int,
        count: Int?,
        cursor: String?,
        include_entities: Bool?,
        skip_status: Bool?
    ) async throws -> [String: Any]

    func lists_memberships(
        user_id: Int,
        count: Int?,
        cursor: String?
    ) async throws -> [String: Any]

    func lists_memberships(
        screen_name: String,
        count: Int?,
        cursor: String?
    ) async throws -> [String: Any]

    func lists_ownerships(
        user_id: Int,
        count: Int?,
        cursor: String?
    ) async throws -> [String: Any]

    func lists_ownerships(
        screen_name: String,
        count: Int?,
        cursor: String?
    ) async throws -> [String: Any]

    func lists_show(
        list_id: Int
    ) async throws -> [String: Any]

    func lists_statuses(
        list_id: Int,
        since_id: Int?,
        max_id: Int?,
        count: Int?,
        include_entities: Bool?,
        include_rts: Bool?
    ) async throws -> [[String: Any]]

    func lists_subscribers(
        list_id: Int,
        count: Int?,
        cursor: String?,
        include_entities: Bool?,
        skip_status: Bool?
    ) async throws -> [String: Any]

    func lists_subscriptions(
        user_id: Int,
        count: Int?,
        cursor: String?
    ) async throws -> [String: Any]

    func lists_subscriptions(
        screen_name: String,
        count: Int?,
        cursor: String?
    ) async throws -> [String: Any]


    // MARK: - Search -
    func search_tweets(
        q: String,
        geocode: String?,
        lang: Languages?,
        locale: Locale?,
        result_type: Result_Type?,
        count: Int?,
        until: (year: Int, month: Int, day: Int)?,
        since_id: Int?,
        max_id: Int?,
        include_entities: Bool?
    ) async throws -> [String: Any]


    // MARK: - Statuses -
    func statuses_lookup(
        id: [Int],
        include_entities: Bool?,
        trim_user: Bool?,
        map: Bool?
    ) async throws -> [[String: Any]]

    func statuses_retweeters_ids(
        id: Int,
        cursor: String?,
        stringify_ids: Bool?
    ) async throws -> [String: Any]

    func statuses_retweets(
        id: Int,
        count: Int?,
        trim_user: Bool?
    ) async throws -> [[String: Any]]

    func statuses_show(
        id: Int,
        trim_user: Bool?,
        include_entities: Bool?
    ) async throws -> [String: Any]

    func statuses_user_timeline(
        user_id: Int,
        since_id: Int?,
        max_id: Int?,
        count: Int?,
        trim_user: Bool?,
        exclude_replies: Bool?,
        contributor_details: Bool?,
        include_rts: Bool?
    ) async throws -> [[String: Any]]

    func statuses_user_timeline(
        screen_name: String,
        since_id: Int?,
        max_id: Int?,
        count: Int?,
        trim_user: Bool?,
        exclude_replies: Bool?,
        contributor_details: Bool?,
        include_rts: Bool?
    ) async throws -> [[String: Any]]


    // MARK: - Trends -
    func trends_available(
    ) async throws -> [[String: Any]]

    func trends_closest(
        lat: Double,
        long: Double
    ) async throws -> [[String: Any]]

    func trends_place(
        id: Int,
        exclude: Exclude?
    ) async throws -> [[String: Any]]


    // MARK: - Users -
    func users_lookup(
        user_id: [Int],
        include_entities: Bool?,
        tweet_mode: Bool?
    ) async throws -> [[String: Any]]

    func users_lookup(
        screen_name: [String],
        include_entities: Bool?
    ) async throws -> [[String: Any]]

    func users_search(
        q: String,
        page: Int?,
        count: Int?,
        include_entities: Bool?
    ) async throws -> [[String: Any]]

    func user_show(
        user_id: Int,
        include_entities: Bool?
    ) async throws -> [String: Any]

    func user_show(
        screen_name: String,
        include_entities: Bool?
    ) async throws -> [String: Any]
}
