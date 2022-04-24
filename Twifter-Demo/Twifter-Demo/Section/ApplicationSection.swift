//
//  ApplicationSection.swift
//  Demo
//
//  Created by 宮本大新 on 2022/04/25.
//

import SwiftUI
import Twifter

struct ApplicationSection: View {
    var body: some View {
        Section {
            // Get Rate Limit -> Remaining number of "/statuses/user_timeline
            Button("rate_limit_status") {
                Task {
                    let result = try await TwifterClient().rate_limit_status(resources: [.statuses])
                    guard let resources = result["resources"] as? [String: Any] else { return }
                    guard let statuses = resources["statuses"] as? [String: Any] else { return }
                    guard let user_timeline = statuses["/statuses/user_timeline"] as? [String: Any] else { return }
                    print(user_timeline["remaining"] ?? 0)
                }
            }
        } header: { Text("Application") }
    }
}

struct ApplicationSection_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationSection()
    }
}
