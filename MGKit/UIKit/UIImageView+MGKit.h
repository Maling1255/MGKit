//
//  UIImageView+MGKit.h
//  MGKit
//
//  Created by maling on 2019/5/30.
//  Copyright © 2019 maling. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (MGKit)

+ (UIImageView *)mg_imageview:(id)image;
+ (UIImageView *)mg_imageview:(id)image frame:(CGRect)frame;
+ (UIImageView *)mg_imageViewFrame:(CGRect)frame;

@end


