//
//  NSDictionary+Mock.m
//  BankOfCommunications
//
//  Created by konghao on 2018/6/7.
//  Copyright © 2018年 P&C Information. All rights reserved.
//

#import "NSDictionary+Mock.h"
#import "YYModel.h"

@implementation NSDictionary (Mock)

- (NSDictionary *)mockParamWithObjc:(id)objc {
    return [self mockParamWithObjc:objc withClassName:nil];
}

- (NSDictionary *)mockParamWithObjc:(id)objc withClassName:(NSString *)className {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:self];
    [dict setObject:@"1" forKey:@"isMock"];
    NSString *str = [objc yy_modelToJSONString];
    if (str == nil) {
        objc = @{@"msg":@"数据格式错误"};
        str = [objc yy_modelToJSONString];
    }
    [dict setObject:str forKey:@"mockDict"];

    if (className != nil && ![className isEqualToString:@""]) {
        [dict setObject:className forKey:@"className"];
    }
    return dict;
}

- (NSDictionary *)mockAchiveResult {
    NSString *str = [self objectForKey:@"mockDict"];
    NSData *jsonData = [str dataUsingEncoding : NSUTF8StringEncoding];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:NULL];

    return dic;
}

- (BOOL)isMock {
    return [self objectForKey:@"isMock"] ? YES : NO;
}

@end
