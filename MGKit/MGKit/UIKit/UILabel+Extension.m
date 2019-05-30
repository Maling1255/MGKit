//
//  UILabel+Extension.m
//  MGKit
//
//  Created by maling on 2019/2/15.
//  Copyright © 2019 maling. All rights reserved.
//

#import "UILabel+Extension.h"
#import <objc/runtime.h>

@implementation UILabel (Extension)

- (UILabel * (^)(UIView *view))showUpSuperView
{
    __weak typeof(self)weakSelf = self;
    return ^(UIView * view) {
        
        [view addSubview:weakSelf];
        return self;
    };
}

- (UILabel * (^)(NSString *title))titleSet;
{
    return ^(NSString *title) {
         self.text = title;
        return self;
    };
}

- (UILabel * (^)(id font))fontSet
{
    return ^(id font) {
        self.font = [self getFontWithFontValue:font];
        return self;
    };
}

- (UILabel * (^)(id color))textColorSet
{
    return ^(id color) {
        self.textColor = [self getColorWithColorValue:color];
        return self;
    };
}


- (UILabel * (^)(id color))backgroundColorsSet
{
    return ^(id color) {
        self.backgroundColor = [self getColorWithColorValue:color];
        return self;
    };
}

- (UILabel * (^)(CGRect frame))frameSet
{
    return ^(CGRect frame) {
        self.frame = frame;
        return self;
    };
}
- (UILabel * (^)(NSTextAlignment textAlignment))textAlignmentSet
{
    return ^(NSTextAlignment textAlignment) {
        self.textAlignment = textAlignment;
        return self;
    };
}
- (UILabel * (^)(CGFloat radius))cornerRadiusSet
{
    return ^(CGFloat radius) {
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
        return self;
    };
}
- (UILabel * (^)(NSAttributedString *attributedText))attributedTextSet
{
    return ^(NSAttributedString *attributedText) {
        self.attributedText = attributedText;
        return self;
    };
}

- (UIFont *)getFontWithFontValue:(id)font
{
    if (font && [font isKindOfClass:[UIFont class]]) {
        return font;
    } else {
        NSNumber *fontNumber = (NSNumber *)font;
        return [UIFont systemFontOfSize:fontNumber.floatValue];
    }
}

- (UIColor *)getColorWithColorValue:(id)color
{
    if (color && [[color class] isSubclassOfClass:[NSString class]]) {
        NSString *colorString = [NSString stringWithFormat:@"%@", color];
        return [self colorWithHexColorString:colorString alpha:1];
    } else if (color && [[color class] isSubclassOfClass:[UIColor class]]) {
        return (UIColor *)color;
    }
    return nil;
}

- (UIColor *)colorWithHexColorString:(NSString *)hexColorString alpha:(float)alpha
{
    unsigned int red, green, blue;
    NSRange range;
    range.length = 2;
    range.location = 0;
    [[NSScanner scannerWithString:[hexColorString substringWithRange:range]]scanHexInt:&red];
    range.location = 2;
    [[NSScanner scannerWithString:[hexColorString substringWithRange:range]]scanHexInt:&green];
    range.location = 4;
    [[NSScanner scannerWithString:[hexColorString substringWithRange:range]]scanHexInt:&blue];
    UIColor *color = [UIColor colorWithRed:(float)(red/255.0f)green:(float)(green/255.0f)blue:(float)(blue/255.0f)alpha:alpha];
    return color;
}








//- (MGViewProperty *)ownViewProperty
//{
//    MGViewProperty *ownViewProperty = objc_getAssociatedObject(self, _cmd);
//    
//    if (!ownViewProperty) {
//        
//        objc_setAssociatedObject(self, @selector(ownViewProperty), [[MGViewProperty alloc] init], OBJC_ASSOCIATION_RETAIN);
//    }
//    
//    return objc_getAssociatedObject(self, _cmd);
//}
//
//- (void)setOwnViewProperty:(MGViewProperty *)ownViewProperty
//{
//    objc_setAssociatedObject(self, @selector(ownViewProperty), ownViewProperty, OBJC_ASSOCIATION_RETAIN);
//}
//
//- (nonnull MGViewProperty *)viewProperty
//{
//    MGViewProperty *property = [self ownViewProperty];
//    
//    if (!property)
//    {
//        property = [[MGViewProperty alloc] init];
//        [self setOwnViewProperty:property];
//    }
//    
//    return property;
//}

@end
