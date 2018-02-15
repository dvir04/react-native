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
        
        reactView = ReactModule.sharedInstance.viewForModule("StateApp", initialProperties: nil)
        reactNativeView.addSubview(reactView!)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.toggleState), name: .stateChangedNotification, object: nil)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        reactView?.frame = reactNativeView.bounds
    }


    @IBAction func nativeSwitchValueChanged(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "State")
    }
    
    @objc func toggleState(_ notification: Notification) {
        let currentState = UserDefaults.standard.bool(forKey: "State")
        print("State: \(currentState)")
        nativeSwitch.isOn = !currentState
        UserDefaults.standard.set(!currentState, forKey: "State")
    }
}

extension Notification.Name {
    static let stateChangedNotification = Notification.Name(rawValue: "StateChanged")
}
