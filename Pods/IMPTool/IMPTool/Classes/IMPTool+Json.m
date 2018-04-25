//
//  IMPTool+Json.m
//  IMobPay
//
//  Created by user on 2017/8/8.
//  Copyright © 2017年 QTPay. All rights reserved.
//  Json处理工具类

#import "IMPTool+Json.h"

@implementation IMPTool (Json)

/**
 *  json转字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
//        DLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

@end
