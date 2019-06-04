//
//  NSString+MGKit.m
//  MGKit
//
//  Created by maling on 2019/5/30.
//  Copyright © 2019 maling. All rights reserved.
//

#import "NSString+MGKit.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>

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

+ (CGSize)mg_sizeWithString:(NSString *)string Attributes:(nullable NSDictionary<NSAttributedStringKey, id> *)attributes andMaxSize:(CGSize)size
{
    CGRect rect = [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil];
    CGSize getSize = CGSizeMake(ceil(rect.size.width), ceil(rect.size.height));
    return getSize;
}

#pragma mark - MD5
- (NSString *)mg_MD5ForLower32Bate
{
    //要进行UTF8的转码
    const char* input = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *changeStr = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [changeStr appendFormat:@"%02x", result[i]];
    }
    
    return changeStr;
}
- (NSString *)mg_MD5ForUpper32Bate
{
    //要进行UTF8的转码
    const char* input = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *changeStr = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [changeStr appendFormat:@"%02X", result[i]];
    }
    
    return changeStr;
}
- (NSString *)mg_MD5ForLower16Bate
{
    NSString *md5Str = [self mg_MD5ForLower32Bate];
    NSString  *string;
    for (int i=0; i<24; i++) {
        string=[md5Str substringWithRange:NSMakeRange(8, 16)];
    }
    return string;
}
- (NSString *)mg_MD5ForUpper16Bate
{
    NSString *md5Str = [self mg_MD5ForUpper32Bate];
    
    NSString  *string;
    for (int i=0; i<24; i++) {
        string=[md5Str substringWithRange:NSMakeRange(8, 16)];
    }
    return string;
}

- (NSString *)mg_MD5Hash
{
    CC_MD5_CTX md5;
    CC_MD5_Init (&md5);
    CC_MD5_Update (&md5, [self UTF8String], (CC_LONG) [self length]);
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final (digest, &md5);
    NSString *s = [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                   digest[0],  digest[1],
                   digest[2],  digest[3],
                   digest[4],  digest[5],
                   digest[6],  digest[7],
                   digest[8],  digest[9],
                   digest[10], digest[11],
                   digest[12], digest[13],
                   digest[14], digest[15]];
    
    return s;
}

- (NSString *)mg_Base64EncodeString
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSString *stringBase64 = [data base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    return stringBase64;
}

- (NSString *)mg_Base64DecodeString
{
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSString *string =[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return string;
}

- (NSString *)hmacSHA1StringWithKey:(NSString *)key
{
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *messageData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableData *mutableData = [NSMutableData dataWithLength:CC_SHA1_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA1, keyData.bytes, keyData.length, messageData.bytes, messageData.length, mutableData.mutableBytes);
    
    return [self stringFromBytes:(unsigned char *)mutableData.bytes length:(int)mutableData.length];
}
- (NSString *)stringFromBytes:(unsigned char *)bytes length:(int)length
{
    NSMutableString *mutableString = @"".mutableCopy;
    for (int i = 0; i < length; i++)
        [mutableString appendFormat:@"%02x", bytes[i]];
    return [NSString stringWithString:mutableString];
}

@end
