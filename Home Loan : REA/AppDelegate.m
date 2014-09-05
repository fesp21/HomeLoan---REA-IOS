//
//  AppDelegate.m
//  Home Loan : REA
//
//  Created by Dheina Lundi A on 04/09/14.
//  Copyright (c) 2014 iMoney. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

static BOOL needRefresh;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //Push
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
     (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    
    //Google Analytics.
//    [GAI sharedInstance].trackUncaughtExceptions = YES;
//    [GAI sharedInstance].dispatchInterval = 20;
//    [[GAI sharedInstance].logger setLogLevel:kGAILogLevelVerbose];
    [[GAI sharedInstance] trackerWithTrackingId:@"UA-50608320-3"];
    
    
    needRefresh=NO;
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [ColorUtilities colorWithHexString:@"91e1ff"];
    SplashVC *splash = [[SplashVC alloc] initWithNibName:@"SplashVC" bundle:nil];
    self.window.rootViewController = splash;
    [self.window makeKeyAndVisible];
    
    return YES;
}

							
- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    needRefresh=YES;
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}


+ (void)setNeedRefresh:(BOOL)value
{
    needRefresh =value;
}
+ (BOOL)getIsNeedRefresh
{
    return needRefresh;
}



- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
	NSLog(@"My token is: %@", deviceToken);
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
	NSLog(@"Failed to get token, error: %@", error);
}

@end
