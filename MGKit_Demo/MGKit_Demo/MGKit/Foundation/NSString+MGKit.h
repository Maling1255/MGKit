//
//  NSString+MGKit.h
//  MGKit
//
//  Created by maling on 2019/5/30.
//  Copyright © 2019 maling. All rights reserved.
//

#import <UIKit/UIKit.h>

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
+ (CGSize)mg_sizeWithString:(NSString *)string Attributes:(nullable NSDictionary<NSAttributedStringKey, id> *)attributes andMaxSize:(CGSize)size;


/**
 MD5加密 32位小写

 @return 加密后的32位小写字符串
 */
- (NSString *)mg_MD5ForLower32Bate;
/**
 MD5加密 32位大写
 
 @return 加密后的32位大写字符串
 */
- (NSString *)mg_MD5ForUpper32Bate;
/**
 * MD5 hash
 */
- (NSString *)mg_MD5Hash;

/**
 MD5加密 16位小写
 
 @return 加密后的16位小写字符串
 */
- (NSString *)mg_MD5ForLower16Bate;
/**
 MD5加密 16大写

 @return 加密后的16位大写字符串
 */
- (NSString *)mg_MD5ForUpper16Bate;
/**
  明文 -> base64 加密后的字符串

 @return 加密字符串
 */
- (NSString *)mg_Base64EncodeString;
/**
 base64 加密字符串 -> 明文

 @return 原始字符串
 */
- (NSString *)mg_Base64DecodeString;


- (NSString *)hmacSHA1StringWithKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
