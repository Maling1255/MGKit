//
//  MGToast.h
//  MGKit
//
//  Created by maling on 2019/5/31.
//  Copyright © 2019 maling. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MGToast : NSObject

+ (void)mg_show:(NSString*) text;
+ (void)mg_show:(NSString *)text duration:(int) duration;
//+ (void)mg_showCustomView:(UIView *)view duration:(CGFloat)duration;

@end

