//
//  ViewController.m
//  MGKit_Demo
//
//  Created by maling on 2019/5/31.
//  Copyright © 2019 maling. All rights reserved.
//

#import "ViewController.h"
#import "MGKit/MGKit.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 300, 200, 200)];
    view.backgroundColor = [UIColor lightGrayColor];
    view.right = self.view.width - 10;
    
    [view mg_shadowRadius:20 offset:CGSizeMake(10, 10) opacity:1 color:@"4ff02b" path:nil];
    [self.view addSubview:view];
    
    [view mg_addDottedLine];
    
    UILabel * lbl = [[UILabel alloc] init];
    
    
    lbl.frame = CGRectMake(100, view.bottom + 50, 100, 50);
    
    lbl.backgroundColor = [UIColor mg_randomColor];
    [self.view addSubview:lbl];
    
    [lbl mg_cornerRadius:10 corners:UIRectCornerTopLeft | UIRectCornerBottomRight];
    
    NSString *string = @"123456";
    
    NSLog(@"加密后的字符串 %@", [string mg_MD5ForLower16Bate]);
    
    NSString *encode = [string mg_Base64EncodeString];
    NSLog(@"64: %@", encode);
    
   NSString *decode = [encode mg_Base64DecodeString];
    NSLog(@"encode: %@", decode);
    
    
}


@end
