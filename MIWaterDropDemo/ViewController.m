//
//  ViewController.m
//  MIWaterDropDemo
//
//  Created by lynnjinglei on 15/10/28.
//  Copyright © 2015年 XiaoLei. All rights reserved.
//

#import "ViewController.h"
#import "MIWaterDropView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadWaterDropView];
}

- (void)loadWaterDropView
{
    MIWaterDropView *waterDropView = [[MIWaterDropView alloc]initWithFrame:CGRectMake(100, 100, 100, 50 + (50/cos(M_PI/3)))];//100为水滴的宽体，半径r为一半。高度需要计算 50 + (50/cos(M_PI/3))
    [self.view addSubview:waterDropView];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
