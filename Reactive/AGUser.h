//
//  AGUser.h
//  Reactive
//
//  Created by Maria Fossli on 29.10.13.
//  Copyright (c) 2013 Agens AS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGSettings.h"

@interface AGUser : NSObject

@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSDate *lastSyncDate;
@property (nonatomic, strong) NSArray *messages;
@property (nonatomic, strong, readonly) AGSettings *settings;

@end
