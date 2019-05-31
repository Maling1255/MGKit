//
//  UIColor+MGKit.h
//  MGKit
//
//  Created by maling on 2019/5/30.
//  Copyright © 2019 maling. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (MGKit)

/**
 随机色

 @return color
 */
+ (UIColor *)mg_randomColor;

/**
 color

 @param color 将字符表示的颜色转换成UIColor,支持格式 #345678(RGBA)、#123456(RGB) 333333
 @return color
 */
+ (UIColor *)mg_colorWithHexString:(NSString *)color;
+ (UIColor *)mg_colorWithColorValue:(id)color;

@end

NS_ASSUME_NONNULL_END
