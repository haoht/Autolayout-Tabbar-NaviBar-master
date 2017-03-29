//
//  TenViewController.m
//  CustomTabbar
//
//  Created by liman on 14-12-31.
//  Copyright (c) 2014年 lh. All rights reserved.
//

#import "TenViewController.h"
#import "MainTabbarController.h"

@implementation TenViewController

#pragma mark - life cycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.title = @"第十个";
        self.view.backgroundColor = [UIColor grayColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 初始化textfield
    [self initTextField];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(test)];
}

#pragma mark - private method
// 初始化textfield
- (void)initTextField
{
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 120, 240, 30)];
    textField.layer.borderColor = [UIColor redColor].CGColor;
    textField.layer.borderWidth = 0.5;
    textField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:textField];
}

#pragma mark - target action
- (void)test
{
    
}

@end
