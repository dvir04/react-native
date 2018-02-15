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
class StateManager: RCTEventEmitter {
    
    override func supportedEvents() -> [String]! {
        return ["StateManagerEvent"]
    }
    
    @objc func stateValueChanged(_ state: Bool) {
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: .reactNativeStateChangedNotification, object: state)
        }
    }
    
    static func broadcastStateChangedEvent(state: Bool) {
        ReactModule.sharedInstance.eventEmitter(forName: "StateManager")?.sendEvent(withName: "StateManagerEvent", body: ["state": state])
    }
}
