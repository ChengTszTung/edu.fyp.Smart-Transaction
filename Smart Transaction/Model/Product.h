//
//  Product.h
//  Smart Transaction Mac
//
//  Created by TszTung Cheng on 7/3/14.
//  Copyright (c) 2014 Parse. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : PFObject<PFSubclassing>

+ (NSString *)parseClassName;
@property (retain) NSString *productName;
@property float productPrice;
@property int rfid;
@end
