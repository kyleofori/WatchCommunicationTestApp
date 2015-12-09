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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserverForName("any-name", object: nil, queue: NSOperationQueue.mainQueue()) { notification in
            
            if let receivedString = notification.userInfo?["any-key"] {
                self.receivedMessage.text = receivedString.debugDescription
            }
        }
    }

}

