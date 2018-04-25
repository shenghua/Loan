//
//  IMPTool+Json.h
//  IMobPay
//
//  Created by user on 2017/8/8.
//  Copyright © 2017年 QTPay. All rights reserved.
//  Json处理工具类

#import "IMPTool.h"

@interface IMPTool (Json)

/**
 *  json转字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
@end
