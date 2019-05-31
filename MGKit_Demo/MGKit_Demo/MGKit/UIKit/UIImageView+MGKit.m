//
//  UIImageView+MGKit.m
//  MGKit
//
//  Created by maling on 2019/5/30.
//  Copyright © 2019 maling. All rights reserved.
//

#import "UIImageView+MGKit.h"
#import "UIImage+MGKit.h"
@implementation UIImageView (MGKit)

+ (UIImageView *)mg_imageview:(id)image
{
    return [self mg_imageview:image frame:CGRectZero];
}
+ (UIImageView *)mg_imageview:(id)image frame:(CGRect)frame
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage mg_image:image]];
    imageView.frame = frame;
    return imageView;
}
+ (UIImageView *)mg_imageViewFrame:(CGRect)frame
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    return imageView;
}

@end
