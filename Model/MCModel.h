//
//  MCModel.h
//  Home Loan : REA
//
//  Created by Dheina Lundi A on 04/09/14.
//  Copyright (c) 2014 iMoney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCModel : NSObject

@property (nonatomic) NSNumber *_id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *avatar;

- (id)initWithObject:(NSDictionary*)_object;


@end
