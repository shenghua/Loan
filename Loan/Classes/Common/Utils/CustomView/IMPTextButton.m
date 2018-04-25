//
//  IMPTextButton.m
//  Loan
//
//  Created by 王胜华 on 20/11/2017.
//  Copyright © 2017 imobpay. All rights reserved.
//

#import "IMPTextButton.h"

@implementation IMPTextButton

+ (instancetype)buttonWithType:(UIButtonType)buttonType title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font
{
    IMPTextButton *customButton = [[self alloc] initWithTitle:title titleColor:titleColor font:font];
    
    return customButton;
}

- (instancetype)initWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font
{
    self = [super init];
    
    if (self) {
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        self.titleLabel.font = font;
    }
    
    return self;
}

- (instancetype)init
{
    self = [self initWithTitle:@"" titleColor:[UIColor whiteColor] font:FONT_CUSTOM(10.0)];
    
    if (self) {
        
    }
    
    return self;
}

@end
