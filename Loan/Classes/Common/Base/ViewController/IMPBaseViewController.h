//
//  IMPBaseViewController.h
//  Loan
//
//  Created by 王胜华 on 29/09/2017.
//  Copyright © 2017 imobpay. All rights reserved.
//  ViewController基类

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "Colours.h"

@interface IMPBaseViewController : UIViewController

/**
 * 重置输入框焦点
 */
- (BOOL)resignFirstResponder;

/**
 * 刷新视图
 */
- (void)layoutIfNeeded;

/**
 * textfield添加回车键处理事件
 */
- (void)addReturnKeyEvent:(UIView *)view;

/**
 * 设置状态栏类型
 */
- (void)statusBarStyle:(UIStatusBarStyle)statusBarStyle;
@end
