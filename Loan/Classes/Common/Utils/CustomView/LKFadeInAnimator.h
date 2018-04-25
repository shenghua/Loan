//
//  LKFadeInAnimator.h
//  Loan
//
//  Created by 王胜华 on 04/12/2017.
//  Copyright © 2017 imobpay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LKFadeInAnimator : NSObject <UIViewControllerAnimatedTransitioning>

- (instancetype)initWithInterval:(NSTimeInterval)animationDuration startingAlpha:(CGFloat)startingAlpha;

@end
