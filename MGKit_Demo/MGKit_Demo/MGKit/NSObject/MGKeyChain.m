//
//  MGKeyChain.m
//  MGKit_Demo
//
//  Created by maling on 2019/6/3.
//  Copyright © 2019 maling. All rights reserved.
//

#import "MGKeyChain.h"
#import  <Security/Security.h>

@implementation MGKeyChain

+ (NSMutableDictionary *)mg_getKeychainQuery:(NSString *)key
{
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (id)kSecClassGenericPassword,(id)kSecClass,
            key, (id)kSecAttrService,
            key, (id)kSecAttrAccount,
            (id)kSecAttrAccessibleAfterFirstUnlock,(id)kSecAttrAccessible, nil];
}
+ (void)mg_saveData:(id)data forKey:(NSString *)key
{
    //获得keychain字典
    NSMutableDictionary *keychainQuery = [self mg_getKeychainQuery:key];
    //删除旧值
    SecItemDelete((CFDictionaryRef)keychainQuery);
    //添加新值
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    // 将新的信息添加到keychain中
    SecItemAdd((CFDictionaryRef)keychainQuery, NULL);
}

+ (id)mg_readDataForKey:(NSString *)key
{
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self mg_getKeychainQuery:key];
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keychainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"存储失败，key-- %@  exception-- %@", key, e);
        } @finally {
        }
    }
    if (keyData) {
        CFRelease(keyData);
    }
    return ret;
}

+ (void)mg_deleteKeyData:(NSString *)key
{
    NSMutableDictionary *keychainQuery = [self mg_getKeychainQuery:key];
    SecItemDelete((CFDictionaryRef)keychainQuery);
}

@end
