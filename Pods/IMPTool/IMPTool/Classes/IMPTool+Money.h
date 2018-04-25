//
//  IMPTool+Money.h
//  IMobPay
//
//  Created by user on 2017/8/8.
//  Copyright © 2017年 QTPay. All rights reserved.
//  支付相关钱的处理类（小数点精度校准）

#import "IMPTool.h"

@interface IMPTool (Money)

/**
 *  金额: 字符串转成整形
 */
+ (NSUInteger)convertMoney:(NSString *)moneyStr;

/**
 *  字符串处理千分位
 */
+ (NSString *)stringRangeFormater:(NSString *)str;

/**
 *  手续费到账金额计算
 *  @param input   输入金额
 *  @param feeRate 手续费费率
 *  @param feeMax  最高手续费哦
 *  @param feeMin  最低手续费
 *  @return @[到账金额，手续费]
 */
+ (NSArray *)outPutWithInput:(NSString *)input feeRate:(double)feeRate feeMax:(double)feeMax feeMin:(double)feeMin;
@end
