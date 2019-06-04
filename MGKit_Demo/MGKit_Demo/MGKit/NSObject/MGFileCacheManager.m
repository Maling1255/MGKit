//
//  MGFileCacheManager.m
//  MGKit_Demo
//
//  Created by maling on 2019/6/3.
//  Copyright © 2019 maling. All rights reserved.
//

#import "MGFileCacheManager.h"
#import "NSFileManager+MGKit.h"
@implementation MGFileCacheManager

// 把对象归档存到沙盒里
+ (BOOL)mg_saveObject:(id)object byFileName:(NSString *)fileName
{
    NSString *path  = [self mg_appendFilePath:fileName];
    path = [path stringByAppendingString:@".archive"];
    BOOL success = [NSKeyedArchiver archiveRootObject:object toFile:path];
    return success;
}
// 通过文件名从沙盒中找到归档的对象
+ (id)mg_readObjectByFileName:(NSString*)fileName {
    NSString *path  = [self mg_appendFilePath:fileName];
    path = [path stringByAppendingString:@".archive"];
    id obj =  [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    return obj;
}

// 根据文件名删除沙盒中的文件
+ (void)mg_removeObjectByFileName:(NSString *)fileName {
    NSString *path  = [self mg_appendFilePath:fileName];
    path = [path stringByAppendingString:@".archive"];
    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}
/// 拼接文件名
+ (NSString *)mg_appendFilename:(NSString *)fileName {
    
    // 1. 沙盒缓存路径
    NSString *cachesPath = [NSFileManager mg_cachesPath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:cachesPath isDirectory:nil]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:cachesPath withIntermediateDirectories:NO attributes:nil error:nil];
    }
    return cachesPath;
}
/// 拼接文件路径
+ (NSString *)mg_appendFilePath:(NSString *)fileName {
    
    // 1. 沙盒缓存路径
    NSString *cachesPath = [NSFileManager mg_cachesPath];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@",cachesPath,fileName];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:nil]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:filePath withIntermediateDirectories:NO attributes:nil error:nil];
    }
    
    return filePath;
}

#pragma mark - User Default
// 存储用户偏好设置
+ (void)mg_saveUserData:(id)data forKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

// 读取用户偏好设置
+ (id)mg_readUserDataForKey:(NSString *)key
{
    id obj = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return obj;
}

// 删除用户偏好设置
+ (void)mg_removeUserDataForkey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
