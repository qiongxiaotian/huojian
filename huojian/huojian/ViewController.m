//
//  ViewController.m
//  huojian
//
//  Created by yb on 17/1/8.
//  Copyright © 2017年 yb. All rights reserved.
//

#import "ViewController.h"
#import "XYAlterView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    XYAlterView *alert = [[XYAlterView alloc]initWithFrame:self.view.frame];
    XYAlterView *alert = [XYAlterView alterViewWithTitle:@"1" content:@"系统版本有更新需要更新吗" cancel:@"稍后更新" sure:@"现在更新" cancelBtClcik:^{
        NSLog(@"稍后");
    } sureBtClcik:^{
        NSLog(@"现在");
    }];
    
    [self.view addSubview:alert];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
