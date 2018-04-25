//
//  IMPBaseViewController.m
//  Loan
//
//  Created by 王胜华 on 29/09/2017.
//  Copyright © 2017 imobpay. All rights reserved.
//

#import "IMPBaseViewController.h"
#import "IQKeyboardManager.h"
#import "IQKeyboardReturnKeyHandler.h"
#import "UINavigationBar+BackgroundColor.h"

@interface IMPBaseViewController ()

// 键盘回车键处理
@property (nonatomic, strong) IQKeyboardReturnKeyHandler *returnKeyHandler;

@end

@implementation IMPBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加键盘Return key动作
    self.returnKeyHandler = [[IQKeyboardReturnKeyHandler alloc] initWithViewController:self];
    
    // 设置导航栏背景色
    [self navigationBackgroundColor:([UIColor colorFromHexString:COLOR_NAVIGATION_BACKGROUND])];
    
    // 设置状态栏类型
    [self statusBarStyle:UIStatusBarStyleLightContent];
    
    // 设置导航栏字体颜色
    [self statusBarTitleColor:[UIColor whiteColor] font:FONT_CUSTOM(17.0)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)layoutIfNeeded
{
    [self.view layoutIfNeeded];
}

#pragma mark - Status bar
- (void)statusBarStyle:(UIStatusBarStyle)statusBarStyle
{
    [UIApplication sharedApplication].statusBarStyle = statusBarStyle;
}

- (void)navigationBackgroundColor:(UIColor *)color
{
    [self.navigationController.navigationBar imp_setBackgroundColor:color];
}

#pragma mark - Navigation bar
- (void)statusBarTitleColor:(UIColor *)color font:(UIFont *)font
{
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:color, NSForegroundColorAttributeName,
                                     font, NSFontAttributeName, nil];
}

#pragma mark - Keyboard
- (BOOL)resignFirstResponder
{
    return [[IQKeyboardManager sharedManager] resignFirstResponder];
}

- (void)addReturnKeyEvent:(UIView *)view
{
    [self.returnKeyHandler addResponderFromView:view];
}

@end
