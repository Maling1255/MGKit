//
//  NSString+MGKit.m
//  MGKit
//
//  Created by maling on 2019/5/30.
//  Copyright © 2019 maling. All rights reserved.
//

#import "NSString+MGKit.h"

@implementation NSString (MGKit)

+ (CGSize)mg_sizeWithString:(NSString *)string andFont:(UIFont *)font andMaxSize:(CGSize)size
{
    if (!string.length || !font) {
        return CGSizeZero;
    }
    CGRect rect = [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil];
    CGSize getSize = CGSizeMake(ceil(rect.size.width), ceil(rect.size.height));
    return getSize;
}

+ (CGFloat)mg_widthWithString:(NSString *)string andFont:(UIFont *)font andMaxSize:(CGSize)size
{
    return [self mg_sizeWithString:string andFont:font andMaxSize:size].width;
}

+ (CGFloat)mg_heightWithString:(NSString *)string andFont:(UIFont *)font andMaxSize:(CGSize)size
{
    return [self mg_sizeWithString:string andFont:font andMaxSize:size].height;
}

- (CGSize)mg_sizeWithAttributes:(nullable NSDictionary<NSAttributedStringKey, id> *)attributes andMaxSize:(CGSize)size
{
    CGRect rect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil];
    CGSize getSize = CGSizeMake(ceil(rect.size.width), ceil(rect.size.height));
    return getSize;
}


@end
