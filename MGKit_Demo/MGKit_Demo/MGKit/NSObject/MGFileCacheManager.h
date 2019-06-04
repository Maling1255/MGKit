//
//  MGFileCacheManager.h
//  MGKit_Demo
//
//  Created by maling on 2019/6/3.
//  Copyright © 2019 maling. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MGFileCacheManager : NSObject

/**
 *  把对象归档存到沙盒里Cache路径下
 */
+ (BOOL)mg_saveObject:(id)object byFileName:(NSString*)fileName;
/**
 *  通过文件名从沙盒中找到归档的对象
 */
+ (id)mg_readObjectByFileName:(NSString*)fileName;
/**
 *  根据文件名删除沙盒中的归档对象
 */
+ (void)mg_removeObjectByFileName:(NSString*)fileName;
/**
 *  存储用户偏好设置 到 NSUserDefults
 */
+ (void)mg_saveUserData:(id)data forKey:(NSString*)key;
/**
 *  读取用户偏好设置
 */
+(id)mg_readUserDataForKey:(NSString*)key;
/**
 *  删除用户偏好设置
 */
+(void)mg_removeUserDataForkey:(NSString*)key;


@end

NS_ASSUME_NONNULL_END
