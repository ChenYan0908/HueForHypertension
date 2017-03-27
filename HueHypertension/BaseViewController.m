//
//  BaseViewController.m
//  hypertension
//
//  Created by LiuYiiyuan on 16/4/20.
//  Copyright © 2016年 LiuYiiyuan. All rights reserved.
//

#import "BaseViewController.h"
#import "UIResponder+FirstResponder.h"


@interface BaseViewController ()

/**
 判断目前键盘是否已经显示
 */
@property (assign, nonatomic) BOOL isKeyBoardShown;

/**
 页面需要上移（下移）的距离
 */
@property (assign, nonatomic) CGFloat deltaY;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification *)notification {
    if (!self.isKeyBoardShown) {
        id firstResponder = [UIResponder currentFirstResponder];
        double duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        NSDictionary *info = [notification userInfo];
        CGFloat kbHeight = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
        
        if ([firstResponder isKindOfClass:[UITextField class]]) {
            UITextField *currentTextField = firstResponder;
            CGRect textFieldRect = [currentTextField convertRect:currentTextField.frame toView:self.view];
            if (textFieldRect.origin.y + textFieldRect.size.height > self.view.frame.size.height - kbHeight) {
                [UIView animateWithDuration:duration animations:^{
                    self.deltaY = (textFieldRect.origin.y + textFieldRect.size.height) - (self.view.frame.size.height - kbHeight);
                    self.deltaY = MIN(kbHeight, self.deltaY);
                    
                    CGRect currentFrame = self.view.frame;
                    currentFrame.origin.y = currentFrame.origin.y - self.deltaY;
                    self.view.frame = currentFrame;
                }];
                self.isKeyBoardShown = YES;
                
            }
        }
    }
}

- (void)keyboardWillHide:(NSNotification *)notification {
    if (self.isKeyBoardShown) {
        double duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        [UIView animateWithDuration:duration animations:^{
            CGRect currentFrame = self.view.frame;
            currentFrame.origin.y = currentFrame.origin.y + _deltaY;
            self.view.frame = currentFrame;
        }];
        
    }
    self.isKeyBoardShown = NO;
}


@end
