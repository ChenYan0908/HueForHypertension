//
//  AlertManager.h
//  hypertension
//
//  Created by LiuYiiyuan on 16/3/31.
//  Copyright © 2016年 LiuYiiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 弹窗警告的管理类
 */
@interface AlertManager : NSObject


/**
 基本弹窗警告

 @param controller 需要弹出警告的controller
 @param title 警告的标题
 @param message 警告的内容
 */
+ (void)sendSimpleAlert:(UIViewController *)controller title:(NSString *)title message:(NSString *)message;

/**
 弹窗警告，点击确定后有回调

 @param controller 需要弹出警告的controller
 @param title 警告的标题
 @param message 警告的内容
 @param completionHandler 点击确定后的回调
 */
+ (void)sendSimpleAlertWithCompletion:(UIViewController *)controller title:(NSString *)title message:(NSString *)message completion:(void(^)())completionHandler;


/**
 弹窗警告，有确定和取消两个按钮，分别有点击后的回调

 @param controller 需要弹出警告的controller
 @param title 警告的标题
 @param message 警告的内容
 @param confirmHandler 点击确定后的回调
 @param cancelHandler 点击取消后的回调
 */
+ (void)sendAlertWithCompletion:(UIViewController *)controller title:(NSString *)title message:(NSString *)message confirm:(void(^)())confirmHandler cancel:(void(^)())cancelHandler;

@end
