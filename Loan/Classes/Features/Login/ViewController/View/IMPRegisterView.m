//
//  IMPRegisterView.m
//  Loan
//
//  Created by 王胜华 on 20/10/2017.
//  Copyright © 2017 imobpay. All rights reserved.
//

#import "IMPRegisterView.h"
#import "IMPCountdownView.h"
#import "IMPSubmitButton.h"
#import "IMPAgreementButton.h"
#import "IMPImageButton.h"

@interface IMPRegisterView ()

#pragma mark - Views

// 登录背景图片
@property (nonatomic, strong) UIImageView *backgroundImageView;

// 手机区号
@property (nonatomic, strong) IMPBaseLabel *areaCodeLabel;

// 手机号输入框
@property (nonatomic, strong) IMPBaseTextField *mobileNoTextField;

// 验证码输入框
@property (nonatomic, strong) IMPBaseTextField *verificationCodeTextField;

// 获取验证码
@property (nonatomic, strong) IMPCountdownView *countdownView;

// 姓名
@property (nonatomic, strong) IMPBaseTextField *userNameTextField;

// 身份证
@property (nonatomic, strong) IMPBaseTextField *certificateIDTextField;

// 密码输入框
@property (nonatomic, strong) IMPBaseTextField *passwordTextField;

// 密码输入确认框
@property (nonatomic, strong) IMPBaseTextField *passwordConfirmTextField;

// 注册按钮
@property (nonatomic, strong) IMPSubmitButton *registerButton;

// 协议
@property (nonatomic, strong) IMPAgreementButton *agreementButton;

// 关闭按钮
@property (nonatomic, strong) IMPImageButton *closeButton;

@end

@implementation IMPRegisterView

@synthesize backgroundImageView, areaCodeLabel, mobileNoTextField, verificationCodeTextField, countdownView, userNameTextField, certificateIDTextField, passwordTextField, passwordConfirmTextField, registerButton, agreementButton, closeButton;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

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
    
    self.registerButton = [IMPSubmitButton buttonWithType:UIButtonTypeCustom title:@"注册" titleColor:[UIColor whiteColor] font:FONT_CUSTOM(13.0)];
    
    [self addSubview:registerButton];
    
    self.backgroundImageView = IMAGEVIEW_NAME(@"AccountRegisteImage");
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
    
    self.userNameTextField = [[IMPBaseTextField alloc] initWithPlaceholder:@"请输入姓名"];
    [self addSubview:userNameTextField];
    
    self.certificateIDTextField = [[IMPBaseTextField alloc] initWithPlaceholder:@"请输入身份证号码"];
    certificateIDTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    [self addSubview:certificateIDTextField];
    
    self.passwordTextField = [[IMPBaseTextField alloc] initWithPlaceholder:@"请输入新密码"];
    passwordTextField.secureTextEntry = YES;
    passwordTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    [self addSubview:passwordTextField];
    
    self.passwordConfirmTextField = [[IMPBaseTextField alloc] initWithPlaceholder:@"请再次输入密码"];
    passwordConfirmTextField.secureTextEntry = YES;
    passwordConfirmTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    [self addSubview:passwordConfirmTextField];
    
    self.countdownView = [IMPCountdownView countDownView];
    [self addSubview:countdownView];
    
    self.agreementButton = [[IMPAgreementButton alloc] init];
    [self addSubview:agreementButton];
    
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
    
    [countdownView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(verificationCodeTextField.mas_right).offset(8);
        make.centerY.equalTo(verificationCodeTextField.mas_centerY);
        make.width.equalTo(@(65));
    }];
    
    [userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.left.equalTo(mobileNoTextField);
        make.top.equalTo(verificationCodeTextField.mas_bottom).offset(18);
    }];
    
    [certificateIDTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.left.equalTo(mobileNoTextField);
        make.top.equalTo(userNameTextField.mas_bottom).offset(18);
    }];
    
    [passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.left.equalTo(mobileNoTextField);
        make.top.equalTo(certificateIDTextField.mas_bottom).offset(18);
    }];
    
    [passwordConfirmTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.left.equalTo(mobileNoTextField);
        make.top.equalTo(passwordTextField.mas_bottom).offset(18);
    }];
    
    [agreementButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(areaCodeLabel.mas_left);
        make.top.equalTo(passwordConfirmTextField.mas_bottom).offset(9);
        make.height.equalTo(@10);
    }];
    
    [registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@90);
        make.height.equalTo(@36);
        make.centerX.equalTo(backgroundImageView.mas_centerX);
        make.top.equalTo(backgroundImageView.mas_bottom).offset(-17);
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
    EVENT_BUTTON_ADD(registerButton, self, @selector(handleRegisterEvent));
    
    EVENT_BUTTON_ADD(agreementButton, self, @selector(handleAgreementEvent));
    
    EVENT_BUTTON_ADD(closeButton, self, @selector(handleCloseEvent));
}

#pragma mark - Events
/**
 * 处理注册事件
 */
- (void)handleRegisterEvent
{
    
}

/**
 * 处理协议事件
 */
- (void)handleAgreementEvent
{
    
}

/**
 * 关闭按钮
 */
- (void)handleCloseEvent
{
    EVENT_NOTIFICATION_POST_USERINFO(NOTIFICATION_REGISTER_DONE, nil, @{@"currentView" : self});
}
@end
