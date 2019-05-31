//
//  UIView+MGKit.m
//  MGKit
//
//  Created by maling on 2019/5/30.
//  Copyright © 2019 maling. All rights reserved.
//

#import "UIView+MGKit.h"
#import "UIColor+MGKit.h"
#import <objc/runtime.h>
#define kTagLineView 10070000
@implementation UIView (MGKit)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (CGFloat)x
{
    return self.frame.origin.x;
}
- (CGFloat)y
{
    return self.frame.origin.y;
}
- (void)setCenterXY:(CGPoint)centerXY
{
    CGPoint _center = self.center;
    _center.x = centerXY.x;
    _center.y = centerXY.y;
    self.center = _center;
}
- (CGPoint)centerXY
{
    return self.centerXY;
}
- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
- (CGFloat)centerX
{
    return self.center.x;
}
- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}
- (CGFloat)centerY
{
    return self.center.y;
}
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (CGFloat)height
{
    return self.frame.size.height;
}
- (CGFloat)width
{
    return self.frame.size.width;
}
- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
- (CGSize)size
{
    return self.frame.size;
}
- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
- (CGPoint)origin
{
    return self.frame.origin;
}
- (CGFloat)top
{
    return self.frame.origin.y;
}
- (void)setTop:(CGFloat)top
{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}
- (CGFloat)left
{
    return self.frame.origin.x;
}
- (void)setLeft:(CGFloat)left
{
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}
- (CGFloat)bottom
{
    return self.frame.size.height + self.frame.origin.y;
}
- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}
- (CGFloat)right
{
    return self.frame.size.width + self.frame.origin.x;
}
- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}


- (void)mg_cornerRadius:(CGFloat)radius
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.frame = self.bounds;
    layer.path = path.CGPath;
    self.layer.mask = layer;
}

- (void)mg_cornerRadius:(CGFloat)radius corners:(UIRectCorner)corners
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.frame = self.bounds;
    layer.path = path.CGPath;
    self.layer.mask = layer;
}

- (void)mg_shadowRadius:(CGFloat)radius offset:(CGSize)size opacity:(CGFloat)opacity color:(id)color path:(UIBezierPath *)path
{
    self.layer.shadowRadius = radius;
    self.layer.shadowOffset = size;
    self.layer.shadowColor = [UIColor mg_colorWithColorValue:color].CGColor;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowPath = path ? path.CGPath :[[UIBezierPath bezierPathWithRect:self.bounds] CGPath];
    
//    self.layer.cornerRadius = cradius;
//    self.layer.borderWidth = width;
//    self.layer.borderColor = borderColor.CGColor
}

- (void)mg_addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown andColor:(UIColor *)color
{
    return [self mg_addLineUp:hasUp andDown:hasDown andColor:color andLeftSpace:0 lineHight:0.5];
}

- (void)mg_addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown andColor:(UIColor *)color lineHight:(CGFloat)lineHight
{
    return [self mg_addLineUp:hasUp andDown:hasDown andColor:color andLeftSpace:0 lineHight:lineHight];
}

- (void)mg_addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown andColor:(UIColor *)color andLeftSpace:(CGFloat)leftSpace lineHight:(CGFloat)lineHight
{
    [self mg_removeViewWithTag:kTagLineView];
    if (hasUp) {
        UIView *upView = [UIView mg_lineViewWithPointYY:0 andColor:color andLeftSpace:leftSpace lineHight:lineHight];
        upView.tag = kTagLineView;
        [self addSubview:upView];
    }
    if (hasDown) {
        UIView *downView = [UIView mg_lineViewWithPointYY:CGRectGetMaxY(self.bounds)-lineHight andColor:color andLeftSpace:leftSpace lineHight:lineHight];
        downView.tag = kTagLineView;
        [self addSubview:downView];
    }
}

+ (UIView *)mg_lineViewWithPointYY:(CGFloat)pointY andColor:(UIColor *)color andLeftSpace:(CGFloat)leftSpace lineHight:(CGFloat)lineHight
{
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(leftSpace, pointY, [UIScreen mainScreen].bounds.size.width - leftSpace, lineHight)];
    lineView.backgroundColor = color;
    return lineView;
}

- (void)mg_removeViewWithTag:(NSInteger)tag{
    for (UIView *aView in [self subviews]) {
        if (aView.tag == tag) {
            [aView removeFromSuperview];
        }
    }
}

- (void)mg_addDottedLine
{
    [self mg_addDottedLine:MGDottedLineOrientationHorizontal dotLineColor:@"04244B" ratio:@0.5 dotLineThickness:nil dotlineLength:5 dotlineSpace:1];
}

- (void)mg_addDottedLine:(MGDottedLineOrientation)orientation
            dotLineColor:(id)color
                   ratio:(NSNumber *)ratio
        dotLineThickness:(NSNumber *)dotLineThickness
           dotlineLength:(CGFloat)dotlineLength
            dotlineSpace:(CGFloat)dotlineSpace
{
    // 横线虚线
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:self.bounds];
    [shapeLayer setPosition:CGPointMake(self.frame.size.width / 2.0,  self.frame.size.height/2.0)];
    [shapeLayer setAnchorPoint:CGPointMake(0.5, 0.5)];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //设置虚线颜色
    [shapeLayer setStrokeColor:[UIColor blackColor].CGColor];
    //设置虚线宽度（厚度）
    [shapeLayer setLineWidth:dotLineThickness ? [dotLineThickness floatValue] : 1];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //设置虚线的线宽及间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithFloat:dotlineLength], [NSNumber numberWithFloat:dotlineSpace], nil]];
    //创建虚线绘制路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    if (orientation == MGDottedLineOrientationHorizontal) {
        CGPathMoveToPoint(path, NULL, 0, self.height * (ratio ? [ratio floatValue] : 0.5));
        CGPathAddLineToPoint(path, NULL, self.width, self.height * (ratio ? [ratio floatValue] : 0.5));
    } else {
        CGPathMoveToPoint(path, NULL, self.width * (ratio ? [ratio floatValue] : 0.5), 0);
        CGPathAddLineToPoint(path, NULL, self.width * (ratio ? [ratio floatValue] : 0.5), self.height);
    }
    //设置虚线绘制路径
    [shapeLayer setPath:path];
    CGPathRelease(path);
    
    [self.layer addSublayer:shapeLayer];
}


static const char *ActionHandlerTapGestureKey;
- (void)mg_tapActionWithBlock:(void (^)(UIView *))block
{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &ActionHandlerTapGestureKey);
    
    if (!gesture) {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &ActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    
    objc_setAssociatedObject(self, &ActionHandlerTapGestureKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)handleActionForTapGesture:(UITapGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateRecognized)  {
        void(^action)(UIView *) = objc_getAssociatedObject(self, &ActionHandlerTapGestureKey);
        if (action)  {
            action(gesture.view);
        }
    }
}

- (void)mg_enumerateEachSubviews:(void (^)(UIView *subview))block
{
    NSParameterAssert(block != nil);
    [self.subviews enumerateObjectsUsingBlock:^(UIView *subview, NSUInteger idx, BOOL *stop) {
        block(subview);
    }];
}

@end
