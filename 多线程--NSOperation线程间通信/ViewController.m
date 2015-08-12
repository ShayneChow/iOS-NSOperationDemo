//
//  ViewController.m
//  多线程--NSOperation线程间通信
//
//  Created by Xiang on 15/8/11.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *downloadImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // 1.创建一个新的队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // 2.添加任务(操作)
    [queue addOperationWithBlock:^{
        // 2.1在子线程中下载图片
        NSURL *url  = [NSURL URLWithString:@"https://ruby-china-files.b0.upaiyun.com/photo/2014/04e78d8c5f92a2d6bf058ffe60deabfd.png"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        
        // 2.2回到主线程更新UI
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.downloadImageView.image = image;
            self.downloadImageView.contentMode = UIViewContentModeScaleAspectFill;
        }];
    }];
}

@end
