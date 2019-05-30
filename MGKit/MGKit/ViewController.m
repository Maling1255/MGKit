//
//  ViewController.m
//  MGKit
//
//  Created by maling on 2019/2/15.
//  Copyright © 2019 maling. All rights reserved.
//

#import "ViewController.h"
#import "MGLabel.h"
#import "UIView+MGKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UILabel *titleLbl = MGObject(UILabel)
    .titleSet(@"测试哦三测试哦三测试哦三测试哦三测试哦三测试哦三测试哦三测试哦三测试哦三测试哦三测试哦三")
    .backgroundColorsSet(@"333333")
    .frameSet(CGRectMake(100, 300, 200, 50))
    .textColorSet([UIColor cyanColor])
    .fontSet(@50)
    .showUpSuperView(self.view)
    .textAlignmentSet(NSTextAlignmentRight)
    .cornerRadiusSet(20);
    
    
//    [titleLbl cornerRadius:25];
    
    titleLbl.layer.shadowColor = [UIColor redColor].CGColor;
    titleLbl.layer.shadowRadius = 10;
    titleLbl.layer.shadowOffset = CGSizeMake(10, 10);
    
    [titleLbl.layer setShadowPath:[[UIBezierPath bezierPathWithRect:titleLbl.bounds] CGPath]];
    
    
    
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:@"222"];
    titleLbl.attributedTextSet(att);
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 300, 200, 200)];
    view.backgroundColor = [UIColor blueColor];
    view.right = self.view.width - 10;
    
    view.center = titleLbl.center;
    
    [view mg_shadowRadius:20 offset:CGSizeMake(10, 10) opacity:1 color:@"4ff02b" path:nil];
    [self.view addSubview:view];
    
    [self.navigationController.navigationBar mg_backgroundColor:@"333333"];
    
    
    
    NSLog(@"KK %@", titleLbl.text);

}


@end
