//
//  Transaction.m
//  Smart Transaction Mac
//
//  Created by TszTung Cheng on 7/3/14.
//  Copyright (c) 2014 Parse. All rights reserved.
//

#import "Transaction.h"
#import <Parse/PFObject+Subclass.h>

@implementation Transaction

@dynamic user;
@dynamic transactionItems;
+ (NSString *)parseClassName {
    return @"Transaction";
}

@end
