//
//  NSDate+Handle.h
//  BankOfCommunications
//
//  Created by LiuJie on 2019/11/22.
//  Copyright © 2019 P&C Information. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Handle)

// 字符串转为北京时间NSDate   支持yyyyMMdd yyyyMMddHHmmss
+ (NSDate *)convertToBJDate:(NSString *)dateString;

// 北京时间转换为字符串
- (NSString *)bjDateConvertToStringWithDateFormatter:(NSString *)dateFormatter;

// 计算两个日期间隔天数
+ (NSInteger)calculateDayWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;

// 距离date为n天的日期
+ (NSDate *)getDateFromDate:(NSDate *)date deltaDay:(NSInteger)deltaDay;

// 获取距离date为N个月日日期
+ (NSDate *)getDateFromDate:(NSDate *)date deltaMonth:(NSInteger)deltaMonth;

@end
