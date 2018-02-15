//
//  StateManager.swift
//  ReactNativeBridgeDemo
//
//  Created by dl20932 on 15/02/2018.
//  Copyright © 2018 dl20932. All rights reserved.
//

import Foundation
import React

@objc(StateManager)
class StateManager: NSObject {
    
    var bridge: RCTBridge!
    
    
    @objc func didPressButton(_ reactTag: NSNumber) {
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: .stateChangedNotification, object: true)
        }
    }
}
