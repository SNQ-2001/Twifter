//
//  Friendships.swift
//  
//
//  Created by 宮本大新 on 2022/04/23.
//

import Foundation

extension Twifter {
    /**
     GET friendships/show

     - Note: Returns detailed information about the relationship between two arbitrary users.

     - Parameters:
       - source_id: The user_id of the subject user.
       - target_id: The user_id of the target user.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friendships-show
     */
    public func friendships_show(source_id: Int, target_id: Int) async throws -> [String: Any] {
        let guest_token = try await generate_guest_token().guest_token
        let urlString: String = "https://api.twitter.com/1.1/friendships/show.json?source_id=\(source_id)&target_id=\(target_id)"
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return result ?? [:]
    }


    /**
     GET friendships/show

     - Note: Returns detailed information about the relationship between two arbitrary users.

     - Parameters:
       - source_screen_name: The screen_name of the subject user.
       - target_screen_name: The screen_name of the target user.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friendships-show
     */
    public func friendships_show(source_screen_name: String, target_screen_name: String) async throws -> [String: Any] {
        let guest_token = try await generate_guest_token().guest_token
        let urlString: String = "https://api.twitter.com/1.1/friendships/show.json?source_screen_name=\(source_screen_name.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)&target_screen_name=\(target_screen_name.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return result ?? [:]
    }
}
