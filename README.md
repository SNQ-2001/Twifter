# Twifter

[![Version](https://img.shields.io/badge/version-0.1.0-blue)](https://github.com/SNQ-2001/Twifter)
[![License](https://img.shields.io/badge/License-MIT-green)](https://github.com/SNQ-2001/Twifter/blob/main/LICENSE)
[![Twitter](https://img.shields.io/twitter/follow/_SNQ?style=social)](https://twitter.com/_SNQ)

This library allows you to manipulate the Twitter API without a developer account.

Currently only [Twitter API v1.1](https://developer.twitter.com/en/docs/api-reference-index#twitter-api-standard) is supported.

I plan to support [Twitter API v2](https://developer.twitter.com/en/docs/api-reference-index#twitter-api-v2) and Twitter private APIs in the future.


If you like the project, Please `Star ⭐️`

## Install

**- Swift Package Manager -**

You can install Twifter into your Xcode project via SPM. To learn more about SPM, click here

For Xcode 12
   1. open your project and navigate to File → Swift Packages → Add Package Dependency...
   2. Paste the repository URL (https://github.com/SNQ-2001/Twifter) and click Next.
 
For Xcode 13
   1. navigate to Files → Add Package
   2. Paste the repository URL (https://github.com/SNQ-2001/Twifter) and click Next.

**- CocoaPods -**

Coming soon

## Functions
```Swift
try await Twifter().generate_guest_token()
try await Twifter().rate_limit_status()
try await Twifter().collections_entries(id: "custom-539487832448843776")
try await Twifter().followers_ids(user_id: 1218659670)
try await Twifter().friends_ids(screen_name: "_SNQ")
try await Twifter().followers_list(user_id: 1218659670)
try await Twifter().followers_list(screen_name: "_SNQ")
try await Twifter().friends_ids(user_id: 1218659670)
try await Twifter().friends_ids(screen_name: "_SNQ")
try await Twifter().friends_list(user_id: 1218659670)
try await Twifter().friends_list(screen_name: "_SNQ")
try await Twifter().friendships_show(source_id: 1218659670, target_id: 1468966997438640128)
try await Twifter().friendships_show(source_screen_name: "_SNQ", target_screen_name: "Shadow_Ban_Bot")
try await Twifter().geo_id(place_id: "06ef846bfc783874")
try await Twifter().geo_reverse_geocode(lat: 35.79449997305192, long: 139.79078800000002)
try await Twifter().geo_search(query: "Tokyo")
try await Twifter().geo_search(lat: 35.79449997305192, long: 139.79078800000002)
try await Twifter().geo_search(ip: "1.2.3.4")
try await Twifter().lists_list(user_id: 1218659670)
try await Twifter().lists_list(screen_name: "_SNQ")
try await Twifter().lists_members(list_id: 1517792406514839552)
try await Twifter().lists_memberships(user_id: 1218659670)
try await Twifter().lists_memberships(screen_name: "_SNQ")
try await Twifter().lists_ownerships(user_id: 1218659670)
try await Twifter().lists_ownerships(screen_name: "_SNQ")
try await Twifter().lists_show(list_id: 1517792406514839552)
try await Twifter().lists_statuses(list_id: 1517792406514839552)
try await Twifter().lists_subscribers(list_id: 1517792406514839552)
try await Twifter().lists_subscriptions(user_id: 1218659670)
try await Twifter().lists_subscriptions(screen_name: "_SNQ")
try await Twifter().search_tweets(q: "Swift")
try await Twifter().statuses_lookup(id: [1488101267243429889, 1516619027288043521])
try await Twifter().statuses_retweeters_ids(id: 1488101267243429889)
try await Twifter().statuses_retweets(id: 1488101267243429889)
try await Twifter().statuses_show(id: 1488101267243429889)
try await Twifter().statuses_user_timeline(user_id: 1218659670)
try await Twifter().statuses_user_timeline(screen_name: "_SNQ")
try await Twifter().trends_available()
try await Twifter().trends_closest(lat: 35.79449997305192, long: 139.79078800000002)
try await Twifter().trends_place(id: 1110809)
try await Twifter().users_lookup(user_id: [1218659670, 1468966997438640128])
try await Twifter().users_lookup(screen_name: ["_SNQ", "Shadow_Ban_Bot"])
try await Twifter().users_search(q: "_SNQ")
try await Twifter().user_show(user_id: 1218659670)
try await Twifter().user_show(screen_name: "_SNQ")
```

## Usage

EX) Get User ID
```Swift
import SwiftUI
import Twifter

struct ContentView: View {
   var body: some View {
        Button(action: {
            Task {
                let user_info = try await Twifter().user_show(screen_name: "_SNQ")
                guard let id = user_info["id"] else { return }
                print(id)
            }
        }) {
            Text("Get User ID")
        }
   }
}
```

**- Requirements -**

Enclose with `Task`

```Swift
Task {
    
}
```

Add `try await`

```Swift
try await Twifter().user_show(screen_name: "_SNQ")
```

## Contributions

Issues and PRs are welcome, even for minor improvements and corrections.
