//
//  UIImage+Gradient.h
//  BankOfCommunications
//
//  Created by LiuFeiFei on 2018/9/26.
//  Copyright © 2018年 P&C Information. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Gradient)

#pragma mark - 渐变色图片
// 默认 start：0xf8f8f8 end:0xe5e5e5
+ (UIImage *)gradientColorWithSize:(CGSize)size;
+ (UIImage *)gradientColorWithStartColor:(UIColor *)startColor
                                endColor:(UIColor *)endColor
                                    size:(CGSize)size;
+ (UIImage *)gradientColorWithRed:(CGFloat)red
                            green:(CGFloat)green
                             blue:(CGFloat)blue
                       startAlpha:(CGFloat)startAlpha
                         endAlpha:(CGFloat)endAlpha
                             size:(CGSize)size;

#pragma mark - 圆角图片
- (UIImage *)circleImageWithRadius:(CGFloat)radius byRoundingCorners:(UIRectCorner)rectCorner;
- (UIImage *)circleImageWithRadius:(CGFloat)radius;
- (UIImage *)circleImage;

@end
