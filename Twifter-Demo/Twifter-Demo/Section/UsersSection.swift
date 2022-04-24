//
//  UsersSection.swift
//  Demo
//
//  Created by 宮本大新 on 2022/04/25.
//

import SwiftUI
import Twifter

struct UsersSection: View {
    var body: some View {
        Section{
            // Info on multiple users -> Multiple user descriptions
            Button("users_lookup") {
                Task {
                    let result = try await TwifterClient().users_lookup(screen_name: ["_SNQ", "Shadow_Ban_Bot"])
                    print(result[0]["description"] ?? "")
                }
            }
            // Search user -> Tweet text
            Button("users_search") {
                Task {
                    let result = try await TwifterClient().users_search(q: "_SNQ", tweet_mode: .extended)
                    guard let status = result[0]["status"] as? [String: Any] else { return }
                    print(status["full_text"] ?? "")
                }
            }
            // User info -> Tweet text
            Button("user_show") {
                Task {
                    let result = try await TwifterClient().user_show(screen_name: "_SNQ", tweet_mode: .extended)
                    guard let status = result["status"] as? [String: Any] else { return }
                    print(status["full_text"] ?? "")
                }
            }
        } header: { Text("Users") }
    }
}

struct UsersSection_Previews: PreviewProvider {
    static var previews: some View {
        UsersSection()
    }
}
