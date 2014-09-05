//
//  DataManager.m
//  Home Loan : REA
//
//  Created by Dheina Lundi A on 04/09/14.
//  Copyright (c) 2014 iMoney. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

+(void)setBRL:(float)value
{
    [RecentUtilities setPreferencesWithKey:@"BRL_VALUE" :[NSString stringWithFormat:@"%f",value]];
}
+(float)getBRL{
    NSString *blrS = [RecentUtilities getPreferencesWithKey:@"BRL_VALUE"];
    return [blrS floatValue];
}

+(void)doLogout{
    
}

+(void)setIsUserLogin:(BOOL)value{
    [RecentUtilities setPreferencesBoolWithKey:@"USER_LOGIN" :value];
}
+(BOOL)isUserLogin{
    return [RecentUtilities getPreferencesBoolWithKey:@"USER_LOGIN"];
}

+(void)setUserId:(NSString*)value{
    [RecentUtilities setPreferencesWithKey:@"USER_ID" :value];
}
+(NSString*)getUserId{
    return [RecentUtilities getPreferencesWithKey:@"USER_ID"];
}

+(void)setEmail:(NSString*)value{
    [RecentUtilities setPreferencesWithKey:@"USER_EMAIL" :value];
}
+(NSString*)getEmail{
    return [RecentUtilities getPreferencesWithKey:@"USER_EMAIL"];
}

+(void)setPassword:(NSString*)value{
    [RecentUtilities setPreferencesWithKey:@"USER_PASSWORD" :value];
}
+(NSString*)getPassword{
    return [RecentUtilities getPreferencesWithKey:@"USER_PASSWORD"];
}

+(void)setName:(NSString*)value{
    [RecentUtilities setPreferencesWithKey:@"USER_NAME" :value];
}
+(NSString*)getName{
    return [RecentUtilities getPreferencesWithKey:@"USER_NAME"];
}

+(void)setPhone:(NSString*)value{
    [RecentUtilities setPreferencesWithKey:@"USER_PHONE" :value];
}
+(NSString*)getPhone{
    return [RecentUtilities getPreferencesWithKey:@"USER_PHONE"];
}

+(void)setState:(NSString*)value{
    [RecentUtilities setPreferencesWithKey:@"USER_STATE" :value];
}
+(NSString*)getState{
    return [RecentUtilities getPreferencesWithKey:@"USER_STATE"];
}

+(void)setAgency:(NSString*)value{
    [RecentUtilities setPreferencesWithKey:@"USER_AGENCY" :value];
}
+(NSString*)getAgency{
    return [RecentUtilities getPreferencesWithKey:@"USER_AGENCY"];
}

+(void)setAvatar:(NSString*)value{
    [RecentUtilities setPreferencesWithKey:@"USER_AVATAR" :value];
}
+(NSString*)getAvatar{
    return [RecentUtilities getPreferencesWithKey:@"USER_AVATAR"];
}

+(void)setPoint:(NSString*)value{
    [RecentUtilities setPreferencesWithKey:@"USER_POINT" :value];
}
+(NSString*)getPoint{
    return [RecentUtilities getPreferencesWithKey:@"USER_POINT"];
}

+(void)setAccessToken:(NSString*)value{
    [RecentUtilities setPreferencesWithKey:@"USER_ACCESS_TOKEN" :value];
}
+(NSString*)getAccessToken{
    return [RecentUtilities getPreferencesWithKey:@"USER_ACCESS_TOKEN"];
}

+(void)setIsActivate:(BOOL)value{
    [RecentUtilities setPreferencesBoolWithKey:@"USER_IS_ACTIVE" :value];
}
+(BOOL)getIsActivate{
    return [RecentUtilities getPreferencesBoolWithKey:@"USER_IS_ACTIVE"];
}

+(void)setActivationCode:(NSString*)value{
    [RecentUtilities setPreferencesWithKey:@"USER_ACT_CODE" :value];
}
+(NSString*)getActivationCode{
    return [RecentUtilities getPreferencesWithKey:@"USER_ACT_CODE"];
}

+(void)setTemporaryPassword:(NSString*)value{
    [RecentUtilities setPreferencesWithKey:@"USER_TMP_PASS" :value];
}
+(NSString*)getTemporaryPassword{
    return [RecentUtilities getPreferencesWithKey:@"USER_TMP_PASS"];
}


@end
