//
//  CollectionsSection.swift
//  Demo
//
//  Created by 宮本大新 on 2022/04/25.
//

import SwiftUI
import Twifter

struct CollectionsSection: View {
    var body: some View {
        Section {
            Button("collections_entries") {
                Task {
                    // Get collection info -> Tweet text
                    let result = try await TwifterClient().collections_entries(id: "custom-539487832448843776", tweet_mode: .extended)
                    guard let objects = result["objects"] as? [String: Any] else { return }
                    guard let tweets = objects["tweets"] as? [String: Any] else { return }
                    for tweet in tweets {
                        guard let value = tweet.value as? [String: Any] else { return }
                        print(value["full_text"] ?? "")
                    }
                }
            }
        } header: { Text("Collections") }
    }
}

struct CollectionsSection_Previews: PreviewProvider {
    static var previews: some View {
        CollectionsSection()
    }
}
