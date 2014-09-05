//
//  RecentUtilities.h
//  Renew Car Insurance
//
//  Created by Dheina Lundi A on 22/04/14.
//  Copyright (c) 2014 Dheina Lundi A. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecentUtilities : NSObject

+(void)setPreferencesWithKey:(NSString*)key :(NSString*)value;
+(NSString*)getPreferencesWithKey:(NSString*)key;
+(void)setPreferencesIntWithKey:(NSString*)key :(int)value;
+(int)getPreferencesIntWithKey:(NSString*)key;
+(BOOL)getPreferencesBoolWithKey:(NSString*)key;
+(void)setPreferencesBoolWithKey:(NSString*)key :(BOOL)value;
+(BOOL) isValidEmail:(NSString *)checkString;
+(void)shakeView:(UIView *)view;

+(void)showAlert:(NSString*)title message:(NSString*)message cancelBtn:(NSString*)cancelBtn;
+ (NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime;
+ (NSInteger)monthsBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime;
+ (NSInteger)yearsBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime;

+ (CGSize)text:(NSString *)text sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
+(UIImage*)imageWithImage: (UIImage*) sourceImage scaledToWidth: (float) i_width;

+(void)callPhone:(NSString*)phone_number;

+(NSString*)getMapThumb:(NSString*)name latitude:(double)latitude longitude:(double) longitude width:(int)width height:(int)height;
@end
