//
//  UIView+MGKit.h
//  MGKit
//
//  Created by maling on 2019/5/30.
//  Copyright © 2019 maling. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MGDottedLineOrientation) {
    MGDottedLineOrientationHorizontal,
    MGDottedLineOrientationVertical
};

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
 移除所有的子控件
 */
- (void)mg_removeAllSubviews;

/**
 * 绘制圆角
 
 @param radius 半径
 @param corners 指定圆角位置
 */
- (void)mg_cornerRadius:(CGFloat)radius corners:(UIRectCorner)corners;
- (void)mg_cornerRadius:(CGFloat)radius;

/**
 阴影效果

 @param shadowRadius 阴影半径
 @param size 阴影偏移
 @param opacity 不透明 （0-1范围）
 @param color 阴影颜色
 @param path 阴影区域
 @param cornerRadius 视图圆角半径
 @param borderWidth 边框宽度
 @param borderColor 边框颜色
 */
- (void)mg_shadowRadius:(CGFloat)shadowRadius offset:(CGSize)size opacity:(CGFloat)opacity color:(id)color path:(UIBezierPath *)path cornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
- (void)mg_shadowRadius:(CGFloat)shadowRadius offset:(CGSize)size opacity:(CGFloat)opacity color:(id)color path:(UIBezierPath *)path;

/**
 隐藏阴影
 */
- (void)mg_hideShadow;


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
 绘制虚线

 @param orientation 横向 & 竖向 的虚线
 @param color 虚线颜色
 @param ratio 所在位置的在父视图的位置的比例
 @param dotLineThickness 虚线厚度
 @param dotlineLength 虚线长度
 @param dotlineSpace 虚线间距
 */
- (void)mg_addDottedLine:(MGDottedLineOrientation)orientation dotLineColor:(id)color ratio:(NSNumber *)ratio dotLineThickness:(NSNumber *)dotLineThickness dotlineLength:(CGFloat)dotlineLength dotlineSpace:(CGFloat)dotlineSpace;
- (void)mg_addDottedLine;

typedef void (^MGGestureActionBlock)(UIView *view, UIGestureRecognizer *gestureRecoginzer);
/**
 点击view 事件

 @param block 回调处理
 */
- (void)mg_tapActionWithBlock:(MGGestureActionBlock)block;
/**
 长按 view 事件

 @param block block 回调
 */
- (void)mg_longPressActionWithBlock:(MGGestureActionBlock)block;

/**
 遍历子控件

 @param block 回调subview
 */
- (void)mg_enumerateEachSubviews:(void (^)(UIView *subview))block;

/**
 第一响应视图
 */
- (UIView *)mg_firstResponder;

/**
 当前view所在的viewcontroler
 */
- (UIViewController *)mg_viewController;

@end

