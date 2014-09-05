//
//  RatesModel.h
//  Home Loan : REA
//
//  Created by Dheina Lundi A on 04/09/14.
//  Copyright (c) 2014 iMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RatesModel : NSObject

@property (nonatomic) NSNumber *bank_id;
@property (nonatomic) NSNumber *loanAmount;
@property (nonatomic) NSNumber *interestRate;

- (id)initWithObject:(NSNumber*)bankID object:(NSDictionary*)_object;


@end
