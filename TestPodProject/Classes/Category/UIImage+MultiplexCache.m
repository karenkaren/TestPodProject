//
//  UIImage+MultiplexCache.m
//  PCShop
//
//  Created by 丁丁 on 14-4-30.
//  Copyright (c) 2014年 丁丁. All rights reserved.
//

#import "UIImage+MultiplexCache.h"

static NSMutableDictionary *dictOfCaches =nil;

@implementation UIImage (MultiplexCache)

+(UIImage *)imageWithKey:(NSString *)keyString{

    return [dictOfCaches objectForKey:keyString];
}

+(void)setImage:(UIImage *)image key:(NSString *)keyString{

    if (dictOfCaches ==nil) {
        dictOfCaches =[[NSMutableDictionary alloc] init];
    }
    if (image !=nil && keyString !=nil) {
        [dictOfCaches setObject:image forKey:keyString];
    }
}

+(void)removeCache{

    [dictOfCaches removeAllObjects];
    dictOfCaches =nil;
}

@end
