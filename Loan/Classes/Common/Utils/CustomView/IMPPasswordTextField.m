//
//  IMPPasswordTextField.m
//  Loan
//
//  Created by 王胜华 on 16/11/2017.
//  Copyright © 2017 imobpay. All rights reserved.
//

#import "IMPPasswordTextField.h"
#import "Colours.h"

@interface IMPPasswordTextField ()

@end

@implementation IMPPasswordTextField

- (instancetype)initWithPlaceholder:(NSString *)placeholder;
{
    self = [super initWithPlaceholder:placeholder];
    
    if (self) {
        self.secureTextEntry = YES;
        
        [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    
    return self;
}

- (void)setSecureTextEntry:(BOOL)secureTextEntry
{
    [super setSecureTextEntry:secureTextEntry];
    
    // Set to custom font if secureTextEntry is false, else set it to system font.
    self.font = secureTextEntry ? FONT_SYSTEM(self.font.pointSize) : FONT_CUSTOM(self.font.pointSize);
    
//    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSFontAttributeName : FONT_CUSTOM(13.0)}];
}

#pragma mark - Events
- (void)textFieldDidChange:(id)sender
{
    UITextField *textField = (UITextField *)sender;
        
    // Set to custom font if the textfield is cleared or isSecureTextEntry is false, else set it to system font
    if (textField.text.length == 0 || !textField.isSecureTextEntry) {
        textField.font = FONT_CUSTOM(textField.font.pointSize);
    } else {
        textField.font = FONT_SYSTEM(textField.font.pointSize);
    }
}

@end
