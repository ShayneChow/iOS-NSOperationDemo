//
//  ZXApp.m
//  多线程--多图片下载
//
//  Created by Xiang on 15/8/12.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ZXApp.h"

@implementation ZXApp

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)appWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
