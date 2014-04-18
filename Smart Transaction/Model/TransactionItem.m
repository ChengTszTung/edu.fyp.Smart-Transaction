//
//  TransactionItem.m
//  Smart Transaction Mac
//
//  Created by TszTung Cheng on 7/3/14.
//  Copyright (c) 2014 Parse. All rights reserved.
//

#import "TransactionItem.h"
#import <Parse/PFObject+Subclass.h>

@implementation TransactionItem
@dynamic product;
@dynamic quantity;
+ (NSString *)parseClassName {
    return @"TransactionItem";
}
@end
