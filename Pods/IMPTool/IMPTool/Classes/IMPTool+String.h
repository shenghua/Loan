//
//  IMPTool+String.h
//  IMobPay
//
//  Created by user on 2017/8/8.
//  Copyright © 2017年 QTPay. All rights reserved.
//  字符串处理工具类

#import "IMPTool.h"

@interface IMPTool (String)

/**
 *  获取格式化手机号,把手机号的第4个到第7个字符转成星号 例如:135****1688
 */
+ (NSString *)fetchFormattedMobileNo:(NSString *)mobileNo;

/**
 *  获取格式化姓名,把姓名的第一个字符转成星号 例如:张*明
 */
+ (NSString *)fetchFormattedUserName:(NSString *)userName;

/**
 *  获取格式化银行卡号,把卡号的前6后4位外的其他字符转成星号 例如:622603******22078
 */
+ (NSString *)fetchFormattedCardNo:(NSString *)cardNo;

/**
 *  格式化身份证号  例如:341281******22078 前6后4
 *
 *  @param idString 输入字符
 */
+ (NSString *)fetchFormattedIDNo:(NSString *)idString;
/**
 *  姓名加密 例如:张**
 */
+ (NSString *)nameStringPassword:(NSString *)nameString;

/**
 *  返回身份证后六位；并在六位前补12个零；字母往前推一位
 */
+ (NSString *)returnCertificationLastSixNumber:(NSString *)certiStr;

/**
 * 格式化字符串   身份证:6+4+4+4  银行卡号:4+4+4+4   手机号:3+4+4
 */
//+ (NSMutableString *)formatString:(NSMutableString *)string separateType:(int)separateType;

/**
 *  截取电话号码
 */
+ (NSString *)stringByReplaceMobilePhone:(NSString *)mobileNo;

/**
 *  字符串转double类型
 */
+ (double)stringToDouble:(NSString *)str;

/**
 *  获取银行图标名称
 */
+ (NSString *)fetchBankIconName:(NSString *)bankId;

/**
 *  获取银行名称简称
 */
+ (NSString *)fetchBankAbbreviationName:(NSString *)bankId;

/**
 *  用户等级
 */
+ (NSString *)fetchUserVipLevel:(int)vipLevel;

/**
 *  格式话小数 四舍五入类型
 */
+ (NSString *)decimalwithFormat:(NSString *)format  floatV:(float)floatV;

/**
 *  获取字符串长度
 */
//+ (CGFloat)getWidthBoundingRectWithSize:(NSString *)str height:(CGFloat)height fontSize:(CGFloat)fontSize;

@end
