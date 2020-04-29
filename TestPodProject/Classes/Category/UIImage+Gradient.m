//
//  UIImage+Gradient.m
//  BankOfCommunications
//
//  Created by LiuFeiFei on 2018/9/26.
//  Copyright © 2018年 P&C Information. All rights reserved.
//

#import "UIImage+Gradient.h"
#import "UIColor+Hex.h"

@implementation UIImage (Gradient)

/**
 渐变色图片

 @param size 图片大小
 @return 图片
 */
+ (UIImage *)gradientColorWithSize:(CGSize)size {
    return [UIImage gradientColorWithStartColor:[UIColor colorWithHex:0xf8f8f8] endColor:[UIColor colorWithHex:0xe5e5e5] size:size];
}

/**
 渐变色图片

 @param startColor 渐变开始颜色
 @param endColor 渐变结束颜色
 @param size 图片大小
 @return 图片
 */
+ (UIImage *)gradientColorWithStartColor:(UIColor *)startColor
                                endColor:(UIColor *)endColor
                                   size:(CGSize)size
{
    //底部上下渐变效果背景
    // The following methods will only return a 8-bit per channel context in the DeviceRGB color space. 通过图片上下文设置颜色空间间
    UIGraphicsBeginImageContext(size);
    //获得当前的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    //创建颜色空间 /* Create a DeviceRGB color space. */
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //通过矩阵调整空间变换
    CGContextScaleCTM(context, size.width, size.height);
    
    CGFloat locations[] = {0.0, 1.0};
    NSArray * colors = @[(__bridge id)startColor.CGColor, (__bridge id)endColor.CGColor];
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    
    //释放颜色渐变
    CGColorSpaceRelease(colorSpace);
    //通过上下文绘画线色渐变
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(1, 1), kCGGradientDrawsBeforeStartLocation);
    CGContextRestoreGState(context);
    CGGradientRelease(gradient);
    //通过图片上下文获得照片
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    return image;
}

/**
 渐变色图片

 @param red 红色
 @param green 绿色
 @param blue 蓝色
 @param startAlpha 开始的透明度
 @param endAlpha 结束的透明度
 @param size 图片大小
 @return 图片
 */
+ (UIImage *)gradientColorWithRed:(CGFloat)red
                            green:(CGFloat)green
                             blue:(CGFloat)blue
                       startAlpha:(CGFloat)startAlpha
                         endAlpha:(CGFloat)endAlpha
                             size:(CGSize)size
{
    //底部上下渐变效果背景
    // The following methods will only return a 8-bit per channel context in the DeviceRGB color space. 通过图片上下文设置颜色空间间
    UIGraphicsBeginImageContext(size);
    //获得当前的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //创建颜色空间 /* Create a DeviceRGB color space. */
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    //通过矩阵调整空间变换
    CGContextScaleCTM(context, size.width, size.height);
    //从上向下
    //设置颜色 矩阵
    CGFloat colors[] = {
        red, green, blue, startAlpha,
        red, green, blue, endAlpha,
    };
    //通过颜色组件获得渐变上下文
    CGGradientRef backGradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));
   
    //释放颜色渐变
    CGColorSpaceRelease(rgb);
    //通过上下文绘画线色渐变
    CGContextDrawLinearGradient(context, backGradient, CGPointMake(0, 0), CGPointMake(1, 1), kCGGradientDrawsBeforeStartLocation);
    //通过图片上下文获得照片
    CGGradientRelease(backGradient);
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    return image;
}


/**
 圆角图片

 @param radius 圆角半径
 @return 圆角图片
 */
- (UIImage *)circleImageWithRadius:(CGFloat)radius {
    UIGraphicsBeginImageContext(self.size);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    UIBezierPath * bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    [bezierPath addClip];
    [self drawInRect:rect];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 圆角图片
 
 @param radius 圆角半径
 @rectCorner 圆角位置
 @return 圆角图片
 */
- (UIImage *)circleImageWithRadius:(CGFloat)radius byRoundingCorners:(UIRectCorner)rectCorner {
    UIGraphicsBeginImageContext(self.size);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    UIBezierPath * bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:rectCorner cornerRadii:CGSizeMake(radius, radius)];
    [bezierPath addClip];
    [self drawInRect:rect];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


/**
 圆角图片

 @return 椭圆图片，若该图片为正方形，则返回圆形图片
 */
- (UIImage *)circleImage {
    UIGraphicsBeginImageContext(self.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    CGContextClip(ctx);
    [self drawInRect:rect];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
