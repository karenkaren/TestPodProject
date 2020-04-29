//
//  UIResponder+Router.h
//  ResponderChain
//
//  Created by zhaoyang on 2018/6/7.
//  Copyright © 2018年 zhaoyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (Router)

/**
 *  @param selectorName 需要调用的方法名称
 *  @param object       传递的对象
 *  @param info         传递的参数信息
 */
- (void)routerEventWithSelectorName:(NSString *)selectorName
                             object:(id)object
                               info:(NSDictionary *)info;
@end
