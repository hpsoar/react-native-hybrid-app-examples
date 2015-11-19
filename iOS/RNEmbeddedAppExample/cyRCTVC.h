//
//  RCTViewController.h
//  RNEmbeddedAppExample
//
//  Created by HuangPeng on 11/19/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cyRCT.h"

typedef NS_ENUM(NSInteger, RCTVCNaviType) {
  kRCTVCNaviTypePush,
  kRCTVCNaviTypePushHideNaviBar,
  kRCTVCNaviTypeModal,
};

@interface cyRCTVC : UIViewController

- (instancetype)initWithModule:(NSString *)moduleName moduleParams:(NSDictionary *)params;

- (void)showFrom:(UIViewController *)vc animated:(BOOL)animated naviType:(RCTVCNaviType)naviType;

@end
