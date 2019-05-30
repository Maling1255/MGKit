//
//  UIImageView+MGKit.m
//  MGKit
//
//  Created by maling on 2019/5/30.
//  Copyright © 2019 maling. All rights reserved.
//

#import "UIImageView+MGKit.h"

@implementation UIImageView (MGKit)

+ (UIImageView *)image:(id)image
{
    return [self image:image frame:CGRectZero];
}
+ (UIImageView *)image:(id)image frame:(CGRect)frame
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage mg_image:image]];
    imageView.frame = frame;
    return imageView;
}

@end
