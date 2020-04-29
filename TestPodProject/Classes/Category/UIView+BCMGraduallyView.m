//
//  UIView+BCMGraduallyView.m
//  BankOfCommunications
//
//  Created by konghao on 2018/9/25.
//  Copyright © 2018年 P&C Information. All rights reserved.
//

#import "UIView+BCMGraduallyView.h"
#import "UIColor+Hex.h"

@implementation UIView (BCMGraduallyView)

- (void)addSimpleGraduallyLayer {
    [self addGraduallyLayer:self.bounds withStartColor:[UIColor colorWithHex:0xEEEEEE] withendColor:[UIColor colorWithHex:0xD8D8D8]];
}

- (void)addGraduallyLayer:(CGRect)frame {
    [self addGraduallyLayer:frame withStartColor:[UIColor colorWithHex:0xEEEEEE] withendColor:[UIColor colorWithHex:0xD8D8D8]];
}
- (void)addGraduallyLayerWithStartColor:(UIColor *)startColor withendColor:(UIColor *)endColor {
    [self addGraduallyLayerWithStartColor:startColor withendColor:endColor];
}

- (void)addGraduallyLayer:(CGRect)frame withStartColor:(UIColor *)startColor withendColor:(UIColor *)endColor {
    for (CALayer * layer in self.layer.sublayers) {
        if ([layer isKindOfClass:[CAGradientLayer class]]) {
            [layer removeFromSuperlayer];
        }
    }
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)startColor.CGColor, (__bridge id)endColor.CGColor];
    gradientLayer.locations = @[@0, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = frame;
    [self.layer addSublayer:gradientLayer];
}

- (CAGradientLayer *)achiveGraduallylayer
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.locations = @[@0, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    return gradientLayer;
}
- (void)removeGradientLayer
{
    for (CALayer * layer in self.layer.sublayers) {
        if ([layer isKindOfClass:[CAGradientLayer class]]) {
            [layer removeFromSuperlayer];
        }
    }
}
@end
