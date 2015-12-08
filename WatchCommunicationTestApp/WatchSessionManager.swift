//
//  WatchSessionManager.swift
//  WatchCommunicationTestApp
//
//  Created by Stuart Kent on 12/8/15.
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
        session?.delegate = self
        session?.activateSession()
    }
    
    // MARK: Private Implementation
    
    private let session: WCSession? = WCSession.isSupported() ? WCSession.defaultSession() : nil
    
    private var validSession: WCSession? {
        guard let session = session where session.paired && session.watchAppInstalled else {
            return nil
        }
        
        return session
    }
    
    private var validReachableSession: WCSession? {
        guard let session = validSession where session.reachable else {
            return nil
        }
        
        return session
    }
    
}
