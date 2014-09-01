//
//  UIColor+GNSUtils.m
//  gnsy
//
//  Created by horimislime on 2014/09/01.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import "UIColor+GNSUtils.h"

/**
 * Generate UIColor from hex string
 *
 * http://qiita.com/SparklerApps/items/8cd37a5fe88dd20e4d07
 */
@implementation UIColor (GNSUtils)
+ (UIColor *)colorWithHex:(NSString *)hexCode {
    NSScanner *colorScanner = [NSScanner scannerWithString:hexCode];
    unsigned int color;
    if (![colorScanner scanHexInt:&color]) return nil;
    CGFloat r = ((color & 0xFF0000) >> 16) / 255.0f;
    CGFloat g = ((color & 0x00FF00) >> 8) / 255.0f;
    CGFloat b = (color & 0x0000FF) / 255.0f;
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}
@end
