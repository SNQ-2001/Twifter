//
//  ListsSection.swift
//  Demo
//
//  Created by 宮本大新 on 2022/04/25.
//

import SwiftUI
import Twifter

struct ListsSection: View {
    var body: some View {
        Section{
            // Get list containing users -> List id
            Button("lists_list") {
                Task {
                    let results = try await TwifterClient().lists_list(screen_name: "_SNQ")
                    for result in results {
                        print(result["id"] ?? "")
                    }
                }
            }
            // Get users included in list -> Tweet text
            Button("lists_members") {
                Task {
                    let result = try await TwifterClient().lists_members(list_id: 1517792406514839552, tweet_mode: .extended)
                    guard let users = result["users"] as? NSArray else { return }
                    for user in users {
                        guard let user_obje = user as? [String: Any] else { return }
                        guard let status = user_obje["status"] as? [String: Any] else { return }
                        print(status["full_text"] ?? "")
                    }
                }
            }
            // Get list added as members -> List id
            Button("lists_memberships") {
                Task {
                    let result = try await TwifterClient().lists_memberships(screen_name: "_SNQ")
                    guard let lists = result["lists"] as? NSArray else { return }
                    for list in lists {
                        guard let list_obje = list as? [String: Any] else { return }
                        print(list_obje["id"] ?? 0)
                    }
                }
            }
            // Get List created by the user -> List id
            Button("lists_ownerships") {
                Task {
                    let result = try await TwifterClient().lists_ownerships(screen_name: "_SNQ")
                    guard let lists = result["lists"] as? NSArray else { return }
                    for list in lists {
                        guard let list_obje = list as? [String: Any] else { return }
                        print(list_obje["id"] ?? "")
                    }
                }
            }
            // Get list information -> List Name
            Button("lists_show") {
                Task {
                    let result = try await TwifterClient().lists_show(list_id: 1517792406514839552)
                    print(result["name"] ?? "")
                }
            }
            // Get Tweets from the list -> Tweet text
            Button("lists_statuses") {
                Task {
                    let results = try await TwifterClient().lists_statuses(list_id: 1517792406514839552, tweet_mode: .extended)
                    for result in results {
                        print(result["full_text"] ?? "")
                    }
                }
            }
            // Get followers of the list
            Button("lists_subscribers") {
                Task {
                    let result = try await TwifterClient().lists_subscribers(list_id: 1517792406514839552)
                    print(result)
                }
            }
            // Get info on list you follow
            Button("lists_subscriptions") {
                Task {
                    let result = try await TwifterClient().lists_subscriptions(screen_name: "_SNQ")
                    print(result)
                }
            }
        } header: { Text("Lists") }
    }
}

struct ListsSection_Previews: PreviewProvider {
    static var previews: some View {
        ListsSection()
    }
}
