//
//  TRVideoListModel.m
//  网易视听
//
//  Created by tarena on 16/1/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRVideoListModel.h"

@implementation TRVideoListModel
+ (TRVideoListModel *)parseVideoListModelWithDic:(NSDictionary *)dic
{
    return [[self alloc] parseVideoListModelWithDic1:dic];
}
- (TRVideoListModel *)parseVideoListModelWithDic1:(NSDictionary *)dic
{
    self.cover = dic[@"cover"];
    self.title = dic[@"title"];
    self.mp4_url = dic[@"mp4_url"];
    self.desc = dic[@"description"];
    return self;
}








@end
