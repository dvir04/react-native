//
//  ReactModule.swift
//  ReactNativeBridgeDemo
//
//  Created by dl20932 on 15/02/2018.
//  Copyright © 2018 dl20932. All rights reserved.
//

import Foundation
import React

class ReactModule: NSObject {
    static let sharedInstance = ReactModule()
    
    var bridge: RCTBridge?
    
    func viewForModule(_ moduleName: String, initialProperties: [String : Any]?) -> RCTRootView {
        let viewBridge = createBridgeIfNeeded()
        let rootView: RCTRootView = RCTRootView(bridge: viewBridge, moduleName: moduleName, initialProperties: initialProperties)
        return rootView
    }
    
    func eventEmitter(forName moduleName: String) -> RCTEventEmitter? {
        return module(forName: moduleName) as? RCTEventEmitter
    }
}

extension ReactModule: RCTBridgeDelegate {
    func sourceURL(for bridge: RCTBridge!) -> URL! {
        return RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index.ios", fallbackResource: nil) // http://localhost:8081/index.ios.bundle?platform=ios
    }
}

private extension ReactModule {
    
    func createBridgeIfNeeded() -> RCTBridge {
        if bridge == nil {
            bridge = RCTBridge.init(delegate: self, launchOptions: nil)
        }
        return bridge!
    }
    
    func module(forName moduleName: String) -> Any {
        let bridge = createBridgeIfNeeded()
        return bridge.module(forName: moduleName)
    }
}
