//
//  ViewController.m
//  SDWebImageDemo
//
//  Created by Xiang on 15/8/14.
//  Copyright (c) 2015年 周想. All rights reserved.
//

#import "ViewController.h"
#import "ZXApp.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface ViewController ()
/** 需要展示的数据 */
@property (nonatomic, strong) NSArray *apps;
@end

@implementation ViewController

#pragma mark - 懒加载
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
    
    NSURL *url = [NSURL URLWithString:@"http://e.hiphotos.baidu.com/image/pic/item/9825bc315c6034a852fd0096c81349540923768d.jpg"];
    [[SDWebImageManager sharedManager] downloadImageWithURL:url options:kNilOptions progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        // expectedSize 下载的图片的总大小
        // receivedSize 已经接受的大小
        NSLog(@"expectedSize = %ld, receivedSize = %ld", expectedSize, receivedSize);
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        NSLog(@"%@", image);
    }];
}

#pragma mark- datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.apps.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1.创建cell
    static NSString *identifier = @"app";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.设置数据
    ZXApp *app = self.apps[indexPath.row];
    cell.textLabel.text = app.name;
    cell.detailTextLabel.text = app.download;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:app.icon] placeholderImage:[UIImage imageNamed:@"1"]];
    
    // 3.返回cell
    return cell;
}

@end
