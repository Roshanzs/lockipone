//
//  AppDelegate.m
//  检测手机是否锁屏
//
//  Created by 紫贝壳 on 2017/5/23.
//  Copyright © 2017年 stark. All rights reserved.
//

#import "AppDelegate.h"
#import <notify.h>
#define NotificationLock CFSTR("com.apple.springboard.lockcomplete")
#define NotificationChange CFSTR("com.apple.springboard.lockstate")
#define NotificationPwdUI CFSTR("com.apple.springboard.hasBlankedScreen")


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, screenLockStateChanged, NotificationLock, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
    
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, screenLockStateChanged, NotificationChange, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
    return YES;
}
static void screenLockStateChanged(CFNotificationCenterRef center,void* observer,CFStringRef name,const void* object,CFDictionaryRef userInfo){
    
    NSString* lockstate = (__bridge NSString*)name;
    
    if ([lockstate isEqualToString:(__bridge  NSString*)NotificationLock]) {
        
        NSLog(@"locked.锁屏");
        
    }else{
        NSLog(@"状态改变了");
        
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
