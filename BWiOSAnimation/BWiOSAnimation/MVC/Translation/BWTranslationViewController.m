//
//  BWTranslationViewController.m
//  BWiOSAnimation
//
//  Created by BobWong on 16/10/26.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import "BWTranslationViewController.h"

#define Y_ORIGINAL 64 + 30
#define Y_MAX Y_ORIGINAL + 300

@interface BWTranslationViewController ()

@property (nonatomic, strong) UIView *viewFrame;
@property (nonatomic, strong) UIView *viewConstraints;

@end

@implementation BWTranslationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Translation";
    
    
    UIBarButtonItem *item0 = [[UIBarButtonItem alloc] initWithTitle:@"Frame" style:UIBarButtonItemStylePlain target:self action:@selector(buttonFrameTranslationAct:)];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"Constraints" style:UIBarButtonItemStylePlain target:self action:@selector(buttonConstraintsTranslationAct:)];
    self.navigationItem.rightBarButtonItems = @[item0, item1];
    
    
    UIView *viewFrame = [[UIView alloc] initWithFrame:CGRectMake(120, Y_ORIGINAL, 80, 50)];
    self.viewFrame = viewFrame;
    viewFrame.backgroundColor = [UIColor greenColor];
    [self.view addSubview:viewFrame];
    
    UIView *viewConstraints = [[UIView alloc] init];
    viewConstraints.backgroundColor = [UIColor blueColor];
    [self.view addSubview:viewConstraints];
    [viewConstraints mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.width.mas_equalTo(80);
        make.top.mas_equalTo(Y_ORIGINAL);
        make.height.mas_equalTo(50);
    }];
}

- (void)buttonFrameTranslationAct:(UIButton *)sender
{
    CGRect frame = _viewFrame.frame;
    frame.origin.y = (frame.origin.y == Y_ORIGINAL) ? Y_MAX : Y_ORIGINAL;
    BW_WEAK_SELF;
    [UIView animateWithDuration:3.0 animations:^{
        BW_STRONG_SELF;
        
        strongSelf.viewFrame.frame = frame;
    }];
}

- (void)buttonConstraintsTranslationAct:(UIButton *)sender
{
    
}

@end
