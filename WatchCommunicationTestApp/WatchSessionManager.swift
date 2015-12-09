//
//  WatchSessionManager.swift
//  WatchCommunicationTestApp
//
//  Created by Stuart Kent on 12/8/15.
//  Copyright © 2015 Stuart Kent. All rights reserved.
//

import Foundation
import WatchConnectivity

// TODO: this would never live here in real life
import Alamofire

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
    
    func sendMessageToWatch(message: String) {
        guard let session = validReachableSession else { return }
        
        session.sendMessage(["fbewuofbeuwof": message], replyHandler: nil, errorHandler: nil)
    }
    
    // MARK: WCSessionDelegate Methods
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject]) {
        let requestURL = "http://api.wunderground.com/api/9767e85ea7d17a16/conditions/q/CA/San_Francisco.json"
        
        Alamofire.request(.GET, requestURL)
            .responseJSON { (_, _, result: Result<AnyObject>) in
                if let JSON = result.value,
                    dict = JSON as? [String: AnyObject],
                    currentObservation = dict["current_observation"] as? [String: AnyObject],
                    currentTemperature = currentObservation["temperature_string"] {
                        NSNotificationCenter.defaultCenter().postNotificationName("any-name", object: nil, userInfo: ["any-key": currentTemperature])
                }
        }
    }
    
    // MARK: Private Implementation
    
    private let session: WCSession? = WCSession.isSupported() ? WCSession.defaultSession() : nil
    
    private var validSession: WCSession? {
        guard let session = session where session.isValid else {
            return nil
        }
        
        return session
    }
    
    var validReachableSession: WCSession? {
        guard let session = session where session.isValidAndReachable else {
            return nil
        }
        
        return session
    }
    
}
