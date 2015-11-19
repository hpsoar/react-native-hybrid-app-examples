//
//  cyRCTPipe.m
//  RNEmbeddedAppExample
//
//  Created by HuangPeng on 11/19/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import "cyRCTBridge.h"

@implementation cyRCTBridge {
  NSMutableDictionary *_funcMap;
}

RCT_EXPORT_MODULE()

// This is an exported method that is available in JS.
RCT_EXPORT_METHOD(invoke:(NSString *)method params:(NSDictionary *)params callback:(RCTResponseSenderBlock)callback) {
  cyRCTFunc *func = _funcMap[method];
  [func invoke:params callback:callback];
}

RCT_EXPORT_METHOD(invoke:(NSString *)method) {
  [self invoke:method params:nil callback:nil];
}

RCT_EXPORT_METHOD(closeModalVC) {
  [self invoke:kRCTFuncDismissModalVC];
}

RCT_EXPORT_METHOD(popVC) {
  [self invoke:kRCTFuncPopVC];
}

- (instancetype)init
{
  self = [super init];
  if (self) {
    _funcMap = [NSMutableDictionary new];
  }
  return self;
}

- (void)registerFunc:(cyRCTFunc *)func {
  [self registerFunc:func name:func.funcName];
}

- (void)registerFunc:(cyRCTFunc *)func name:(NSString *)name {
  _funcMap[name] = func;
}

- (void)unregisterFunc:(NSString *)name {
  [_funcMap removeObjectForKey:name];
}

@end

@implementation cyRCTFunc

- (void)invoke:(NSDictionary *)params callback:(RCTResponseSenderBlock)callback {
  
}

- (void)invoke {
  [self invoke:nil callback:nil];
}

@end

@implementation cyRCTFunc (Util)

- (UIViewController *)topVC {
  UIViewController *vc = [[UIApplication sharedApplication] keyWindow].rootViewController;
  if ([vc isKindOfClass:[UITabBarController class]]) {
    vc = [(UITabBarController *)vc selectedViewController];
  }
  
  if ([vc isKindOfClass:[UINavigationController class]]) {
    vc = [(UINavigationController *)vc viewControllers].lastObject;
  }
  return vc;
}

- (void)runInMainQueue:(dispatch_block_t)block {
  dispatch_async(dispatch_get_main_queue(), ^{
    block();
  });
}

@end

BOOL cyRCTParamBool(NSDictionary *dict, NSString *name, BOOL defaultValue) {
  id param = dict[name];
  return param ? [param boolValue] : defaultValue;
}

@implementation cyRCTFuncDismissModalVC

- (NSString *)funcName {
  return kRCTFuncDismissModalVC;
}

- (void)invoke:(NSDictionary *)params callback:(RCTResponseSenderBlock)callback {
  BOOL animated = cyRCTParamBool(params, kRCTFuncParameterAnimated, YES);
  UIViewController *vc = self.topVC;
  
  NSAssert(vc.presentedViewController != nil, @"`%@`.presentedViewController is nil", vc);
  
  [self runInMainQueue:^{
    [vc.presentedViewController dismissViewControllerAnimated:animated completion:nil];
  }];
}

- (void)_impl:(NSDictionary *)params callback:(RCTResponseSenderBlock)callback {
 
}

@end

@implementation cyRCTFuncPopVC

- (NSString *)funcName {
  return kRCTFuncPopVC;
}

- (void)invoke:(NSDictionary *)params callback:(RCTResponseSenderBlock)callback {
  BOOL animated = cyRCTParamBool(params, kRCTFuncParameterAnimated, YES);
  UIViewController *vc = self.topVC;
  NSAssert(vc != nil, @"top view controller is nil");
  
  [self runInMainQueue:^{
    [vc.navigationController popViewControllerAnimated:animated];
  }];
}

@end
