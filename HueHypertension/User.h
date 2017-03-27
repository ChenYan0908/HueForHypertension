//
//  User.h
//  HueHypertension
//
//  Created by Yiyuan Liu on 2017/3/27.
//  Copyright © 2017年 Yiyuan Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject<NSCoding>

@property (copy, nonatomic) NSString *leanCloudId;
//@property (nonatomic) BOOL rememberPassword;

- (instancetype)initWithId:(NSString *)leanCloudId;

@end
