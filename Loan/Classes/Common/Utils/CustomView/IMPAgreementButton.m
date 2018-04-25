//
//  IMPAgreementButton.m
//  Loan
//
//  Created by 王胜华 on 23/11/2017.
//  Copyright © 2017 imobpay. All rights reserved.
//

#import "IMPAgreementButton.h"
#import "Colours.h"

@implementation IMPAgreementButton

+ (instancetype)agreementButton
{
    IMPAgreementButton *agreementButton = [[IMPAgreementButton alloc] init];
    
    return agreementButton;
}
- (instancetype)init
{
    self = [super init];
    
    if (self) {
        NSString *agreementString = @"* 注册代表您已阅读并同意《口贷用户协议》";
        NSMutableAttributedString *agreementAttributeString = [[NSMutableAttributedString alloc] initWithString:agreementString];
        [agreementAttributeString addAttribute:NSForegroundColorAttributeName value:[UIColor colorFromHexString:COLOR_FONT_PLACEHOLDER] range:NSMakeRange(0, 13)];
        [agreementAttributeString addAttribute:NSForegroundColorAttributeName value:[UIColor colorFromHexString:COLOR_FONT_BLUE] range:NSMakeRange(13, 8)];
        [self setAttributedTitle:agreementAttributeString forState:UIControlStateNormal];
    }
    
    return self;
}
@end
