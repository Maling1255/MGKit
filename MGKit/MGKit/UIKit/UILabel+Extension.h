//
//  UILabel+Extension.h
//  MGKit
//
//  Created by maling on 2019/2/15.
//  Copyright © 2019 maling. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UILabel (Extension)

- (UILabel * (^)(UIView *view))showUpSuperView;

- (UILabel * (^)(NSString *title))titleSet;
- (UILabel * (^)(id font))fontSet;
- (UILabel * (^)(id color))textColorSet;
- (UILabel * (^)(id color))backgroundColorsSet;
- (UILabel * (^)(CGRect frame))frameSet;
- (UILabel * (^)(NSTextAlignment textAlignment))textAlignmentSet;
- (UILabel * (^)(NSAttributedString *attributedText))attributedTextSet;

- (UILabel * (^)(CGFloat radius))cornerRadiusSet;


//- (nonnull MGViewProperty *)viewProperty;
//@property (nonatomic) MGViewProperty * _Nullable ownViewProperty;

@end

