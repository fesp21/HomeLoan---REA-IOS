//
//  RegisterVC.h
//  Home Loan : REA
//
//  Created by Dheina Lundi A on 04/09/14.
//  Copyright (c) 2014 iMoney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleAnalytics-iOS-SDK/GAI.h>
#import "GAIDictionaryBuilder.h"
#import "GAIFields.h"


@interface RegisterVC : UIViewController
<
UIScrollViewDelegate,
UITextFieldDelegate
>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *content;


@property (weak, nonatomic) IBOutlet UIButton *btnInvisible;

@end
