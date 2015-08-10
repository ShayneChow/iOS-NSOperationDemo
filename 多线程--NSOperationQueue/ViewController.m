//
//  ViewController.m
//  多线程--NSOperationQueue
//
//  Created by Xiang on 15/8/10.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ViewController.h"
#import "ZXOperation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // 1.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    // 2.创建任务
    // 自定义任务的好处: 提高代码的复用性
    ZXOperation *op1 = [[ZXOperation alloc] init];
    ZXOperation *op2 = [[ZXOperation alloc] init];
    
    // 3.添加任务到队列
    [queue addOperation:op1];
    [queue addOperation:op2];
}

@end
