//
//  MGKeyChain.h
//  MGKit_Demo
//
//  Created by maling on 2019/6/3.
//  Copyright © 2019 maling. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MGKeyChain : NSObject

/**
 以钥匙串的方式存储数据，更具 key 写入到钥匙串中

 @param data 需要存储的数据
 @param key 更具 key 值存储
 */
+ (void)mg_saveData:(id)data forKey:(NSString *)key;
/**
 根据 key 值从钥匙串中取出要存储的数据

 @param key key
 @return 存储的数据
 */
+ (id)mg_readDataForKey:(NSString *)key;

/**
  根据 key 删除已存储的数据

 @param key key
 */
+ (void)mg_deleteKeyData:(NSString *)key;

@end

