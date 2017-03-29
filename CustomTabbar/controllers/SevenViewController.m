//
//  SevenViewController.m
//  CustomTabbar
//
//  Created by liman on 14/11/10.
//  Copyright (c) 2014年 lh. All rights reserved.
//

#import "SevenViewController.h"
#import "AppDelegate.h"

@implementation SevenViewController

#pragma mark - life cycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.title = @"第七个";
        self.view.backgroundColor = [UIColor grayColor];
        
        self.hidesBottomBarWhenPushed = YES;
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
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 120, 240, 30)];
    textField.layer.borderColor = [UIColor redColor].CGColor;
    textField.layer.borderWidth = 0.5;
    textField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:textField];
}

@end
