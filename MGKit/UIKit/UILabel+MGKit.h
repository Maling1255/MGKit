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


@end
