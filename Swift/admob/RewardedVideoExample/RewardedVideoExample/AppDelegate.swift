//
//  Copyright (C) 2016 Google, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import GoogleMobileAds
import AdColonyAdapter
import UnityAdapter
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication,
      didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

    NSLog("SDK Version: %@", GADRequest.sdkVersion())
    
    // Initialize Google Mobile Ads SDK
    GADMobileAds.configure(withApplicationID: "ca-app-pub-1154410420357813/6968179284")
    let ads = GADMobileAds.sharedInstance()
    ads.start { status in
        // Optional: Log each adapter's initialization latency.
        let adapterStatuses = status.adapterStatusesByClassName
        for adapter in adapterStatuses {
            let adapterStatus = adapter.value
            NSLog("Adapter Name: %@, Description: %@, Latency: %f", adapter.key,
                  adapterStatus.description, adapterStatus.latency)
        }
        // Start loading ads here...
    }
    return true
  }

}
