//
//  DataCache.h
//  hypertension
//
//  Created by LiuYiiyuan on 16/11/25.
//  Copyright © 2016年 LiuYiiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 用NSKeyedArchiver压缩对象并储存到NSUserDefaults
 */
@interface DataCache : NSObject

/**
 压缩并储存对象

 @param data 要储存到对象
 @param key 储存在NSUserDefaults中的key
 */
+ (void)setCache:(id)data forKey:(NSString *)key;

/**
 读取对象

 @param key 储存在NSUserDefaults中的key
 @return 读取的对象
 */
+ (id)loadCache:(NSString *)key;

@end
