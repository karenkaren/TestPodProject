//
//  UIResponder+Router.m
//  ResponderChain
//
//  Created by zhaoyang on 2018/6/7.
//  Copyright © 2018年 zhaoyang. All rights reserved.
//

#import "UIResponder+Router.h"

@implementation UIResponder (Router)
- (void)routerEventWithSelectorName:(NSString *)selectorName object:(id)object info:(NSDictionary *)info {
    [[self nextResponder] routerEventWithSelectorName:selectorName object:object info:info];
}
@end
