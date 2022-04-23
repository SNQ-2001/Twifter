# Twifter

[![Version](https://img.shields.io/badge/version-0.1.0-blue)](https://github.com/SNQ-2001/Twifter)
[![License](https://img.shields.io/badge/License-MIT-green)](https://github.com/SNQ-2001/Twifter)
[![Twitter](https://img.shields.io/twitter/follow/_SNQ?style=social)](https://twitter.com/_SNQ)



If you like the project, please `Star ⭐️`

## Install

***- Swift Package Manager -***

You can install Twifter into your Xcode project via SPM. To learn more about SPM, click here

For Xcode 12
   1. open your project and navigate to File → Swift Packages → Add Package Dependency...
   2. Paste the repository URL (https://github.com/SNQ-2001/Twifter) and click Next.
 
For Xcode 13
   1. navigate to Files → Add Package
   2. Paste the repository URL (https://github.com/SNQ-2001/Twifter) and click Next.

***- CocoaPods -***

You can also install Twifter with Cocoapods. 

Add pod 'Twifter' in your podfile:
```Ruby
platform :ios, '14.0'
target 'Your App' do
  use_frameworks!
  pod 'Twifter'
end
```

## Usage

EX) Get User ID
```Swfit
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
