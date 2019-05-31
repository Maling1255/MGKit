//
//  UIWindow+MGKit.h
//  MGKit
//
//  Created by maling on 2019/5/31.
//  Copyright © 2019 maling. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIWindow (MGKit)

/**
 返回层次结构中顶部的导航控制器 | tabBar控制器

 @return 导航控制器
 */
- (UIViewController*)mg_topMostController;

/**
 当前控制器

 @return 当前显示的控制器
 */
- (UIViewController*)mg_currentViewController;

@end

NS_ASSUME_NONNULL_END
