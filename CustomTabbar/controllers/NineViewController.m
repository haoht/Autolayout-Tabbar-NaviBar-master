//
//  EightViewController.m
//  CustomTabbar
//
//  Created by liman on 14-12-31.
//  Copyright (c) 2014年 lh. All rights reserved.
//

#import "NineViewController.h"
#import "MainTabbarController.h"

@implementation NineViewController

#pragma mark - life cycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.title = @"第九个";
        self.view.backgroundColor = [UIColor grayColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 初始化textfield
    [self initTextField];
}

#pragma mark - private method
// 初始化textfield
- (void)initTextField
{
    UITextField *testField = [[UITextField alloc] initWithFrame:CGRectMake(50, 120, 240, 30)];
    testField.layer.borderColor = [UIColor redColor].CGColor;
    testField.layer.borderWidth = 0.5;
    testField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:testField];
}

@end
