//
//  AppDelegate.swift
//  WatchCommunicationTestApp
//
//  Created by Stuart Kent on 12/7/15.
//  Copyright © 2015 Stuart Kent. All rights reserved.
//

import UIKit
import WatchConnectivity

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        if WCSession.isSupported() {
            WatchSessionManager.sharedManager.startSession()
        
        }
        
        return true
    }
    
    // this is a method from the WCSessionDelegate protocol, but we assign the Manager as the protocol
    
    

}

