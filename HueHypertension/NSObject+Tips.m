//
//  NSObject+Tips.m
//  hypertension
//
//  Created by LiuYiiyuan on 16/11/8.
//  Copyright © 2016年 LiuYiiyuan. All rights reserved.
//

#import "NSObject+Tips.h"

__weak MBProgressHUD * _sharedHud;

@implementation UIView (Tips)

/// 弹出toast的基础方法
- (MBProgressHUD *)showTips:(NSString *)message autoHide:(BOOL)autoHide completionHandler:(void(^)())handler
{
    UIView * container = self;
    
    if ( container )
    {
        if ( nil != _sharedHud )
        {
            [_sharedHud hide:NO];
        }
        
        UIView * view = self;
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.detailsLabelText = message;
        hud.detailsLabelFont = [UIFont systemFontOfSize:15];
        _sharedHud = hud;
        
        if ( autoHide )
        {
            [hud hide:YES afterDelay:2.f];
        }
        
    }
    
    return _sharedHud;
}

- (MBProgressHUD *)showMessageTips:(NSString *)message
{
    return [self showTips:message autoHide:YES completionHandler:nil];
}

- (MBProgressHUD *)showMessageTips:(NSString *)message completionHandler:(void(^)())handler {
    return [self showTips:message autoHide:YES completionHandler:handler];
}


- (MBProgressHUD *)showLoadingTips:(NSString *)message
{
    UIView * container = self;
    
    if ( container )
    {
        if ( nil != _sharedHud )
        {
            [_sharedHud hide:NO];
        }
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:container animated:YES];
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.detailsLabelText = message;
        hud.detailsLabelFont = [UIFont systemFontOfSize:15];
        
        hud.square = YES;
        
        _sharedHud = hud;
    }
    
    return _sharedHud;
}

/// 弹出带图片toast的基本方法，表示成功、失败、加载中
- (MBProgressHUD *)showUpImageSuccessTips:(NSString *)message completionHandler:(void(^)())handler
{
    UIView * container = self;
    
    if ( container )
    {
        if ( nil != _sharedHud )
        {
            [_sharedHud hide:NO];
        }
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:container animated:YES];
        hud.mode = MBProgressHUDModeCustomView;
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"save.png"]];
        hud.detailsLabelText = message;
        hud.detailsLabelFont = [UIFont systemFontOfSize:15];
        _sharedHud = hud;
        
        hud.yOffset = -[UIScreen mainScreen].bounds.size.width*0.1;
        hud.square = YES;
        
        double delayInSeconds = 2; // number of seconds to wait
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self animated:YES];
            dispatch_async(dispatch_get_main_queue(), handler);
        });

    }
    
    return _sharedHud;
}

- (MBProgressHUD *)showUpImageSuccessTips:(NSString *)message{
    UIView * container = self;
    
    if ( container )
    {
        if ( nil != _sharedHud )
        {
            [_sharedHud hide:NO];
        }
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:container animated:YES];
        hud.mode = MBProgressHUDModeCustomView;
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"save.png"]];
        hud.detailsLabelText = message;
        hud.detailsLabelFont = [UIFont systemFontOfSize:15];
        _sharedHud = hud;
        
        hud.yOffset = -[UIScreen mainScreen].bounds.size.width*0.1;
        hud.square = YES;

        [hud hide:YES afterDelay:2.f];
    }
    
    return _sharedHud;
}

- (MBProgressHUD *)showSuccessTips:(NSString *)message
{
    return [self showUpImageSuccessTips:message];
}

- (MBProgressHUD *)showSuccessTips:(NSString *)message completionHandler:(void(^)())handler{
    return [self showUpImageSuccessTips:message completionHandler:handler];
}


- (MBProgressHUD *)showFailureTips:(NSString *)message
{
    UIView * container = self;
    
    if ( container )
    {
        if ( nil != _sharedHud )
        {
            [_sharedHud hide:NO];
        }
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:container animated:YES];
        hud.mode = MBProgressHUDModeCustomView;
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"delete.png"]];
        hud.detailsLabelText = message;
        hud.detailsLabelFont = [UIFont systemFontOfSize:15];
        _sharedHud = hud;
        
        [hud hide:YES afterDelay:2.f];
    }
    
    return _sharedHud;
}




- (void)dismissTips
{
    [_sharedHud hide:YES];
    _sharedHud = nil;
}

@end

@implementation UIViewController (Tips)

- (MBProgressHUD *)showMessageTips:(NSString *)message
{
    return [self.view showTips:message autoHide:YES completionHandler:nil];
}

- (MBProgressHUD *)showMessageTips:(NSString *)message completionHandler:(void (^)())handler{
    return [self.view showTips:message autoHide:YES completionHandler:handler];
}

- (MBProgressHUD *)showSuccessTips:(NSString *)message
{
    return [self.view showUpImageSuccessTips:message];
}

- (MBProgressHUD *)showLoadingTips:(NSString *)message
{
    return [self.view showLoadingTips:message];
}

- (MBProgressHUD *)showUpImageSuccessTips:(NSString *)message
{
    return [self.view showUpImageSuccessTips:message];
}

- (MBProgressHUD *)showSuccessTips:(NSString *)message completionHandler:(void(^)())handler{
    return [self.view showUpImageSuccessTips:message completionHandler:handler];
}

- (MBProgressHUD *)showFailureTips:(NSString *)message{
    return [self.view showFailureTips:message];
}

- (void)dismissTips
{
    [self.view dismissTips];
}

@end
