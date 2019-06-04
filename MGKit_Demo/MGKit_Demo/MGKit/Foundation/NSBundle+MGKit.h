//
//  NSBundle+MGKit.h
//  MGKit_Demo
//
//  Created by maling on 2019/6/3.
//  Copyright © 2019 maling. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (MGKit)

/**
 * 产品包名
 */
+ (NSString *)mg_applicationBundleIdentifier;
/**
 * 产品版本号
 */
+ (NSString *)mg_applicationVersionCode;
/**
 * build 版本号
 */
+ (NSString *)mg_applicationBuildVersionCode;


@end

