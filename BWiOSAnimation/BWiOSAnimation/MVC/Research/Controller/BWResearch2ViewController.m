//
//  BWResearch2ViewController.m
//  BWiOSAnimation
//
//  Created by BobWong on 2017/4/24.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "BWResearch2ViewController.h"
#import "BWCustomCAView0.h"
#import "BWCustomCALayer0.h"

@interface BWResearch2ViewController ()

@end

@implementation BWResearch2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Research";
    
//    [self setUI];
//    [self setUI2];
//    [self setUI3];
    [self setUI4];
}

- (void)setUI {
    
    CALayer *superLayer = self.view.layer;
    
    CALayer *layer0 = [CALayer new];
    layer0.frame = CGRectMake(20, 200, 200, 50);
    layer0.backgroundColor = [UIColor greenColor].CGColor;
    [superLayer addSublayer:layer0];
    
}

- (void)setUI2 {
    BWCustomCAView0 *customCAView0 = [[BWCustomCAView0 alloc] init];
    customCAView0.frame = CGRectMake(20, 200, 200, 300);
    [self.view addSubview:customCAView0];
}

- (void)setUI3 {
    
    CALayer *superLayer = self.view.layer;
    
    BWCustomCALayer0 *layer0 = [BWCustomCALayer0 new];
    layer0.frame = CGRectMake(20, 200, 200, 90);
    layer0.backgroundColor = [UIColor orangeColor].CGColor;
    [superLayer addSublayer:layer0];
    
}

- (void)setUI4 {
    
    CALayer *superLayer = self.view.layer;
    
    CALayer *layer0 = [CALayer new];
    layer0.frame = CGRectMake(20, 200, 200, 50);
    layer0.backgroundColor = [UIColor greenColor].CGColor;
    [superLayer addSublayer:layer0];
    
    CABasicAnimation *fadeAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeAnim.fromValue = [NSNumber numberWithFloat:1.0];
    fadeAnim.toValue = [NSNumber numberWithFloat:0.0];
    fadeAnim.duration = 2.0;
    [layer0 addAnimation:fadeAnim forKey:@"opacity"];
    
    // Change the actual data value in the layer to the final value.
    layer0.opacity = 0.0;
    
}

@end
