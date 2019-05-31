//
//  UIBezierPath+MGKit.h
//  MGKit
//
//  Created by maling on 2019/5/30.
//  Copyright © 2019 maling. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBezierPath (MGKit)

/**
 将path设置成平滑的曲线

 @param granularity 20 平滑度
 @return 得到平滑的曲线
 */
- (UIBezierPath *)mg_smoothedPathWithGranularity:(NSInteger)granularity;

@end

NS_ASSUME_NONNULL_END
