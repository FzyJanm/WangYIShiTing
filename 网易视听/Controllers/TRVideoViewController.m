//
//  TRVideoViewController.m
//  网易视听
//
//  Created by tarena on 16/1/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRVideoViewController.h"
#import "TRNetManager.h"
#import "TRVideoListModel.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
@interface TRVideoViewCell:UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIButton *videoButton;
@property(nonatomic,strong) NSURL *videoUrl;

@end

@implementation TRVideoViewCell
//单例对象负责播放视频
+ (AVPlayerViewController *)shareInstance
{
    static AVPlayerViewController *playerVC = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        playerVC = [[AVPlayerViewController alloc]init];
    });
    return playerVC;
}

- (IBAction)playVideo:(UIButton *)sender {
    AVPlayerViewController *playerVC = [TRVideoViewCell shareInstance];
    playerVC.player = [AVPlayer playerWithURL:_videoUrl];
    [playerVC.player play];
    playerVC.view.frame = sender.bounds;
    [sender addSubview:playerVC.view];
    
}
//当cell重用时，需要把cell上的播放器界面删掉
- (void)prepareForReuse
{
    [super prepareForReuse];
    if ([TRVideoViewCell shareInstance].view.superview== self.videoButton) {
        [[TRVideoViewCell shareInstance].view removeFromSuperview];
        [TRVideoViewCell shareInstance].player = nil;
    }

}
@end

@interface TRVideoViewController ()
@property(nonatomic,strong) NSArray *dataForVideos;
@end

@implementation TRVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [TRNetManager sendGetRequestWithUrlstr:@"http://c.m.163.com/nc/video/home/0-10.html" parameters:nil success:^(NSArray *resposeObject) {
        _dataForVideos = resposeObject;
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@",error.userInfo);
        
    }];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.dataForVideos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TRVideoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    TRVideoListModel *model = _dataForVideos[indexPath.row];
    cell.title.text = model.title;
    cell.descLabel.text = model.desc;
    [cell.videoButton setBackgroundImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.cover]]] forState:UIControlStateNormal];
    cell.videoUrl = [NSURL URLWithString:model.mp4_url];
    
//    cell.
    
    // Configure the cell...
    
    return cell;
}
//适配屏幕大小
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UIScreen mainScreen].bounds.size.width * 540.0 /720.0;
}


@end
