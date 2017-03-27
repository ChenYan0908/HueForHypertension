//
//  User.m
//  HueHypertension
//
//  Created by Yiyuan Liu on 2017/3/27.
//  Copyright © 2017年 Yiyuan Liu. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)init {
    if (self = [super init]) {
//        self.rememberPassword = true;
    }
    return self;
}

- (instancetype)initWithId:(NSString *)leanCloudId {
    self = [[User alloc] init];
    if (self) {
        self.leanCloudId = leanCloudId;
    }
    return self;
}

#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.leanCloudId forKey:@"id"];
//    [aCoder encodeBool:self.rememberPassword forKey:@"rememberPassword"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    User *user = [[User alloc] init];
    user.leanCloudId = [aDecoder decodeObjectForKey:@"id"];
//    user.rememberPassword = [aDecoder decodeBoolForKey:@"rememberPassword"];
    return user;
}

@end
