//
//  IMPEnum.h
//  Loan
//
//  Created by 王胜华 on 10/10/2017.
//  Copyright © 2017 imobpay. All rights reserved.
//

#ifndef IMPEnum_h
#define IMPEnum_h

// 用户视图类型
typedef enum IMPUserViewType {
    IMPUserViewTypeLogin,              // 登录
    IMPUserViewTypePasswordRetrieve,   // 找回密码
    IMPUserViewTypeRegister            // 注册
} IMPUserViewType;

// 滚动条滚动方向
typedef enum IMPScrollDirection {
    IMPScrollDirectionNone,             // None
    IMPScrollDirectionLeft,             // 左滑动
    IMPScrollDirectionRight,            // 右滑动
    IMPScrollDirectionUp,               // 上滑动
    IMPScrollDirectionDown              // 下滑动
} IMPScrollDirection;

#endif /* IMPEnum_h */
