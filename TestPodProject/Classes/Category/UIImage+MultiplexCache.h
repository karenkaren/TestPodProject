//
//  UIImage+MultiplexCache.h
//  PCShop
//
//  Created by 丁丁 on 14-4-30.
//  Copyright (c) 2014年 丁丁. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 *  @brief UIImage 别类，复用内存缓存
 */
@interface UIImage (MultiplexCache)

/*!
 *  @brief  根据key，获取 UIImage
 *
 *  @param keyString key
 *
 *  @return UIImage
 */
+(UIImage *)imageWithKey:(NSString *)keyString;

/*!
 *  @brief  缓存图片
 *
 *  @param image     image
 *  @param keyString key
 */
+(void)setImage:(UIImage *)image key:(NSString *)keyString;

/*!
 *  @brief  移除缓存
 */
+(void)removeCache;

@end
