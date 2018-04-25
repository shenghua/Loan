//
//  IMPTool+String.m
//  IMobPay
//
//  Created by user on 2017/8/8.
//  Copyright © 2017年 QTPay. All rights reserved.
//  字符串处理工具类

#import "IMPTool+String.h"

@implementation IMPTool (String)

/**
 *  获取格式化手机号,把手机号的第4个到第7个字符转成星号 例如:135****1688
 */
+ (NSString *)fetchFormattedMobileNo:(NSString *)mobileNo
{
    if (mobileNo == nil || [@"" isEqualToString:mobileNo]) {
        return @"";
    }
    NSMutableString *fetchFormattedMobileNo = [[NSMutableString alloc] initWithString:mobileNo];
    if (fetchFormattedMobileNo.length>7) {
        [fetchFormattedMobileNo replaceCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
        return fetchFormattedMobileNo;
    }else{
        return fetchFormattedMobileNo;
    }
}

/**
 *  获取格式化姓名,把姓名的第一个字符转成星号 例如:张*明
 */
+ (NSString *)fetchFormattedUserName:(NSString *)userName
{
    if (userName == nil || [@"" isEqualToString:userName]) {
        return @"";
    }
    NSMutableString *formattedUserName = [[NSMutableString alloc] initWithString:userName];
    if (formattedUserName.length>0) {
        [formattedUserName replaceCharactersInRange:NSMakeRange(0, 1) withString:@"*"];
        return formattedUserName;
    }else{
        return userName;
    }
}

/**
 *  获取格式化银行卡号,把卡号的前6后4位外的其他字符转成星号 例如:622603******22078
 */
+ (NSString *)fetchFormattedCardNo:(NSString *)cardNo
{
    if (cardNo == nil || [@"" isEqualToString:cardNo]) {
        return @"";
    }
    NSMutableString *fetchFormattedCardNo = [[NSMutableString alloc] initWithString:cardNo];
    if (fetchFormattedCardNo.length>10) {
        unsigned long formattedLength=fetchFormattedCardNo.length-10;
        for (int i=6; i<6+formattedLength; i++) {
            [fetchFormattedCardNo replaceCharactersInRange:NSMakeRange(i, 1) withString:@"*"];
        }
        
        return fetchFormattedCardNo;
    }else{
        return cardNo;
    }
}

/**
 *  格式化身份证号  例如:341281******22078 前6后4
 *
 *  @param idString 输入字符
 */
+ (NSString *)fetchFormattedIDNo:(NSString *)idString
{
    if (idString == nil || [@"" isEqualToString:idString]) {
        return @"";
    }
    idString = [idString stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSMutableString *fetchFormatCardNo = [[NSMutableString alloc] initWithString:idString];
    
    if (fetchFormatCardNo.length>10) {
        NSInteger formattLength = fetchFormatCardNo.length-10;
        for (int i=6; i<6+formattLength; i++) {
            [fetchFormatCardNo replaceCharactersInRange:NSMakeRange(i, 1) withString:@"*"];
        }
        
        return fetchFormatCardNo;
    }else{
        return idString;
    }
    
}

/**
 *  姓名加密 例如:张**
 */
+ (NSString *)nameStringPassword:(NSString *)nameString
{
    NSMutableString *fetchFormattedProductTypeStr = [[NSMutableString alloc] initWithString:nameString];
    NSString *newNameString = nil;
    if (nameString !=nil || fetchFormattedProductTypeStr.length>1) {
        
        newNameString = [fetchFormattedProductTypeStr stringByReplacingCharactersInRange:NSMakeRange(1, fetchFormattedProductTypeStr.length-1) withString:@"**"];
        
    }else{
        return nameString;
        
    }
    return newNameString;
}

/**
 *  返回身份证后六位；并在六位前补12个零；字母往前推一位
 */
+ (NSString *)returnCertificationLastSixNumber:(NSString *)certiStr
{
    NSString *str = @"";
    if (certiStr.length>=7) {
        if ([[certiStr substringFromIndex:certiStr.length-1] isEqualToString:@"X"]) {
            str = [certiStr substringWithRange:NSMakeRange(certiStr.length-7, 6)];
        }else {
            str = [certiStr substringFromIndex:certiStr.length-6];
        }
    }
    return [NSString stringWithFormat:@"000000000000%@",str];
}

///**
// * 格式化字符串   身份证:6+4+4+4  银行卡号:4+4+4+4   手机号:3+4+4
// */
//+ (NSMutableString *)formatString:(NSMutableString *)string separateType:(int)separateType
//{
//    string = [[string stringByReplacingOccurrencesOfString:@" " withString:@""] mutableCopy];
//
//    int separateNum = 4;
//
//    switch (separateType) {
//            // 格式化: 1 -> 4+4+4+4 银行卡号
//        case kIMPKeyboardSeparateTypeBankCardNo:
//            [self formatStringWithString:string separateIndex:separateNum];
//            break;
//
//            // 格式化: 2 -> 6+4+4+4 身份证号
//        case kIMPKeyboardSeparateTypeCertificateNo:
//            if (string.length > 6) {
//                NSString *string1 = [string substringToIndex:6];
//                NSString *string2 = [string substringFromIndex:6];
//
//                string = [NSMutableString stringWithFormat:@"%@ %@", string1, [self formatStringWithString:[string2 mutableCopy] separateIndex:4]];
//            }
//            break;
//
//            // 格式化: 3 -> 3+4+4 手机号码
//        case kIMPKeyboardSeparateTypeMobileNo:
//            if (string.length > 3) {
//                NSString *string1 = [string substringToIndex:3];
//                NSString *string2 = [string substringFromIndex:3];
//
//                string = [NSMutableString stringWithFormat:@"%@ %@", string1, [self formatStringWithString:[string2 mutableCopy] separateIndex:4]];
//            }
//            break;
//
//        default:
//            break;
//    }
//
//    return string;
//}
/**
 * 格式化字符串-空格分割
 */
+ (NSMutableString *)formatStringWithString:(NSMutableString *)string separateIndex:(int)separateIndex
{
    unsigned long count = string.length / separateIndex;
    
    for (int i = 0; i < count; i++) {
        int insertIndex = (i + 1) * separateIndex + i;
        if (insertIndex != string.length )
            [string insertString:@" " atIndex:insertIndex];
    }
    
    return string;
}

/**
 *  截取电话号码
 */
+ (NSString *)stringByReplaceMobilePhone:(NSString *)mobileNo
{
    mobileNo = [[[[[[[[[[[mobileNo stringByReplacingOccurrencesOfString:@"(" withString:@""]
                         stringByReplacingOccurrencesOfString:@")" withString:@""]
                        stringByReplacingOccurrencesOfString:@" " withString:@""]
                       stringByReplacingOccurrencesOfString:@"-" withString:@""] stringByReplacingOccurrencesOfString:@"+86" withString:@""] stringByReplacingOccurrencesOfString:@"17951" withString:@""] stringByReplacingOccurrencesOfString:@" " withString:@""]stringByReplacingOccurrencesOfString:@"+" withString:@""] stringByReplacingOccurrencesOfString:@"*86" withString:@""]
                 stringByReplacingOccurrencesOfString:@"*" withString:@""]
                stringByReplacingOccurrencesOfString:@"#" withString:@""];
    
    return mobileNo;
}

/**
 *  字符串转double类型
 */
+ (double)stringToDouble:(NSString *)str
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init] ;
    [formatter setNumberStyle: NSNumberFormatterDecimalStyle];
    double value = [[formatter numberFromString: str] doubleValue];
    return value;
}

