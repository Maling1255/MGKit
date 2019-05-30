//
//  MGKit.h
//  MGKit
//
//  Created by maling on 2019/5/30.
//  Copyright © 2019 maling. All rights reserved.
//

#ifndef MGKit_h
#define MGKit_h

#import "UILabel+MGKit.h"
#import "UIColor+MGKit.h"
#import "UIFont+MGKit.h"
#import "UIView+MGKit.h"
#import "UIButton+MGKit.h"
#import "UIImage+MGKit.h"
#import "UINavigationBar+MGKit.h"
#import "UIImageView+MGKit.h"
#import "UIBezierPath+MGKit.h"

#import "NSString+MGKit.h"


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


#endif /* MGKit_h */
