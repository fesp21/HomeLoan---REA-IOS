//
//  ColorUtilities.h
//  Riyadhoh
//
//  Created by Mac on 5/31/13.
//  Copyright (c) 2013 dheinaLundi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColorUtilities : NSObject

+ (UIColor*)colorWithHexString:(NSString*)hex;
+ (UIColor*)colorWithHexString:(NSString*)hex alpha:(float)ala;

@end
