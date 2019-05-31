//
//  NSTimer+MGKit.h
//  MGKit
//
//  Created by maling on 2019/5/31.
//  Copyright © 2019 maling. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (MGKit)

/**
 快速创建计时器

 @param interval 计时间隔
 @param actionBlock 回调事件
 @return 计时器
 */
+ (NSTimer *)mg_timerInterval:(NSInteger)interval actionBlock:(void(^)(void))actionBlock;

/**
 计时暂停
 */
- (void)mg_pause;

/**
 继续计时
 */
- (void)mg_resume;

/**
 重设计时间隔 （如10  等待10秒执行下次，以后还是按照之前的时间间隔执行）

 @param time 重设需要等待的时间间隔
 */
- (void)mg_resumeWithTimeInterval:(NSTimeInterval)time;

@end

