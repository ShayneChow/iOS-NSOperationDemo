//
//  ZXOperation.m
//  多线程-NSOperation
//
//  Created by Xiang on 15/8/10.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ZXOperation.h"

@implementation ZXOperation

/*
 只要将任务添加到队列中, 那么队列在执行自定义任务的时候
 就会自动调用main方法
 */
- (void)main {
    NSLog(@"%s, %@", __func__, [NSThread currentThread]);
}

@end
