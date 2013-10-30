//
//  AGUserManager.m
//  Reactive
//
//  Created by Maria Fossli on 29.10.13.
//  Copyright (c) 2013 Agens AS. All rights reserved.
//

#import "AGUserManager.h"
#import "ReactiveCocoa.h"

@interface AGUserManager ()

@property (nonatomic, strong, readwrite) AGUser *currentUser;
@property (nonatomic, strong, readwrite) AGSettings *settings;
@property (nonatomic, assign, readwrite) AGUserManagerState state;

@end


@implementation AGUserManager

+ (instancetype)sharedInstance
{
    static AGUserManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [AGUserManager new];
    });
    return instance;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        [self synchUserNowAndThen];
    }
    return self;
}

- (void)synchUserNowAndThen
{
    __weak __typeof__(self) wself = self;
    double delayInSeconds = 10.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        self.currentUser.lastSyncDate = [NSDate date];
        [wself synchUserNowAndThen];
    });
}

- (void)loginWithUserName:(NSString *)userName password:(NSString *)password
{
    self.state = AGUserManagerStateLoggingIn;
    
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        AGUser *user = [AGUser new];
        user.name = userName;
        user.userId = @"511";
        user.lastSyncDate = [NSDate date];
        
        self.currentUser = user;
        self.state = AGUserManagerStateLoggedIn;
    });
}

@end
