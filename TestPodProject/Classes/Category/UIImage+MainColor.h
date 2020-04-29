//
//  UIImage+MainColor.h
//  BankOfCommunications
//
//  Created by Mac on 15/7/13.
//  Copyright (c) 2015年 P&C Information. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MainColor)

/**
 *  图片的主色调
 *
 *  @return UIColor
 */
-(UIColor *)mainColor;

/**
 *  判断是不是亮色系的图片
 *
 *  @return 布尔值
 */
-(BOOL)isLightImage;
/**
 *  修改图片的alpha值
 *
 *  @param alpha 透明度
 *
 *  @return 修改后的图片
 */
- (UIImage *)imageByApplyingAlpha:(CGFloat)alpha;



/** 生成纯色图片
 @param color 生成的图片颜色
 */
+ (UIImage *)imageWithColor:(UIColor *)color;
@end
