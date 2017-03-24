//
//  knowledgeModel.h
//  hypertension
//
//  Created by LiuYiiyuan on 16/11/17.
//  Copyright © 2016年 LiuYiiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class knowledgeModel;

@protocol knoledgeModelDelegate <NSObject>

- (void)fetchDataForModel:(knowledgeModel *)model;

@end

@interface knowledgeModel : NSObject

@property (assign, nonatomic) NSUInteger knowledgeId;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *subtitle;
@property (copy, nonatomic) NSString *time;
@property (copy, nonatomic) NSString *link;
@property (assign, nonatomic) NSInteger readCount;
@property (assign, nonatomic) NSInteger collectCount;
@property (weak, nonatomic) id<knoledgeModelDelegate> delegate;

@end
