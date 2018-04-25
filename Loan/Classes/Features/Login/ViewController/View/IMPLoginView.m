//
//  IMPLoginView.m
//  Loan
//
//  Created by 王胜华 on 17/10/2017.
//  Copyright © 2017 imobpay. All rights reserved.
//

#import "IMPLoginView.h"
#import "IMPTextButton.h"
#import "IMPCountdownView.h"
#import "IMPSubmitButton.h"
#import "IMPImageButton.h"

@interface IMPLoginView()

#pragma mark - Views

// 登录背景图片
@property (nonatomic, strong) UIImageView *backgroundImageView;

// 分隔竖线
@property (nonatomic, strong) UIImageView *separateImageView;

// 密码可视按钮
@property (nonatomic, strong) IMPImageButton *passwordVisibleButton;

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

// 密码是否明文显示
@property (nonatomic, assign) BOOL passwordVisibleable;

// 登录按钮
@property (nonatomic, strong) IMPSubmitButton *loginButton;

// 忘记密码按钮
@property (nonatomic, strong) IMPTextButton *forgotPasswordButton;

// 验证码登录
@property (nonatomic, strong) IMPTextButton *codeLoginButton;

// 账号密码登录
@property (nonatomic, strong) IMPTextButton *passwordLoginButton;

// 注册账号
@property (nonatomic, strong) IMPTextButton *registerButton;

#pragma mark - RAC

// 密码是否可视按钮绑定事件
@property (nonatomic, strong) RACCommand *passwordVisibleButtonCommand;

// 手机号输入框校验
@property (nonatomic, strong) RACCommand *mobileCommand;

// 密码输入框校验
@property (nonatomic, strong) RACSignal *passwordSignal;

// 验证码输入框校验
@property (nonatomic, strong) RACSignal *verificationSignal;

// 获取验证码按钮绑定事件
@property (nonatomic, strong) RACCommand *verificationButtonCommand;

@end

@implementation IMPLoginView

@synthesize backgroundImageView, separateImageView, passwordVisibleButton, areaCodeLabel, mobileNoTextField, passwordTextField, verificationCodeTextField, countdownView, passwordVisibleable, loginButton, forgotPasswordButton, codeLoginButton, registerButton, passwordLoginButton;

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.passwordVisibleable = NO;
        
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
    
    self.loginButton = [IMPSubmitButton buttonWithType:UIButtonTypeCustom title:@"登录" titleColor:[UIColor whiteColor] font:FONT_CUSTOM(13.0)];
//    loginButton.enabled = NO;
    [self addSubview:loginButton];
    
    self.backgroundImageView = IMAGEVIEW_NAME(@"LoginBackgroundImage");
    backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:backgroundImageView];
    
    self.separateImageView = IMAGEVIEW_NAME(@"LoginSeparateImage");
    separateImageView.contentMode = UIViewContentModeScaleAspectFill;
    separateImageView.hidden = YES;
    [self addSubview:separateImageView];
    
    self.passwordVisibleButton = [IMPImageButton buttonWithType:UIButtonTypeCustom];
    [self layoutVisibleButtonImage];
    [self addSubview:passwordVisibleButton];
    
    self.areaCodeLabel = [[IMPBaseLabel alloc] init];
    areaCodeLabel.text = @"+86";
    areaCodeLabel.textColor = [UIColor colorFromHexString:COLOR_FONT_PLACEHOLDER];
    areaCodeLabel.font = FONT_CUSTOM(13.0);
    [self addSubview:areaCodeLabel];
    
    self.mobileNoTextField = [[IMPBaseTextField alloc] initWithPlaceholder:@"请输入手机号"];
    mobileNoTextField.keyboardType = UIKeyboardTypePhonePad;
    [self addSubview:mobileNoTextField];
    
    self.passwordTextField = [[IMPBaseTextField alloc] initWithPlaceholder:@"请输入密码"];
    passwordTextField.secureTextEntry = YES;
    passwordTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    [self addSubview:passwordTextField];
    
    self.verificationCodeTextField = [[IMPBaseTextField alloc] initWithPlaceholder:@"请输入收到的验证码"];
    verificationCodeTextField.hidden = YES;
    verificationCodeTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self addSubview:verificationCodeTextField];
    
    self.countdownView = [IMPCountdownView countDownView];
    countdownView.hidden = YES;
    [self addSubview:countdownView];
    
    self.forgotPasswordButton = [IMPTextButton buttonWithType:UIButtonTypeCustom title:@"忘记密码？" titleColor:[UIColor whiteColor] font:FONT_CUSTOM(10.0)];
    [self addSubview:forgotPasswordButton];
    
    self.codeLoginButton = [IMPTextButton buttonWithType:UIButtonTypeCustom title:@"验证码登录" titleColor:[UIColor whiteColor] font:FONT_CUSTOM(10.0)];
    [self addSubview:codeLoginButton];
    
    self.registerButton = [IMPTextButton buttonWithType:UIButtonTypeCustom title:@"—— 注册口贷账号 ——" titleColor:[UIColor whiteColor] font:FONT_CUSTOM(12.0)];
    [self addSubview:registerButton];
    
    self.passwordLoginButton = [IMPTextButton buttonWithType:UIButtonTypeCustom title:@"账号密码登录" titleColor:[UIColor whiteColor] font:FONT_CUSTOM(10.0)];
    passwordLoginButton.hidden = YES;
    [self addSubview:passwordLoginButton];
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
        make.left.equalTo(backgroundImageView.mas_left).offset(26);
        make.top.equalTo(backgroundImageView.mas_top).offset(22);
    }];
    
    [mobileNoTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@180);
        make.height.equalTo(@26);
        make.left.equalTo(areaCodeLabel.mas_right).offset(15);
        make.top.equalTo(areaCodeLabel.mas_top);
    }];
    
    [passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.left.equalTo(mobileNoTextField);
        make.top.equalTo(mobileNoTextField.mas_bottom).offset(20);
    }];
    
    [verificationCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.left.top.equalTo(passwordTextField);
        make.width.equalTo(@150);
    }];
    
    [passwordVisibleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(passwordTextField.mas_centerY);
        make.right.equalTo(backgroundImageView.mas_right).offset(-23);
    }];
    
    [separateImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(verificationCodeTextField.mas_centerY);
        make.left.equalTo(verificationCodeTextField.mas_right).offset(5);
    }];
    
    [countdownView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(separateImageView.mas_right).offset(5);
        make.centerY.equalTo(separateImageView.mas_centerY);
        make.width.equalTo(@(65));
    }];
    
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@82);
        make.height.equalTo(@36);
        make.centerX.equalTo(backgroundImageView.mas_centerX);
        make.top.equalTo(backgroundImageView.mas_bottom).offset(-17);
    }];
    
    [forgotPasswordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(loginButton.mas_centerY).offset(4);
        make.left.equalTo(backgroundImageView.mas_left).offset(20);
    }];
    
    [codeLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(forgotPasswordButton.mas_centerY);
        make.right.equalTo(backgroundImageView.mas_right).offset(-20);
    }];
    
    [registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.bottom.equalTo(self.superview.mas_bottom).offset(-30);
    }];
    
    [passwordLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(codeLoginButton.mas_centerY);
        make.right.equalTo(codeLoginButton.mas_right);
    }];
}

