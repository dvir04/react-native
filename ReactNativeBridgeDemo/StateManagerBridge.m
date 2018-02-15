//
//  StateManagerBridge.m
//  ReactNativeBridgeDemo
//
//  Created by dl20932 on 15/02/2018.
//  Copyright © 2018 dl20932. All rights reserved.
//

#import "RCTBridgeModule.h"

@interface RCT_EXTERN_MODULE(StateManager, NSObject)

RCT_EXTERN_METHOD(didPressButton:(nonnull NSNumber *)reactTag)

@end
