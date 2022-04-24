//
//  ContentView.swift
//  Twifter-Demo
//
//  Created by 宮本大新 on 2022/04/23.
//

import SwiftUI
import Twifter

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                Group {
                    ApplicationSection()

                    CollectionsSection()

                    FavoritesSection()

                    FollowersSection()

                    FriendsSection()

                    GeoSection()
                }
                Group {
                    ListsSection()

                    SearchSection()

                    StatusesSection()

                    TrendsSection()

                    UsersSection()
                }
            }
            .navigationTitle("Twifter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
