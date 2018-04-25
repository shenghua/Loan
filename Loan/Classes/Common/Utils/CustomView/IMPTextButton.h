//
//  IMPTextButton.h
//  Loan
//
//  Created by 王胜华 on 20/11/2017.
//  Copyright © 2017 imobpay. All rights reserved.
//  文本按钮

#import "IMPBaseButton.h"

@interface IMPTextButton : IMPBaseButton

/**
 * 生成文本按钮
 *
 * @param buttonType 按钮类型
 * @param title 按钮文本
 * @param titleColor 文本颜色
 * @param font 文本字体
 * @return 按钮对象
 */
+ (instancetype)buttonWithType:(UIButtonType)buttonType title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font;

/**
 * 按钮初始化
 *
 * @param title 按钮文本
 * @param titleColor 文本颜色
 * @param font 文本字体
 * @return 按钮对象
 */
- (instancetype)initWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font;

/**
 * 按钮初始化
 */
- (instancetype)init;
@end
