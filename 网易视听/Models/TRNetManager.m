//
//  TRNetManager.m
//  网易视听
//
//  Created by tarena on 16/1/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRNetManager.h"
#import "AFNetworking.h"
#import "TRVideoListModel.h"
@implementation TRNetManager
+ (void)sendGetRequestWithUrlstr:(NSString *)urlStr parameters:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    [mgr GET:urlStr parameters:params success:^(NSURLSessionDataTask * _Nonnull task,NSDictionary *responseObject) {
        NSArray *videoLists = responseObject[@"videoList"];
        NSMutableArray *modelArry = [NSMutableArray array];
        for (NSDictionary *video in videoLists) {
            TRVideoListModel *model = [TRVideoListModel parseVideoListModelWithDic:video];
            [modelArry addObject:model];
        }
        success([modelArry copy]);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"error %@",error.userInfo);
        failure(error);
    }];
    
    
    
    
    
    
    
    
    
    
}
@end
