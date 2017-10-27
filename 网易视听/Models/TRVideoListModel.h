//
//  TRVideoListModel.h
//  网易视听
//
//  Created by tarena on 16/1/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRVideoListModel : NSObject

@property(nonatomic,copy) NSString *cover;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *desc;
@property(nonatomic,copy) NSString *mp4_url;

+(TRVideoListModel *)parseVideoListModelWithDic:(NSDictionary *)dic;













@end
