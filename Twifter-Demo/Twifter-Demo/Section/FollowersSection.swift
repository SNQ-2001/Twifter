//
//  FollowersSection.swift
//  Demo
//
//  Created by 宮本大新 on 2022/04/25.
//

import SwiftUI
import Twifter

struct FollowersSection: View {
    var body: some View {
        Section {
            // Get follower IDs -> IDs
            Button("followers_ids") {
                Task {
                    let results = try await TwifterClient().followers_ids(screen_name: "_SNQ")
                    guard let ids = results["ids"] as? NSArray else { return }
                    for id in ids {
                        print(id)
                    }
                }
            }

            // Get follower info -> Tweet text
            Button("followers_list") {
                Task {
                    let result = try await TwifterClient().followers_list(screen_name: "_SNQ", tweet_mode: .extended)
                    guard let users = result["users"] as? NSArray else { return }
                    for user in users {
                        print()
                        guard let user_obje = user as? [String: Any] else { return }
                        guard let status = user_obje["status"] as? [String: Any] else { return }
                        print(status["full_text"] ?? "")
                    }
                }
            }
        } header: { Text("Followers") }
    }
}

struct FollowersSection_Previews: PreviewProvider {
    static var previews: some View {
        FollowersSection()
    }
}
