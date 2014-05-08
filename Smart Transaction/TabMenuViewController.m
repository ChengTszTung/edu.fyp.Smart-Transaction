//
//  TabMenuViewController.m
//  Smart Transaction
//
//  Created by TszTung Cheng on 8/4/14.
//  Copyright (c) 2014 1314-114102-02. All rights reserved.
//

#import "TabMenuViewController.h"
#import "LoginViewController.h"
#import <Parse/PFUser.h>

@interface TabMenuViewController ()
@property (nonatomic) PFUser* user;

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
        
        _user = [PFUser currentUser];
        
        [[OWUProximityManager shared] startupClientWithDelegate:self];
        [OWUProximityManager shared].desiredProximity = CLProximityImmediate;
        
    }
}


#pragma mark - OWUBlueBeaconClientDelegate

- (void)proximityClientDidEnterRegion {
    
}

- (void)proximityClientDidConnectToServer {
    [[OWUProximityManager shared] postToServerWithDictionary:@{@"key": @"1234"}];
}

- (void)proximityClientDidRangeBeacon:(CLBeacon *)beacon {
    switch (beacon.proximity) {
        case CLProximityFar:
            NSLog(@"Far");
            break;
        case CLProximityNear:
            NSLog(@"Near");
            
            break;
        case CLProximityImmediate:
            NSLog(@"Immediate");
            break;
        case CLProximityUnknown:
            NSLog(@"Unknown");
            break;
        default:
            break;
    }
}

- (void)proximityClientDidExitRegion {
    
}



@end
