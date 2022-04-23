//
//  Geo.swift
//  
//
//  Created by 宮本大新 on 2022/04/23.
//

import Foundation

public extension Client {
    /**
     GET geo/id/:place_id

     - Note: Returns all the information about a known place.

     - Parameters:
       - place_id: A place in the world. These IDs can be retrieved from geo/reverse_geocode.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/geo/place-information/api-reference/get-geo-id-place_id
     */
    public func geo_id(place_id: String) async throws -> [String: Any] {
        let guest_token = try await generate_guest_token().guest_token
        let urlString: String = "https://api.twitter.com/1.1/geo/id/\(place_id).json"
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return result ?? [:]
    }


    /**
     GET geo/reverse_geocode

     - Note: Given a latitude and a longitude, searches for up to 20 places that can be used as a place_id when updating a status.

     - Parameters:
       - lat: The latitude to search around. This parameter will be ignored unless it is inside the range -90.0 to +90.0 (North is positive) inclusive. It will also be ignored if there isn't a corresponding long parameter.
       - long: The longitude to search around. The valid ranges for longitude are -180.0 to +180.0 (East is positive) inclusive. This parameter will be ignored if outside that range, if it is not a number, if geo_enabled is turned off, or if there not a corresponding lat parameter.
       - accuracy: A hint on the "region" in which to search. If a number, then this is a radius in meters, but it can also take a string that is suffixed with ft to specify feet. If this is not passed in, then it is assumed to be 0m. If coming from a device, in practice, this value is whatever accuracy the device has measuring its location (whether it be coming from a GPS, WiFi triangulation, etc.).
       - granularity: This is the minimal granularity of place types to return and must be one of: neighborhood, city, admin or country . If no granularity is provided for the request neighborhood is assumed. Setting this to city, for example, will find places which have a type of city, admin or country.
       - max_results: A hint as to the number of results to return. This does not guarantee that the number of results returned will equal max_results, but instead informs how many "nearby" results to return. Ideally, only pass in the number of places you intend to display to the user here.        3

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/geo/places-near-location/api-reference/get-geo-reverse_geocode
     */
    public func geo_reverse_geocode(lat: Double, long: Double, accuracy: Int? = nil, granularity: Granularity? = nil, max_results: Int? = nil) async throws -> [String: Any] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/geo/reverse_geocode.json?lat=\(lat)&long=\(long)"
        if accuracy != nil {
            urlString = "\(urlString)&accuracy=\(accuracy!)"
        }
        if granularity != nil {
            urlString = "\(urlString)&granularity=\(granularity!.rawValue)"
        }
        if max_results != nil {
            urlString = "\(urlString)&max_results=\(max_results!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return result ?? [:]
    }


