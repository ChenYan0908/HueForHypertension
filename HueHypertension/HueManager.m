
//
//  HueManager.m
//  hypertension
//
//  Created by LiuYiiyuan on 16/12/1.
//  Copyright © 2016年 LiuYiiyuan. All rights reserved.
//

#import "HueManager.h"
#import "AppDelegate.h"

@implementation HueManager

+ (instancetype)sharedManager {
    static HueManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[HueManager alloc] init];
    });
    return manager;
}

- (PHHueSDK *)phHueSDK {
    if (!_phHueSDK) {
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        _phHueSDK = delegate.phHueSDK;
    }
    return _phHueSDK;
}

- (PHBridgeSendAPI *)bridgeSendApi {
    if (!_bridgeSendApi) {
        _bridgeSendApi = [[PHBridgeSendAPI alloc] init];
    }
    return _bridgeSendApi;
}

#pragma mark - public api
- (void)showLevel1 {
    if (!self.phHueSDK.localConnected) {
        return;
    }
    NSArray *array = @[@0, @77, @148, @195, @237, @254];
    [self showLightWithArray:array interval:0.2f hue:@0];
}

- (void)showLevel2 {
    if (!self.phHueSDK.localConnected) {
        return;
    }
    NSArray *array = @[@0, @77, @148, @195, @237, @254];
    [self showLevelTwoLightWithArray:array interval:0.3f hue:@45000];
}

- (void)showLevel3WithHue:(NSNumber *)hue {
    if (!self.phHueSDK.localConnected) {
        return;
    }
    dispatch_queue_t queue = dispatch_queue_create("com.hue.level", DISPATCH_QUEUE_SERIAL);
    PHBridgeResourcesCache *cache = [PHBridgeResourcesReader readBridgeResourcesCache];
    self.light1 = [cache.lights objectForKey:@"1"];
    self.light2 = [cache.lights objectForKey:@"2"];
    self.light3 = [cache.lights objectForKey:@"3"];
    // phase 0
    PHLightState *lightState1 = [[PHLightState alloc] init];
    lightState1.on = @YES;
    lightState1.hue = hue;
    lightState1.saturation = @0;
    lightState1.brightness = @0;
    lightState1.transitionTime = @1;
    PHLightState *lightState2 = [[PHLightState alloc] init];
    lightState2.on = @YES;
    lightState2.hue = hue;
    lightState2.saturation = @0;
    lightState2.brightness = @0;
    lightState2.transitionTime = @2;
    PHLightState *lightState3 = [[PHLightState alloc] init];
    lightState3.on = @YES;
    lightState3.hue = hue;
    lightState3.saturation = @0;
    lightState3.brightness = @0;
    lightState3.transitionTime = @4;
    [self showSinglePhase:queue lightState1:lightState1 lightState2:lightState2 lightState3:lightState3 interval:0.0f];

    // phase 1
    lightState1.saturation = @102;
    lightState1.brightness = @204;
    lightState1.transitionTime = @9;
    lightState2.transitionTime = @4;
    lightState3.transitionTime = @1;
    [self showSinglePhase:queue lightState1:lightState1 lightState2:lightState2 lightState3:lightState3 interval:0.0f];
    
    // phase 2
    lightState1.saturation = @77;
    lightState1.brightness = @153;
    lightState1.transitionTime = @5;
    lightState2.saturation = @254;
    lightState2.brightness = @254;
    lightState2.transitionTime = @7;
    lightState3.saturation = @102;
    lightState3.brightness = @204;
    lightState3.transitionTime = @5;
    [self showSinglePhase:queue lightState1:lightState1 lightState2:lightState2 lightState3:lightState3 interval:0.0f];
    
    [self showDefaultLight:queue];
}

