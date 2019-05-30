//
//  UIButton+MGKit.m
//  MGKit
//
//  Created by maling on 2019/5/30.
//  Copyright © 2019 maling. All rights reserved.
//

#import "UIButton+MGKit.h"
#import <objc/runtime.h>

static const NSString *MGBUTTON_EDGEINSETS = @"HitEdgeInsets";

@implementation UIButton (MGKit)

+ (UIButton *)initButtonTitle:(NSString *)title font:(id)font titleColor:(id)titleColor image:(id)image
{
    return [self initButtonFrame:CGRectZero title:title font:font titleColor:titleColor image:image];
}

+ (UIButton *)initButtonFrame:(CGRect)frame title:(NSString *)title font:(id)font titleColor:(id)titleColor  image:(id)image
{
    return [self initButtonFrame:frame title:title font:font titleColor:titleColor titleHightColor:nil image:image];
}
+ (UIButton *)initButtonFrame:(CGRect)frame title:(NSString *)title font:(id)font titleColor:(id)titleColor  titleHightColor:(id)titleHightColor image:(id)image
{
    UIButton *button = [[UIButton alloc] init];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor mg_colorWithColorValue:titleColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor mg_colorWithColorValue:titleHightColor] forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont mg_fontWithFontValue:font];
    [button setImage:[UIImage mg_image:image] forState:UIControlStateNormal];
    return button;
}

- (void)setMg_hitRangeEdgeInsets:(UIEdgeInsets)mg_hitRangeEdgeInsets
{
    NSValue *value = [NSValue value:&mg_hitRangeEdgeInsets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self, &MGBUTTON_EDGEINSETS, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)mg_hitRangeEdgeInsets {
    NSValue *value = objc_getAssociatedObject(self, &MGBUTTON_EDGEINSETS);
    if(value) {
        UIEdgeInsets edgeInsets; [value getValue:&edgeInsets]; return edgeInsets;
    }else {
        return UIEdgeInsetsZero;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if(UIEdgeInsetsEqualToEdgeInsets(self.mg_hitRangeEdgeInsets, UIEdgeInsetsZero) || !self.enabled || self.hidden) {
        return [super pointInside:point withEvent:event];
    }
    CGRect relativeFrame = self.bounds;
    CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.mg_hitRangeEdgeInsets);
    return CGRectContainsPoint(hitFrame, point);
}

static const NSString *btnAssociatedBlockKey = @"btnAssociatedClickKey";
- (void)setMg_clickButton:(void (^)(UIButton * _Nonnull))mg_clickButton
{
    objc_setAssociatedObject(self, &btnAssociatedBlockKey, mg_clickButton, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self removeTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    if (mg_clickButton) {
        [self addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}
- (void (^)(UIButton * _Nonnull))mg_clickButton
{
    return objc_getAssociatedObject(self, &btnAssociatedBlockKey);
}

- (void)buttonClick:(UIButton *)button
{
    if (self.mg_clickButton) {
        self.mg_clickButton(button);
    }
}

@end
