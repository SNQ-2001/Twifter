//
//  Twifter.swift
//
//
//  Created by 宮本大新 on 2022/04/23.
//

import Foundation

public struct Client: ClientProtocol {
    public init() {

    }
    internal func get(url: String, guest_token: String) async throws -> Data {
        let Url: URL = URL(string: url)!
        var request = URLRequest(url: Url)
        request.httpMethod = "GET"
        request.addValue("Bearer AAAAAAAAAAAAAAAAAAAAANRILgAAAAAAnNwIzUejRCOuH5E6I8xnZz4puTs%3D1Zv7ttfk8LF81IUq16cHjhLTvJu4FA33AGWWjCpTnA", forHTTPHeaderField: "authorization")
        request.addValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36", forHTTPHeaderField: "User-Agent")
        request.addValue(guest_token, forHTTPHeaderField: "x-guest-token")
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
    internal func post(url: String) async throws -> Data {
        let Url: URL = URL(string: url)!
        var request = URLRequest(url: Url)
        request.httpMethod = "POST"
        request.addValue("Bearer AAAAAAAAAAAAAAAAAAAAANRILgAAAAAAnNwIzUejRCOuH5E6I8xnZz4puTs%3D1Zv7ttfk8LF81IUq16cHjhLTvJu4FA33AGWWjCpTnA", forHTTPHeaderField: "authorization")
        request.addValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36", forHTTPHeaderField: "User-Agent")
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
}
