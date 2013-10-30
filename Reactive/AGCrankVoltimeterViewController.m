//
//  AGCrankVoltimeterViewController.m
//  Reactive
//
//  Created by Maria Fossli on 29.10.13.
//  Copyright (c) 2013 Agens AS. All rights reserved.
//

#import "AGCrankVoltimeterViewController.h"
#import "ReactiveCocoa.h"
#import "AGUserManager.h"
#import "RACExtScope.h"

@interface AGCrankVoltimeterViewController ()

@property (nonatomic, strong) IBOutlet UILabel *userNameLabel;
@property (nonatomic, strong) IBOutlet UILabel *syncDateLabel;
@property (nonatomic, strong) IBOutlet UILabel *peelPotatoStateLabel;
@property (nonatomic, strong) IBOutlet UILabel *flushToiletStateLabel;
@property (atomic, assign) NSUInteger totalNumberOfPotatoesPeeled;

@end

@implementation AGCrankVoltimeterViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    RACChannelTo(self, userNameLabel.text) = RACChannelTo(AGUserManager.sharedInstance, currentUser.name);
    
    RAC(self, syncDateLabel.text) = [RACObserve(AGUserManager.sharedInstance, currentUser.lastSyncDate) map:^id(NSDate *date) {
        return [self formatDate:date];
    }];
    
    RAC(self, peelPotatoStateLabel.text) = [[[RACObserve(self, totalNumberOfPotatoesPeeled)
                                             deliverOn:[RACScheduler mainThreadScheduler]]
                                            take:11]
                                            map:^id(NSNumber *value) {
                                                int peelTimes = [value unsignedIntegerValue];
                                                if(peelTimes >= 10)
                                                {
                                                    return @"Peeled a lot!";
                                                }
                                                else
                                                {
                                                    return [NSString stringWithFormat:@"%d done!", peelTimes];
                                                }
                                            }];
    
}

- (IBAction)userWantsToPeelPotatoes:(id)sender
{
    [[self peelFivePotatoes]
     subscribeNext:^(NSNumber *progress) {
        NSLog(@"Peeled %@ out of 5", progress);
         self.totalNumberOfPotatoesPeeled++;
    } error:^(NSError *error) {
        NSLog(@"Error occured");
    } completed:^{
        NSLog(@"Potatoes are peeled");
    }];
}

- (RACSignal *)peelFivePotatoes
{
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSOperationQueue *queue = [NSOperationQueue new];
        [queue setMaxConcurrentOperationCount:1];
        
        for(int j = 0; j < 5; j++)
        {
            NSOperation *peelOperation = [NSBlockOperation blockOperationWithBlock:^{
                [self doSomeMath];
            }];
            
            [peelOperation setCompletionBlock:^{
                [subscriber sendNext:@(j + 1)];
                if(j == 4)
                {
                    [subscriber sendCompleted];
                }
            }];
            
            [queue addOperation:peelOperation];
        }
        
        return [RACDisposable disposableWithBlock:^{
            [queue cancelAllOperations];
        }];
    }];
    return signal;
}

- (void)doSomeMath
{
    int total = 10000000;
    int sum = 0;
    for(int i = 0; i < total; i++)
    {
        sum += ceilf(floorf(roundf(sinf(((float)i / (float)total) * M_PI))));
    }
}

- (NSString *)formatDate:(NSDate *)date
{
    static NSDateFormatter *formatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [NSDateFormatter new];
        formatter.dateFormat = @"hh:mm:ss";
    });
    
    return [formatter stringFromDate:date];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
