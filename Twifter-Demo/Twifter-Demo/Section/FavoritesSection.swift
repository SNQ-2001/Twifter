//
//  FavoritesSection.swift
//  Demo
//
//  Created by 宮本大新 on 2022/04/25.
//

import SwiftUI
import Twifter

struct FavoritesSection: View {
    var body: some View {
        Section {
            // Get like info -> Tweet text
            Button("favorites_list") {
                Task {
                    let results = try await TwifterClient().favorites_list(screen_name: "_SNQ", tweet_mode: .extended)
                    for result in results {
                        print(result["full_text"] ?? "")
                    }
                }
            }
        } header: { Text("Favorites") }
    }
}

struct FavoritesSection_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesSection()
    }
}
