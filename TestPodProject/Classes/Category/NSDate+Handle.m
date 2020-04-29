//
//  NSDate+Handle.m
//  BankOfCommunications
//
//  Created by LiuJie on 2019/11/22.
//  Copyright © 2019 P&C Information. All rights reserved.
//

#import "NSDate+Handle.h"

@implementation NSDate (Handle)

// 字符串转为北京时间NSDate
+ (NSDate *)convertToBJDate:(NSString *)dateString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    if (dateString.length == 8) {
        formatter.dateFormat = @"yyyyMMdd";
    } else if (dateString.length == 14) {
        formatter.dateFormat = @"yyyyMMddHHmmss";
    }
    // 得到当前时间（世界标准时间 UTC/GMT）
    NSDate *date = [formatter dateFromString:dateString];
    // 设置系统时区为本地时区
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    // 计算本地时区与 GMT 时区的时间差
    NSInteger interval = [zone secondsFromGMT];
    // 在 GMT 时间基础上追加时间差值，得到本地时间
    date = [date dateByAddingTimeInterval:interval];
    return date;
}

// 北京时间转换为字符串
- (NSString *)bjDateConvertToStringWithDateFormatter:(NSString *)dateFormatter {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = dateFormatter;
    // 设置系统时区为本地时区
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    // 计算本地时区与 GMT 时区的时间差
    NSInteger interval = [zone secondsFromGMT];
    // 在 GMT 时间基础上追加时间差值，得到本地时间
    NSDate *date = [self dateByAddingTimeInterval:-interval];
    return [formatter stringFromDate:date];
}

// 计算两个日期间隔天数
+ (NSInteger)calculateDayWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitDay;
    NSDateComponents *delta = [calendar components:unit fromDate:startDate toDate:endDate options:0];
    return delta.day;
}

// 距离date为n天的日期
+ (NSDate *)getDateFromDate:(NSDate *)date deltaDay:(NSInteger)deltaDay {
    if (deltaDay == 0) {
        return date;
    }
    NSDate *nextDate = [NSDate dateWithTimeInterval:24 * 60 * 60 * (deltaDay) sinceDate:date];
    return nextDate;
}

// 获取距离date为N个月日日期
+ (NSDate *)getDateFromDate:(NSDate *)date deltaMonth:(NSInteger)deltaMonth {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:date];
    dateComponents.month += 1;
    NSDate *nextDate = [calendar dateFromComponents:dateComponents];
    return nextDate;
}

@end
