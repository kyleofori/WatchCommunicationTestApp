//
//  WatchSessionManager.swift
//  WatchCommunicationTestApp
//
//  Created by Kyle Ofori on 12/8/15.
//  Copyright © 2015 Stuart Kent. All rights reserved.
//

import Foundation
import WatchConnectivity

// Note that the WCSessionDelegate must be an NSObject
// So no, you cannot use the nice Swift struct here!
class WatchSessionManager: NSObject, WCSessionDelegate {
    
    // Instantiate the Singleton
    static let sharedManager = WatchSessionManager()
    private override init() {
        super.init()
    }
    
    // Keep a reference for the session,
    // which will be used later for sending / receiving data
    private let session: WCSession? = WCSession.isSupported() ? WCSession.defaultSession() : nil
    
    // Activate Session
    // This needs to be called to activate the session before first use!
    func startSession() {
        session?.delegate = self
        session?.activateSession()
    }
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject]) {
        print("short")
        NSNotificationCenter.defaultCenter().postNotificationName("any-name", object: nil, userInfo: message)
    }
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject]) {
        print("short")
        // issue network request here
    }
    
    func sendMessage(message: String) {
        let session = WCSession.defaultSession()
        
        guard session.reachable else { return }
        
        session.sendMessage(["fbewuofbeuwof": message], replyHandler: nil, errorHandler: nil)
    }
}