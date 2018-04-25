//
//  IMPBaseLabel.m
//  Loan
//
//  Created by 王胜华 on 20/10/2017.
//  Copyright © 2017 imobpay. All rights reserved.
//

#import "IMPBaseLabel.h"
#import "Colours.h"

@implementation IMPBaseLabel

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.textColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor colorFromHexString:COLOR_FONT_BACKGROUND];
        self.font = [UIFont systemFontOfSize:10.0];
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
