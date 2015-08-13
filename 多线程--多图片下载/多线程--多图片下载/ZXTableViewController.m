//
//  ZXTableViewController.m
//  多线程--多图片下载
//
//  Created by Xiang on 15/8/12.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ZXTableViewController.h"
#import "ZXApp.h"

@interface ZXTableViewController ()
/** 需要展示的数据 */
@property (nonatomic, strong) NSArray *apps;
@end

@implementation ZXTableViewController

#pragma mark - lazy
- (NSArray *)apps {
    if (!_apps) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"apps.plist" ofType:nil];
        NSArray *tempArr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *models = [NSMutableArray arrayWithCapacity:tempArr.count];
        for (NSDictionary *dict in tempArr) {
            ZXApp *app = [ZXApp appWithDict:dict];
            [models addObject:app];
        }
        _apps = [models copy];
    }
    return _apps;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.apps.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", [NSThread currentThread]);
    // 1.创建cell
    static NSString *identifier = @"app";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.设置数据
    ZXApp *app = self.apps[indexPath.row];
    cell.textLabel.text = app.name;
    cell.detailTextLabel.text = app.download;
    
    // 下载图片
    /*
     存在的问题:
     1.图片在主线程中下载, 阻塞主线程
     2.重复下载, 浪费资源
     */
    NSURL *url = [NSURL URLWithString:app.icon];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    cell.imageView.image = image;
    
    // 3.返回cell
    return cell;
}

@end
