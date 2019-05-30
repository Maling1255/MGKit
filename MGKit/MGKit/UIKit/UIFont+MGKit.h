//
//  UIFont+MGKit.h
//  MGKit
//
//  Created by maling on 2019/5/30.
//  Copyright © 2019 maling. All rights reserved.
//

#import <UIKit/UIKit.h>

static inline void MGFontNameList() {
    
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    NSArray *fontFamilys = [UIFont familyNames];
    for (NSString *familyName in fontFamilys) {
        //        NSLog(@"family name : %@",familyName);
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for (NSString *fontName in fontNames) {
            //            NSLog(@"font name : %@",fontName);
            [tempArray addObject:fontName];
        }
    }
    
    NSArray *result = [tempArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    
    for (NSString *fontName in result) {
        NSLog(@"!fontName: %@", fontName);
    }
}

@interface UIFont (MGKit)

+ (UIFont *)mg_fontWithFontValue:(id)font;

+ (UIFont *)systemFontRegularOfSize:(CGFloat)size;
+ (UIFont *)systemFontMediumOfSize:(CGFloat)size;
+ (UIFont *)systemFontSemiboldOfSize:(CGFloat)size;
+ (UIFont *)systemFontLightOfSize:(CGFloat)size;
+ (UIFont *)systemFontThinOfSize:(CGFloat)size;
+ (UIFont *)systemFontBoldOfSize:(CGFloat)size;
+ (UIFont *)systemFontHeavyOfSize:(CGFloat)size;
+ (UIFont *)systemFontBlackOfSize:(CGFloat)size;
+ (UIFont *)systemFontUltraLightOfSize:(CGFloat)size;

@end

