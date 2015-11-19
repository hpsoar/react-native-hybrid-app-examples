//
//  RCTViewController.m
//  RNEmbeddedAppExample
//
//  Created by HuangPeng on 11/19/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import "RCTViewController.h"
#import "RCTRootView.h"
#import "AppDelegate.h"

@interface RCTViewController ()
@property (nonatomic, readonly) NSString *moduleName;
@property (nonatomic, readonly) NSDictionary *params;
@property (nonatomic) BOOL hideNavigationBar;
@property (nonatomic) BOOL navigationBarWasHidden;
@end

@implementation RCTViewController

- (void)showFrom:(UIViewController *)vc animated:(BOOL)animated naviType:(RCTVCNaviType)naviType {
  switch (naviType) {
    case kRCTVCNaviTypePush: {
      [vc.navigationController pushViewController:self animated:animated];
      break;
    }
    case kRCTVCNaviTypePushHideNaviBar: {
      self.hideNavigationBar = YES;
      [vc.navigationController pushViewController:self animated:animated];
      break;
    }
    case kRCTVCNaviTypeModal: {
      [vc presentViewController:self animated:animated completion:nil];
      break;
    }
    default: {
      break;
    }
  }
}

- (instancetype)initWithModule:(NSString *)moduleName moduleParams:(NSDictionary *)params {
  self = [super initWithNibName:nil bundle:nil];
  if (self) {
    _moduleName = moduleName;
    _params = params;
  }
  return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
  // Here we create a `RCTRootView` that initializes with the `RCTBridge` that we already pre-loaded.
  RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:[cyRCT sharedManager].bridge moduleName:self.moduleName initialProperties:self.params];
  
  // We want this view to take up the entire screen.
  rootView.frame = [UIScreen mainScreen].bounds;
  
  [self.view addSubview:rootView];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  if (self.hideNavigationBar) {
    self.navigationBarWasHidden = self.navigationController.navigationBarHidden;
    [self.navigationController setNavigationBarHidden:YES];
  }
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  if (self.hideNavigationBar) {
    if (!self.navigationBarWasHidden) {
      [self.navigationController setNavigationBarHidden:NO];
    }
  }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
