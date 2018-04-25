//
//  IMPAccountLoginViewController.h
//  Loan
//
//  Created by 王胜华 on 19/09/2017.
//  Copyright © 2017 imobpay. All rights reserved.
//  用户登录ViewController

#import "IMPBaseViewController.h"

@interface IMPAccountLoginViewController : IMPBaseViewController

/**
 * 根据viewType显示对应视图
 *
 * @param viewType 视图类型
 */
- (void)showViewWithType:(IMPUserViewType)viewType;

@end
