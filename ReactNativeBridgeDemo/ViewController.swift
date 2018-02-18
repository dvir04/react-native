//
//  ViewController.swift
//  ReactNativeBridgeDemo
//
//  Created by dl20932 on 15/02/2018.
//  Copyright © 2018 dl20932. All rights reserved.
//

import UIKit
import React

class ViewController: UIViewController {

    @IBOutlet weak var nativeView: UIView!
    @IBOutlet weak var nativeSwitch: UISwitch!
    @IBOutlet weak var reactNativeView: RCTRootView!
    
    var reactView: RCTRootView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        reactView = ReactModule.sharedInstance.viewForModule("StateApp", initialProperties: ["state": true])
        reactNativeView.addSubview(reactView!)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.toggleState), name: .reactNativeStateChangedNotification, object: nil)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        reactView?.frame = reactNativeView.bounds
    }
    
    @IBAction func nativeSwitchValueChanged(_ sender: UISwitch) {
        StateManager.broadcastStateChangedEvent(state: sender.isOn)
    }
    
    @objc func toggleState(_ notification: Notification) {
        if let currentState = notification.object as? Bool {
            nativeSwitch.setOn(currentState, animated: true)
            nativeSwitchValueChanged(nativeSwitch)
        }
    }
}

extension Notification.Name {
    static let reactNativeStateChangedNotification = Notification.Name(rawValue: "reactNativeStateChangedNotification")
}
