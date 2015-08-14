//
//  NSString+ZX.m
//  多线程--多图片下载
//
//  Created by Xiang on 15/8/14.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "NSString+ZX.h"

@implementation NSString (ZX)

- (instancetype)cacheDir {
    NSString *dir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    return [dir stringByAppendingPathComponent:[self lastPathComponent]];
}

- (instancetype)docDir {
    NSString *dir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return [dir stringByAppendingPathComponent:[self lastPathComponent]];
}

- (instancetype)tmpDir {
    NSString *dir = NSTemporaryDirectory();
    return [dir stringByAppendingPathComponent:[self lastPathComponent]];
}

@end
