//
//  RequestResultModel.h
//  FrameworkDemo
//
//  Created by Bright on 16/3/17.
//  Copyright © 2016年 yunlong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestModel.h"
@interface RequestResultModel : NSObject

@property(nonatomic, assign) BOOL success;//请求是否成功
@property(nonatomic, copy) NSString *errorInfo;//失败信息
@property(nonatomic, strong) BaseRequestModel *requestModel;//请求model
@property(nonatomic, strong) NSDictionary *retDict;//返回数据

@end
