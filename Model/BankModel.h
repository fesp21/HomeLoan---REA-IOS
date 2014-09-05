//
//  BankModel.h
//  Home Loan : REA
//
//  Created by Dheina Lundi A on 04/09/14.
//  Copyright (c) 2014 iMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RatesModel.h"

@interface BankModel : NSObject

@property (nonatomic) NSNumber *_id;
@property (nonatomic, copy) NSString *path;
@property (nonatomic, copy) NSString *bank;
@property (nonatomic, copy) NSString *bankName;
@property (nonatomic, copy) NSString *productName;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *imageAlt;
@property (nonatomic) NSNumber *flexiLoan;
@property (nonatomic) NSNumber *lockInPeriod;
@property (nonatomic) NSNumber *marginOfFinance;

@property (nonatomic) NSMutableArray *hlRates;

- (id)initWithObject:(NSDictionary*)_object;


@end
