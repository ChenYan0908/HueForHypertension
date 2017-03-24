    //
//  NSObject+Null.m
//  hypertension
//
//  Created by LiuYiiyuan on 16/11/17.
//  Copyright © 2016年 LiuYiiyuan. All rights reserved.
//

#import "NSObject+Null.h"

@implementation NSObject (Null)

- (BOOL)isNull
{
    if ([self isEqual:[NSNull null]])
    {
        return YES;
    }
    else
    {
        if ([self isKindOfClass:[NSNull class]])
        {
            return YES;
        }
        else
        {
            if (self==nil)
            {
                return YES;
            }
        }
    }
    if ([self isKindOfClass:[NSString class]]) {
        if ([((NSString *)self) isEqualToString:@"(null)"]) {
            return YES;
        }
    }
    return NO;
}

@end
