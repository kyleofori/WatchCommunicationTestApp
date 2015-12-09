//
//  WatchSessionManager.swift
//  WatchCommunicationTestApp
//
//  Created by Stuart Kent on 12/9/15.
//  Copyright © 2015 Stuart Kent. All rights reserved.
//

import Foundation
import WatchConnectivity

class WatchSessionManager: NSObject, WCSessionDelegate {
    
    static let sharedManager = WatchSessionManager()
    private override init() {
        super.init()
    }
    
    // MARK: Exposed Methods
    
    func startSession() {
        session.delegate = self
        session.activateSession()
    }
    
    func sendMessageToPhone(message: String) {
        if let session = reachableSession {
            session.sendMessage(["default-key" : message], replyHandler: nil, errorHandler: nil)
        }
    }
    
    // MARK: WCSessionDelegate Methods
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject]) {
        NSNotificationCenter.defaultCenter().postNotificationName("hewioewofbewobf", object: nil, userInfo: message)
    }
    
    // MARK: Private Implementation
    
    private let session: WCSession = WCSession.defaultSession()
    
    private var reachableSession: WCSession? {
        guard session.reachable else {
            return nil
        }
        
        return session
    }
    
}
