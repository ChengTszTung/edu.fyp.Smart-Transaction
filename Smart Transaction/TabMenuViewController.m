//
//  TabMenuViewController.m
//  Smart Transaction
//
//  Created by TszTung Cheng on 8/4/14.
//  Copyright (c) 2014 1314-114102-02. All rights reserved.
//

#import "TabMenuViewController.h"
#import "LoginViewController.h"

@interface TabMenuViewController ()

@end

@implementation TabMenuViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (![PFUser currentUser]) { // No user logged in
        // Create the log in view controller
        LoginViewController *logInViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"LoginViewController"];
        [logInViewController setDelegate:self]; // Set ourselves as the delegate
        
        // Present the log in view controller
        self.modalPresentationStyle = UIModalPresentationCurrentContext;
        [self presentViewController:logInViewController animated:YES completion:NULL];
    }else{
        //[PFUser logOut];
    }
    

    
}

@end
