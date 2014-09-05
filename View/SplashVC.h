//
//  SplashVC.h
//  Home Loan : REA
//
//  Created by Dheina Lundi A on 04/09/14.
//  Copyright (c) 2014 iMoney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleAnalytics-iOS-SDK/GAI.h>
#import "GAIDictionaryBuilder.h"
#import "GAIFields.h"

#import <AFNetworking/AFNetworking.h>
#import "KGStatusBar.h"
#import "MBProgressHUD.h"
#import "RecentUtilities.h"
#import "DBManager.h"
#import "DataManager.h"

#import "RegisterVC.h"


@interface SplashVC : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *txtLoading;

@end
