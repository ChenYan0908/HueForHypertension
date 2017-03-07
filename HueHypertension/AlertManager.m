//
//  AlertManager.m
//  hypertension
//
//  Created by LiuYiiyuan on 16/3/31.
//  Copyright © 2016年 LiuYiiyuan. All rights reserved.
//

#import "AlertManager.h"
//#import "CRToast/CRToast.h"

@implementation AlertManager

+ (void)sendSimpleAlert:(UIViewController *)controller title:(NSString *)title message:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    [controller presentViewController:alert animated:YES completion:nil];
}

+ (void)sendSimpleAlertWithCompletion:(UIViewController *)controller title:(NSString *)title message:(NSString *)message completion:(void(^)())completionHandler {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:completionHandler];
    [alert addAction:okAction];
    [controller presentViewController:alert animated:YES completion:nil];
}

+ (void)sendAlertWithCompletion:(UIViewController *)controller title:(NSString *)title message:(NSString *)message confirm:(void (^)())confirmHandler cancel:(void (^)())cancelHandler {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"重试" style:UIAlertActionStyleDefault handler:confirmHandler];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:cancelHandler];
    [alert addAction:cancelAction];
    [alert addAction:okAction];
    [controller presentViewController:alert animated:YES completion:nil];
}


@end
