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
@property (weak, nonatomic) IBOutlet UITextField *participants;


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

- (IBAction)enterData:(UIButton *)sender {
    
    
    NSString *title = _titleText.text;
    NSString *description = _descriptionText.text;
    NSString *timeLimit = _timeLimitText.text;
    NSString *to = _peopleText.text;
    NSDate *limit = _timeLimitPicker.date;
    NSString *from = @"Me!";
    
    NSURL *URL = [NSURL URLWithString:@"http://5cba3813.ngrok.com/challenge"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    // Set request type
    request.HTTPMethod = @"POST";
    
    // Set params to be sent to the server
    NSDictionary *tmp = [[NSDictionary alloc] initWithObjectsAndKeys:
                         description, @"description",
                         to, @"to",
                         from, @"from",
                         limit, @"end_date",
                         nil];
    
    NSError *error;
    NSData *data = [NSJSONSerialization dataWithJSONObject:tmp options:0 error:&error];
    
    // Add values and contenttype to the http header
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:@"%lu", (unsigned long)[data length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:data];
    
    // Send the request
    [NSURLConnection connectionWithRequest:request delegate:self];
    
    
}

@end
