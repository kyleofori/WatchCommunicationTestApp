//
//  InterfaceController.swift
//  WatchCommunicationTestApp WatchKit Extension
//
//  Created by Stuart Kent on 12/7/15.
//  Copyright © 2015 Stuart Kent. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    @IBOutlet var receivedText: WKInterfaceLabel!
    
    @IBAction func hitSend() {
        let d = NSDate().description
        
        WatchSessionManager.sharedManager.sendMessageToPhone("Hi, Chris, it's \(d)!")
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        NSNotificationCenter.defaultCenter().addObserverForName("hewioewofbewobf", object: nil, queue: .mainQueue()) { notification in
            if let receivedString = notification.userInfo?["fbewuofbeuwof"] as? String {
                self.receivedText.setText(receivedString)
            }
        }
    }

}
