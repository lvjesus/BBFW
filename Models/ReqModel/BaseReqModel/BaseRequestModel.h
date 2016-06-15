//
//  BaseRequestModel.h
//  FrameworkDemo
//
//  Created by Bright on 16/3/17.
//  Copyright © 2016年 yunlong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseRequestModel : NSObject

//所有的请求参数model都基于此类，子类属性名必须同接口文档定义的一致
//分页字段子类不用定义，直接用以下字段

//通用属性
// 必传
@property(nonatomic, copy) NSString *requestUrl;/**< 请求url */
@property (nonatomic,weak) id delegate; /**< 调用请求回调方法的对象 */
@property(nonatomic, assign) SEL callBackMethod;/**< 请求回调方法 */

//分页相关（非必需，默认不分页）
@property(nonatomic, assign) BOOL needSetPage;//是否需要分页，默认为否，以下三个属性不需要设置;如果为是，以下三项默认为0
@property(nonatomic, assign) NSInteger index;//页码
@property(nonatomic, assign) NSInteger size;//单页条数
@property(nonatomic, assign) NSInteger direction;//排序方式
@property(nonatomic, assign) NSInteger orderBy;/*排序字段编号"0=Id;*/

//请求方式、缓存相关（非必需，默认post、无缓存）
@property(nonatomic, assign) NSInteger requestType;/**< 请求方式 0:POST 1:GET */
@property(nonatomic, assign) BOOL isCache;/**< 是否缓存 */
@property(nonatomic, assign) NSInteger cacheType;/**< 缓存类型 0:plist */

@property(nonatomic, strong) NSMutableArray *noMD5Params;   //md5不需要加密的参数



@end
