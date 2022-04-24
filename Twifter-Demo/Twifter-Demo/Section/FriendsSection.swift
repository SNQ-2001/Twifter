//
//  FriendsSection.swift
//  Demo
//
//  Created by 宮本大新 on 2022/04/25.
//

import SwiftUI
import Twifter

struct FriendsSection: View {
    var body: some View {
        Section{

            Button("friends_ids") {
                // Get IDs from users you are following -> IDs
                Task {
                    let results = try await TwifterClient().friends_ids(screen_name: "_SNQ")
                    guard let ids = results["ids"] as? NSArray else { return }
                    for id in ids {
                        print(id)
                    }
                }
            }
            Button("friends_list") {
                // Get info from users you are following -> Tweet text
                Task {
                    let result = try await TwifterClient().friends_list(screen_name: "_SNQ", tweet_mode: .extended)
                    guard let users = result["users"] as? NSArray else { return }
                    for user in users {
                        print()
                        guard let user_obje = user as? [String: Any] else { return }
                        guard let status = user_obje["status"] as? [String: Any] else { return }
                        print(status["full_text"] ?? "")
                    }
                }
            }
        } header: { Text("Friends") }
    }
}

struct FriendsSection_Previews: PreviewProvider {
    static var previews: some View {
        FriendsSection()
    }
}
