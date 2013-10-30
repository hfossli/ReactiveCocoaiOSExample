//
//  AGImperativeLoginViewController.m
//  Reactive
//
//  Created by Maria Fossli on 30.10.13.
//  Copyright (c) 2013 Agens AS. All rights reserved.
//

#import "AGImperativeLoginViewController.h"
#import "AGUserManager.h"

@interface AGImperativeLoginViewController ()

@property (nonatomic, strong) IBOutlet UITextField *usernameTextField;
@property (nonatomic, strong) IBOutlet UITextField *passwordTextField;
@property (nonatomic, strong) IBOutlet UIButton *logInButton;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation AGImperativeLoginViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[AGUserManager sharedInstance] addObserver:self forKeyPath:@"state" options: NSKeyValueObservingOptionNew context:NULL];
    
    [self updateLogInButton];
    [self updateActivityIndicator];
}

- (IBAction)textFieldChanged:(UITextField *)textField
{
    [self updateLogInButton];
}

- (BOOL)shouldButtonBeEnabled
{
    BOOL textFieldsIsValid = self.usernameTextField.text.length > 0 && self.passwordTextField.text.length > 0;
    BOOL isNotLoggingIn = [AGUserManager sharedInstance].state != AGUserManagerStateLoggingIn;
    return textFieldsIsValid && isNotLoggingIn;
}

- (void)updateLogInButton
{
    self.logInButton.enabled = [self shouldButtonBeEnabled];
}

- (void)updateActivityIndicator
{
    BOOL isNotLoggingIn = [AGUserManager sharedInstance].state != AGUserManagerStateLoggingIn;
    self.activityIndicator.hidden = isNotLoggingIn;
}

- (IBAction)loginButtonTapped:(id)sender
{
    [[AGUserManager sharedInstance] loginWithUserName:self.usernameTextField.text password:self.passwordTextField.text];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([object isEqual:[AGUserManager sharedInstance]] && [keyPath isEqualToString:@"state"])
    {
        [self updateLogInButton];
        [self updateActivityIndicator];
    }
}

@end
