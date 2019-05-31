//
//  UIWindow+MGKit.m
//  MGKit
//
//  Created by maling on 2019/5/31.
//  Copyright © 2019 maling. All rights reserved.
//

#import "UIWindow+MGKit.h"

@implementation UIWindow (MGKit)

- (UIViewController *)mg_topMostController
{
    UIViewController *topController = [self rootViewController];
    while ([topController presentedViewController]) topController = [topController presentedViewController];
    return topController;
}
- (UIViewController *)mg_currentViewController
{
    UIViewController *currentViewController = [self mg_topMostController];
    
    while ([currentViewController isKindOfClass:[UINavigationController class]] &&
           [(UINavigationController*)currentViewController topViewController])
        
        currentViewController = [(UINavigationController*)currentViewController topViewController];
    return currentViewController;
}

@end
