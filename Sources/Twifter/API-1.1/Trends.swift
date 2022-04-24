//
//  Trends.swift
//  
//
//  Created by 宮本大新 on 2022/04/23.
//

import Foundation

public extension TwifterClient {
    /**
     GET trends/available

     - Note: Returns the locations that Twitter has trending topic information for.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/trends/locations-with-trending-topics/api-reference/get-trends-available
     */
    func trends_available() async throws -> [[String: Any]] {
        let guest_token = try await generate_guest_token().guest_token
        let urlString: String = "https://api.twitter.com/1.1/trends/available.json"
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
        return result ?? [[:]]
    }


    /**
     GET trends/closest

     - Note: Returns the locations that Twitter has trending topic information for, closest to a specified location.

     - Parameters:
     - lat: If provided with a long parameter the available trend locations will be sorted by distance, nearest to furthest, to the co-ordinate pair. The valid ranges for longitude is -180.0 to +180.0 (West is negative, East is positive) inclusive.
     - long: If provided with a lat parameter the available trend locations will be sorted by distance, nearest to furthest, to the co-ordinate pair. The valid ranges for longitude is -180.0 to +180.0 (West is negative, East is positive) inclusive.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/trends/locations-with-trending-topics/api-reference/get-trends-closest
     */
    func trends_closest(lat: Double, long: Double) async throws -> [[String: Any]] {
        let guest_token = try await generate_guest_token().guest_token
        let urlString: String = "https://api.twitter.com/1.1/trends/closest.json?lat=\(lat)&long=\(long)"
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
        return result ?? [[:]]
    }


    /**
     GET trends/place

     - Note: Returns the top 50 trending topics for a specific id, if trending information is available for it.

     - Parameters:
     - id: The numeric value that represents the location from where to return trending information for from. Formerly linked to the Yahoo! Where On Earth ID Global information is available by using 1 as the WOEID .
     - exclude: Setting this equal to hashtags will remove all hashtags from the trends list.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/trends/trends-for-location/api-reference/get-trends-place
     */
    func trends_place(id: Int, exclude: Exclude? = nil) async throws -> [[String: Any]] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/trends/place.json?id=\(id)"
        if exclude != nil {
            urlString = "\(urlString)&exclude=\(exclude!.rawValue)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
        return result ?? [[:]]
    }
}
