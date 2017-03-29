//
//  CustomTabbarController.m
//  CustomTabbar
//
//  Created by liman on 14/11/9.
//  Copyright (c) 2014年 lh. All rights reserved.
//

#import "MainTabbarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"
#import "MainNavigationController.h"

@interface MainTabbarController ()
{
    BOOL didUpdateConstraints;
    
    // 为了autolayout适配
    MainTabbarItemView *lastTabbarItemView;
}

@end

@implementation MainTabbarController

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
    
    // 初始化子控制器
    [self initViewControllers];
    
    // 初始化item的显示数据数组(图片&标题)
    [self initImagesArrTitlesArr];
    
    // 自定义tabbar
    [self initTabBar];
    
    [self.view setNeedsUpdateConstraints];
//    [self.view updateConstraintsIfNeeded];
}

#pragma mark - private methods
// 初始化子控制器
- (void)initViewControllers
{
    UINavigationController *navi1 = [[UINavigationController alloc] initWithRootViewController:[[FirstViewController alloc] init]];
    UINavigationController *navi2 = [[UINavigationController alloc] initWithRootViewController:[[SecondViewController alloc] init]];
    UINavigationController *navi3 = [[MainNavigationController alloc] initWithRootViewController:[[ThirdViewController alloc] init]];
    UINavigationController *navi4 = [[UINavigationController alloc] initWithRootViewController:[[FourViewController alloc] init]];
    UINavigationController *navi5 = [[UINavigationController alloc] initWithRootViewController:[[FiveViewController alloc] init]];
    
    self.viewControllers = @[navi1,
                             navi2,
                             navi3,
                             navi4,
                             navi5,
                             ];
}

// 初始化item的显示数据数组(图片&标题)
- (void)initImagesArrTitlesArr
{
    // 普通背景图片
_normalImages = @[@"tabbar_home.png",
                  @"tabbar_message_center.png",
                  @"tabbar_profile.png",
                  @"tabbar_discover.png",
                  @"tabbar_more.png"
                  ];
    // 高亮背景图片
    _highlightImages = @[@"tabbar_home_highlighted.png",
                         @"tabbar_message_center_highlighted.png",
                         @"tabbar_profile_highlighted.png",
                         @"tabbar_discover_highlighted.png",
                         @"tabbar_more_highlighted.png"
                         ];
    // item标题
    _titles = @[@"1",
                @"2",
                @"3",
                @"4",
                @"5",
    ];
}

// 自定义tabbar
- (void)initTabBar
{
    _tabBarView = [UIView new];
    _tabBarView.frame = self.tabBar.bounds;
    _tabBarView.backgroundColor = [UIColor blackColor];
    [self.tabBar addSubview:_tabBarView];
    
    
    // 添加5个自定义的items
    for (int i = 0; i < self.viewControllers.count; i ++) {
    
        _tabbarItemView = [MainTabbarItemView new];
        _tabbarItemView.tag = i;
        _tabbarItemView.delegate = self;
        _tabbarItemView.imageView.image = [UIImage imageNamed:_normalImages[i]];
        _tabbarItemView.titleLabel.text = _titles[i];
        [_tabBarView addSubview:_tabbarItemView];
        
        [self.view setNeedsUpdateConstraints];
        [self.view updateConstraintsIfNeeded];
        
        lastTabbarItemView = _tabbarItemView;
    }

    // 设置第一个item为"选中"状态
    UIView *firstSubview = _tabBarView.subviews[0];
    if ([firstSubview isKindOfClass:[MainTabbarItemView class]]) {
        MainTabbarItemView *firstItemView = (MainTabbarItemView *)firstSubview;
        firstItemView.imageView.image = [UIImage imageNamed:_highlightImages[0]];
        firstItemView.titleLabel.textColor = [UIColor redColor];
    }
}

#pragma mark - updateViewConstraints method
- (void)updateViewConstraints
{
    [_tabbarItemView makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(0);
        make.width.equalTo(_tabBarView).multipliedBy(1.0/5);
        if (!lastTabbarItemView) {
            make.left.equalTo(0);
        } else {
            make.left.equalTo(lastTabbarItemView.right).priorityHigh();
        }
    }];
    
    
    /*****************************************************************/
    if (didUpdateConstraints) {
        [super updateViewConstraints];
        return;
    }
    
    didUpdateConstraints = YES;
    
    [super updateViewConstraints];
}

#pragma mark - MainTabberItemViewDelegate
- (void)mainTabbarItemView:(MainTabbarItemView *)itemView didSelectedIndex:(NSUInteger)index
{
    // 核心代码
    self.selectedIndex = index;
    
    // 点击item后, 还原其他所有item的图片&标题颜色
    int i = 0;
    for (MainTabbarItemView *subView in _tabBarView.subviews) {
        subView.imageView.image = [UIImage imageNamed:_normalImages[i]];
        subView.titleLabel.textColor = [UIColor whiteColor];
        i ++;
    }
    
    // 点击item后, 改变选中的item的图片&标题颜色
    itemView.titleLabel.textColor = [UIColor redColor];
    itemView.imageView.image = [UIImage imageNamed:_highlightImages[index]];
}

@end
