//
//  MViewController.m
//  Autolayout
//
//  Created by 尚进 on 16/1/5.
//  Copyright © 2016年 尚进. All rights reserved.
//

#import "MViewController.h"

@interface MViewController ()
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *left;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *width;
@property (weak, nonatomic) IBOutlet UIView *redview;

@end

@implementation MViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.text.text=@"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    self.left.constant=100;
    self.width.constant=250;
    [UIView animateWithDuration:2.0 animations:^{
        [self.view layoutIfNeeded];
        [self.redview layoutIfNeeded];
    }];
}

@end
