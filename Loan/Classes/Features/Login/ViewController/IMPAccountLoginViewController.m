//
//  IMPAccountLoginViewController.m
//  Loan
//
//  Created by 王胜华 on 19/09/2017.
//  Copyright © 2017 imobpay. All rights reserved.
//

#import "IMPAccountLoginViewController.h"
#import "IMPLoginView.h"
#import "IMPPasswordRetrieveView.h"
#import "IMPRegisterView.h"
#import "IQKeyboardReturnKeyHandler.h"
#import "LKFadeInAnimator.h"

// TODO: 按钮关联、按钮动效、提交按钮不可用状态、错误信息动画

@interface IMPAccountLoginViewController () <UIViewControllerTransitioningDelegate>

// 登录logo
@property (nonatomic, strong) UIImageView *logoImageView;

// 登录视图
@property (nonatomic, strong) IMPLoginView *loginView;

// 找回密码视图
@property (nonatomic, strong) IMPPasswordRetrieveView *passwordRetrieveView;

// 注册视图
@property (nonatomic, strong) IMPRegisterView *registerView;

// 视图显示类型
@property (nonatomic, assign) IMPUserViewType viewType;

@end

@implementation IMPAccountLoginViewController

@synthesize logoImageView, loginView, passwordRetrieveView, registerView, viewType;

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;

    self.view.backgroundColor = [UIColor colorFromHexString:COLOR_LOGIN_BACKGROUND];
    
    [self initLogoImageView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 默认加载登录视图
    if (viewType == IMPUserViewTypeLogin && !loginView) {
        [self initLoginView];
    }
}

- (void)dealloc
{
    // 移除通知
    EVENT_NOTIFICATION_REMOVE_ALL(self);
}

#pragma mark - Get Method - Lazy Init
- (UIImageView *)logoImageView
{
    if (!logoImageView) {
        self.logoImageView = IMAGEVIEW_NAME(@"AccountLoginLogoImage");
        logoImageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.view addSubview:logoImageView];
        
        [logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).offset(130.0 * SCALE);
            make.centerX.equalTo(self.view.mas_centerX);
        }];
    }
    
    return logoImageView;
}

/**
 * loginView get方法
 *
 * @return loginView
 */
- (IMPLoginView *)loginView
{
    if (!loginView) {
        self.loginView = [[IMPLoginView alloc] init];
        [self.view addSubview:self.loginView];
        
        [self addReturnKeyEvent:loginView];
        
        [self addLoginNotificationEvent];
        
        [self layoutLoginView];
    }
    
    return loginView;
}

/**
 * passwordRetrieveView get方法
 *
 * @return passwordRetrieveView
 */
- (IMPPasswordRetrieveView *)passwordRetrieveView
{
    if (!passwordRetrieveView) {
        self.passwordRetrieveView = [[IMPPasswordRetrieveView alloc] init];
        [self.view addSubview:passwordRetrieveView];
        
        [self addReturnKeyEvent:passwordRetrieveView];
        
        [self addRetrieveNotificationEvent];
        
        [self layoutPasswordRetrieveView];
    }
    
    return passwordRetrieveView;
}

/**
 * registerView get方法
 *
 * @return registerView
 */
- (IMPRegisterView *)registerView
{
    if (!registerView) {
        self.registerView = [[IMPRegisterView alloc] init];
        [self.view addSubview:registerView];
        
        [self addReturnKeyEvent:registerView];
        
        [self addRegisterNotificationEvent];
        
        [self layoutRegisterView];
    }
    
    return registerView;
}

#pragma mark - Layout Subviews
/**
 * 登录视图布局
 */
- (void)layoutLoginView
{
    [loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.left.bottom.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(296 * SCALE);
    }];
    
    [self layoutIfNeeded];
}

/**
 * 找回密码视图布局
 */
- (void)layoutPasswordRetrieveView
{
    [passwordRetrieveView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.bottom.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(296 * SCALE);
        make.left.equalTo(self.view.mas_right);
    }];
    
    [self layoutIfNeeded];
}

/**
 * 注册视图布局
 */
- (void)layoutRegisterView
{
    [registerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.bottom.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(296 * SCALE);
        make.left.equalTo(self.view.mas_right);
    }];
    
    [self layoutIfNeeded];
}

#pragma mark - Init Subviews
/**
 * 初始化、布局logo图片
 */
