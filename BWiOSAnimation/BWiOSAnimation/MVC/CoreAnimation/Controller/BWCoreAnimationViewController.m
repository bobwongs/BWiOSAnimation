//
//  BWCoreAnimationViewController.m
//  BWiOSAnimation
//
//  Created by BobWong on 2017/4/24.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "BWCoreAnimationViewController.h"

@interface BWCoreAnimationViewController ()

@end

@implementation BWCoreAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self animateSimpleChanges];
}

- (void)animateSimpleChanges {
    
    // Animating Simple Changes to a Layer’s Properties
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
