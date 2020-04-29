//
//  UIView+BCMGraduallyView.h
//  BankOfCommunications
//
//  Created by konghao on 2018/9/25.
//  Copyright © 2018年 P&C Information. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BCMGraduallyView)

- (void)addSimpleGraduallyLayer;
- (void)addGraduallyLayer:(CGRect)frame;
- (void)addGraduallyLayerWithStartColor:(UIColor *)startColor withendColor:(UIColor *)endColor;

- (void)addGraduallyLayer:(CGRect)frame withStartColor:(UIColor *)startColor withendColor:(UIColor *)endColor;

- (CAGradientLayer *)achiveGraduallylayer;

- (void)removeGradientLayer;

@end
