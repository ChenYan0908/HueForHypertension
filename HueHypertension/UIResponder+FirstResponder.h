//
//  UIResponder+FirstResponder.h
//  hypertension
//
//  Created by LiuYiiyuan on 16/4/15.
//  Copyright © 2016年 LiuYiiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 获取当前的FirstResponder
 */
@interface UIResponder (FirstResponder)

/**
 获取当前的FirstResponder

 @return 当前的FirstResponder对象
 */
+ (id)currentFirstResponder;

@end
