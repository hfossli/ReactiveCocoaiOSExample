//
//  AGUserManager.h
//  Reactive
//
//  Created by Maria Fossli on 29.10.13.
//  Copyright (c) 2013 Agens AS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGUser.h"

typedef enum {
    AGUserManagerStateLoggedOut,
    AGUserManagerStateLoggingIn,
    AGUserManagerStateLoggedIn,
} AGUserManagerState;

@interface AGUserManager : NSObject

@property (nonatomic, strong, readonly) AGUser *currentUser;
@property (nonatomic, assign, readonly) AGUserManagerState state;

+ (instancetype)sharedInstance;
- (void)loginWithUserName:(NSString *)userName password:(NSString *)password;

@end
