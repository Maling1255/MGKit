//
//  UILabel+MGKit.h
//  MGKit
//
//  Created by maling on 2019/4/24.
//  Copyright © 2019 maling. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (MGKit)

+ (UILabel *)mg_labelText:(NSString *)text;
+ (UILabel *)mg_labelText:(NSString *)text textColor:(id)color;
+ (UILabel *)mg_labelText:(NSString *)text textColor:(id)color font:(id)font;
+ (UILabel *)mg_labelText:(NSString *)text textColor:(id)color font:(id)font backgroundColor:(id)backgroundColor;
+ (UILabel *)mg_labelText:(NSString *)text textColor:(id)color font:(id)font textAlignment:(NSTextAlignment)textAlignment;
+ (UILabel *)mg_labelText:(NSString *)text textColor:(id)color font:(id)font textAlignment:(NSTextAlignment)textAlignment backgroundColor:(id)backgroundColor;

/**
 *  改变行间距
 */
+ (void)mg_changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变字间距
 */
+ (void)mg_changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变行间距和字间距
 */
+ (void)mg_changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;

@end
