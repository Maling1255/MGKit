//
//  UILabel+MGKit.m
//  MGKit
//
//  Created by maling on 2019/4/24.
//  Copyright © 2019 maling. All rights reserved.
//

#import "UILabel+MGKit.h"
#import "UIColor+MGKit.h"
#import "UIFont+MGKit.h"

@implementation UILabel (MGKit)

+ (UILabel *)mg_labelText:(NSString *)text
{
    return [self mg_labelText:text textColor:nil];
}
+ (UILabel *)mg_labelText:(NSString *)text textColor:(id)color
{
    return [self mg_labelText:text textColor:color font:nil];
}
+ (UILabel *)mg_labelText:(NSString *)text textColor:(id)color font:(id)font
{
    return [self mg_labelText:text textColor:color font:font textAlignment:NSTextAlignmentCenter];
}
+ (UILabel *)mg_labelText:(NSString *)text textColor:(id)color font:(id)font textAlignment:(NSTextAlignment)textAlignment
{
    return [self mg_labelText:text textColor:color font:font textAlignment:textAlignment backgroundColor:nil];
}
+ (UILabel *)mg_labelText:(NSString *)text textColor:(id)color font:(id)font backgroundColor:(id)backgroundColor
{
    return [self mg_labelText:text textColor:color font:font textAlignment:NSTextAlignmentCenter backgroundColor:backgroundColor];
}
+ (UILabel *)mg_labelText:(NSString *)text textColor:(id)color font:(id)font textAlignment:(NSTextAlignment)textAlignment backgroundColor:(id)backgroundColor;
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
