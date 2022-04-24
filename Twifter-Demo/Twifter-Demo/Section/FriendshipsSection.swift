//
//  FriendshipsSection.swift
//  Demo
//
//  Created by 宮本大新 on 2022/04/25.
//

import SwiftUI
import Twifter

struct FriendshipsSection: View {
    var body: some View {
        Section{
            // Get the relationship between "source_screen_name" and "target_screen_name"
            Button("friendships_show") {
                Task {
                    let result = try await TwifterClient().friendships_show(source_screen_name: "_SNQ", target_screen_name: "Shadow_Ban_Bot")
                    guard let relationship = result["relationship"] as? [String: Any] else { return }
                    guard let target = relationship["target"] as? [String: Any] else { return }
                    print(target["followed_by"] ?? 0)
                }
            }
        } header: { Text("Friendships") }
    }
}

struct FriendshipsSection_Previews: PreviewProvider {
    static var previews: some View {
        FriendshipsSection()
    }
}
