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
class AppDelegate: UIResponder, UIApplicationDelegate, WCSessionDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        if WCSession.isSupported() {
            let session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
        
        return true
    }
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject]) {
        print("short")
        NSNotificationCenter.defaultCenter().postNotificationName("any-name", object: nil, userInfo: message)
    }
    
    func sendMessage(message: String) {
        let session = WCSession.defaultSession()
        
        guard session.reachable else { return }
        
        session.sendMessage(["fbewuofbeuwof": message], replyHandler: nil, errorHandler: nil)
    }

}

