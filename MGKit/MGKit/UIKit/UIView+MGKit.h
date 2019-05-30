//
//  UIView+MGKit.h
//  MGKit
//
//  Created by maling on 2019/5/30.
//  Copyright © 2019 maling. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MGKit)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGPoint centerXY;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;


/**
 * 绘制圆角
 
 @param radius 半径
 @param corners 执行圆角位置
 */
- (void)mg_cornerRadius:(CGFloat)radius corners:(UIRectCorner)corners;
- (void)mg_cornerRadius:(CGFloat)radius;

/**
 阴影效果

 @param radius 阴影半径
 @param size 阴影偏移
 @param opacity 不透明 （0-1范围）
 @param color 阴影颜色
 @param path 阴影区域
 */
- (void)mg_shadowRadius:(CGFloat)radius offset:(CGSize)size opacity:(CGFloat)opacity color:(id)color path:(UIBezierPath *)path;

/**
 添加顶部&底部线条
 
 @param hasUp 顶部
 @param hasDown 底部
 @param color 线条颜色
 @param leftSpace 距离左端距离
 @param lineHight 默认线条高度 0.5
 */
- (void)mg_addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown andColor:(UIColor *)color andLeftSpace:(CGFloat)leftSpace lineHight:(CGFloat)lineHight;
- (void)mg_addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown andColor:(UIColor *)color lineHight:(CGFloat)lineHight;
- (void)mg_addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown andColor:(UIColor *)color;

/**
 点击view 事件

 @param block 回调处理
 */
- (void)mg_tapActionWithBlock:(void (^)(UIView *))block;

/**
 遍历子控件

 @param block 回调subview
 */
- (void)mg_enumerateEachSubviews:(void (^)(UIView *subview))block;

@end

