//
//  WatchCommunicationManager.swift
//  WatchCommunicationTestApp
//
//  Created by Stuart Kent on 12/8/15.
//  Copyright © 2015 Stuart Kent. All rights reserved.
//

import Foundation
import WatchConnectivity

@available(iOS 9.0, *)
struct WatchCommunicationManager {
    
    private let watchSessionManager: WatchSessionManagerProtocol
    
    init(watchSessionManager: WatchSessionManagerProtocol) {
        self.watchSessionManager = watchSessionManager
    }
    
    func sendMessageToWatch(message: String) {
        guard let session = watchSessionManager.validReachableSession else { return }
        
        session.sendMessage(["fbewuofbeuwof": message], replyHandler: nil, errorHandler: nil)
    }
    
}
