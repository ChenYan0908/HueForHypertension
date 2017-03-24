//
//  LoginViewController.h
//  HueHypertension
//
//  Created by Yiyuan Liu on 2017/3/7.
//  Copyright © 2017年 Yiyuan Liu. All rights reserved.
//

@protocol LoginDelegate

- (void)loginDidSuccess;

@end

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (nonatomic, weak) id<LoginDelegate> delegate;

@end
