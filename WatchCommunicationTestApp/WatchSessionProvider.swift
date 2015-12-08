//
//  WatchSessionProvider.swift
//  WatchCommunicationTestApp
//
//  Created by Stuart Kent on 12/8/15.
//  Copyright © 2015 Stuart Kent. All rights reserved.
//

import Foundation
import WatchConnectivity

@available(iOS 9.0, *)
protocol WatchSessionProvider {
    var validReachableSession: WCSession? { get }
}
