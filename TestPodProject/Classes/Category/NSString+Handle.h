//
//  NSString+Handle.h
//  BankOfCommunications
//
//  Created by zhaoyang on 2018/1/10.
//  Copyright © 2018年 P&C Information. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 字符串处理 */
@interface NSString (Handle)
/** 获取后6位 */
+ (NSString *)getLastSixChar:(NSString *)string;
/** 获取后4位 */
+ (NSString *)getLastFourChar:(NSString *)string;
/** 获取前4位 */
+ (NSString *)getFirstFourChar:(NSString *)string;
/** 每4位加一个空格 */
+ (NSString *)insertSpace:(NSString *)string;


/** 保留最后数字, 其他替换成 *
 *  @param end 保留的最后位数,  e.g. end = 4,  12345678 -> ****5678
 */
+ (NSString *)replacedByStar:(NSString *)string end:(NSUInteger)end;


/** 保留开始和最后数字, 其他替换成
 *  @param begin 保留的开始的位数
 *  @param end 保留的最后位数
 *  e.g.  bagin = 2, end = 3,   12345678 -> 12***678
 */
+ (NSString *)replacedByStar:(NSString *)string begin:(NSUInteger)begin end:(NSUInteger)end;

/** 计算字符串的长度
 *  @param font 要计算的字符串字体
 */
+ (CGSize)widthOfString:(NSString *)string font:(UIFont *)font;

/**
 金额处理

 @return 50000变为50,000.00
 */
- (NSString *)transformToMoneyType;

@end
