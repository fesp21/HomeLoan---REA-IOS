//
//  BankModel.m
//  Home Loan : REA
//
//  Created by Dheina Lundi A on 04/09/14.
//  Copyright (c) 2014 iMoney. All rights reserved.
//

#import "BankModel.h"

@implementation BankModel



- (id)initWithObject:(NSDictionary*)_object
{
    self = [super init];
    if (self) {
        self._id = [_object objectForKey:@"nid"];
        self.path = [_object objectForKey:@"path"];
        self.bank = [_object objectForKey:@"bank"];
        self.bankName = [_object objectForKey:@"bankName"];
        self.productName = [_object objectForKey:@"productName"];
        self.image = [_object objectForKey:@"image"];
        self.imageAlt = [_object objectForKey:@"imageAlt"];
        self.flexiLoan = [_object objectForKey:@"flexiLoan"];
        self.lockInPeriod = [_object objectForKey:@"lockInPeriod"];
        self.marginOfFinance = [_object objectForKey:@"marginOfFinance"];
        [self parseRates:[_object objectForKey:@"hlRates"]];
    }
    return self;
}

-(void) parseRates:(NSArray*)list
{
    self.hlRates = [[NSMutableArray alloc]init];
    for (int i = 0 ; i<list.count; i++) {
        NSDictionary *modelD = [list objectAtIndex:i];
        RatesModel *model = [[RatesModel alloc]initWithObject:self._id object:modelD];
        [self.hlRates addObject:model];
    }
    
}


@end
