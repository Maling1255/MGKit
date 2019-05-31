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
    
}


@end
