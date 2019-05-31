//
//  UINavigationBar+MGKit.m
//  MGKit
//
//  Created by maling on 2019/5/30.
//  Copyright © 2019 maling. All rights reserved.
//

#import "UINavigationBar+MGKit.h"
#import <objc/runtime.h>
#import "UIColor+MGKit.h"

static const NSString *overlayerkey = @"overlayerkey";
@implementation UINavigationBar (MGKit)

- (UIView*)overlayer
{
    return objc_getAssociatedObject(self, &overlayerkey);
}

- (void)setOverlayer:(UIView*)overlayer
{
    objc_setAssociatedObject(self, &overlayerkey, overlayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark --
- (void)mg_backgroundColor:(id)backgroundColor
{
    if (!self.overlayer)
    {
        [self setBackgroundImage:[UIImage new] forBarMetrics:(UIBarMetricsDefault)];
        
        CGFloat statusBarHeight = iPhoneXSeries() ? 44 : 20;
        
        self.overlayer = [[UIView alloc] initWithFrame:CGRectMake(0,  -statusBarHeight, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + statusBarHeight)];
        self.overlayer.userInteractionEnabled = NO;
        self.overlayer.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self insertSubview:self.overlayer atIndex:0];
    }
    self.overlayer.backgroundColor = [UIColor mg_colorWithColorValue:backgroundColor];
}

static inline BOOL iPhoneXSeries() {
    BOOL iPhoneXSeries = NO;
    if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
        return iPhoneXSeries;
    }
    
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            iPhoneXSeries = YES;
        }
    }
    return iPhoneXSeries;
}


@end
