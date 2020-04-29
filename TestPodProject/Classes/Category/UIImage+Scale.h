//
//  UIImage+Scale.h
//  PCShop
//
//  Created by 丁丁 on 14-4-30.
//  Copyright (c) 2014年 丁丁. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 *  @brief  UIImage 别类，图片缩放
 */
@interface UIImage (Scale)

/*!
 *  @brief 等比缩放到等宽度，例如800 *800 图片缩放到宽度位640 ，此时高度等比计算为640。
 *
 *  @param width 宽度
 *
 *  @return UIImage
 */
-(UIImage *)scaleWidth:(CGFloat)width;

@end
