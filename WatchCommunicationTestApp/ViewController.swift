//
//  ViewController.swift
//  WatchCommunicationTestApp
//
//  Created by Stuart Kent on 12/7/15.
//  Copyright © 2015 Stuart Kent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var receivedMessage: UILabel!
    
    @IBAction func hitSend(sender: UIButton) {
        let d = NSDate().description
        
        if #available(iOS 9.0, *) {
            let sessionManager = WatchSessionManager.sharedManager
            
            WatchCommunicationManager(watchSessionManager: sessionManager)
                .sendMessageToWatch("Hi, Kyle, it's \(d)!")
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserverForName("any-name", object: nil, queue: NSOperationQueue.mainQueue()) { notification in
            
            if let receivedString = notification.userInfo?["default-key"] as? String {
                self.receivedMessage.text = receivedString
            }
        }
    }

}

