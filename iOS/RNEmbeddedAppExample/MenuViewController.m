//
//  MenuViewController.m
//  RNEmbeddedAppExample
//
//  Created by Dave Sibiski on 9/2/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import "MenuViewController.h"

#import "PassingDataViewController.h"
#import "ModalWithNavigatorViewController.h"
#import "RCTViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController {
    NSDictionary *data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    data = @{
        @"sectionTitles": @[@"Simple", @"Advanced"],
        @"sectionKeys": @[
            @[@"ViewInView", @"PassingData"],
            @[@"ModalWithNavigator"],
        ],
        @"sectionData": @[
            @[
                @"React View inside a Native View",
                @"Passing Data into a React View",
            ],
            @[
                @"Native Modal with RN Navigation",
            ],
        ],
    };
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
  
    self.title = @"Embedded App Example";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[data objectForKey:@"sectionTitles"] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[data objectForKey:@"sectionData"] objectAtIndex:section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  
  return [[data objectForKey:@"sectionTitles"] objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [[[data objectForKey:@"sectionData"] objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
  
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *chosenItem = [[[data objectForKey:@"sectionKeys"] objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
  
    if ([chosenItem isEqualToString:@"ViewInView"]) {
        RCTViewController *vc = [[RCTViewController alloc] initWithModule:@"SimpleView" moduleParams:nil];
        [vc showFrom:self animated:YES naviType:kRCTVCNaviTypePush];
    }
    else if ([chosenItem isEqualToString:@"PassingData"]) {
        RCTViewController *vc = [[RCTViewController alloc] initWithModule:@"PassingData" moduleParams:[self data]];
        [vc showFrom:self animated:YES naviType:kRCTVCNaviTypePush];
    }
    else if ([chosenItem isEqualToString:@"ModalWithNavigator"]) {
        RCTViewController *vc = [[RCTViewController alloc] initWithModule:@"ModalWithNavigator" moduleParams:nil];
        [vc showFrom:self animated:YES naviType:kRCTVCNaviTypePushHideNaviBar];
    }
}

- (NSDictionary *)data {
    return @{
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
}

@end
