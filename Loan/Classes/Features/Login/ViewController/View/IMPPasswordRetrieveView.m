//
//  IMPPasswordRetrieveView.m
//  Loan
//
//  Created by 王胜华 on 20/11/2017.
//  Copyright © 2017 imobpay. All rights reserved.
//

#import "IMPPasswordRetrieveView.h"
#import "IMPBaseLabel.h"
#import "IMPBaseTextField.h"
#import "IMPTextButton.h"
#import "IMPCountdownView.h"
#import "IMPSubmitButton.h"
#import "IMPImageButton.h"

@interface IMPPasswordRetrieveView ()

#pragma mark - Views

// 登录背景图片
@property (nonatomic, strong) UIImageView *backgroundImageView;

// 手机区号
@property (nonatomic, strong) IMPBaseLabel *areaCodeLabel;

// 手机号输入框
@property (nonatomic, strong) IMPBaseTextField *mobileNoTextField;

// 密码输入框
@property (nonatomic, strong) IMPBaseTextField *passwordTextField;

// 验证码输入框
@property (nonatomic, strong) IMPBaseTextField *verificationCodeTextField;

// 获取验证码
@property (nonatomic, strong) IMPCountdownView *countdownView;

// 找回密码按钮
@property (nonatomic, strong) IMPTextButton *passwordRetrieveButton;

// 收不到验证码按钮
@property (nonatomic, strong) IMPTextButton *verificationCodeUnreceivableButton;

// 关闭按钮
@property (nonatomic, strong) IMPImageButton *closeButton;

@end

@implementation IMPPasswordRetrieveView

@synthesize backgroundImageView, areaCodeLabel, mobileNoTextField, passwordTextField, verificationCodeTextField, countdownView, passwordRetrieveButton, verificationCodeUnreceivableButton, closeButton;

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        [self initSubViews];
        
        [self initEvents];
    }
    
    return self;
}

/**
 * UI初始化
 */
- (void)initSubViews
{
    [super initSubviews];
    
    self.passwordRetrieveButton = [IMPSubmitButton buttonWithType:UIButtonTypeCustom title:@"找回密码" titleColor:[UIColor whiteColor] font:FONT_CUSTOM(13.0)];
    [self addSubview:passwordRetrieveButton];
    
    self.backgroundImageView = IMAGEVIEW_NAME(@"PasswordRetrieveBackgroundImage");
    backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:backgroundImageView];
    
    self.areaCodeLabel = [[IMPBaseLabel alloc] init];
    areaCodeLabel.text = @"+86";
    areaCodeLabel.textColor = [UIColor colorFromHexString:COLOR_FONT_PLACEHOLDER];
    areaCodeLabel.font = FONT_CUSTOM(13.0);
    [self addSubview:areaCodeLabel];
    
    self.mobileNoTextField = [[IMPBaseTextField alloc] initWithPlaceholder:@"请输入手机号"];
    mobileNoTextField.keyboardType = UIKeyboardTypePhonePad;
    [self addSubview:mobileNoTextField];
    
    self.verificationCodeTextField = [[IMPBaseTextField alloc] initWithPlaceholder:@"请输入收到的验证码"];
    verificationCodeTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self addSubview:verificationCodeTextField];
    
    self.passwordTextField = [[IMPBaseTextField alloc] initWithPlaceholder:@"请输入新密码"];
    passwordTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    [self addSubview:passwordTextField];
    
    self.countdownView = [IMPCountdownView countDownView];
    [self addSubview:countdownView];
    
    self.verificationCodeUnreceivableButton = [IMPTextButton buttonWithType:UIButtonTypeCustom title:@"收不到验证码？" titleColor:[UIColor colorFromHexString:COLOR_FONT_BLUE] font:FONT_CUSTOM(10.0)];
    [self addSubview:verificationCodeUnreceivableButton];
    
    self.closeButton = [IMPImageButton buttonWithImageName:@"CloseImage1"];
    [self addSubview:closeButton];
}

/**
 * 显示Subviews，布局、添加依赖
 */
- (void)layoutSubviews
{
    [backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    [areaCodeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@40);
        make.height.equalTo(@26);
        make.left.equalTo(backgroundImageView.mas_left).offset(30);
        make.top.equalTo(backgroundImageView.mas_top).offset(22);
    }];
    
    [mobileNoTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@180);
        make.height.equalTo(@26);
        make.left.equalTo(areaCodeLabel.mas_right).offset(15);
        make.top.equalTo(areaCodeLabel.mas_top);
    }];
    
    [verificationCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.left.equalTo(mobileNoTextField);
        make.width.equalTo(@140);
        make.top.equalTo(mobileNoTextField.mas_bottom).offset(18);
    }];
    
    [passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.left.equalTo(mobileNoTextField);
        make.top.equalTo(verificationCodeTextField.mas_bottom).offset(18);
    }];
    
    [countdownView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(verificationCodeTextField.mas_right).offset(8);
        make.centerY.equalTo(verificationCodeTextField.mas_centerY);
        make.width.equalTo(@(65));
    }];
    
    [passwordRetrieveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@90);
        make.height.equalTo(@36);
        make.centerX.equalTo(backgroundImageView.mas_centerX);
        make.top.equalTo(backgroundImageView.mas_bottom).offset(-17);
    }];
    
    [verificationCodeUnreceivableButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(backgroundImageView.mas_bottom).offset(-20);
        make.left.equalTo(areaCodeLabel.mas_left);
    }];
    
    [closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backgroundImageView).offset(10);
        make.right.equalTo(backgroundImageView).offset(-20);
    }];
}

/**
 * 添加按钮事件
 */
- (void)initEvents
{
    EVENT_BUTTON_ADD(passwordRetrieveButton, self, @selector(handleRetrieveEvent));
    
    EVENT_BUTTON_ADD(verificationCodeUnreceivableButton, self, @selector(handleVerificationCodeUnreceivableEvent));
    
    EVENT_BUTTON_ADD(closeButton, self, @selector(handleCloseEvent));
}

#pragma mark - Events
/**
 * 处理验证码收不到事件
 */
- (void)handleVerificationCodeUnreceivableEvent
{
    
}

/**
 * 处理找回密码事件
 */
- (void)handleRetrieveEvent
{
    
}

/**
 * 关闭按钮
 */
- (void)handleCloseEvent
{
    EVENT_NOTIFICATION_POST_USERINFO(NOTIFICATION_RETRIEVE_DONE, nil, @{@"currentView" : self});
}

@end
