//
//  NSString+ZX.h
//  多线程--多图片下载
//
//  Created by Xiang on 15/8/14.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZX)
/**
 *  生成缓存目录全路径
 */
- (instancetype)cacheDir;
/**
 *  生成文档目录全路径
 */
- (instancetype)docDir;
/**
 *  生成临时目录全路径
 */
- (instancetype)tmpDir;

@end