- (void)showScoreLightWithHue:(NSNumber *)hue {
    if (!self.phHueSDK.localConnected) {
        return;
    }
    dispatch_queue_t queue = dispatch_queue_create("com.hue.level", DISPATCH_QUEUE_SERIAL);
    PHBridgeResourcesCache *cache = [PHBridgeResourcesReader readBridgeResourcesCache];
    self.light1 = [cache.lights objectForKey:@"1"];
    self.light2 = [cache.lights objectForKey:@"2"];
    self.light3 = [cache.lights objectForKey:@"3"];
    // phase 0
    PHLightState *lightState1 = [[PHLightState alloc] init];
    lightState1.on = @YES;
    lightState1.hue = @0;
    lightState1.saturation = @0;
    lightState1.brightness = @0;
    lightState1.transitionTime = @1;
    PHLightState *lightState2 = [[PHLightState alloc] init];
    lightState2.on = @YES;
    lightState2.hue = @0;
    lightState2.saturation = @0;
    lightState2.brightness = @0;
    lightState2.transitionTime = @2;
    PHLightState *lightState3 = [[PHLightState alloc] init];
    lightState3.on = @YES;
    lightState3.hue = @0;
    lightState3.saturation = @0;
    lightState3.brightness = @0;
    lightState3.transitionTime = @3;
    [self showLevel3SinglePhase:queue lightState1:lightState1 lightState2:lightState2 lightState3:lightState3 interval:0.0f];
    
    // phase 1
    lightState1.hue = @10923;
    lightState1.saturation = @204;
    lightState1.brightness = @254;
    lightState1.transitionTime = @3;
    lightState2.hue = @8192;
    lightState2.saturation = @204;
    lightState2.brightness = @254;
    lightState3.hue = @5461;
    lightState3.saturation = @204;
    lightState3.brightness = @254;
    lightState3.transitionTime = @1;
    [self showLevel3SinglePhase:queue lightState1:lightState1 lightState2:lightState2 lightState3:lightState3 interval:0.0f];
    
    // phase 2
    lightState1.hue = @0;
    lightState1.saturation = @0;
    lightState1.brightness = @0;
    lightState1.transitionTime = @1;
    lightState2.hue = @0;
    lightState2.saturation = @0;
    lightState2.brightness = @0;
    lightState3.hue = @0;
    lightState3.saturation = @0;
    lightState3.brightness = @0;
    lightState3.transitionTime = @3;
    [self showLevel3SinglePhase:queue lightState1:lightState1 lightState2:lightState2 lightState3:lightState3 interval:0.0f];
    
    // phase 3
    lightState1.hue = @10923;
    lightState1.saturation = @204;
    lightState1.brightness = @254;
    lightState1.transitionTime = @3;
    lightState2.hue = @8192;
    lightState2.saturation = @204;
    lightState2.brightness = @254;
    lightState3.hue = @5461;
    lightState3.saturation = @204;
    lightState3.brightness = @254;
    lightState3.transitionTime = @1;
    [self showLevel3SinglePhase:queue lightState1:lightState1 lightState2:lightState2 lightState3:lightState3 interval:0.0f];
    
    // phase 4
    lightState1.hue = @0;
    lightState1.saturation = @0;
    lightState1.brightness = @0;
    lightState1.transitionTime = @1;
    lightState2.hue = @0;
    lightState2.saturation = @0;
    lightState2.brightness = @0;
    lightState3.hue = @0;
    lightState3.saturation = @0;
    lightState3.brightness = @0;
    lightState3.transitionTime = @3;
    [self showLevel3SinglePhase:queue lightState1:lightState1 lightState2:lightState2 lightState3:lightState3 interval:0.0f];
    
    // phase 5
    lightState1.hue = @10923;
    lightState1.saturation = @204;
    lightState1.brightness = @254;
    lightState1.transitionTime = @3;
    lightState2.hue = @8192;
    lightState2.saturation = @204;
    lightState2.brightness = @254;
    lightState3.hue = @5461;
    lightState3.saturation = @204;
    lightState3.brightness = @254;
    lightState3.transitionTime = @1;
    [self showLevel3SinglePhase:queue lightState1:lightState1 lightState2:lightState2 lightState3:lightState3 interval:0.0f];
    
    // phase 6
    lightState1.hue = @0;
    lightState1.saturation = @0;
    lightState1.brightness = @0;
    lightState1.transitionTime = @3;
    lightState2.hue = hue;
    lightState2.saturation = @254;
    lightState2.brightness = @254;
    lightState2.transitionTime = @8;
    lightState3.hue = @0;
    lightState3.saturation = @0;
    lightState3.brightness = @0;
    lightState3.transitionTime = @3;
    [self showLevel3SinglePhase:queue lightState1:lightState1 lightState2:lightState2 lightState3:lightState3 interval:0.0f];
    
    lightState1.hue = hue;
    lightState1.saturation = @254;
    lightState1.brightness = @254;
    lightState1.transitionTime = @8;
    lightState3.hue = hue;
    lightState3.saturation = @254;
    lightState3.brightness = @254;
    lightState3.transitionTime = @8;
    [self showLevel3SinglePhase:queue lightState1:lightState1 lightState2:lightState2 lightState3:lightState3 interval:0.0f];
    
}

