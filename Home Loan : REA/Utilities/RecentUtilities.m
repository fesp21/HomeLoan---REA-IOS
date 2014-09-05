//
//  RecentUtilities.m
//  Renew Car Insurance
//
//  Created by Dheina Lundi A on 22/04/14.
//  Copyright (c) 2014 Dheina Lundi A. All rights reserved.
//

#import "RecentUtilities.h"

@implementation RecentUtilities

+(void)setPreferencesWithKey:(NSString*)key :(NSString*)value
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:value forKey:key];
    [defaults synchronize];
}

+(NSString*)getPreferencesWithKey:(NSString*)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if(defaults!=nil){
        return [defaults objectForKey:key];
    }else{
        return @"";
    }
}
+(void)setPreferencesIntWithKey:(NSString*)key :(int)value
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:value forKey:key];
    [defaults synchronize];
}

+(int)getPreferencesIntWithKey:(NSString*)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if(defaults!=nil){
        return [defaults integerForKey:key];
    }else{
        return 0;
    }
}

+(void)setPreferencesBoolWithKey:(NSString*)key :(BOOL)value
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:value forKey:key];
    [defaults synchronize];
}

+(BOOL)getPreferencesBoolWithKey:(NSString*)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if(defaults!=nil){
        return [defaults boolForKey:key];
    }else{
        return NO;
    }
}

+(BOOL) isValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

+(void)shakeView:(UIView *)view
{
    CAKeyframeAnimation * anim = [ CAKeyframeAnimation animationWithKeyPath:@"transform" ] ;
    anim.values = @[ [ NSValue valueWithCATransform3D:CATransform3DMakeTranslation(-5.0f, 0.0f, 0.0f) ], [ NSValue valueWithCATransform3D:CATransform3DMakeTranslation(5.0f, 0.0f, 0.0f) ] ] ;
    anim.autoreverses = YES ;
    anim.repeatCount = 2.0f ;
    anim.duration = 0.07f ;
    [ view.layer addAnimation:anim forKey:nil ] ;
}

+(void)showAlert:(NSString*)title message:(NSString*)message cancelBtn:(NSString*)cancelBtn
{
    if(title==nil){
        title = @"Alert";
    }
    if(cancelBtn==nil){
        cancelBtn = @"OK";
    }
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelBtn otherButtonTitles:nil, nil];
    [alert show];
}

+ (NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit
                                               fromDate:fromDateTime
                                                 toDate:toDateTime
                                                options:0];
    return components.day;
}
+ (NSInteger)monthsBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit
                                               fromDate:fromDateTime
                                                 toDate:toDateTime
                                                options:0];
    return components.month;
}
+ (NSInteger)yearsBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit
                                               fromDate:fromDateTime
                                                 toDate:toDateTime
                                                options:0];
    return components.year;
}

+ (CGSize)text:(NSString *)text sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
    {
        CGRect frame = [text boundingRectWithSize:size
                                          options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                       attributes:@{NSFontAttributeName:font}
                                          context:nil];
        return frame.size;
    }
    else
    {
        return [text sizeWithFont:font constrainedToSize:size];
    }
}
+(UIImage*)imageWithImage: (UIImage*) sourceImage scaledToWidth: (float) i_width
{
    float oldWidth = sourceImage.size.width;
    float scaleFactor = i_width / oldWidth;
    
    float newHeight = sourceImage.size.height * scaleFactor;
    float newWidth = oldWidth * scaleFactor;
    
    UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight));
    [sourceImage drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+(NSString*)getMapThumb:(NSString*)name latitude:(double)latitude longitude:(double)longitude width:(int)width height:(int)height
{
    return [NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/staticmap?center=%f,%f&zoom=16&size=%dx%d&sensor=false&markers=color:blue%%7Clabel:%@%%7C%f,%f",longitude,latitude,width,height,name,longitude,latitude];
}


+(void)callPhone:(NSString*)phone_number
{
    UIDevice *device = [UIDevice currentDevice];
    if ([[device model] isEqualToString:@"iPhone"] ) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phone_number]]];
    } else {
        UIAlertView *notPermitted=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Your device doesn't support this feature." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [notPermitted show];
    }
}


@end
