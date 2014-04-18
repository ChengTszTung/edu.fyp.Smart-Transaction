//
//  Transaction.h
//  Smart Transaction Mac
//
//  Created by TszTung Cheng on 7/3/14.
//  Copyright (c) 2014 Parse. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Transaction : PFObject<PFSubclassing>

+ (NSString *)parseClassName;
@property PFObject *user;
@property NSArray *transactionItems;
@end
