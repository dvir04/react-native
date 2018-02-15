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
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        reactView?.frame = reactNativeView.bounds
    }


    @IBAction func nativeSwitchValueChanged(_ sender: UISwitch) {
        
    }
}

