//
//  MCModel.m
//  Home Loan : REA
//
//  Created by Dheina Lundi A on 04/09/14.
//  Copyright (c) 2014 iMoney. All rights reserved.
//

#import "MCModel.h"

@implementation MCModel


- (id)initWithObject:(NSDictionary*)_object
{
    self = [super init];
    if (self) {
        self._id = [_object objectForKey:@"id"];
        self.name = [_object objectForKey:@"name"];
        self.email = [_object objectForKey:@"email"];
        self.phone = [_object objectForKey:@"contact_number"];
        self.avatar = [_object objectForKey:@"photo"];
    }
    return self;
}

@end
