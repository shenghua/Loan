//
//  LKFadeInAnimator.m
//  Loan
//
//  Created by 王胜华 on 04/12/2017.
//  Copyright © 2017 imobpay. All rights reserved.
//

#import "LKFadeInAnimator.h"

@interface LKFadeInAnimator ()

@property (nonatomic, assign) NSTimeInterval animationDuration;

@property (nonatomic, assign) CGFloat startingAlpha;

@end

@implementation LKFadeInAnimator

@synthesize animationDuration, startingAlpha;

- (instancetype)initWithInterval:(NSTimeInterval)animationDuration startingAlpha:(CGFloat)startingAlpha
{
    self = [super init];
    
    if (self) {
        self.animationDuration = animationDuration;
        
        self.startingAlpha = startingAlpha;
    }
    
    return self;
}

#pragma mark - UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return animationDuration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *containerView = transitionContext.containerView;
    
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
//    toView.alpha = startingAlpha;
    fromView.alpha = 0.8;
    
    [containerView addSubview:toView];
    
    [UIView animateWithDuration:animationDuration animations:^{
//        toView.alpha = 1.0;
        fromView.alpha = 0.2;
    } completion:^(BOOL finished) {
//        fromView.alpha = 1.0;
        [transitionContext completeTransition:YES];
    }];
}

@end
