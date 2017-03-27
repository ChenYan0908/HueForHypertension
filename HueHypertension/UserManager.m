//
//  UserManager.m
//  HueHypertension
//
//  Created by Yiyuan Liu on 2017/3/27.
//  Copyright © 2017年 Yiyuan Liu. All rights reserved.
//

#import "UserManager.h"
#import "DataCache.h"

@implementation UserManager

+ (instancetype)manager {
    static UserManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[UserManager alloc] init];
    });
    return manager;
}

- (void)logout {
    self.user = [User new];
}

- (void)saveAuthorizeData {
    [DataCache setCache:_user forKey:@"UserCache"];
}

- (void)readAuthorizeData {
    _user = [DataCache loadCache:@"UserCache"];
    if (!_user) {
        _user = [[User alloc] init];
    }
}

@end
