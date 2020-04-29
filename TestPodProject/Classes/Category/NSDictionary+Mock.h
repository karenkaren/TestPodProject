//
//  NSDictionary+Mock.h
//  BankOfCommunications
//
//  Created by konghao on 2018/6/7.
//  Copyright © 2018年 P&C Information. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Mock)

/**
 模拟返回数据

 @param objc 模拟返回的数据 支持 NSDictionary NSArray Model
 @return 返回请求的参数
 @code
 NSDictionary *dict = @{.......};
 dict = [dict mockParamWithObjc:objc]; //这行加入挡板数据，不需要挡板可以注释这一行
 [AresHTTPRequest GET:[AresApp getAppUrl:KKKShakeUrl] parameters:dict completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
 //这里的的 response 就是上面的objc转换成字典或者数组的值
 }]；
 @endcode
 */
- (NSDictionary *)mockParamWithObjc:(id)objc;



- (NSDictionary *)mockAchiveResult;
- (BOOL)isMock;

@end