/**
 *  获取银行图标名称
 */
+ (NSString *)fetchBankIconName:(NSString *)bankId
{
    if ([@"" isEqualToString:bankId] || nil==bankId) {
        return @"common_bank_default";
    }
    
    int bankIdValue=[bankId intValue];
    if ( (bankIdValue<=105 && bankIdValue>=102) || (bankIdValue<=310 && bankIdValue>=301) || bankIdValue==403 ) {
        return [NSString stringWithFormat:@"common_bank_%d",bankIdValue];
    }else{
        return @"common_bank_default";
    }
}

/**
 *  获取银行名称简称
 */
+ (NSString *)fetchBankAbbreviationName:(NSString *)bankId
{
    if ([@"" isEqualToString:bankId] || nil==bankId) {
        return @"";
    }
    
    int bankIdValue=[bankId intValue];
    NSString *shortname = @"";
    switch (bankIdValue) {
        case 102:
            shortname = @"工商银行";
            break;
        case 103:
            shortname = @"农业银行";
            break;
        case 104:
            shortname = @"中国银行";
            break;
        case 105:
            shortname = @"建设银行";
            break;
        case 301:
            shortname = @"交通银行";
            break;
        case 302:
            shortname = @"中信银行";
            break;
        case 303:
            shortname = @"光大银行";
            break;
        case 304:
            shortname = @"华夏银行";
            break;
        case 305:
            shortname = @"民生银行";
            break;
        case 306:
            shortname = @"广发银行";
            break;
        case 307:
            shortname = @"平安银行";
            break;
        case 308:
            shortname = @"招商银行";
            break;
        case 309:
            shortname = @"兴业银行";
            break;
        case 310:
            shortname = @"浦发银行";
            break;
        case 313:
            shortname = @"城市商业银行";
            break;
        case 322:
            shortname = @"农村商业银行";
            break;
        case 402:
            shortname = @"信用社";
            break;
        case 403:
            shortname = @"邮政储蓄";
            break;
        case 501:
            shortname = @"汇丰银行";
            break;
        case 502:
            shortname = @"东亚银行";
            break;
        case 531:
            shortname = @"花旗银行";
            break;
        case 671:
            shortname = @"渣打银行";
            break;
    }
    return shortname;
}

/**
 *  用户等级
 */
+ (NSString *)fetchUserVipLevel:(int)vipLevel
{
    NSString *levelName;
    switch (vipLevel) {
        case 1:
            levelName = @"普通用户";
            break;
            
        case 2:
            levelName = @"一星级用户";
            break;
            
        case 3:
            levelName = @"二星级用户";
            break;
            
        case 4:
            levelName = @"三星级用户";
            break;
            
        case 5:
            levelName = @"四星级用户";
            break;
            
        case 6:
            levelName = @"五星级用户";
            break;
        case 8:
            levelName = @"商户";
            break;
        default:
            levelName = @"普通用户";
            break;
    }
    
    return levelName;
}

/**
 *  格式话小数 四舍五入类型
 */
+ (NSString *)decimalwithFormat:(NSString *)format  floatV:(float)floatV
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    
    [numberFormatter setPositiveFormat:format];
    
    return  [numberFormatter stringFromNumber:[NSNumber numberWithFloat:floatV]];
}

///**
// *  获取字符串长度
// */
//+ (CGFloat)getWidthBoundingRectWithSize:(NSString *)str height:(CGFloat)height fontSize:(CGFloat)fontSize
//{
//    return [str boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:DEFAULT_FONT(FONT_SIZE_SIYAOSU)} context:nil].size.width;
//}
@end