- (void)scheduleRemindLightAt:(NSDate *)date {
    if (!self.phHueSDK.localConnected) {
        return;
    }
    
    
    PHSchedule *newSchedule = [[PHSchedule alloc] init];
    newSchedule.name = @"remind";
    newSchedule.localTime = YES;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *scheduleComponents = [calendar components:NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
    NSDateComponents *components = [calendar components:NSCalendarUnitHour|NSCalendarUnitMinute fromDate:date];
    scheduleComponents.hour = components.hour + 8;
    scheduleComponents.minute = components.minute;
    scheduleComponents.second = 0;
    newSchedule.date = [calendar dateFromComponents:scheduleComponents];
    newSchedule.recurringDays = RecurringAlldays;
    newSchedule.lightIdentifier = @"1";
    PHLightState *state = [[PHLightState alloc] init];
    state.on = @YES;
    state.hue = @25500;
    state.brightness = @100;
    state.saturation = @254;
    newSchedule.state = state;
    
    [self.bridgeSendApi createSchedule:newSchedule completionHandler:^(NSString *scheduleIdentifier, NSArray *errors) {
        if (!errors){
            // Create successful
            NSLog(@"schedule: %@",scheduleIdentifier);
        } else {
            // Error occurred
            NSLog(@"error: %@",errors);
        }
    }];
}

- (void)removeScheduleWithId:(NSString *)scheduleIdentifier {
    [self.bridgeSendApi removeScheduleWithId:scheduleIdentifier completionHandler:^(NSArray *errors) {
        if (!errors){
            // Create successful
            NSLog(@"success");
        } else {
            // Error occurred
            NSLog(@"error: %@",errors);
        }
    }];
}

- (void)showRecordSuccess {
    if (!self.phHueSDK.localConnected) {
        return;
    }
    dispatch_queue_t queue = dispatch_queue_create("com.hue.level", DISPATCH_QUEUE_SERIAL);
    PHBridgeResourcesCache *cache = [PHBridgeResourcesReader readBridgeResourcesCache];
    self.light1 = [cache.lights objectForKey:@"1"];
    self.light2 = [cache.lights objectForKey:@"2"];
    self.light3 = [cache.lights objectForKey:@"3"];
    // phase 0
    PHLightState *lightState1 = [[PHLightState alloc] init];
    lightState1.on = @YES;
    lightState1.hue = @25500;
    lightState1.saturation = @254;
    lightState1.brightness = @254;
    lightState1.transitionTime = @1;
    PHLightState *lightState2 = [[PHLightState alloc] init];
    lightState2.on = @YES;
    lightState2.hue = @25500;
    lightState2.saturation = @254;
    lightState2.brightness = @254;
    lightState2.transitionTime = @1;
    PHLightState *lightState3 = [[PHLightState alloc] init];
    lightState3.on = @YES;
    lightState3.hue = @25500;
    lightState3.saturation = @254;
    lightState3.brightness = @254;
    lightState3.transitionTime = @1;
    [self showSinglePhase:queue lightState1:lightState1 lightState2:lightState2 lightState3:lightState3 interval:0.0f];
    
    [NSThread sleepForTimeInterval:3.0f];
    
    [self showDefaultLight:queue];
}

#pragma mark - private methods
- (void)showLightWithArray:(NSArray *)array interval:(float)interval hue:(NSNumber*)hue{
    dispatch_queue_t queue = dispatch_queue_create("com.hue.level", DISPATCH_QUEUE_SERIAL);
    //    dispatch_queue_t queue = dispatch_get_main_queue();
    
    PHBridgeResourcesCache *cache = [PHBridgeResourcesReader readBridgeResourcesCache];
    self.light1 = [cache.lights objectForKey:@"1"];
    self.light2 = [cache.lights objectForKey:@"2"];
    self.light3 = [cache.lights objectForKey:@"3"];
    
    // phase 0
    PHLightState *lightState1 = [[PHLightState alloc] init];
    lightState1.on = @YES;
    lightState1.hue = hue;
    lightState1.saturation = @254;
    lightState1.brightness = array[0];
    lightState1.transitionTime = @0;
    PHLightState *lightState2 = [[PHLightState alloc] init];
    lightState2.on = @YES;
    lightState2.hue = hue;
    lightState2.saturation = @254;
    lightState2.brightness = array[0];
    lightState2.transitionTime = @0;
    PHLightState *lightState3 = [[PHLightState alloc] init];
    lightState3.on = @YES;
    lightState3.hue = hue;
    lightState3.saturation = @254;
    lightState3.brightness = array[0];
    lightState3.transitionTime = @0;
    
    [self showSinglePhase:queue lightState1:lightState1 lightState2:lightState2 lightState3:lightState3 interval:interval];
    
    // phase 1
    lightState1.brightness = array[5];
    lightState2.brightness = array[5];
    lightState3.brightness = array[5];
    lightState1.transitionTime = @(5);
    lightState2.transitionTime = @(6);
    lightState3.transitionTime = @(7);
    [self showSinglePhase:queue lightState1:lightState1 lightState2:lightState2 lightState3:lightState3 interval:interval];
    
    // phase 2
    lightState1.brightness = array[0];
    lightState2.brightness = array[0];
    lightState3.brightness = array[0];
    lightState1.transitionTime = @(7);
    lightState2.transitionTime = @(6);
    lightState3.transitionTime = @(5);
    [self showSinglePhase:queue lightState1:lightState1 lightState2:lightState2 lightState3:lightState3 interval:interval];
    
    [self showDefaultLight:queue];

}

- (void)showLevelTwoLightWithArray:(NSArray *)array interval:(float)interval hue:(NSNumber*)hue{
    dispatch_queue_t queue = dispatch_queue_create("com.hue.level", DISPATCH_QUEUE_SERIAL);
    //    dispatch_queue_t queue = dispatch_get_main_queue();
    
    PHBridgeResourcesCache *cache = [PHBridgeResourcesReader readBridgeResourcesCache];
    self.light1 = [cache.lights objectForKey:@"1"];
    self.light2 = [cache.lights objectForKey:@"2"];
    self.light3 = [cache.lights objectForKey:@"3"];
    
    // phase 0
    PHLightState *lightState1 = [[PHLightState alloc] init];
    lightState1.on = @YES;
    lightState1.hue = hue;
    lightState1.saturation = @254;
    lightState1.brightness = array[0];
    lightState1.transitionTime = @0;
    PHLightState *lightState2 = [[PHLightState alloc] init];
    lightState2.on = @YES;
    lightState2.hue = hue;
    lightState2.saturation = @254;
    lightState2.brightness = array[0];
    lightState2.transitionTime = @0;
    PHLightState *lightState3 = [[PHLightState alloc] init];
    lightState3.on = @YES;
    lightState3.hue = hue;
    lightState3.saturation = @254;
    lightState3.brightness = array[0];
    lightState3.transitionTime = @0;
    
    [self showSinglePhase:queue lightState1:lightState1 lightState2:lightState2 lightState3:lightState3 interval:interval];
    
    // phase 1
    lightState1.brightness = array[5];
    lightState2.brightness = array[5];
    lightState3.brightness = array[5];
    lightState1.transitionTime = @(5);
    lightState2.transitionTime = @(6);
    lightState3.transitionTime = @(7);
    [self showSinglePhase:queue lightState1:lightState1 lightState2:lightState2 lightState3:lightState3 interval:interval];
    
    // phase 2
    lightState1.brightness = array[0];
    lightState2.brightness = array[0];
    lightState3.brightness = array[0];
    lightState1.transitionTime = @(7);
    lightState2.transitionTime = @(6);
    lightState3.transitionTime = @(5);
    [self showSinglePhase:queue lightState1:lightState1 lightState2:lightState2 lightState3:lightState3 interval:interval];
    
    [self showDefaultLight:queue];
    
}

- (void)showSinglePhase:(dispatch_queue_t)queue lightState1:(PHLightState *)lightState1 lightState2:(PHLightState *)lightState2 lightState3:(PHLightState *)lightState3 interval:(float)interval{
    //    NSLog(@"bright: %@ %@ %@",lightState1.brightness, lightState2.brightness, lightState3.brightness);
    //    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 100ull * NSEC_PER_MSEC);
    
    dispatch_sync(queue, ^{
        [NSThread sleepForTimeInterval:0.2];
        
        [self.bridgeSendApi updateLightStateForId:self.light1.identifier withLightState:lightState1 completionHandler:^(NSArray *errors) {
            if (errors) {
                NSLog(@"error: %@",errors);
            }else{
                NSLog(@"success");
            }
        }];
    });
    
    dispatch_sync(queue, ^{
        [self.bridgeSendApi updateLightStateForId:self.light2.identifier withLightState:lightState2 completionHandler:^(NSArray *errors) {
            if (errors) {
                NSLog(@"error: %@",errors);
            }else{
                NSLog(@"success");
            }
        }];
    });
    
    dispatch_sync(queue, ^{
        [self.bridgeSendApi updateLightStateForId:self.light3.identifier withLightState:lightState3 completionHandler:^(NSArray *errors) {
            if (errors) {
                NSLog(@"error: %@",errors);
            }else{
                NSLog(@"success");
            }
        }];
     });
    
}

- (void)showLevel3SinglePhase:(dispatch_queue_t)queue lightState1:(PHLightState *)lightState1 lightState2:(PHLightState *)lightState2 lightState3:(PHLightState *)lightState3 interval:(float)interval{
    //    NSLog(@"bright: %@ %@ %@",lightState1.brightness, lightState2.brightness, lightState3.brightness);
    //    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 100ull * NSEC_PER_MSEC);
    
    dispatch_sync(queue, ^{
//        [NSThread sleepForTimeInterval:0.2];
        
        [self.bridgeSendApi updateLightStateForId:self.light1.identifier withLightState:lightState1 completionHandler:^(NSArray *errors) {
            if (errors) {
                NSLog(@"error: %@",errors);
            }else{
                NSLog(@"success");
            }
        }];
    });
    
    dispatch_sync(queue, ^{
        [self.bridgeSendApi updateLightStateForId:self.light2.identifier withLightState:lightState2 completionHandler:^(NSArray *errors) {
            if (errors) {
                NSLog(@"error: %@",errors);
            }else{
                NSLog(@"success");
            }
        }];
    });
    
    dispatch_sync(queue, ^{
        [self.bridgeSendApi updateLightStateForId:self.light3.identifier withLightState:lightState3 completionHandler:^(NSArray *errors) {
            if (errors) {
                NSLog(@"error: %@",errors);
            }else{
                NSLog(@"success");
            }
        }];
    });
    
}

- (void)showDefaultLight:(dispatch_queue_t)queue {
    dispatch_sync(queue, ^{
        [NSThread sleepForTimeInterval:0.1f];
        PHLightState *state = [[PHLightState alloc] init];
        state.on = @NO;
        [self.bridgeSendApi updateLightStateForId:self.light3.identifier withLightState:state completionHandler:^(NSArray *errors) {
            if (errors) {
                NSLog(@"error: %@",errors);
            }else{
                NSLog(@"success");
            }
        }];
        [self.bridgeSendApi updateLightStateForId:self.light2.identifier withLightState:state completionHandler:^(NSArray *errors) {
            if (errors) {
                NSLog(@"error: %@",errors);
            }else{
                NSLog(@"success");
            }
        }];
        [self.bridgeSendApi updateLightStateForId:self.light1.identifier withLightState:state completionHandler:^(NSArray *errors) {
            if (errors) {
                NSLog(@"error: %@",errors);
            }else{
                NSLog(@"success");
            }
        }];
    });
}


@end
