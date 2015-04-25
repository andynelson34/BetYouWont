//
//  SecondViewController.m
//  BetYouWon't
//
//  Created by Andy Nelson on 4/25/15.
//  Copyright (c) 2015 We Will Studios. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UITextField *challengeNameView;
@property (weak, nonatomic) IBOutlet UITextField *challengeDescriptionView;
@property (weak, nonatomic) IBOutlet UITextField *timeLimitView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionText;
@property (weak, nonatomic) IBOutlet UILabel *titleText;
@property (weak, nonatomic) IBOutlet UILabel *timeLimitText;
@property (weak, nonatomic) IBOutlet UIDatePicker *timeLimitPicker;
@property (weak, nonatomic) IBOutlet UILabel *peopleText;


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect timeLimitRect = self.timeLimitView.frame;
    timeLimitRect.size.width = self.view.frame.size.width / 2;
    self.timeLimitView.frame = timeLimitRect;
    NSDate *currentTime = [NSDate date];
    [self.timeLimitPicker setMinimumDate:currentTime];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
