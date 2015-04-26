//
//  WeWillAPI.m
//  BetYouWon't
//
//  Created by Pat Dale on 4/25/15.
//  Copyright (c) 2015 We Will Studios. All rights reserved.
//

#import "WeWillAPI.h"

@interface WeWillAPI ()

@end

@implementation WeWillAPI

NSString *endpoint = @"http://5cba3813.ngrok.com";

- (void) createNewChallenge:(NSString *) descript fromUser:(NSString *) from toUser:(NSString *) to isEnding:(NSDate *) endDate isPublic:(Boolean) public
{
    NSDictionary *tmp = [[NSDictionary alloc] initWithObjectsAndKeys:
                         from, @"from",
                         to, @"to",
                         descript, @"description",
                         endDate, @"end_date",
                         public, @"public",
                         nil];
    
    [self doPostRequest:@"challenge" withParams:tmp];
}

- (void) createNewUser:(NSString *) username withFirst:(NSString *) fname withLast:(NSString *) lname
{
    NSDictionary *tmp = [[NSDictionary alloc] initWithObjectsAndKeys:
                         username, @"username",
                         fname, @"firstname",
                         lname, @"lastname",
                         nil];

    [self doPostRequest:@"user" withParams:tmp];
}

- (NSDictionary *) getChallenges
{
    return [self doGetRequest: @"challenge"];
}

- (NSDictionary *) getUsers
{
    return [self doGetRequest: @"user"];
}

- (void) doPostRequest: (NSString *) action withParams:(NSDictionary *) params
{
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", endpoint, action]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    // Set request type
    request.HTTPMethod = @"POST";
    
    NSError *error;
    NSData *data = [NSJSONSerialization dataWithJSONObject:params options:0 error:&error];
    
    // Add values and contenttype to the http header
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:@"%lu", (unsigned long)[data length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:data];
    
    // Send the request
    [NSURLConnection connectionWithRequest:request delegate:self];
}

- (NSDictionary *) doGetRequest: (NSString *) action
{
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", endpoint, action]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    
    // Set request type
    request.HTTPMethod = @"GET";
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    // Add values and contenttype to the http header
    //NSString *myStringFiller = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseData options: NSJSONReadingMutableContainers error: &error];
    return json;
}


@end
