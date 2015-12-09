//
//  WCSessionManager.swift
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
    private let session = WCSession.defaultSession()
    
    // Activate Session
    // This needs to be called to activate the session before first use!
    func startSession() {
        session.delegate = self
        session.activateSession()
    }
}