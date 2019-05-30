//
//  UIButton+MGKit.h
//  MGKit
//
//  Created by maling on 2019/5/30.
//  Copyright © 2019 maling. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (MGKit)


+ (UIButton *)initButtonTitle:(NSString *)title font:(id)font titleColor:(id)titleColor image:(id)image;
+ (UIButton *)initButtonFrame:(CGRect)frame title:(NSString *)title font:(id)font titleColor:(id)titleColor image:(id)image;
+ (UIButton *)initButtonFrame:(CGRect)frame title:(NSString *)title font:(id)font titleColor:(id)titleColor  titleHightColor:(id)titleHightColor image:(id)image;

/**
 点击范围
 */
@property(nonatomic, assign) UIEdgeInsets mg_hitRangeEdgeInsets;

/**
 点击按钮回调
 */
@property(nonatomic, copy) void(^mg_clickButton)(UIButton *button);

@end