    /**
     GET geo/search

     - Note: Search for places that can be attached to a Tweet via POST statuses/update.

     - Parameters:
       - query: Free-form text to match against while executing a geo-based query, best suited for finding nearby locations by name. Remember to URL encode the query.
       - granularity: This is the minimal granularity of place types to return and must be one of: neighborhood , city , admin or country. If no granularity is provided for the request neighborhood is assumed. Setting this to city, for example, will find places which have a type of city, admin or country.
       - max_results: A hint as to the number of results to return. This does not guarantee that the number of results returned will equal max_results, but instead informs how many "nearby" results to return. Ideally, only pass in the number of places you intend to display to the user here.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/geo/places-near-location/api-reference/get-geo-search
     */
    public func geo_search(query: String, granularity: Granularity? = nil, accuracy: Int? = nil, max_results: Int? = nil, contained_within: String? = nil, attribute_street_address: String? = nil) async throws -> [String: Any] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/geo/search.json?query=\(query.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"

        if granularity != nil {
            urlString = "\(urlString)&granularity=\(granularity!.rawValue)"
        }
        if accuracy != nil {
            urlString = "\(urlString)&accuracy=\(accuracy!)"
        }
        if max_results != nil {
            urlString = "\(urlString)&max_results=\(max_results!)"
        }
        if contained_within != nil {
            urlString = "\(urlString)&contained_within=\(contained_within!.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        }
        if attribute_street_address != nil {
            urlString = "\(urlString)&attribute:street_address=\(attribute_street_address!.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return result ?? [:]
    }


    /**
     GET geo/search

     - Note: Search for places that can be attached to a Tweet via POST statuses/update.

     - Parameters:
       - lat: The latitude to search around. This parameter will be ignored unless it is inside the range -90.0 to +90.0 (North is positive) inclusive. It will also be ignored if there isn't a corresponding long parameter.
       - long: The longitude to search around. The valid ranges for longitude are -180.0 to +180.0 (East is positive) inclusive. This parameter will be ignored if outside that range, if it is not a number, if geo_enabled is turned off, or if there not a corresponding lat parameter.
       - granularity: This is the minimal granularity of place types to return and must be one of: neighborhood , city , admin or country. If no granularity is provided for the request neighborhood is assumed. Setting this to city, for example, will find places which have a type of city, admin or country.
       - max_results: A hint as to the number of results to return. This does not guarantee that the number of results returned will equal max_results, but instead informs how many "nearby" results to return. Ideally, only pass in the number of places you intend to display to the user here.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/geo/places-near-location/api-reference/get-geo-search
     */
    public func geo_search(lat: Double, long: Double, granularity: Granularity? = nil, accuracy: Int? = nil, max_results: Int? = nil, contained_within: String? = nil, attribute_street_address: String? = nil) async throws -> [String: Any] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/geo/search.json?lat=\(lat)&long=\(long)"

        if granularity != nil {
            urlString = "\(urlString)&granularity=\(granularity!.rawValue)"
        }
        if accuracy != nil {
            urlString = "\(urlString)&accuracy=\(accuracy!)"
        }
        if max_results != nil {
            urlString = "\(urlString)&max_results=\(max_results!)"
        }
        if contained_within != nil {
            urlString = "\(urlString)&contained_within=\(contained_within!.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        }
        if attribute_street_address != nil {
            urlString = "\(urlString)&attribute:street_address=\(attribute_street_address!.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return result ?? [:]
    }


    /**
     GET geo/search

     - Note: Search for places that can be attached to a Tweet via POST statuses/update.

     - Parameters:
       - ip: An IP address. Used when attempting to fix geolocation based off of the user's IP address.
       - granularity: This is the minimal granularity of place types to return and must be one of: neighborhood , city , admin or country. If no granularity is provided for the request neighborhood is assumed. Setting this to city, for example, will find places which have a type of city, admin or country.
       - max_results: A hint as to the number of results to return. This does not guarantee that the number of results returned will equal max_results, but instead informs how many "nearby" results to return. Ideally, only pass in the number of places you intend to display to the user here.

     - SeeAlso
     https://developer.twitter.com/en/docs/twitter-api/v1/geo/places-near-location/api-reference/get-geo-search
     */
    public func geo_search(ip: String, granularity: Granularity? = nil, accuracy: Int? = nil, max_results: Int? = nil, contained_within: String? = nil, attribute_street_address: String? = nil) async throws -> [String: Any] {
        let guest_token = try await generate_guest_token().guest_token
        var urlString: String = "https://api.twitter.com/1.1/geo/search.json?ip=\(ip.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"

        if granularity != nil {
            urlString = "\(urlString)&granularity=\(granularity!.rawValue)"
        }
        if accuracy != nil {
            urlString = "\(urlString)&accuracy=\(accuracy!)"
        }
        if max_results != nil {
            urlString = "\(urlString)&max_results=\(max_results!)"
        }
        if contained_within != nil {
            urlString = "\(urlString)&contained_within=\(contained_within!.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        }
        if attribute_street_address != nil {
            urlString = "\(urlString)&attribute:street_address=\(attribute_street_address!.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        }
        let data = try await get(url: urlString, guest_token: guest_token)
        let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        return result ?? [:]
    }
}

