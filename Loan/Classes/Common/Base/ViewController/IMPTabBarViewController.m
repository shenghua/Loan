//
//  IMPTabBarViewController.m
//  Loan
//
//  Created by 王胜华 on 30/11/2017.
//  Copyright © 2017 imobpay. All rights reserved.
//

#import "IMPTabBarViewController.h"
#import "IMPWebViewController.h"
#import "IMPAccountLoginViewController.h"
#import "UINavigationBar+BackgroundColor.h"

@interface IMPTabBarViewController () <UITabBarControllerDelegate>

@property (nonatomic, assign) BOOL isFirst;

@end

@implementation IMPTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isFirst = YES;
    
    self.delegate = self;
    
    self.viewControllers = [self loadViewControllers];
    
    [self handleTabBarColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * 加载ViewController
 */
- (NSArray *)loadViewControllers
{
    NSMutableArray *tabBarViewControllers = [NSMutableArray array];
    
    NSArray *tabBarItems = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"IMPTabBarItems" ofType:@"plist"]];
    
    for (NSArray *item in tabBarItems) {
        // 正常状态图片
        UIImage *tabBarItemImage = [UIImage imageNamed:item[1]];
        
        // 选中状态图片
        UIImage *tabBarItemSelectedImage = [UIImage imageNamed:item[2]];
        
        // 设置渲染模式，UIImageRenderingModeAlwaysOriginal-始终绘制原始图片，防止tint color或者图形上下文改变图片颜色
        tabBarItemImage = [tabBarItemImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        tabBarItemSelectedImage = [tabBarItemSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        // 类名
        Class class = NSClassFromString(item[0]);
        UIViewController *viewController = [[class alloc] init];
        viewController.tabBarItem.image = tabBarItemImage;
        viewController.tabBarItem.selectedImage = tabBarItemSelectedImage;
        
        // 标题
        viewController.tabBarItem.title = item[3];
        viewController.title = item[3];
        
        // WebView的情况，加载公用WebViewController，item[4]是url元素
        if ([viewController isKindOfClass:IMPWebViewController.class]) {
            IMPWebViewController *webVC = (IMPWebViewController *) viewController;
            webVC.htmlPath = [NSString stringWithFormat:@"%@", item[4]];
        }
        
        // 加入导航控制器
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
        [tabBarViewControllers addObject:navigationController];
    }
    
    return tabBarViewControllers;
}

/**
 * 设置Tab Bar字体、背景颜色
 */
- (void)handleTabBarColor
{
    // 设置字体颜色 - 正常状态
    [[UITabBarItem appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor colorFromHexString:COLOR_FONT_BLACK], NSForegroundColorAttributeName, nil]
                                             forState:UIControlStateNormal];
    
    // 设置字体颜色 - 选中状态
    [[UITabBarItem appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorFromHexString:COLOR_FONT_BLUE], NSForegroundColorAttributeName, nil]
                                             forState:UIControlStateSelected];
    
    // 设置tabbar背景颜色
    UIView *tabBarBackgroundView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    tabBarBackgroundView.backgroundColor = [UIColor whiteColor];
    [self.tabBar insertSubview:tabBarBackgroundView atIndex:0];
}

#pragma mark - UITabBarControllerDelegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if (self.isFirst) {
        self.isFirst = !_isFirst;
        
        IMPAccountLoginViewController *accountLoginViewController = [[IMPAccountLoginViewController alloc] init];
        [accountLoginViewController showViewWithType:IMPUserViewTypeLogin];
        [self presentViewController:accountLoginViewController animated:YES completion:nil];
        
        return NO;
    }
    
    return YES;
}

@end
