//
//  RatesModel.m
//  Home Loan : REA
//
//  Created by Dheina Lundi A on 04/09/14.
//  Copyright (c) 2014 iMoney. All rights reserved.
//

#import "RatesModel.h"

@implementation RatesModel

- (id)initWithObject:(NSNumber*)bankID object:(NSDictionary*)_object
{
    self = [super init];
    if (self) {
        self.bank_id = bankID;
        self.loanAmount = [_object objectForKey:@"loanAmount"];
        self.interestRate = [_object objectForKey:@"interestRate"];
    }
    return self;
}

@end
