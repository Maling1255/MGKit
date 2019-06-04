//
//  NSFileManager+MGKit.h
//  MGKit_Demo
//
//  Created by maling on 2019/6/3.
//  Copyright © 2019 maling. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSFileManager (MGKit)

/**
 * 获取Documents目录的URL
 */
+ (NSURL *)mg_documentsURL;
/**
 * 沙盒 document 路径
 */
+ (NSString *)mg_documentsPath;
/**
 * 获取 library 目录的URL
 */
+ (NSURL *)mg_libraryURL;
/**
 * 沙盒 library 路径
 */
+ (NSString *)mg_libraryPath;
/**
 * 获取 caches 目录的URL
 */
+ (NSURL *)mg_cachesURL;
/**
 * 沙盒 caches 路径
 */
+ (NSString *)mg_cachesPath;
/**
 * temp 路径
 */
+ (NSString *)mg_tmpDirectoryPath;

@end

