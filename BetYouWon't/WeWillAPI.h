//
//  WeWillAPI.h
//  BetYouWon't
//
//  Created by Pat Dale on 4/25/15.
//  Copyright (c) 2015 We Will Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeWillAPI : NSObject

extern NSString *endpoint;

- (void) createNewChallenge:(NSString *) descript fromUser:(NSString *) from toUser:(NSString *) to isEnding:(NSDate *) endDate isPublic:(Boolean) public;

- (void) createNewUser:(NSString *) username withFirst:(NSString *) fname withLast:(NSString *) lname;

- (NSDictionary *) getChallenges;

- (NSDictionary *) getUsers;

@end
