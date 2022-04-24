//
//  StatusesSection.swift
//  Demo
//
//  Created by 宮本大新 on 2022/04/25.
//

import SwiftUI
import Twifter

struct StatusesSection: View {
    var body: some View {
        Section{
            // Get tweet info -> Tweet text
            Button("statuses_lookup") {
                Task {
                    let results = try await TwifterClient().statuses_lookup(id: [1488101267243429889, 1516619027288043521], tweet_mode: .extended)
                    for result in results {
                        print(result["full_text"] ?? "")
                    }
                }
            }
            // Get the ID of the user who RT
            Button("statuses_retweeters_ids") {
                Task {
                    let result = try await TwifterClient().statuses_retweeters_ids(id: 1488101267243429889)
                    guard let ids = result["ids"] as? NSArray else { return }
                    for id in ids {
                        print(id)
                    }
                }
            }
            // Get info on users who RT -> User name
            Button("statuses_retweets") {
                Task {
                    let results = try await TwifterClient().statuses_retweets(id: 1488101267243429889)
                    for result in results {
                        guard let user = result["user"] as? [String: Any] else { return }
                        print(user["name"] ?? "")
                    }
                }
            }
            // Get tweet info -> Tweet text
            Button("statuses_show") {
                Task {
                    let result = try await TwifterClient().statuses_show(id: 1488101267243429889, tweet_mode: .extended)
                    print(result["full_text"] ?? "")
                }
            }
            // Get user time line -> Tweet text
            Button("statuses_user_timeline") {
                Task {
                    let results = try await TwifterClient().statuses_user_timeline(screen_name: "_SNQ", tweet_mode: .extended)
                    for result in results {
                        print(result["full_text"] ?? "")
                    }
                }
            }
        } header: { Text("Statuses") }
    }
}

struct StatusesSection_Previews: PreviewProvider {
    static var previews: some View {
        StatusesSection()
    }
}
