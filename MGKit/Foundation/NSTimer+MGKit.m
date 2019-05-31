//
//  NSTimer+MGKit.m
//  MGKit
//
//  Created by maling on 2019/5/31.
//  Copyright © 2019 maling. All rights reserved.
//

#import "NSTimer+MGKit.h"

@implementation NSTimer (MGKit)

- (void)mg_pause
{
    if (!self.isValid) return;
    [self setFireDate:[NSDate distantFuture]];
}

- (void)mg_resume
{
    if (!self.isValid) return;
    [self setFireDate:[NSDate date]];
}

- (void)mg_resumeWithTimeInterval:(NSTimeInterval)time
{
    if (!self.isValid) return;
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:time]];
}

+ (NSTimer *)mg_timerInterval:(NSInteger)interval actionBlock:(void(^)(void))actionBlock
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(startActon:) userInfo:[actionBlock copy] repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    return timer;
}

+(void)startActon:(NSTimer *)timer
{
    void(^actionBlock)(void) = timer.userInfo;
    if (actionBlock) {
        actionBlock();
    }
}

@end
