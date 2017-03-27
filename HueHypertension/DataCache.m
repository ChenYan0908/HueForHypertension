//
//  DataCache.m
//  hypertension
//
//  Created by LiuYiiyuan on 16/11/25.
//  Copyright © 2016年 LiuYiiyuan. All rights reserved.
//

#import "DataCache.h"

@implementation DataCache

+ (void)setCache:(id)data forKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setValue:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (id)loadCache:(NSString *)key {
    return [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:key]];
}

@end
