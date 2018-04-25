//
//  UIFont+FontNameCustom.m
//  Loan
//
//  Created by 王胜华 on 20/10/2017.
//  Copyright © 2017 imobpay. All rights reserved.
//

#import "UIFont+FontNameCustom.h"
#import <objc/runtime.h>

@implementation UIFont (FontNameCustom)

+ (void)load
{
    [super load];
    
//    static dispatch_once_t onceToken;
    
//    dispatch_once(&onceToken, ^{
//        Method oldMethod = class_getClassMethod([self class], @selector(systemFontOfSize:));
//        Method newMethod = class_getClassMethod([self class], @selector(customFontOfSize:));
//
//        method_exchangeImplementations(oldMethod, newMethod);
//    });
}

/**
 * 字体类型：FONT_DEFAULT_NAME，调用fontWithName方法生成UIFont
 *
 * @param fontSize 字体大小
 */
+ (UIFont *)customFontOfSize:(CGFloat)fontSize
{
    UIFont *customFont = [UIFont fontWithName:FONT_DEFAULT_NAME size:fontSize];
    
//    if (!customFont)
//        customFont = [UIFont systemFontOfSize:fontSize];
    
    return customFont;
}

@end
