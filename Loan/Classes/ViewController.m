//
//  ViewController.m
//  Loan
//
//  Created by 王胜华 on 11/09/2017.
//  Copyright © 2017 imobpay. All rights reserved.
//

#import "ViewController.h"
#import "IMPAccountLoginViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController () <UIAlertViewDelegate, CAAnimationDelegate>

@end

@implementation ViewController

#pragma mark - View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    RACSignal *letters = [@"A B C D E F G H I " componentsSeparatedByString:@" "].rac_sequence.signal;
//
//    [letters subscribeNext:^(NSString *x){
//
//        NSLog(@"%@-%@", [NSThread currentThread], x);
//    }];
//
//    RACSubject *subject = [RACSubject subject];
//
//    [subject subscribeNext:^(id  _Nullable x) {
//        NSLog(@"%@-第一个订阅者-%@", [NSThread currentThread], x);
//    }];
//    [subject subscribeNext:^(id  _Nullable x) {
//        NSLog(@"%@-第二个订阅者-%@", [NSThread currentThread], x);
//    }];
//
//    [subject sendNext:@"first subscribe"];
//
//    RACReplaySubject *replaySubject = [RACReplaySubject subject];
//
//    [replaySubject sendNext:@1];
//    [replaySubject sendNext:@2];
//
//    [replaySubject subscribeNext:^(id  _Nullable x) {
//        NSLog(@"%@-第一个订阅者收到的数据%@", [NSThread currentThread], x);
//    }];
//
//    [replaySubject subscribeNext:^(id  _Nullable x) {
//        NSLog(@"%@-第二个订阅者收到的数据%@", [NSThread currentThread], x);
//    }];
//
//
//    RACSubject *letters1 = [RACSubject subject];
//    RACSubject *numbers = [RACSubject subject];
//
//    RACSignal *signalOfSignals = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        [subscriber sendNext:letters1];
//        [subscriber sendNext:numbers];
//        [subscriber sendCompleted];
//
//        return nil;
//    }];
//
//    RACSignal *flattened = [signalOfSignals flatten];
//
//    [flattened subscribeNext:^(id  _Nullable x) {
//        NSLog(@"%@-%@", [NSThread currentThread], x);
//    }];
//
//    [letters1 sendNext:@"A"];
//    [numbers sendNext:@"1"];
//    [letters1 sendNext:@"B"];
//    [letters1 sendNext:@"C"];
//    [numbers sendNext:@"2"];
    
    UIAlertView *helloAlertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"Navigate to login page." delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [helloAlertView show];
//
//    UIView *positionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    positionView.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:positionView];
//
//    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
//    basicAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    basicAnimation.beginTime = CACurrentMediaTime();
//    basicAnimation.duration = 2.0;
//    basicAnimation.repeatCount = 2;
//    basicAnimation.fromValue = [NSValue valueWithCGPoint:positionView.layer.position];
//    basicAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.view.bounds.size.width - 50, self.view.bounds.size.height - 50)];
//    basicAnimation.autoreverses = YES;
//    basicAnimation.removedOnCompletion = NO;
//    basicAnimation.fillMode = kCAFillModeBackwards;
//    
//    [positionView.layer addAnimation:basicAnimation forKey:@"position"];
//    
//    UIView *rotationView = [[UIView alloc] initWithFrame:CGRectMake(0, 300, 50, 50)];
//    rotationView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:rotationView];
//    
//    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
//    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    rotationAnimation.duration = 2.0;
//    rotationAnimation.repeatCount = 2;
////    rotationAnimation.autoreverses = YES;
//    rotationAnimation.beginTime = CACurrentMediaTime();
//    rotationAnimation.fromValue = [NSNumber numberWithFloat:0.0];
//    rotationAnimation.toValue = [NSNumber numberWithFloat:2 * M_PI];
//    
//    [rotationView.layer addAnimation:rotationAnimation forKey:@"rotation"];
}

- (void)testAnimation
{
    
}

- (void)pauseLayer:(CALayer *)layer
{
    CFTimeInterval pauseTime = [layer convertTime:CACurrentMediaTime() toLayer:nil];
    
    layer.speed = 0.0;
    layer.timeOffset = pauseTime;
}

- (void)resumeLayer:(CALayer *)layer
{
    layer.timeOffset = layer.timeOffset;
    layer.timeOffset = 0;
    layer.speed = 1.0;
    layer.beginTime = 0;
    
    CFTimeInterval pauseTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.beginTime = pauseTime;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    IMPAccountLoginViewController *accountLoginViewController = [[IMPAccountLoginViewController alloc] init];
    [accountLoginViewController showViewWithType:IMPUserViewTypeLogin];
    [self presentViewController:accountLoginViewController animated:YES completion:nil];
}
@end
