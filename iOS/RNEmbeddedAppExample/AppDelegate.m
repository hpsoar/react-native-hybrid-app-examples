/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "AppDelegate.h"
#import "MenuViewController.h"
#import "cyRCT.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[cyRCT sharedManager] setupWithJSHost:@"http://192.168.2.60:8081" LaunchOptions:launchOptions];
    
    MenuViewController *menuViewController = [[MenuViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:menuViewController];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
