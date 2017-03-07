//
//  AppDelegate.h
//  HueHypertension
//
//  Created by Yiyuan Liu on 2017/3/2.
//  Copyright © 2017年 Yiyuan Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"
#import <AVOSCloud/AVOSCloud.h>
#import <HueSDK_iOS/HueSDK.h>
#import "PHBridgePushLinkViewController.h"
#import "PHBridgeSelectionViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, PHBridgeSelectionViewControllerDelegate, PHBridgePushLinkViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navigationController;

@property (strong, nonatomic) PHHueSDK *phHueSDK;

/**
 Starts the local heartbeat
 */
- (void)enableLocalHeartbeat;

/**
 Stops the local heartbeat
 */
- (void)disableLocalHeartbeat;

/**
 Starts a search for a bridge
 */
- (void)searchForBridgeLocal;

@end

