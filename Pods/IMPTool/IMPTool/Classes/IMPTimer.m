//
//  IMPTimer.m
//  Expecta
//
//  Created by 王胜华 on 17/11/2017.
//

#import "IMPTimer.h"

@interface IMPTimer ()

// 系统timer
@property (nonatomic, strong) NSTimer *t;

// 回调block
@property (nonatomic, copy) void (^block)(IMPTimer *);

@end

@implementation IMPTimer

+ (IMPTimer *)timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(IMPTimer *timer))block
{
    IMPTimer *timer = [[IMPTimer alloc] initWithTimeInterval:interval repeats:repeats block:block];
    
    return timer;
}

- (instancetype)initWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(IMPTimer *timer))block
{
    self = [super init];
    
    if (self) {
        self.t = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(execute) userInfo:nil repeats:repeats];
        self.block = block;
        
        [[NSRunLoop currentRunLoop] addTimer:self.t forMode:NSRunLoopCommonModes];
    }
    
    return self;
}

/**
 * 执行任务
 */
- (void)execute
{
    __weak __typeof__(self) weakSelf = self;
    self.block(weakSelf);
}

/**
 * 销毁timer
 */
- (void)invalidate
{
    [self.t invalidate];
    self.t = nil;
}

- (void)dealloc
{
    [self invalidate];
}

@end
