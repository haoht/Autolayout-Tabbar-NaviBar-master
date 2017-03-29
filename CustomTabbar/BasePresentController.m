//
//  BasePresentController.m
//  CustomTabbar
//
//  Created by liman on 14/11/9.
//  Copyright (c) 2014年 lh. All rights reserved.
//

#import "BasePresentController.h"

@implementation BasePresentController

#pragma mark - life cycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 自定义导航栏"返回按钮"
    [self initNaviBackBtn];
}

// 适配iOS8 - 隐藏键盘
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
}


#pragma mark - private methods
// 自定义导航栏"返回按钮"
- (void)initNaviBackBtn
{
    UIButton *backBtn = [UIButton buttonWithType:0];
    backBtn.frame = CGRectMake(0, 0, 12, 20);
    [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    
    // 控制按钮的左右间距
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = 2;
    
    self.navigationItem.leftBarButtonItems = @[negativeSpacer, backItem];
}

#pragma mark - target action
// 点击了:返回按钮
- (void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
