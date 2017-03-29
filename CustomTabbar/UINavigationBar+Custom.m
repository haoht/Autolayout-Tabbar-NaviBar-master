//
//  UINavigationBar+Custom.m
//  CustomTabbar
//
//  Created by liman on 15-2-2.
//  Copyright (c) 2015年 lh. All rights reserved.
//

#import "UINavigationBar+Custom.h"

@implementation UINavigationBar (Custom) //[UINavigationBar appearance] == self

- (void)didMoveToSuperview
{
    // 自定义导航栏背景颜色 (iOS6会崩)
//    [UINavigationBar appearance].barTintColor = [UIColor orangeColor];
    
    
    // 自定义导航栏背景图片
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"live_bg_yellow"] forBarMetrics:UIBarMetricsDefault];
    
    
    // 自定义导航栏标题 字体颜色&大小
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName: [UIColor redColor],
//                                                           NSFontAttributeName: [UIFont boldSystemFontOfSize:19],
                                                           }];
    
    
    // 自定义导航栏BarButtonItem 字体颜色&大小
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName: [UIColor whiteColor],
//                                                           NSFontAttributeName: [UIFont systemFontOfSize:16]
                                                           } forState:UIControlStateNormal];
    
    // 自定义导航栏"返回箭头"的颜色
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    
    // 隐藏默认的"返回item"的标题
//    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
//                                                             forBarMetrics:UIBarMetricsDefault];
    
}

@end
