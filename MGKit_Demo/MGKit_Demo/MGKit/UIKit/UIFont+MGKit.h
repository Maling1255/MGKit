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

+ (UIFont *)mg_systemFontRegularOfSize:(CGFloat)size;
+ (UIFont *)mg_systemFontMediumOfSize:(CGFloat)size;
+ (UIFont *)mg_systemFontSemiboldOfSize:(CGFloat)size;
+ (UIFont *)mg_systemFontLightOfSize:(CGFloat)size;
+ (UIFont *)mg_systemFontThinOfSize:(CGFloat)size;
+ (UIFont *)mg_systemFontBoldOfSize:(CGFloat)size;
+ (UIFont *)mg_systemFontHeavyOfSize:(CGFloat)size;
+ (UIFont *)mg_systemFontBlackOfSize:(CGFloat)size;
+ (UIFont *)mg_systemFontUltraLightOfSize:(CGFloat)size;

@end

