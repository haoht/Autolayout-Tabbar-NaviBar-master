//
//  MainTabberItemView.m
//  CustomTabbar
//
//  Created by liman on 14/11/9.
//  Copyright (c) 2014年 lh. All rights reserved.
//

#import "MainTabbarItemView.h"

@interface MainTabbarItemView ()
{
    BOOL didUpdateConstraints;
}

@end

@implementation MainTabbarItemView

#pragma mark - life cycle
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 初始化子视图
        [self initSubviews];
        
    }
    return self;
}

#pragma mark - private methods
// 初始化子视图
- (void)initSubviews
{
    // 图片
    _imageView = [UIImageView new];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.userInteractionEnabled = YES;
    [self addSubview:_imageView];
    
    // label
    _titleLabel = [UILabel new];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont boldSystemFontOfSize:10];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_titleLabel];
    
    // 添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tabbarTapped)];
    [self addGestureRecognizer:tap];
}

#pragma mark - updateConstraints method
- (void)updateConstraints
{
    if (didUpdateConstraints) {
        [super updateConstraints];
        return;
    }
    
    [_imageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(4);
        make.left.offset(10);
        make.right.offset(-10);
        make.bottom.offset(-14);
    }];
    
    [_titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imageView.bottom);
        make.width.equalTo(self);
        make.left.bottom.equalTo(0);
    }];
    
    didUpdateConstraints = YES;
    
    [super updateConstraints];
}

#pragma mark - layoutSubviews method
- (void)layoutSubviews
{
    [super layoutSubviews];
}

#pragma mark - target action
- (void)tabbarTapped
{
    if ([self.delegate respondsToSelector:@selector(mainTabbarItemView:didSelectedIndex:)]) {
        [self.delegate mainTabbarItemView:self didSelectedIndex:self.tag];
    }
}

@end
