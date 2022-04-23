//
//  Guest.swift
//  
//
//  Created by 宮本大新 on 2022/04/23.
//

import Foundation

extension Client {
    public func generate_guest_token() async throws -> GuestToken {
        let urlString: String = "https://api.twitter.com/1.1/guest/activate.json"
        let data = try await post(url: urlString)
        do {
            let result = try JSONDecoder().decode(GuestToken.self, from: data)
            return result
        } catch {
            let result = try JSONDecoder().decode(Errors.self, from: data)
            if result.errors[0].code == 88 {
                throw ErrorCode.Error88
            } else if result.errors[0].code == 89 {
                throw ErrorCode.Error89
            } else {
                throw ErrorCode.Error999
            }
        }
    }
}
