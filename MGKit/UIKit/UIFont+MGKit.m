//
//  UIFont+MGKit.m
//  MGKit
//
//  Created by maling on 2019/5/30.
//  Copyright © 2019 maling. All rights reserved.
//

#import "UIFont+MGKit.h"

@implementation UIFont (MGKit)

+ (UIFont *)mg_fontWithFontValue:(id)font
{
    if (font && [font isKindOfClass:[UIFont class]]) {
        return font;
    } else {
        if (font) {
            NSNumber *fontNumber = (NSNumber *)font;
            return [UIFont systemFontOfSize:fontNumber.floatValue];
        } else {
            return nil;
        }
    }
}

+ (UIFont *)mg_systemFontRegularOfSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size weight:UIFontWeightRegular];
}
+ (UIFont *)mg_systemFontMediumOfSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size weight:UIFontWeightMedium];
}
+ (UIFont *)mg_systemFontSemiboldOfSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size weight:UIFontWeightSemibold];
}
+ (UIFont *)mg_systemFontLightOfSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size weight:UIFontWeightLight];
}
+ (UIFont *)mg_systemFontThinOfSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size weight:UIFontWeightThin];
}
+ (UIFont *)mg_systemFontBoldOfSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size weight:UIFontWeightBold];
}
+ (UIFont *)mg_systemFontHeavyOfSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size weight:UIFontWeightHeavy];
}
+ (UIFont *)mg_systemFontBlackOfSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size weight:UIFontWeightBlack];
}
+ (UIFont *)mg_systemFontUltraLightOfSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size weight:UIFontWeightUltraLight];
}

@end
