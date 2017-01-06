//
//  MYViewController.m
//  Autolayout
//
//  Created by 尚进 on 15/12/31.
//  Copyright © 2015年 尚进. All rights reserved.
//

#import "MYViewController.h"

@interface MYViewController ()

@end

@implementation MYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    1.添加控件
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor=[UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:blueView];
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor=[UIColor redColor];
    redView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:redView];
    
    NSArray *cont=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[blueView]-20-|" options:0 metrics:nil views:@{@"blueView" : blueView}];
    [self.view addConstraints:cont];
    
    NSArray *conts=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[blueView(40)]-20-[redView(==blueView)]" options:NSLayoutFormatAlignAllRight metrics:nil views:@{@"blueView" : blueView, @"redView" : redView}];
    [self.view addConstraints:conts];
    // 让红色宽度＝蓝色宽度＊0.5
    NSLayoutConstraint *redWidth =[NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0.0];
    [self.view addConstraint:redWidth];
}
//红色，蓝色，底部相同
- (void)Text2
{
    //    1.添加控件
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor=[UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:blueView];
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor=[UIColor redColor];
    redView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:redView];
    
    // VFL生成约束
    NSDictionary *mertrics = @{@"margin" : @20};
    //    NSDictionary *views=@{@"blueView" : blueView, @"redView" : redView};
    NSDictionary *views = NSDictionaryOfVariableBindings(blueView,redView);
    NSArray *conts = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[blueView]-margin-[redView(==blueView)]-margin-|" options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:mertrics views:views];
    NSArray *const2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[blueView(==blueHeight)]-margin-|" options:0 metrics:@{@"blueHeight":@40 , @"margin":@20} views:views];
    [self.view addConstraints:conts];
    [self.view addConstraints:const2];
}
// 红色一半，蓝色
- (void)Text1
{
    //    1.添加控件
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor=[UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:blueView];
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor=[UIColor redColor];
    redView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:redView];
    
    // 2.约束蓝色
    // 2.1.高度
    NSLayoutConstraint *blueHeight =[NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:40];
    [blueView addConstraint:blueHeight];
    
    CGFloat margin = 20;
    //左边间距
    NSLayoutConstraint *blueleft =[NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:margin];
    [self.view addConstraint:blueleft];
    //顶部间距
    NSLayoutConstraint *blueTop =[NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:margin];
    [self.view addConstraint:blueTop];
    //右边间距
    NSLayoutConstraint *blueRight =[NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-margin];
    [self.view addConstraint:blueRight];
    
    //约束红色
    //红色右边＝＝蓝色右边
    NSLayoutConstraint *redRight =[NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0];
    [self.view addConstraint:redRight];
    //红色高度＝＝蓝色高度
    NSLayoutConstraint *redHeight =[NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0];
    [self.view addConstraint:redHeight];
    //红色顶部＝蓝色底部＋间距
    NSLayoutConstraint *redTop =[NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:margin];
    [self.view addConstraint:redTop];
    // 让红色宽度＝蓝色宽度＊0.5
    NSLayoutConstraint *redWidth =[NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0.0];
    [self.view addConstraint:redWidth];
}
// 中点
- (void)centerText
{
    //    1.添加控件
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor=[UIColor blueColor];
    [self.view addSubview:blueView];
    
    //    2.添加约束
    blueView.translatesAutoresizingMaskIntoConstraints=NO;
    /**
     宽高：100
     位置：在父控件中居中
     */
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100];
    [blueView addConstraint:width];
    
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100];
    [blueView addConstraint:height];
    
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    [self.view addConstraint:centerX];
    
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    [self.view addConstraint:centerY];
}


@end
