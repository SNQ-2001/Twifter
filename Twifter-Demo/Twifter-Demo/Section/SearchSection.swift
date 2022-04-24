//
//  SearchSection.swift
//  Demo
//
//  Created by 宮本大新 on 2022/04/25.
//

import SwiftUI
import Twifter

struct SearchSection: View {
    var body: some View {
        Section{
            // Get search results -> Tweet text
            Button("search_tweets") {
                Task {
                    let result = try await TwifterClient().search_tweets(q: "Swift", tweet_mode: .extended)
                    guard let statuses = result["statuses"] as? NSArray else { return }
                    for status in statuses {
                        guard let status_obje = status as? [String: Any] else { return }
                        print(status_obje["full_text"] ?? "")
                    }
                }
            }
        } header: { Text("Search") }
    }
}

struct SearchSection_Previews: PreviewProvider {
    static var previews: some View {
        SearchSection()
    }
}
