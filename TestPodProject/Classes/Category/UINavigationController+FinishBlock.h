//
//  UINavigationController+FinishBlock.h
//  LingTouNiaoZF
//
//  Created by LiuFeifei on 16/11/15.
//  Copyright © 2016年 LiuJie. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^VoidBlock)(void);

@interface UINavigationController (FinishBlock)

@property (nonatomic, copy) VoidBlock finishBlock;

@end