- (void)initLogoImageView
{
    [self logoImageView];
}

/**
 * 初始化、布局登录视图
 */
- (void)initLoginView
{
    [self loginView];
}

/**
 * 初始化、布局找回密码视图
 */
- (void)initPasswordRetrieveView
{
    [self.passwordRetrieveView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_right).offset(-SCREEN_WIDTH);
    }];
    
    [self layoutIfNeeded];
}

/**
 * 初始化、布局注册视图
 */
- (void)initRegisterView
{
    [self.registerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_right).offset(-SCREEN_WIDTH);
    }];
    
    [self layoutIfNeeded];
}

#pragma mark - Add Notifications
/**
 * 登录视图显示 - 添加相关通知
 */
- (void)addLoginNotificationEvent
{
    // 注册通知 - 登录事件
    EVENT_NOTIFICATION_ADD(self, NOTIFICATION_LOGIN_DONE, @selector(login:), nil);
    
    // 注册通知 - 显示注册页
    EVENT_NOTIFICATION_ADD(self, NOTIFICATION_TO_REGISTER, @selector(showRegisterView:), nil);
    
    // 注册通知 - 显示找回密码
    EVENT_NOTIFICATION_ADD(self, NOTIFICATION_TO_RETRIEVE, @selector(showRetrieveView:), nil);
}

/**
 * 找回密码视图显示 - 添加相关通知
 */
- (void)addRetrieveNotificationEvent
{
    // 注册通知 - 找回密码结束，隐藏视图
    EVENT_NOTIFICATION_ADD(self, NOTIFICATION_RETRIEVE_DONE, @selector(registerOrRetrieveDone:), nil);
}

/**
 * 注册视图显示 - 添加相关通知
 */
- (void)addRegisterNotificationEvent
{
    // 注册通知 - 注册操作结束，隐藏视图
    EVENT_NOTIFICATION_ADD(self, NOTIFICATION_REGISTER_DONE, @selector(registerOrRetrieveDone:), nil);
}

#pragma mark - Notification Response
/**
 * 登录事件
 */
- (void)login:(NSNotification *)notification
{
    self.transitioningDelegate = self;
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 * 通知回调：显示注册视图
 */
- (void)showRegisterView:(NSNotification *)notification
{
    [self showView:self.registerView offset:-SCREEN_WIDTH alpha:0];
}

/**
 * 通知回调：显示找回密码视图
 */
- (void)showRetrieveView:(NSNotification *)notification
{
    [self showView:self.passwordRetrieveView offset:-SCREEN_WIDTH alpha:0];
}

/**
 * 通知回调：注册结束 | 找回密码结束
 */
- (void)registerOrRetrieveDone:(NSNotification *)notification
{
    switch (viewType) {
        // 动画切换登录视图和当前视图
        case IMPUserViewTypeLogin:
            [self showView:[notification.userInfo objectForKey:@"currentView"] offset:0 alpha:1.0];
            break;
            
        // 退出当前页
        default:
            [self dismissViewControllerAnimated:YES completion:nil];
            break;
    }
    
}

/**
 * 视图切换 - 登录视图与找回密码、注册视图 动画切换
 *
 * @param view 待操作视图
 * @param offset 位移量
 * @param alpha loginView透明度
 */
- (void)showView:(UIView *)view offset:(CGFloat)offset alpha:(CGFloat)alpha
{
    [view mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_right).offset(offset);
    }];
    
    [UIView animateWithDuration:.7 animations:^{
        [self resignFirstResponder];
        loginView.alpha = alpha;
        [self layoutIfNeeded];
    }];
}

#pragma mark - Show View With Type
- (void)showViewWithType:(IMPUserViewType)viewType
{
    self.viewType = viewType;
    
    switch (viewType) {
        case IMPUserViewTypeLogin:
            [self initLoginView];
            break;
            
        case IMPUserViewTypePasswordRetrieve:
            [self initPasswordRetrieveView];
            break;
            
        case IMPUserViewTypeRegister:
            [self initRegisterView];
            break;
            
        default:
            break;
    }
}

#pragma mark - UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[LKFadeInAnimator alloc] initWithInterval:0.5 startingAlpha:0.8];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [[LKFadeInAnimator alloc] initWithInterval:1 startingAlpha:0.8];
}

@end
