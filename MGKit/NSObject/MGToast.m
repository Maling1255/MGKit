//
//  MGToast.m
//  MGKit
//
//  Created by maling on 2019/5/31.
//  Copyright © 2019 maling. All rights reserved.
//

#import "MGToast.h"
#import <UIKit/UIKit.h>
static BOOL _isShowing;
static UIView *kCustomView = nil;
static UIView* _view = nil;
#define viewTag 1000011

@implementation MGToast

+ (void)mg_show:(NSString *)text
{
    [self mg_show:text duration:2];
}
+ (void)mg_show:(NSString *)text duration:(int) duration
{
    dispatch_async(dispatch_get_main_queue(), ^{
        CGSize size = [UIScreen mainScreen].bounds.size;
        [self mg_show:text duration:duration viewTop:(size.height - 40) / 2];
    });
}

+ (void)mg_show:(NSString *)text duration:(CGFloat)duration viewTop:(CGFloat)y{
    if ([text isKindOfClass:[NSString class]] && text.length) {
        CGSize size = [UIScreen mainScreen].bounds.size;
        UILabel *label = [self label];
        label.text = text;
        [label sizeToFit];
        
        CGFloat labelWidth = label.bounds.size.width;
        CGFloat labelHeight = 0;
        CGFloat labelMax = size.width - 80;
        if (labelWidth > labelMax) {
            labelWidth = labelMax;
            labelHeight = [self textHeight:text fontInt:14 labelWidth:labelWidth];
        }else{
            labelHeight = 24;
        }
        
        label.frame = CGRectMake(20, 10, labelWidth, labelHeight);
        
        UIView *view = [self baseView];
        CGFloat viewWidth = labelWidth + 40;
        view.frame = CGRectMake((size.width - viewWidth) / 2, y, viewWidth, labelHeight + 20);
        [view addSubview:label];
        
        _view = view;
        [self mg_showCustomView:view duration:duration];
    }
}

+ (void)mg_showCustomView:(UIView *)view duration:(CGFloat)duration
{
    static NSTimeInterval time = 0;
    NSTimeInterval c = CFAbsoluteTimeGetCurrent();
    if (c - time > 15) {
        _isShowing = NO;
        time = c;
    }
    if (_isShowing) {
        return;
    }
    if ([view isKindOfClass:[UIView class]]) {
        _isShowing = YES;
        
        Class CLASS = NSClassFromString(@"FSWindow");
        NSArray *windows = [UIApplication sharedApplication].windows;
        UIWindow *lastObject = nil;
        for (int x = (int)windows.count - 1; x >= 0; x --) {
            lastObject = windows[x];
            if ((!lastObject.hidden) && CLASS && (![lastObject isKindOfClass:CLASS])) {
                break;
            }
        }
        if (lastObject) {
            [lastObject addSubview:view];
        }
        
        kCustomView = view;
        
        [UIView animateWithDuration:0.3 delay:duration options:UIViewAnimationOptionCurveEaseInOut animations:^{
            view.alpha = 0;
        } completion:^(BOOL finished) {
            _isShowing = NO;
            
            for (UIView *subview in view.subviews) {
                [subview removeFromSuperview];
            }
            [view removeFromSuperview];
        }];
    }
}

+ (CGFloat)textHeight:(NSString *)text fontInt:(NSInteger)fontInt labelWidth:(CGFloat)labelWidth{
    if(text){
        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:text];
        NSRange allRange = [text rangeOfString:text];
        [attrStr addAttribute:NSFontAttributeName
                        value:[UIFont systemFontOfSize:fontInt]
                        range:allRange];
        
        NSStringDrawingOptions options =  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
        CGRect rect = [attrStr boundingRectWithSize:CGSizeMake(labelWidth, CGFLOAT_MAX)
                                            options:options
                                            context:nil];
        return ceilf(rect.size.height);
    }
    return 0;
}

+ (UIView *)baseView{
    static UIColor *backColor = nil;
    if (!backColor) {
        backColor = [UIColor colorWithRed:73 / 255.0 green:80 / 255.0 blue:86 / 255.0 alpha:.9];
    }
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 40)];
    view.backgroundColor = backColor;
    view.layer.cornerRadius = 3;
    return view;
}

+ (UILabel *)label{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 8, 0, 24)];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor whiteColor];
    return label;
}


@end
