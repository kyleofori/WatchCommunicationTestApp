//
//  ExtensionDelegate.swift
//  WatchCommunicationTestApp WatchKit Extension
//
//  Created by Stuart Kent on 12/7/15.
//  Copyright © 2015 Stuart Kent. All rights reserved.
//

import WatchKit
import WatchConnectivity

class ExtensionDelegate: NSObject, WKExtensionDelegate, WCSessionDelegate {

    func applicationDidFinishLaunching() {
        let session = WCSession.defaultSession()
        session.delegate = self
        session.activateSession()
    }
    
    func sendMessage(message: String) {
        let session = WCSession.defaultSession()
        
        if session.reachable {
            session.sendMessage(["default-key" : message], replyHandler: nil, errorHandler: nil)
        }
    }
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject]) {
        NSNotificationCenter.defaultCenter().postNotificationName("hewioewofbewobf", object: nil, userInfo: message)
    }

}
