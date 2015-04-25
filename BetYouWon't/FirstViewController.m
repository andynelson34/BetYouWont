//
//  FirstViewController.m
//  BetYouWon't
//
//  Created by Andy Nelson on 4/25/15.
//  Copyright (c) 2015 We Will Studios. All rights reserved.
//

#import "FirstViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (![FBSDKAccessToken currentAccessToken]) {
        // Disable tab bar interaction if user isn't logged in
        for (UITabBarItem *tmpTabBarItem in [[self.tabBarController tabBar] items]) {
            [tmpTabBarItem setEnabled:NO];
        }
        FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
        loginButton.center = self.view.center;
        [self.view addSubview:loginButton];
    } else {
        // Enable tab bar interaction if user is logged in
        for (UITabBarItem *tmpTabBarItem in [[self.tabBarController tabBar] items]) {
            [tmpTabBarItem setEnabled:YES];
        }
    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
