//
//  TrendsSection.swift
//  Demo
//
//  Created by 宮本大新 on 2022/04/25.
//

import SwiftUI
import Twifter

struct TrendsSection: View {
    var body: some View {
        Section{
            // Get a list of regions where trends are aggregated
            Button("trends_available") {
                Task {
                    let result = try await TwifterClient().trends_available()
                    print(result)
                }
            }
            // Coordinate -> woeid
            Button("trends_closest") {
                Task {
                    let result = try await TwifterClient().trends_closest(lat: 35.79449997305192, long: 139.79078800000002)
                    print(result[0]["woeid"] ?? "")
                }
            }
            // Get local trends -> Trend name
            Button("trends_place") {
                Task {
                    let results = try await TwifterClient().trends_place(id: 1110809)
                    for result in results {
                        guard let trends = result["trends"] as? NSArray else { return }
                        for trend in trends {
                            guard let trend_obje = trend as? [String: Any] else { return }
                            print(trend_obje["name"] ?? "")
                        }
                    }
                }
            }
        } header: { Text("Trends") }
    }
}

struct TrendsSection_Previews: PreviewProvider {
    static var previews: some View {
        TrendsSection()
    }
}
