//
//  ProfileViewController.m
//  BetYouWon't
//
//  Created by Emily Shack on 4/25/15.
//  Copyright (c) 2015 We Will Studios. All rights reserved.
//

#import "ProfileViewController.h"
#import "FirstViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ProfileViewController ()

@property (weak, nonatomic) IBOutlet UILabel *challengesText;
@property (weak, nonatomic) IBOutlet UILabel *historyText;
@property (weak, nonatomic) IBOutlet UIImageView *profPic;
@property (weak, nonatomic) IBOutlet UILabel *completedNum;
@property (weak, nonatomic) IBOutlet UILabel *username;

@end

@implementation ProfileViewController

NSArray *historyPics;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //to-do: change the following three variables to be user-specific from the database
    _completedNum.text = @"29";
    _username.text = @"emshack92";
    _profPic.image = [UIImage imageNamed:@"BYWlogo2.png"];
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = CGPointMake(187.5, 475);
    [self.view addSubview:loginButton];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
