//
//  BasePushController2.m
//  CustomTabbar
//
//  Created by liman on 15-2-4.
//  Copyright (c) 2015年 lh. All rights reserved.
//

#import "BasePushController2.h"

@implementation BasePushController2

#pragma mark - life cycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 自定义导航栏"返回按钮"
    [self initNaviBackBtn];
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
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
