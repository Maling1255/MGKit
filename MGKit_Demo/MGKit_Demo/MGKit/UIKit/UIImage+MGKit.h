//
//  UIImage+MGKit.h
//  MGKit
//
//  Created by maling on 2019/5/30.
//  Copyright © 2019 maling. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MGKit)

+ (UIImage *)mg_image:(id)image;

/**
 根据颜色生成image

 @param color color
 @return 生成的image
 */
+ (UIImage *)mg_imageWithColor:(id)color;

/**
 获取image的主要色值
 
 @param image 取色值的image
 @return 十六进制色值
 */
+ (NSString *)mg_hexColorObtainFromImage:(UIImage *)image;

/**
 压缩图片质量
  NSData *imageData = UIImageJPEGRepresentation(newImage, 0.5);
   imageData.length
 @param maxLength 设置指定的最大质量
 @return 压缩后的data
 */
- (NSData *)mg_compressWithMaxLength:(NSUInteger)maxLength;

/**
 修改图片的尺寸大小

 @param maxLength 设置指定的最大范围
 @return 修改后的尺寸大小
 */
- (NSData *)mg_alterSizeWithMaxLength:(NSUInteger)maxLength;

/**
 获取一张模糊图片

 @param image 原image
 @param blurNumber 模糊值 (范围 0 - 1)
 @return 返回一张模糊后的图片
 */
+ (UIImage *)mg_blurImage:(UIImage *)image blurNumber:(CGFloat)blurNumber;

@end
