//
//  UILabel+MGKit.h
//  MGKit
//
//  Created by maling on 2019/4/24.
//  Copyright © 2019 maling. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (MGKit)

+ (UILabel *)initText:(NSString *)text;
+ (UILabel *)initText:(NSString *)text textColor:(id)color;
+ (UILabel *)initText:(NSString *)text textColor:(id)color font:(id)font;
+ (UILabel *)initText:(NSString *)text textColor:(id)color font:(id)font backgroundColor:(id)backgroundColor;
+ (UILabel *)initText:(NSString *)text textColor:(id)color font:(id)font textAlignment:(NSTextAlignment)textAlignment;
+ (UILabel *)initText:(NSString *)text textColor:(id)color font:(id)font textAlignment:(NSTextAlignment)textAlignment backgroundColor:(id)backgroundColor;


@end
