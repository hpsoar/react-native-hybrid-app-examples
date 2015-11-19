//
//  cyRCTManager.h
//  RNEmbeddedAppExample
//
//  Created by HuangPeng on 11/19/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCTBridge.h"

@interface cyRCT : NSObject

+ (instancetype)sharedManager;

- (void)setupWithJSHost:(NSString *)host LaunchOptions:(NSDictionary *)launchOptions;

- (void)verifyModules:(NSArray *)modules;

/**
 * Here we are exposing a `RCTBridge` publicly so that we can access
 * it from anywhere in our app. We simply need to gain access to the
 * AppDelegate and we can get the `RCTBridge`.
 */
@property (nonatomic, readonly) RCTBridge *bridge;

// This method allows us to have access to `NativeModules` that have
// already been instantiated by the bridge.
- (id)nativeModuleForString:(NSString *)moduleName;

@end
