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

+ (UIFont *)systemFontRegularOfSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size weight:UIFontWeightRegular];
}
+ (UIFont *)systemFontMediumOfSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size weight:UIFontWeightMedium];
}
+ (UIFont *)systemFontSemiboldOfSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size weight:UIFontWeightSemibold];
}
+ (UIFont *)systemFontLightOfSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size weight:UIFontWeightLight];
}
+ (UIFont *)systemFontThinOfSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size weight:UIFontWeightThin];
}
+ (UIFont *)systemFontBoldOfSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size weight:UIFontWeightBold];
}
+ (UIFont *)systemFontHeavyOfSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size weight:UIFontWeightHeavy];
}
+ (UIFont *)systemFontBlackOfSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size weight:UIFontWeightBlack];
}
+ (UIFont *)systemFontUltraLightOfSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size weight:UIFontWeightUltraLight];
}

@end
