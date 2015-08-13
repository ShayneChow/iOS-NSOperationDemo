//
//  ZXApp.h
//  多线程--多图片下载
//
//  Created by Xiang on 15/8/12.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXApp : NSObject

/** 图标 */
@property (nonatomic, copy) NSString *icon;
/** 名称 */
@property (nonatomic, copy) NSString *name;
/** 下载数 */
@property (nonatomic, copy) NSString *download;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)appWithDict:(NSDictionary *)dict;

@end
