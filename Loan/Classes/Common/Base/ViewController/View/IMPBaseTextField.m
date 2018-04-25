//
//  IMPBaseTextField.m
//  Loan
//
//  Created by 王胜华 on 20/10/2017.
//  Copyright © 2017 imobpay. All rights reserved.
//

#import "IMPBaseTextField.h"
#import "Colours.h"

@implementation IMPBaseTextField

- (instancetype)initWithPlaceholder:(NSString *)placeholder
{
    self = [super init];
    
    if (self) {
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.font = FONT_CUSTOM(13.0);
        self.textColor = [UIColor colorFromHexString:COLOR_FONT_BLACK];
        self.backgroundColor = [UIColor colorFromHexString:COLOR_FONT_BACKGROUND];
        self.placeholder = placeholder;
        self.returnKeyType = UIReturnKeyNext;
        
        // 设置Placeholder颜色和字体
        if ([self respondsToSelector:@selector(setAttributedPlaceholder:)]) {
            self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName : [UIColor colorFromHexString:COLOR_FONT_PLACEHOLDER], NSFontAttributeName : FONT_CUSTOM(13.0)}];
        }
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
