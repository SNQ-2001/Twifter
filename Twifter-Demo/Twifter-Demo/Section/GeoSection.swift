//
//  GeoSection.swift
//  Demo
//
//  Created by 宮本大新 on 2022/04/25.
//

import SwiftUI
import Twifter

struct GeoSection: View {
    var body: some View {
        Section{
            // Get "place id" info -> Place name
            Button("geo_id") {
                Task {
                    let result = try await TwifterClient().geo_id(place_id: "06ef846bfc783874")
                    print(result["name"] ?? "")
                }
            }
            // Get info on coordinates -> Place name
            Button("geo_reverse_geocode") {
                Task {
                    let result = try await TwifterClient().geo_reverse_geocode(lat: 35.79449997305192, long: 139.79078800000002)
                    guard let result_obje = result["result"] as? [String: Any] else { return }
                    guard let places = result_obje["places"] as? NSArray else { return }
                    for place in places {
                        guard let place_obje = place as? [String: Any] else { return }
                        print(place_obje["full_name"] ?? "")
                    }
                }
            }
            // Get info on place names -> Place name
            Button("geo_search") {
                Task {
                    let result = try await TwifterClient().geo_search(query: "Tokyo")
                    guard let result_obje = result["result"] as? [String: Any] else { return }
                    guard let places = result_obje["places"] as? NSArray else { return }
                    for place in places {
                        guard let place_obje = place as? [String: Any] else { return }
                        print(place_obje["full_name"] ?? "")
                    }
                }
            }
        } header: { Text("Geo") }
    }
}

struct GeoSection_Previews: PreviewProvider {
    static var previews: some View {
        GeoSection()
    }
}
