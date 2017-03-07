//
//  NSObject+Tips.h
//  hypertension
//
//  Created by LiuYiiyuan on 16/11/8.
//  Copyright © 2016年 LiuYiiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

#pragma mark - UIView
/**
 UIView弹出toast提示
 */
@interface UIView (Tips)

/**
 弹出普通toast

 @param message toast内容
 @return toast对象
 */
- (MBProgressHUD *)showMessageTips:(NSString *)message;

/**
 弹出有完成回调的toast

 @param message toast内容
 @param handler 完成后的回调
 @return toast对象
 */
- (MBProgressHUD *)showMessageTips:(NSString *)message completionHandler:(void(^)())handler;

/**
 弹出显示操作成功的toast

 @param message toast内容
 @return toast对象
 */
- (MBProgressHUD *)showSuccessTips:(NSString *)message;

/**
 弹出显示操作成功的toast，且有完成回调

 @param message toast内容
 @param handler 完成后的回调
 @return toast对象
 */
- (MBProgressHUD *)showSuccessTips:(NSString *)message completionHandler:(void(^)())handler;

/**
 弹出显示操作失败的toast

 @param message toast内容
 @return toast对象
 */
- (MBProgressHUD *)showFailureTips:(NSString *)message;

/**
 弹出显示加载中的toast

 @param message toast内容
 @return toast对象
 */
- (MBProgressHUD *)showLoadingTips:(NSString *)message;

@end

#pragma mark - UIViewController
/**
 UIView弹出toast提示
 */
@interface UIViewController (Tips)

/**
 弹出普通toast

 @param message toast内容
 @return toast对象
 */
- (MBProgressHUD *)showMessageTips:(NSString *)message;

/**
 弹出有完成后回调的普通toast

 @param message toast内容
 @param handler 完成后的回调
 @return toast对象
 */
- (MBProgressHUD *)showMessageTips:(NSString *)message completionHandler:(void(^)())handler;

/**
 弹出显示操作成功的toast
 
 @param message toast内容
 @return toast对象
 */
- (MBProgressHUD *)showSuccessTips:(NSString *)message;

/**
 弹出显示加载中的toast
 
 @param message toast内容
 @return toast对象
 */
- (MBProgressHUD *)showLoadingTips:(NSString *)message;

/**
 弹出显示操作成功的toast，且有完成回调
 
 @param message toast内容
 @param handler 完成后的回调
 @return toast对象
 */
- (MBProgressHUD *)showSuccessTips:(NSString *)message completionHandler:(void(^)())handler;

/**
 弹出显示加载中的toast
 
 @param message toast内容
 @return toast对象
 */
- (MBProgressHUD *)showFailureTips:(NSString *)message;

@end
