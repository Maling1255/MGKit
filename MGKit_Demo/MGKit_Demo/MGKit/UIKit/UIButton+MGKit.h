//
//  UIButton+MGKit.h
//  MGKit
//
//  Created by maling on 2019/5/30.
//  Copyright © 2019 maling. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, MGImagePosition) {
    MGImagePositionLeft = 0,              //图片在左，文字在右，默认
    MGImagePositionRight = 1,             //图片在右，文字在左
    MGImagePositionTop = 2,               //图片在上，文字在下
    MGImagePositionBottom = 3,            //图片在下，文字在上
};

@interface UIButton (MGKit)


+ (UIButton *)mg_buttonTitle:(NSString *)title font:(id)font titleColor:(id)titleColor image:(id)image;
+ (UIButton *)mg_buttonFrame:(CGRect)frame title:(NSString *)title font:(id)font titleColor:(id)titleColor image:(id)image;
+ (UIButton *)mg_buttonFrame:(CGRect)frame title:(NSString *)title font:(id)font titleColor:(id)titleColor  titleHightColor:(id)titleHightColor image:(id)image;

/**
  设置图片 文字位置 间距

 @param postion 位置类型
 @param spacing 图片文字之间的间距
 */
- (void)mg_setImagePosition:(MGImagePosition)postion spacing:(CGFloat)spacing;

/**
 点击范围
 */
@property(nonatomic, assign) UIEdgeInsets mg_touchRangeEdgeInsets;

/**
 点击按钮回调
 */
@property(nonatomic, copy) void(^mg_clickButton)(UIButton *button);

@end

