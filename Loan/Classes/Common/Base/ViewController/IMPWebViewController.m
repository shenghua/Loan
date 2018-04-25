//
//  IMPWebViewController.m
//  Loan
//
//  Created by 王胜华 on 30/11/2017.
//  Copyright © 2017 imobpay. All rights reserved.
//

#import "IMPWebViewController.h"
#import <WebKit/WebKit.h>

@interface IMPWebViewController () <WKNavigationDelegate, UIScrollViewDelegate>

// WebView
@property (nonatomic, strong) WKWebView *webView;

// 进度条
@property (nonatomic, strong) UIProgressView *progressView;

// 滚动条 Y轴上次滚动距离
@property (nonatomic, assign) CGFloat lastContentOffsetY;

// 底部栏是否显示
@property (nonatomic, assign) BOOL isTabbarShow;

@end

@implementation IMPWebViewController

@synthesize progressView, webView, lastContentOffsetY, isTabbarShow;

#pragma mark - View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isTabbarShow = YES;
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self initSubviews];
    
    [self layoutSubviews];
    
    [self addObserver];
    
    [self webViewLoadhtml:self.htmlPath];
}

/**
 * 视图初始化
 */
- (void)initSubviews
{
    self.webView = [[WKWebView alloc] init];
    webView.scrollView.showsHorizontalScrollIndicator = NO;
    webView.navigationDelegate = self;
    webView.scrollView.delegate = self;
    [self.view addSubview:webView];
    
    self.progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
//    progressView.progressTintColor = [UIColor redColor];
    progressView.hidden = YES;
    [self.navigationController.navigationBar addSubview:progressView];
}

/**
 * 视图布局
 */
- (void)layoutSubviews
{
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.left.top.equalTo(self.view);
    }];
    
    [progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.navigationController.navigationBar);
        make.height.equalTo(@(1));
        make.left.bottom.equalTo(self.navigationController.navigationBar);
    }];
}

/**
 * KVO - 监听webview加载进度
 */
- (void)addObserver
{
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    // 移除KVO
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

/**
 * 加载html
 */
- (void)webViewLoadhtml:(NSString *)html
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:html]];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData];
    [self.webView loadRequest:request];
}

#pragma mark - KVO response
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        
        [self.progressView setProgress:self.webView.estimatedProgress animated:YES];
        
        /* 加载结束
         * 添加一个简单的动画，将progressView的Height变为1.4倍，在开始加载网页的代理中会恢复为1.5倍
         * 动画时长0.25s，延时0.3s后开始动画
         * 动画结束后将progressView隐藏
         */
        if (self.progressView.progress == 1) {
            
            __weak typeof (self)weakSelf = self;
            [UIView animateWithDuration:0.25f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
                weakSelf.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.4f);
            } completion:^(BOOL finished) {
                weakSelf.progressView.hidden = YES;
                weakSelf.progressView.progress = 0;
            }];
        }
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    //开始加载网页时展示出progressView
    self.progressView.hidden = NO;
    
    //开始加载网页的时候将progressView的Height恢复为1.5倍
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation
{
    [webView sizeToFit];
}

- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error
{
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    IMPScrollDirection scrollDirection = IMPScrollDirectionNone;
    
    CGFloat currentContentOffsetY = scrollView.contentOffset.y;
    
    NSLog(@"==============%f", currentContentOffsetY);
    
    // 向上滚动、显示底部栏
    if (lastContentOffsetY > currentContentOffsetY && currentContentOffsetY > -64 && (currentContentOffsetY + CGRectGetHeight(webView.bounds) - CGRectGetHeight(self.tabBarController.tabBar.frame)) < scrollView.contentSize.height && isTabbarShow == NO)
        scrollDirection = IMPScrollDirectionUp;
    // 向下滚动、隐藏底部栏
    else if (lastContentOffsetY < currentContentOffsetY && currentContentOffsetY > -64 && isTabbarShow == YES)
        scrollDirection = IMPScrollDirectionDown;
    
    self.lastContentOffsetY = currentContentOffsetY;
    
    [self animateTabbarWithDirection:scrollDirection];
}

/**
 * 根据滚动条方向 显示/隐藏 底部栏
 *
 * @param scrollDirection IMPScrollDirectionUp -> 显示底部栏， IMPScrollDirectionDown -> 隐藏底部栏
 */
- (void)animateTabbarWithDirection:(IMPScrollDirection)scrollDirection
{
    CGRect frame = self.tabBarController.tabBar.frame;
    
    // 隐藏底部栏
    if (scrollDirection == IMPScrollDirectionDown) {
        self.isTabbarShow = NO;
        frame.origin.y = SCREEN_HEIGHT;
        
        [webView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(self.view).offset(CGRectGetHeight(self.tabBarController.tabBar.frame));
        }];
    }
    // 显示底部栏
    else if (scrollDirection == IMPScrollDirectionUp) {
        self.isTabbarShow = YES;
        frame.origin.y = SCREEN_HEIGHT - frame.size.height;
        
        [webView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(self.view);
        }];
    }
    else {
        return;
    }
    
    [UIView animateWithDuration:.5 animations:^{
        self.tabBarController.tabBar.frame = frame;
        [self.view layoutIfNeeded];
    }];
    
}

@end
