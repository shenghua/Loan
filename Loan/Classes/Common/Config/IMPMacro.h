//
//  IMPMacro.h
//  Loan
//
//  Created by 王胜华 on 10/10/2017.
//  Copyright © 2017 imobpay. All rights reserved.
//

#ifndef IMPMacro_h
#define IMPMacro_h

#pragma mark - System macros
#define IS_iOS11 @available(iOS 11.0, *)
#define IS_iOS10 @available(iOS 10.0, *)
#define IS_iOS9  @available(iOS 9.0, *)
#define IS_iOS8  @available(iOS 8.0, *)

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
#define IS_ZOOMED (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
#define IS_IPHONE_X (IS_IPHONE && SCREEN_MAX_LENGTH == 812.0)

// 标注图以plus尺寸为标准
#define SCALE SCREEN_MAX_LENGTH / 736.0

#pragma mark - Constant - Integer
#define COUNT_DOWN_SECONDS 60;

#pragma mark - Constant - Colors
#define COLOR_LOGIN_BACKGROUND          @"#1999F2"
#define COLOR_LOGIN_BUTTON              @"#0396FC"
#define COLOR_LOGIN_BORDER              @"#1486D8"
#define COLOR_FONT_PLACEHOLDER          @"#C4C4C4"
#define COLOR_FONT_BLACK                @"#3D4245"
#define COLOR_FONT_BLUE                 @"#2D9AD2"
#define COLOR_FONT_BACKGROUND           @"#F1F2F1"
#define COLOR_NAVIGATION_BACKGROUND     @"#4F8EFE"

#pragma mark - Constant - Notification
#define NOTIFICATION_LOGIN_DONE     @"NOTIFICATION_LOGIN_DONE"      // 登录事件
#define NOTIFICATION_REGISTER_DONE  @"NOTIFICATION_REGISTER_DONE"   // 注册结束
#define NOTIFICATION_RETRIEVE_DONE  @"NOTIFICATION_RETRIEVE_DONE"   // 找回密码结束
#define NOTIFICATION_TO_REGISTER    @"NOTIFICATION_TO_REGISTER"     // 跳转至注册页面
#define NOTIFICATION_TO_RETRIEVE    @"NOTIFICATION_TO_RETRIEVE"     // 跳转至找回密码页面

#pragma mark - Functions - Fonts
#define FONT_DEFAULT_NAME @"Noto Sans S Chinese"
#define FONT_CUSTOM(_FONTSIZE) [UIFont fontWithName:FONT_DEFAULT_NAME size:_FONTSIZE]
#define FONT_SYSTEM(_FONTSIZE) [UIFont systemFontOfSize:_FONTSIZE]
#define FONT_BOLD(_FONTSIZE) [UIFont boldSystemFontOfSize:_FONTSIZE]
#define FONT_ITALIC(_FONTSIZE) [UIFont italicSystemFontOfSize:_FONTSIZE]

#pragma mark - Functions - Images
#define IMAGE_NAME(_IMAGENAME) [UIImage imageNamed:_IMAGENAME]
#define IMAGEVIEW_NAME(_IMAGENAME) [[UIImageView alloc] initWithImage:IMAGE_NAME(_IMAGENAME)]

#pragma mark - Functions - Button Events
#define EVENT_BUTTON_ADD(_BUTTONOBJECT, _TARGET, _METHODSELECTOR) [_BUTTONOBJECT addTarget:_TARGET action:_METHODSELECTOR forControlEvents:UIControlEventTouchUpInside]

#pragma mark - Functions - Notification Events
#define EVENT_NOTIFICATION_ADD(_OBSERVER, _NAME, _METHODSELECTOR, _SENDER) [[NSNotificationCenter defaultCenter] addObserver:_OBSERVER selector:_METHODSELECTOR name:_NAME object:_SENDER]
#define EVENT_NOTIFICATION_POST_USERINFO(_NAME, _OBJECT, _USERINFO) [[NSNotificationCenter defaultCenter] postNotificationName:_NAME object:_OBJECT userInfo:_USERINFO]
#define EVENT_NOTIFICATION_POST(_NAME, _OBJECT) EVENT_NOTIFICATION_POST_USERINFO(_NAME, _OBJECT, nil)
#define EVENT_NOTIFICATION_REMOVE(_OBSERVER, _NAME, _SENDER) [[NSNotificationCenter defaultCenter] removeObserver:_OBSERVER name:_NAME object:_SENDER]
#define EVENT_NOTIFICATION_REMOVE_ALL(_OBSERVER) [[NSNotificationCenter defaultCenter] removeObserver:_OBSERVER]

#endif /* IMPMacro_h */
