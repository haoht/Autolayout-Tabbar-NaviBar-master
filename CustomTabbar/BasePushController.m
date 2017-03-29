//
//  BasePushController.m
//  CustomTabbar
//
//  Created by liman on 14/11/9.
//  Copyright (c) 2014年 lh. All rights reserved.
//

#import "BasePushController.h"

@implementation BasePushController

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


#pragma mark - private methods
// 自定义导航栏"返回按钮"
- (void)initNaviBackBtn
{
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
}

@end
