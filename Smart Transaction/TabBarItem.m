//
//  TabBarItem.m
//  Smart Transaction
//
//  Created by TszTung Cheng on 8/4/14.
//  Copyright (c) 2014 1314-114102-02. All rights reserved.
//

#import "TabBarItem.h"

@implementation TabBarItem

-(void) setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"imageName"])
    {
        [self setImageWithImageName:value];
    }else if ([key isEqualToString:@"selectedImageName"]){
        [self setSelectedImageWithImageName:value];
    }
}

-(void)setImageWithImageName:(NSString *)imageName
{
    [self setImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
}
-(void)setSelectedImageWithImageName:(NSString *)selectedImageName
{
    [self setSelectedImage:[[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
}
@end
