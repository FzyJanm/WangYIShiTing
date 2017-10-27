//
//  TRNetManager.h
//  网易视听
//
//  Created by tarena on 16/1/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRNetManager : NSObject
+ (void)sendGetRequestWithUrlstr:(NSString *)urlStr parameters:(NSDictionary *)params success:(void(^)(id resposeObject))success failure:(void(^)(NSError *error))failure;






@end
