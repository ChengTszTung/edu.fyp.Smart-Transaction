//
//  TransactionItem.h
//  Smart Transaction Mac
//
//  Created by TszTung Cheng on 7/3/14.
//  Copyright (c) 2014 Parse. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TransactionItem : PFObject<PFSubclassing>

+ (NSString *)parseClassName;
@property Product *product;
@property int quantity;
@end
