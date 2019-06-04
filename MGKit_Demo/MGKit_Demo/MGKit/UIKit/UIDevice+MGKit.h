//
//  UIDevice+MGKit.h
//  MGKit_Demo
//
//  Created by maling on 2019/6/3.
//  Copyright © 2019 maling. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (MGKit)

/**
 * 获取系统版本
 */
+ (NSString *)mg_systemVersion;
/**
 * 获取设备类型名字 iPhone， iPod touch， iPad
 */
+ (NSString *)mg_deviceName;
/**
 * 设备的具体名字 iPhoneX iPhone 6s
 */
+ (NSString *)mg_deviceModelName;
/**
 * 获取UUID
 */
+ (NSString *)mg_UUID;
/**
 * 手机别名，用户自己定义的名字
 */
+ (NSString *)mg_aliasName;
/**
 * 设备名称
 */
+ (NSString *)mg_systemName;
/**
 * 手机运营商： 移动，联通 。。。
 */
+ (NSString *)mg_deviceOperator;
/**
 * 设备语言
 */
+ (NSString *)mg_deviceLanguage;
/**
 * 设备所在国家
 */
+ (NSString *)mg_deviceLocaleCountry;
/**
 * 判断是否是iPhone X系列的设备

 @return YES iPhone X系列设备
 */
+ (BOOL)mg_iPhoneXSeries;

@end

NS_ASSUME_NONNULL_END
