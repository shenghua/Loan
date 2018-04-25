//
//  IMPTool+Money.m
//  IMobPay
//
//  Created by user on 2017/8/8.
//  Copyright © 2017年 QTPay. All rights reserved.
//  支付相关钱的处理类（小数点精度校准）

#import "IMPTool+Money.h"
#import "IMPTool+String.h"

@implementation IMPTool (Money)

/**
 *  金额: 字符串转成整形
 */
+ (NSUInteger)convertMoney:(NSString *)moneyStr
{
    return (int) ([[moneyStr stringByReplacingOccurrencesOfString:@"￥" withString:@""] doubleValue] * 100 + 0.000001);
}

/**
 *  字符串处理千分位
 */
+ (NSString *)stringRangeFormater:(NSString *)str
{
    NSString *newString = nil;
    if (str !=nil) {
        str = [NSString stringWithFormat:@"%.2f", str.doubleValue];
        NSRange range = [str rangeOfString:@"."];//匹配得到的下标
        NSRange  rangeLocation = NSMakeRange(range.location, str.length - range.location);
        NSString *st = [str substringWithRange:rangeLocation];//截取范围类的字符串
        NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setFormatterBehavior: NSNumberFormatterBehavior10_4];
        [numberFormatter setNumberStyle: NSNumberFormatterDecimalStyle];
        NSString *numberString = [numberFormatter stringFromNumber: [NSNumber numberWithInteger: [str intValue]]];
        newString = [NSString stringWithFormat:@"%@%@",numberString,st];
    }
    
    return newString;
}

/**
 *  手续费到账金额计算
 *  @param input   输入金额
 *  @param feeRate 手续费费率
 *  @param feeMax  最高手续费哦
 *  @param feeMin  最低手续费
 *  @return @[到账金额，手续费]
 */
+ (NSArray *)outPutWithInput:(NSString *)input feeRate:(double)feeRate feeMax:(double)feeMax feeMin:(double)feeMin {
    if(!input || feeMax == 0 || feeMin == 0 || feeRate == 0){
        return nil;
    }
    double inputNum = [self stringToDouble:input];
    double feeNum =(floor((inputNum * feeRate + 0.005)*100))/100;
    if(feeNum<feeMin){
        feeNum = feeMin;
    }else if (feeNum>feeMax){
        feeNum = feeMax;
    }
    
    double outPutNum = inputNum - feeNum + 0.001;
    //限制到账金额不为负数，小于0则置为0
    if (outPutNum<0){
        outPutNum = 0;
    }
    NSString *fee = [NSString stringWithFormat:@"%.2f",feeNum];
    NSString *outPut = [NSString stringWithFormat:@"%.2f",outPutNum];
    
    return @[outPut,fee];
}

@end
