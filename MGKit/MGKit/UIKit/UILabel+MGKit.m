//
//  UILabel+MGKit.m
//  MGKit
//
//  Created by maling on 2019/4/24.
//  Copyright © 2019 maling. All rights reserved.
//

#import "UILabel+MGKit.h"


@implementation UILabel (MGKit)

+ (UILabel *)initText:(NSString *)text
{
    return [self initText:text textColor:nil];
}
+ (UILabel *)initText:(NSString *)text textColor:(id)color
{
    return [self initText:text textColor:color font:nil];
}
+ (UILabel *)initText:(NSString *)text textColor:(id)color font:(id)font
{
    return [self initText:text textColor:color font:font textAlignment:NSTextAlignmentCenter];
}
+ (UILabel *)initText:(NSString *)text textColor:(id)color font:(id)font textAlignment:(NSTextAlignment)textAlignment
{
    return [self initText:text textColor:color font:font textAlignment:textAlignment backgroundColor:nil];
}
+ (UILabel *)initText:(NSString *)text textColor:(id)color font:(id)font backgroundColor:(id)backgroundColor
{
    return [self initText:text textColor:color font:font textAlignment:NSTextAlignmentCenter backgroundColor:backgroundColor];
}
+ (UILabel *)initText:(NSString *)text textColor:(id)color font:(id)font textAlignment:(NSTextAlignment)textAlignment backgroundColor:(id)backgroundColor;
{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = [UIColor mg_colorWithColorValue:color];
    label.textAlignment = textAlignment;
    label.backgroundColor = [UIColor mg_colorWithColorValue:backgroundColor];
    label.font = [UIFont mg_fontWithFontValue:font];
    return label;
}


@end
