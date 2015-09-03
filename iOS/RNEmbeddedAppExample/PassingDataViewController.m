//
//  PassingDataViewController.m
//  RNEmbeddedAppExample
//
//  Created by Dave Sibiski on 9/2/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import "PassingDataViewController.h"
#import "AppDelegate.h"
#import "RCTRootView.h"

@interface PassingDataViewController ()

@end

@implementation PassingDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Passing Data";
    
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:delegate.bridge moduleName:@"PassingData"];
    
    rootView.initialProperties = @{
        @"data": @[
            @"Here",
            @"is",
            @"an",
            @"example",
            @"of",
            @"passing",
            @"data",
            @"into",
            @"a",
            @"React",
            @"View",
            @"that",
            @"is",
            @"embedded",
            @"in",
            @"a",
            @"Native",
            @"View",
        ]
    };
    
    rootView.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:rootView];
}

@end