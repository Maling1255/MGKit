//
//  NSFileManager+MGKit.m
//  MGKit_Demo
//
//  Created by maling on 2019/6/3.
//  Copyright © 2019 maling. All rights reserved.
//

#import "NSFileManager+MGKit.h"

@implementation NSFileManager (MGKit)

+ (NSURL *)mg_URLForDirectory:(NSSearchPathDirectory)directory {
    return [self.defaultManager URLsForDirectory:directory inDomains:NSUserDomainMask].lastObject;
}
+ (NSString *)mg_pathForDirectory:(NSSearchPathDirectory)directory {
    return NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES)[0];
}
+ (NSURL *)mg_documentsURL
{
    return [self mg_URLForDirectory:NSDocumentDirectory];
}
+ (NSString *)mg_documentsPath
{
    return [self mg_pathForDirectory:NSDocumentDirectory];
}
+ (NSURL *)mg_libraryURL
{
    return [self mg_URLForDirectory:NSLibraryDirectory];
}
+ (NSString *)mg_libraryPath
{
    return [self mg_pathForDirectory:NSLibraryDirectory];
}
+ (NSURL *)mg_cachesURL
{
    return [self mg_URLForDirectory:NSCachesDirectory];
}
+ (NSString *)mg_cachesPath
{
    return [self mg_pathForDirectory:NSCachesDirectory];
}
+ (NSString *)mg_tmpDirectoryPath
{
    return NSTemporaryDirectory();
}

@end
