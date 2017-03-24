//
//  knowledgeModel.m
//  hypertension
//
//  Created by LiuYiiyuan on 16/11/17.
//  Copyright © 2016年 LiuYiiyuan. All rights reserved.
//

#import "knowledgeModel.h"
#import <AVOSCloud/AVOSCloud.h>


@implementation knowledgeModel

- (void)setName:(NSString *)name {
    _name = name;
    AVQuery *query = [AVQuery queryWithClassName:@"Counter"];
    [query whereKey:@"knoName" equalTo:name];
    [query getFirstObjectInBackgroundWithBlock:^(AVObject * _Nullable object, NSError * _Nullable error) {
        if (error) {
            NSLog(@"error:%@",error);
        }else{
            self.readCount = [object[@"views"] integerValue];
            self.collectCount = [object[@"collectCount"] integerValue];
            [self.delegate fetchDataForModel:self];
        }
    }];
}

@end
