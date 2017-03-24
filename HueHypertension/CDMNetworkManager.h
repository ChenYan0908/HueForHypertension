//
//  CDMNetworkManager.h
//  HueHypertension
//
//  Created by Yiyuan Liu on 2017/3/24.
//  Copyright © 2017年 Yiyuan Liu. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef void(^requestSuccessBlock) (NSURLSessionTask *task, id resposeObject);
typedef void(^requestFailureBlock) (NSURLSessionTask *task, NSError *error);

@interface CDMNetworkManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

- (void)sendPostRequest:(NSString *)path parameters:(NSDictionary *)parameters success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;

- (void)getURLString:(NSString *)URLString parameters:(NSDictionary *)parameters success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;

@end
