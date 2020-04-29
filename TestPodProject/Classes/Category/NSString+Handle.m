//
//  NSString+Handle.m
//  BankOfCommunications
//
//  Created by zhaoyang on 2018/1/10.
//  Copyright © 2018年 P&C Information. All rights reserved.
//

#import "NSString+Handle.h"

@implementation NSString (Handle)

//截取卡号最后六位
+ (NSString *)getLastSixChar:(NSString *)string {
    if (![string isKindOfClass:[NSString class]]) return @"";
    if (string.length>0) {
        if (string.length>6) {
            return [string substringFromIndex:string.length - 6];
        } else {
            return string;
        }
    } else {
        return @"";
    }
}
//截取卡号最后四位
+ (NSString *)getLastFourChar:(NSString *)string {
    if (![string isKindOfClass:[NSString class]]) return @"";
    if (string.length>0) {
        if (string.length>4) {
            return [string substringFromIndex:string.length - 4];
        } else {
            return string;
        }
    } else {
        return @"";
    }
}

/** 获取前4位 */
+ (NSString *)getFirstFourChar:(NSString *)string {
    if (![string isKindOfClass:[NSString class]]) return @"";
    if (string.length > 0) {
        if (string.length >= 4) {
            return [string substringToIndex:4];
        } else {
            return string;
        }
    } else {
        return @"";
    }
}

+ (NSString *)insertSpace:(NSString *)string {
    NSMutableString *tmpStr =[NSMutableString stringWithString:string];
    for (int i =0; i <string.length; i++) {
        if (i!=0 && i %4 ==0) {
            [tmpStr insertString:@" " atIndex:i+(i/4)-1];
        }
    }
    return [NSString stringWithString:tmpStr];
}

// 证件号显示处理320113198804118177
+ (NSString *)replacedByStar:(NSString *)string end:(NSUInteger)end {
    return [NSString replacedByStar:string begin:0 end:end];
}

// 证件号显示处理320113198804118177
+ (NSString *)replacedByStar:(NSString *)string begin:(NSUInteger)begin end:(NSUInteger)end {
    if (string.length < begin+end) return string;
    NSMutableString *tempStr = [NSMutableString stringWithString:string];
    for (NSUInteger i = begin; i < string.length-end; i++) {
        [tempStr replaceCharactersInRange:NSMakeRange(i, 1) withString:@"*"];
    }
    return [NSString stringWithString:tempStr];
}

#pragma mark - 计算字符串的长度
+ (CGSize)widthOfString:(NSString *)string font:(UIFont *)font {
    NSDictionary *dict = @{ NSFontAttributeName: font };
    CGSize size = [string sizeWithAttributes:dict];
    return size;
}

#pragma mark - 金额处理
- (NSString *)transformToMoneyType {
    if (self.length) {
        NSString *string = (NSString *)self;
        if ([string containsString:@","]) {
            string = [string stringByReplacingOccurrencesOfString:@"," withString:@""];
        }
        if ([string regularExpression:@"^\\d+([/.]\\d+)?$"] || [string regularExpression:@"^[/.]\\d+?$"]) {
            double money = [string doubleValue];
            NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
            // 设置格式
            [numberFormatter setPositiveFormat:@"###,##0.00;"];
            NSString *formattedNumberString = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:money]];
            return formattedNumberString;
        }
    }
    return self;
}

- (BOOL)regularExpression:(NSString *)patternStr{
    if ([self isKindOfClass:[NSString class]]) {
        NSString *objStr = [NSString stringWithFormat:@"%@", self];
        if (!objStr.length) return NO;
        NSError *error = nil;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:patternStr  options:NSRegularExpressionCaseInsensitive|NSRegularExpressionAnchorsMatchLines error:&error];
        if (error) return NO;
        NSUInteger intNum = [regex numberOfMatchesInString:objStr options:0 range:NSMakeRange(0, objStr.length)];
        return intNum == 0 ? NO : YES;
    }
    return NO;
}

@end
