//
//  AppDelegate.h
//  Home Loan : REA
//
//  Created by Dheina Lundi A on 04/09/14.
//  Copyright (c) 2014 iMoney. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GAI.h"
#import "ColorUtilities.h"
#import "SplashVC.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (void)setNeedRefresh:(BOOL)value;
+ (BOOL)getIsNeedRefresh;

@end
