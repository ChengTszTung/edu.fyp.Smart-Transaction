//
//  Product.m
//  Smart Transaction Mac
//
//  Created by TszTung Cheng on 7/3/14.
//  Copyright (c) 2014 Parse. All rights reserved.
//

#import "Product.h"
#import <Parse/PFObject+Subclass.h>

@implementation Product

@dynamic productName;
@dynamic productPrice;
@dynamic rfid;
+ (NSString *)parseClassName {
    return @"Product";
}

@end
