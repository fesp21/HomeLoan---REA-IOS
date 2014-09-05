//
//  DataManager.h
//  Home Loan : REA
//
//  Created by Dheina Lundi A on 04/09/14.
//  Copyright (c) 2014 iMoney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RecentUtilities.h"

@interface DataManager : NSObject

+(void)setBRL:(float)value;
+(float)getBRL;


//Account Info
+(void)doLogout;

+(void)setIsUserLogin:(BOOL)value;
+(BOOL)isUserLogin;

+(void)setUserId:(NSString*)value;
+(NSString*)getUserId;

+(void)setEmail:(NSString*)value;
+(NSString*)getEmail;

+(void)setPassword:(NSString*)value;
+(NSString*)getPassword;

+(void)setName:(NSString*)value;
+(NSString*)getName;

+(void)setPhone:(NSString*)value;
+(NSString*)getPhone;

+(void)setState:(NSString*)value;
+(NSString*)getState;

+(void)setAgency:(NSString*)value;
+(NSString*)getAgency;

+(void)setAvatar:(NSString*)value;
+(NSString*)getAvatar;

+(void)setPoint:(NSString*)value;
+(NSString*)getPoint;

+(void)setAccessToken:(NSString*)value;
+(NSString*)getAccessToken;


+(void)setIsActivate:(BOOL)value;
+(BOOL)getIsActivate;

+(void)setActivationCode:(NSString*)value;
+(NSString*)getActivationCode;

+(void)setTemporaryPassword:(NSString*)value;
+(NSString*)getTemporaryPassword;


@end
