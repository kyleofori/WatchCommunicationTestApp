//
//  WatchSessionManager.swift
//  WatchCommunicationTestApp
//
//  Created by Stuart Kent on 12/8/15.
//  Copyright © 2015 Stuart Kent. All rights reserved.
//

import Foundation
import WatchConnectivity

@available(iOS 9.0, *)
class WatchSessionManager: NSObject, WCSessionDelegate {
    
    static let sharedManager = WatchSessionManager()
    private override init() {
        super.init()
    }
    
    // MARK: Exposed Methods
    
    func startSession() {
        session?.delegate = self
        session?.activateSession()
    }
    
    // TODO: consider moving this to a separate WatchCommunicationManager
    func sendMessageToWatch(message: String) {
        let session = WCSession.defaultSession()
        
        guard session.reachable else { return }
        
        session.sendMessage(["fbewuofbeuwof": message], replyHandler: nil, errorHandler: nil)
    }
    
    // MARK: WCSessionDelegate Method
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject]) {
        print("short")
        NSNotificationCenter.defaultCenter().postNotificationName("any-name", object: nil, userInfo: message)
    }
    
    // MARK: Private Implementation
    
    private let session: WCSession? = WCSession.isSupported() ? WCSession.defaultSession() : nil
    
    private var validSession: WCSession? {
        guard let session = session where session.isValid else {
            return nil
        }
        
        return session
    }
    
    private var validReachableSession: WCSession? {
        guard let session = session where session.isValidAndReachable else {
            return nil
        }
        
        return session
    }
    
}
