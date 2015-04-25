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

@property (weak, nonatomic) IBOutlet UILabel *newsFeedText;
@property (weak, nonatomic) IBOutlet UITableView *newsFeed;
@property (weak, nonatomic) IBOutlet UIScrollView *scroller;

@end

@implementation FirstViewController

NSArray *tableData;

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
        //Display news feed
        tableData = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"newsFeed";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"BYWlogo2.png"];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
