//
//  cyRCTPipe.h
//  RNEmbeddedAppExample
//
//  Created by HuangPeng on 11/19/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCTBridgeModule.h"
#import <UIKit/UIKit.h>

@class cyRCTFunc;

/**
 *  cyRCTPipe module
 */
@interface cyRCTPipe : NSObject <RCTBridgeModule>

- (void)registerFunc:(cyRCTFunc *)func name:(NSString *)name;
- (void)registerFunc:(cyRCTFunc *)func;
- (void)unregisterFunc:(NSString *)name;

@end

// cyRCTFunc
@interface cyRCTFunc : NSObject

@property (nonatomic, readonly) NSString *funcName;

- (void)invoke:(NSDictionary *)params callback:(RCTResponseSenderBlock)callback;

- (void)invoke;

@end

// scalfold
@interface cyRCTFunc (Util)

@property (nonatomic, readonly) UIViewController *topVC;

- (void)runInMainQueue:(dispatch_block_t)block;

@end

// cyRCTFuncDismissModalVC
#define kRCTFuncDismissModalVC @"dissmiss_vc"
#define kRCTFuncPopVC @"pop_vc"
#define kRCTFuncParameterAnimated @"animated"

@interface cyRCTFuncDismissModalVC : cyRCTFunc

@end

@interface cyRCTFuncPopVC : cyRCTFunc

@end
