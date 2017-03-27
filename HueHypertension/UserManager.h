//
//  UserManager.h
//  HueHypertension
//
//  Created by Yiyuan Liu on 2017/3/27.
//  Copyright © 2017年 Yiyuan Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface UserManager : NSObject

@property (strong, nonatomic) User *user;

+ (instancetype)manager;

//读取user
- (void)readAuthorizeData;
//保存user到本地
- (void)saveAuthorizeData;

- (void)logout;

@end
