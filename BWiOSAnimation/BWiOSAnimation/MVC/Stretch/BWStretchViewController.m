//
//  BWStretchViewController.m
//  BWiOSAnimation
//
//  Created by BobWong on 16/10/31.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import "BWStretchViewController.h"

#define H_VIEW_STRETCH 200

@interface BWStretchViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIButton *btnStretch;
@property (nonatomic, strong) UIView *viewStretch;

@end

@implementation BWStretchViewController

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Stretch";
    
    [self setData];
    [self setUI];
    [self setConstraints];
    [self loadData];
}

#pragma mark - Action

- (void)buttonAction:(UIButton *)sender
{
    // 旋转Button
    CGAffineTransform transform = sender.isSelected ? CGAffineTransformIdentity : CGAffineTransformMakeRotation(M_PI);
    [UIView animateWithDuration:.25 animations:^{
        self.btnStretch.imageView.transform = transform;
    }];
    
    // 伸缩View
    CGFloat offset = sender.isSelected ? -H_VIEW_STRETCH : 0;
    [UIView animateWithDuration:.25 animations:^{
        [self.viewStretch mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.btnStretch.mas_bottom).offset(offset);
        }];
        
        [self.view setNeedsLayout];
        [self.view layoutIfNeeded];
    }];
    
    sender.selected = !sender.isSelected;
}

#pragma mark - Public Method

#pragma mark - Private Method

- (void)setData
{
    
}

- (void)setUI
{
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.btnStretch];
    [self.scrollView addSubview:self.viewStretch];
    
    [self.scrollView sendSubviewToBack:self.viewStretch];
}

- (void)setConstraints
{
    BW_WEAK_SELF;
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        BW_STRONG_SELF;
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        
        make.right.mas_equalTo(strongSelf.btnStretch.mas_right);
    }];
    
    [self.btnStretch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(200);
    }];
    [self.viewStretch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.btnStretch.mas_bottom).offset(-H_VIEW_STRETCH);
        make.height.mas_equalTo(H_VIEW_STRETCH);
    }];
}

- (void)loadData
{
    
}

#pragma mark - Network

#pragma mark - System Delegate

#pragma mark - Custom Delegate

#pragma mark - Getter and Setter

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
    }
    return _scrollView;
}

- (UIButton *)btnStretch {
    if (!_btnStretch) {
        _btnStretch = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_btnStretch setTitle:@"Stretch" forState:UIControlStateNormal];
//        [_btnStretch setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btnStretch setImage:[UIImage imageNamed:@"btn_more_down"] forState:UIControlStateNormal];
        _btnStretch.backgroundColor = [UIColor greenColor];
        [_btnStretch addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnStretch;
}

- (UIView *)viewStretch {
    if (!_viewStretch) {
        _viewStretch = [[UIView alloc] init];
        _viewStretch.backgroundColor = [UIColor grayColor];
    }
    return _viewStretch;
}

@end

/*
 
 //打开工作任务View
 - (void)openWorkTaskView {
 [UIView animateWithDuration:0.5 animations:^{
 self.moreButton.imageView.transform = CGAffineTransformMakeRotation(M_PI);
 [self.workTaskView mas_updateConstraints:^(MASConstraintMaker *make) {
 make.height.mas_equalTo([BMEmployeeWorkTaskView totalHeightOfCollectionViewWithModels:self.workTaskView.taskArray maxWidth:SCREEN_WIDTH]);
 }];
 }];
 }
 
 //关闭工作任务view
 - (void)closeWorkTaskView {
 [UIView animateWithDuration:0.5 animations:^{
 self.moreButton.imageView.transform = CGAffineTransformIdentity;
 [self.workTaskView mas_updateConstraints:^(MASConstraintMaker *make) {
 make.height.mas_equalTo(40);
 }];
 }];
 }
    
 
 UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
 [moreButton setImage:[UIImage imageNamed:@"btn_more_down.png"] forState:UIControlStateNormal];
 [moreButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
 [moreButton addTarget:self action:@selector(moreButtonClick) forControlEvents:UIControlEventTouchUpInside];
 [moreButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
 
 */
