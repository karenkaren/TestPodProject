//
//  UIColor+Hex.h
//  PNCOAForIpad
//
//  Created by 彭 小坚 on 14-1-6.
//  Copyright (c) 2014年 P&C. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIColor (Hex)
/*
 将16进制颜色值转换为RGB值
 */
+ (UIColor *)colorWithHex:(long)hexColor;
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity;

#pragma mark - string -> color
//从十六进制字符串获取颜色 color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color;
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
// color:支持@“#ff123456”、 @“0Xff123456”、 @“ff123456”三种格式
+ (UIColor *)colorWithAlphaHexString:(NSString *)color;

/*!
 @abstract   随机取颜色值
 
 @return 颜色
 
 @since 彭小坚 2014.8.20 @HKBKCIT
 */
+ (UIColor *)randomColor;
@end
