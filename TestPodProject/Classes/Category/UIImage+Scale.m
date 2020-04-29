//
//  UIImage+Scale.m
//  PCShop
//
//  Created by 丁丁 on 14-4-30.
//  Copyright (c) 2014年 丁丁. All rights reserved.
//

#import "UIImage+Scale.h"

@implementation UIImage (Scale)

-(UIImage *)scaleWidth:(CGFloat)width{

    if (width <=0) {
        return self;
    }
    
    CGFloat originalWidth =self.size.width;
    CGFloat originalHeight =self.size.height;
    
    CGFloat height =(width /originalWidth) *originalHeight;
    
    UIImage *image =[UIImage imgResize:self size:CGSizeMake(width, height)];
    
    return image;
}

+ (UIImage *)imgResize:(UIImage*)image size:(CGSize)newSize{
    UIGraphicsBeginImageContext(newSize);
	[image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
	UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return scaledImage;
}

@end
