//
//  ExtensionDelegate.swift
//  WatchCommunicationTestApp WatchKit Extension
//
//  Created by Stuart Kent on 12/7/15.
//  Copyright © 2015 Stuart Kent. All rights reserved.
//

import WatchKit

class ExtensionDelegate: NSObject, WKExtensionDelegate {

    func applicationDidFinishLaunching() {
        WatchSessionManager.sharedManager.startSession()
    }
    
}
