//
//  TabBarController.m
//  HueHypertension
//
//  Created by Yiyuan Liu on 2017/3/20.
//  Copyright © 2017年 Yiyuan Liu. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()



@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UITabBarItem *home = [[UITabBarItem alloc] initWithTitle:@"状态" image:[UIImage imageNamed:@"save_incard_24"] selectedImage:[UIImage imageNamed:@"save_incard_pressed_24.png"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITabBarController *)tabBarController {
    if (_tabBarController == nil) {
        _tabBarController = [[NSBundle mainBundle] loadNibNamed:@"TabBarController" owner:self options:nil].lastObject;
    }
    return _tabBarController;
}

@end
