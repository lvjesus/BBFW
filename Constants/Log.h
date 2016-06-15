//
//  Log.h
//  FrameworkDemo
//
//  Created by Bright on 16/3/17.
//  Copyright © 2016年 yunlong. All rights reserved.
//

#ifndef Log_h
#define Log_h

/** 日志开关 */

#ifdef DEBUG
#define YLLog(...) NSLog(__VA_ARGS__)
#else
#define YLLog(...)
#endif

#ifdef DEBUG
# define BBLog(format, ... ) NSLog((@"--------------------\n\n文件名及路径:%s" "\n函数名:%s" "\n行号:%d\n" format),__FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define BBLog(...);
#endif

#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__);
#else
#define NSLog(...) {}
#endif

#endif /* Log_h */
