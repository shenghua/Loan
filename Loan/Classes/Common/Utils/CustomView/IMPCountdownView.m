//
//  IMPCountdownView.m
//  Loan
//
//  Created by 王胜华 on 20/11/2017.
//  Copyright © 2017 imobpay. All rights reserved.
//

#import "IMPCountdownView.h"
#import "IMPTextButton.h"
#import "IMPTimer.h"

@interface IMPCountdownView ()

// 倒计时按钮
@property (nonatomic, strong) IMPTextButton *countDownButton;

// 倒计时Timer
@property (nonatomic, strong) IMPTimer *countDownTimer;

// 倒计时cout
@property (nonatomic, assign) int countDown;

@end

@implementation IMPCountdownView

@synthesize countDownButton, countDownTimer, countDown;

+ (instancetype)countDownView
{
    IMPCountdownView *cutdownView = [[IMPCountdownView alloc] init];

    return cutdownView;
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        self.countDownButton = [IMPTextButton buttonWithType:UIButtonTypeCustom title:@"获取验证码" titleColor:[UIColor colorFromHexString:COLOR_FONT_BLUE] font:FONT_CUSTOM(11.0)];
        [countDownButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
        [self addSubview:countDownButton];
        
        self.countDown = COUNT_DOWN_SECONDS;
        
        [self addEvents];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [countDownButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.left.top.equalTo(self);
    }];
}

- (void)addEvents
{
    EVENT_BUTTON_ADD(countDownButton, self, @selector(handleFetchVerificationCode));
}

/**
 * 获取验证码
 */
- (void)handleFetchVerificationCode
{
    self.countDownTimer = [IMPTimer timerWithTimeInterval:1 repeats:YES block:^(IMPTimer *timer) {
        if (countDown > 1) {
            [countDownButton setTitle:[NSString stringWithFormat:@"(%d)", --countDown] forState:UIControlStateNormal];
        } else {
            countDownButton.enabled = YES;
            [countDownButton setTitle:@"重新获取" forState:UIControlStateNormal];
            [timer invalidate];
            countDown = COUNT_DOWN_SECONDS;
            countDownTimer = nil;
        }
    }];
    
    countDownButton.enabled = NO;
    [countDownButton setTitle:[NSString stringWithFormat:@"(%d)", countDown] forState:UIControlStateNormal];
}

@end
