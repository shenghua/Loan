//
//  IMPSubmitButton.m
//  Loan
//
//  Created by 王胜华 on 20/11/2017.
//  Copyright © 2017 imobpay. All rights reserved.
//

#import "IMPSubmitButton.h"
#import "Colours.h"

@implementation IMPSubmitButton

+ (instancetype)buttonWithType:(UIButtonType)buttonType title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font
{
    IMPSubmitButton *submitButton = [super buttonWithType:buttonType title:title titleColor:titleColor font:font];
    
    return submitButton;
}

- (instancetype)initWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font
{
    self = [super initWithTitle:title titleColor:titleColor font:font];
    
    if (self) {
        [self initButton];
    }
    
    return self;
}

/**
 * 设置按钮圆角、阴影等
 */
//TODO: 直接设置layer会造成离屏渲染，可以换种方式
- (void)initButton
{
    self.titleEdgeInsets = UIEdgeInsetsMake(4, 0, 0, 0);
    self.backgroundColor = [UIColor colorFromHexString:COLOR_LOGIN_BUTTON];
    
    // 圆角
    self.layer.cornerRadius = 6;
    // to make shadow effect
    self.layer.masksToBounds = NO;
    
    // 阴影
    self.layer.shadowOffset = CGSizeMake(0, 1.5);
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowRadius = 1;
    
    // 边框
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = [UIColor colorFromHexString:COLOR_LOGIN_BORDER].CGColor;
}

@end
