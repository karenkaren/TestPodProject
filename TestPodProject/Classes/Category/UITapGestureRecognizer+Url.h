//
//  UITapGestureRecognizer+Url.h
//  BankOfCommunications
//
//  Created by storm on 16/1/28.
//  Copyright © 2016年 P&C Information. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITapGestureRecognizer (Url)

@property (nonatomic,strong) NSString *strUrl;//第一参数
@property (nonatomic,strong) NSString *tagStr;//第二参数
@property (nonatomic,strong) NSString *paramId;//第三参数
@end
