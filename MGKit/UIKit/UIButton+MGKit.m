//
//  UIButton+MGKit.m
//  MGKit
//
//  Created by maling on 2019/5/30.
//  Copyright © 2019 maling. All rights reserved.
//

#import "UIButton+MGKit.h"
#import <objc/runtime.h>
#import "UIColor+MGKit.h"
#import "UIFont+MGKit.h"
#import "UIImage+MGKit.h"

static const NSString *MGBUTTON_EDGEINSETS = @"HitEdgeInsets";

@implementation UIButton (MGKit)

+ (UIButton *)mg_buttonTitle:(NSString *)title font:(id)font titleColor:(id)titleColor image:(id)image
{
    return [self mg_buttonFrame:CGRectZero title:title font:font titleColor:titleColor image:image];
}

+ (UIButton *)mg_buttonFrame:(CGRect)frame title:(NSString *)title font:(id)font titleColor:(id)titleColor  image:(id)image
{
    return [self mg_buttonFrame:frame title:title font:font titleColor:titleColor titleHightColor:nil image:image];
}
+ (UIButton *)mg_buttonFrame:(CGRect)frame title:(NSString *)title font:(id)font titleColor:(id)titleColor  titleHightColor:(id)titleHightColor image:(id)image
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


- (void)setMg_touchRangeEdgeInsets:(UIEdgeInsets)mg_touchRangeEdgeInsets
{
    NSValue *value = [NSValue value:&mg_touchRangeEdgeInsets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self, &MGBUTTON_EDGEINSETS, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)mg_touchRangeEdgeInsets {
    NSValue *value = objc_getAssociatedObject(self, &MGBUTTON_EDGEINSETS);
    if(value) {
        UIEdgeInsets edgeInsets; [value getValue:&edgeInsets]; return edgeInsets;
    }else {
        return UIEdgeInsetsZero;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if(UIEdgeInsetsEqualToEdgeInsets(self.mg_touchRangeEdgeInsets, UIEdgeInsetsZero) || !self.enabled || self.hidden) {
        return [super pointInside:point withEvent:event];
    }
    CGRect relativeFrame = self.bounds;
    CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.mg_touchRangeEdgeInsets);
    return CGRectContainsPoint(hitFrame, point);
}

- (void)mg_setImagePosition:(MGImagePosition)postion spacing:(CGFloat)spacing
{
    CGFloat imageWith = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGFloat labelWidth = [self.titleLabel.text sizeWithFont:self.titleLabel.font].width;
    CGFloat labelHeight = [self.titleLabel.text sizeWithFont:self.titleLabel.font].height;
#pragma clang diagnostic pop
    
    CGFloat imageOffsetX = (imageWith + labelWidth) / 2 - imageWith / 2;//image中心移动的x距离
    CGFloat imageOffsetY = imageHeight / 2 + spacing / 2;//image中心移动的y距离
    CGFloat labelOffsetX = (imageWith + labelWidth / 2) - (imageWith + labelWidth) / 2;//label中心移动的x距离
    CGFloat labelOffsetY = labelHeight / 2 + spacing / 2;//label中心移动的y距离
    
    switch (postion) {
        case MGImagePositionLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
            break;
            
        case MGImagePositionRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing/2, 0, -(labelWidth + spacing/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageHeight + spacing/2), 0, imageHeight + spacing/2);
            break;
            
        case MGImagePositionTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            break;
            
        case MGImagePositionBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            break;
            
        default:
            break;
    }
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
