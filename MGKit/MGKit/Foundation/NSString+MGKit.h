//
//  NSString+MGKit.h
//  MGKit
//
//  Created by maling on 2019/5/30.
//  Copyright © 2019 maling. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (MGKit)

/**
 计算文本的宽高

 @param string 文本
 @param font 字体大小
 @param size 限制宽高
 @return 得到实际的宽高size
 */
+ (CGSize)mg_sizeWithString:(NSString *)string andFont:(UIFont *)font andMaxSize:(CGSize)size;
+ (CGFloat)mg_widthWithString:(NSString *)string andFont:(UIFont *)font andMaxSize:(CGSize)size;
+ (CGFloat)mg_heightWithString:(NSString *)string andFont:(UIFont *)font andMaxSize:(CGSize)size;
- (CGSize)mg_sizeWithAttributes:(nullable NSDictionary<NSAttributedStringKey, id> *)attributes andMaxSize:(CGSize)size;


@end

NS_ASSUME_NONNULL_END
