//
//  IMPTimer.h
//  Expecta
//
//  Created by 王胜华 on 17/11/2017.
//  NSTimer封装

#import <Foundation/Foundation.h>

@interface IMPTimer : NSObject

/**
 * timer构造方法
 *
 * @param interval timer间隔
 * @param repeats 是否重复
 * @param block 回调block
 * @return imptimer
 */
+ (IMPTimer *)timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(IMPTimer *timer))block;

/**
 * 销毁timer
 */
- (void)invalidate;

@end
