//
//  UIButton+Enlarge.h
//  BankOfCommunications
//
//  Created by LiuFeiFei on 2018/1/4.
//  Copyright © 2018年 P&C Information. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Enlarge)

#pragma mark - 点击范围放大
- (void)setEnlargeEdge:(CGFloat)size;
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;

@end
