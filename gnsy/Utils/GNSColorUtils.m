//
//  GNSColorUtils.m
//  gnsy
//
//  Created by horimislime on 2014/08/31.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import "GNSColorUtils.h"

@implementation GNSColorUtils
/**
 * 16進数文字列からUIColorを生成する
 *
 * http://qiita.com/SparklerApps/items/8cd37a5fe88dd20e4d07
 */
+ (UIColor *)UIColorFromHex:(NSString *)hexString {
    NSScanner *colorScanner = [NSScanner scannerWithString:hexString];
    unsigned int color;
    if (![colorScanner scanHexInt:&color]) return nil;
    CGFloat r = ((color & 0xFF0000) >> 16) / 255.0f;
    CGFloat g = ((color & 0x00FF00) >> 8) / 255.0f;
    CGFloat b = (color & 0x0000FF) / 255.0f;
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}
@end
