//
//  AGFunctionLoginViewController.m
//  Reactive
//
//  Created by Maria Fossli on 30.10.13.
//  Copyright (c) 2013 Agens AS. All rights reserved.
//

#import "AGFunctionLoginViewController.h"
#import "ReactiveCocoa.h"
#import "AGUserManager.h"
#import "RACExtScope.h"

@interface AGFunctionLoginViewController ()

@property (nonatomic, strong) IBOutlet UITextField *usernameTextField;
@property (nonatomic, strong) IBOutlet UITextField *passwordTextField;
@property (nonatomic, strong) IBOutlet UIButton *logInButton;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation AGFunctionLoginViewController

- (void)viewDidLoad
{
    NSArray *relevantSignalsForLoginButton = @[
                                               self.usernameTextField.rac_textSignal,
                                               self.passwordTextField.rac_textSignal,
                                               RACObserve(AGUserManager.sharedInstance, state),
                                               ];
    
    RAC(self.logInButton, enabled) = [RACSignal combineLatest:relevantSignalsForLoginButton reduce:^(NSString *username, NSString *password, NSNumber *stateValue) {
        AGUserManagerState state = [stateValue intValue];
        return @(username.length > 0 && password.length > 0 && state != AGUserManagerStateLoggingIn);
    }];
    
    RAC(self.activityIndicator, hidden) = [RACObserve(AGUserManager.sharedInstance, state) map:^id(NSNumber *stateValue) {
        AGUserManagerState state = [stateValue intValue];
        return @(state != AGUserManagerStateLoggingIn);
    }];
}

- (IBAction)loginButtonTapped:(id)sender
{
    [[AGUserManager sharedInstance] loginWithUserName:self.usernameTextField.text password:self.passwordTextField.text];
    [self.view endEditing:YES];
}

@end
