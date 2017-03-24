//
//  HueManager.h
//  hypertension
//
//  Created by LiuYiiyuan on 16/12/1.
//  Copyright © 2016年 LiuYiiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <HueSDK_iOS/HueSDK.h>

@interface HueManager : NSObject

@property (strong, nonatomic) PHHueSDK *phHueSDK;
@property (strong, nonatomic) PHBridgeSendAPI *bridgeSendApi;

@property (strong, nonatomic) PHLight *light1;
@property (strong, nonatomic) PHLight *light2;
@property (strong, nonatomic) PHLight *light3;

+ (instancetype)sharedManager;

/**
 测量血压、测量体重、服用药物的提醒
 */
- (void)scheduleRemindLightAt:(NSDate *)date;

- (void)removeScheduleWithId:(NSString *)scheduleIdentifier;
/**
 记录数据成功
 */
- (void)showRecordSuccess;

/**
 L1灯效
 */
- (void)showLevel1;

/**
 L2灯效
 */
- (void)showLevel2;

/**
 L3灯效

 @param hue 不同血压程度的色相
 */
- (void)showLevel3WithHue:(NSNumber *)hue;


/**
 每日小结灯效

 @param hue 不同分数对应的色相
 */
- (void)showScoreLightWithHue:(NSNumber *)hue;

@end
