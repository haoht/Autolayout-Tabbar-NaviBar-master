//
//  BasePresentController2.m
//  CustomTabbar
//
//  Created by liman on 14/11/9.
//  Copyright (c) 2014年 lh. All rights reserved.
//

#import "BasePresentController2.h"

@implementation BasePresentController2

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
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
}

#pragma mark - target action
// 点击了:返回按钮
- (void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
