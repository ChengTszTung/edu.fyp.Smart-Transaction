//
//  LoginViewController.m
//  Smart Transaction
//
//  Created by TszTung Cheng on 1/3/14.
//  Copyright (c) 2014 1314-114102-02. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController{
    UIImageView* fieldsBackground;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    [self.logInView setBackgroundColor:[UIColor colorWithRed:0.0 green:0.27 blue:0.61 alpha:1.0]];
    [self.logInView.dismissButton setHidden:YES];
    [self.logInView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]]];
    
    [self.logInView.passwordForgottenButton setImage:[UIImage imageNamed:@"forgotBtn.png"] forState:UIControlStateNormal];
    


    CALayer *layer = self.logInView.usernameField.layer;
    layer.shadowOpacity = 0.0;
    layer = self.logInView.passwordField.layer;
    layer.shadowOpacity = 0.0;
    
    
    fieldsBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LoginFieldBG.png"]];
    [self.logInView insertSubview:fieldsBackground atIndex:1];
    
    self.delegate = self;
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    

    [fieldsBackground setFrame:CGRectMake(35.0f, 200.0f, 250.0f, 100.0f)];
}

-(void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end