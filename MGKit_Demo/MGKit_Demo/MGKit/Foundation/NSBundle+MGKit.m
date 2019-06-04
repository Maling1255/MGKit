//
//  NSBundle+MGKit.m
//  MGKit_Demo
//
//  Created by maling on 2019/6/3.
//  Copyright © 2019 maling. All rights reserved.
//

#import "NSBundle+MGKit.h"

@implementation NSBundle (MGKit)

+ (NSString *)mg_applicationBundleIdentifier
{
    return [NSBundle mainBundle].bundleIdentifier;
}
+ (NSString *)mg_applicationVersionCode
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)@"CFBundleShortVersionString"];
}
+ (NSString *)mg_applicationBuildVersionCode
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleVersionKey];
}

@end