/**
 * 设置密码明文显示按钮图片
 */
- (void)layoutVisibleButtonImage
{
    UIImage *visibleButtonImage = passwordVisibleable ? IMAGE_NAME(@"PasswordVisibleImage") : IMAGE_NAME(@"PasswordInvisibleImage");
    
    [passwordVisibleButton setBackgroundImage:visibleButtonImage forState:UIControlStateNormal];
    [passwordVisibleButton setBackgroundImage:visibleButtonImage forState:UIControlStateHighlighted];
}

#pragma mark - Events
/**
 * 添加按钮事件
 */
- (void)initEvents
{
    EVENT_BUTTON_ADD(loginButton, self, @selector(handleLoginEvent));
    
    EVENT_BUTTON_ADD(passwordVisibleButton, self, @selector(handleVisibleOfPasswordEvent));
    
    EVENT_BUTTON_ADD(forgotPasswordButton, self, @selector(handleForgotPasswordEvent));
    
    EVENT_BUTTON_ADD(codeLoginButton, self, @selector(handleVerificationCodeLoginEvent));
    
    EVENT_BUTTON_ADD(registerButton, self, @selector(handleRegisterEvent));
    
    EVENT_BUTTON_ADD(passwordLoginButton, self, @selector(handleUserPasswordLoginEvent));
}

/**
 * 密码明文显示处理
 */
- (void)handleVisibleOfPasswordEvent
{
    passwordTextField.secureTextEntry = !(passwordVisibleable = !passwordVisibleable);
    
    [self layoutVisibleButtonImage];
}

/**
 * 处理登录事件
 */
- (void)handleLoginEvent
{
    
//    [UIView animateWithDuration:1.0 animations:^{
//        loginButton.layer.cornerRadius = 0.5;
//    } completion:^(BOOL finished) {
        EVENT_NOTIFICATION_POST(NOTIFICATION_LOGIN_DONE, nil);
//    }];
}

/**
 * 跳转至忘记密码
 */
- (void)handleForgotPasswordEvent
{
    EVENT_NOTIFICATION_POST(NOTIFICATION_TO_RETRIEVE, nil);
}

/**
 * 跳转至注册
 */
- (void)handleRegisterEvent
{
    EVENT_NOTIFICATION_POST(NOTIFICATION_TO_REGISTER, nil);
}

/**
 * 跳转验证码登录
 */
- (void)handleVerificationCodeLoginEvent
{
    [self switchLoginType:NO];
}

/**
 * 跳转密码登录
 */
- (void)handleUserPasswordLoginEvent
{
    [self switchLoginType:YES];
}

/**
 * 用户密码登录 or 手机验证码登录，显示/隐藏相关视图
 *
 * @param isUserPasswordLogin  YES: 密码登录  NO： 验证码登录
 */
- (void)switchLoginType:(BOOL)isUserPasswordLogin
{
    // 密码登录相关控件
    passwordTextField.hidden = !isUserPasswordLogin;
    passwordVisibleButton.hidden = !isUserPasswordLogin;
    codeLoginButton.hidden = !isUserPasswordLogin;
    
    // 验证码登录相关控件
    countdownView.hidden = isUserPasswordLogin;
    verificationCodeTextField.hidden = isUserPasswordLogin;
    separateImageView.hidden = isUserPasswordLogin;
    passwordLoginButton.hidden = isUserPasswordLogin;
}
@end
