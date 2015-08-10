//
//  ViewController.m
//  多线程-NSOperation
//
//  Created by Xiang on 15/8/7.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s", __func__);
    //1. 封装任务
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        // 主线程
        NSLog(@"1---%@", [NSThread currentThread]);
    }];
    
    // 2.追加其它任务
    // 注意: 在没有队列的情况下, 如果给BlockOperation追加其它任务, 那么其它任务会在子线程中执行
    [op1 addExecutionBlock:^{
        NSLog(@"2---%@", [NSThread currentThread]);
    }];
    [op1 addExecutionBlock:^{
        NSLog(@"3---%@", [NSThread currentThread]);
    }];
    
    // 3.启动任务
    [op1 start];
    
}

- (void)invocation {
    // 注意: 父类不具备封装操作的能力
    //    NSOperation *op = [[NSOperation alloc] init];
    
    // 1.封装任务
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run) object:nil];
    // 2.要想执行任务必须调用start
    [op1 start];
    
    NSInvocationOperation *op2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run2) object:nil];
    [op2 start];
}

- (void)run {
    NSLog(@"%@", [NSThread currentThread]);
}

- (void)run2 {
    NSLog(@"%@", [NSThread currentThread]);
}

@end
