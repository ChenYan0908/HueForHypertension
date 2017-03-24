//
//  CDMNetworkManager.m
//  HueHypertension
//
//  Created by Yiyuan Liu on 2017/3/24.
//  Copyright © 2017年 Yiyuan Liu. All rights reserved.
//

#import "CDMNetworkManager.h"

static NSString * const knowledgeServiceURLStr = @"http://120.27.141.50:8080/";

typedef void(^requestSuccessBlock) (NSURLSessionTask *task, id resposeObject);
typedef void(^requestFailureBlock) (NSURLSessionTask *task, NSError *error);


@implementation CDMNetworkManager

+ (instancetype)sharedManager {
    static CDMNetworkManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] initWithBaseURL:[NSURL URLWithString:knowledgeServiceURLStr]];
    });
    manager.responseSerializer.stringEncoding = NSUTF8StringEncoding;
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    return manager;
}

- (void)sendPostRequest:(NSString *)path parameters:(NSDictionary *)parameters success:(requestSuccessBlock)success failure:(requestFailureBlock)failure{
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [self POST:path parameters:parameters progress:nil success:^(NSURLSessionTask *task, id responseObject){
        success(task,responseObject);
    } failure:^(NSURLSessionTask *task, NSError *error){
        failure(task,error);
    }];
    
}

- (void)getURLString:(NSString *)URLString parameters:(NSDictionary *)parameters success:(requestSuccessBlock)success failure:(requestFailureBlock)failure{
    //self.requestSerializer = [AFJSONRequestSerializer serializer];
    [self GET:URLString parameters:parameters progress:nil success:^(NSURLSessionTask *task, id responseObject){
        success(task,responseObject);
    }failure:^(NSURLSessionTask *task, NSError *error){
        failure(task,error);
    }];
}

@end
