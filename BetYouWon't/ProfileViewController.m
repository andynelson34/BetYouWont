//
//  ProfileViewController.m
//  BetYouWon't
//
//  Created by Emily Shack on 4/25/15.
//  Copyright (c) 2015 We Will Studios. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@property (weak, nonatomic) IBOutlet UILabel *challengesText;
@property (weak, nonatomic) IBOutlet UILabel *historyText;
@property (weak, nonatomic) IBOutlet UICollectionView *historyPics;
@property (weak, nonatomic) IBOutlet UIImageView *profPic;
@property (weak, nonatomic) IBOutlet UILabel *completedNum;
@property (weak, nonatomic) IBOutlet UILabel *username;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _completedNum.text = @"29";
    _username.text = @"emshack92";
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
