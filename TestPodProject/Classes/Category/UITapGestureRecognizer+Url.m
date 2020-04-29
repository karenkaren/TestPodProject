//
//  UITapGestureRecognizer+Url.m
//  BankOfCommunications
//
//  Created by storm on 16/1/28.
//  Copyright © 2016年 P&C Information. All rights reserved.
//

#import "UITapGestureRecognizer+Url.h"
#import <objc/runtime.h>

#define StrUrl @"__StrUrl"
#define TagStr @"__TagStr"
#define ParamId @"__paramId"
@implementation UITapGestureRecognizer (Url)

-(void)setStrUrl:(NSString *)url{
    objc_setAssociatedObject(self, StrUrl, url, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSString *)strUrl{
    return objc_getAssociatedObject(self, StrUrl);
}
-(void)setTagStr:(NSString *)str{
    objc_setAssociatedObject(self, TagStr, str, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSString *)tagStr{
    return objc_getAssociatedObject(self, TagStr);
}
-(void)setParamId:(NSString *)paramId{
    objc_setAssociatedObject(self, ParamId, paramId, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSString *)paramId{
    return objc_getAssociatedObject(self, ParamId);
}
@end
