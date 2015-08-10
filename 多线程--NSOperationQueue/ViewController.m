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

/** 队列 */
@property (nonatomic, strong) NSOperationQueue *queue;

@end

@implementation ViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // 1.创建队列
    /*
     GCD中有哪些队列:
     并发: 自己创建, 全局
     串行: 自己创建, 主队列
     
     NSOperationQueue:
     主队列: mainQueue
     自己创建: 会在子线程中执行
     */
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    // 自己创建的队列默认是并发, 如果设置maxConcurrentOperationCount = 1,就是串行
    // 注意: 不能设置为0, 如果设置为0就不行执行任务\
    //       默认情况下maxConcurrentOperationCount = -1
    //       在开发中并发数最多尽量不要超过5~6条
    queue.maxConcurrentOperationCount = 1;
    
    // 2.创建任务
    [queue addOperationWithBlock:^{
        [NSThread sleepForTimeInterval:0.1];
        NSLog(@"1 == %@", [NSThread currentThread]);
    }];
    [queue addOperationWithBlock:^{
        [NSThread sleepForTimeInterval:0.1];
        NSLog(@"2 == %@", [NSThread currentThread]);
    }];
    [queue addOperationWithBlock:^{
        [NSThread sleepForTimeInterval:0.1];
        NSLog(@"3 == %@", [NSThread currentThread]);
    }];
    [queue addOperationWithBlock:^{
        [NSThread sleepForTimeInterval:0.1];
        NSLog(@"4 == %@", [NSThread currentThread]);
    }];
    [queue addOperationWithBlock:^{
        [NSThread sleepForTimeInterval:0.1];
        NSLog(@"5 == %@", [NSThread currentThread]);
    }];
    [queue addOperationWithBlock:^{
        [NSThread sleepForTimeInterval:0.1];
        NSLog(@"6 == %@", [NSThread currentThread]);
    }];
}

- (void)operationQueue {
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
