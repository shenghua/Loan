//
//  IMPPasswordTextField.h
//  Loan
//
//  Created by 王胜华 on 16/11/2017.
//  Copyright © 2017 imobpay. All rights reserved.
//
//  Set to custom font if secureTextEntry is false, else set it to system font.


#import "IMPBaseTextField.h"

@interface IMPPasswordTextField : IMPBaseTextField

- (instancetype)initWithPlaceholder:(NSString *)placeholder;

@end
