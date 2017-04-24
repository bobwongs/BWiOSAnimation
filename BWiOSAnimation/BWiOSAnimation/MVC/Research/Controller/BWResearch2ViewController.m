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
//    [self setUI4];
//    [self setUI5];
    [self setUI6];
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

- (void)setUI5 {
    CALayer *superLayer = self.view.layer;
    
    CALayer *layer0 = [CALayer new];
    layer0.frame = CGRectMake(74, 74, 50, 50);
    layer0.backgroundColor = [UIColor greenColor].CGColor;
    [superLayer addSublayer:layer0];
    
    // create a CGPath that implements two arcs (a bounce)
    CGMutablePathRef thePath = CGPathCreateMutable();
    CGPathMoveToPoint(thePath,NULL,74.0,74.0);
    CGPathAddCurveToPoint(thePath,NULL,74.0,500.0,
                          320.0,500.0,
                          320.0,74.0);
    CGPathAddCurveToPoint(thePath,NULL,320.0,500.0,
                          566.0,500.0,
                          566.0,74.0);
    
    CAKeyframeAnimation *theAnimation;
    
    // Create the animation object, specifying the position property as the key path.
    theAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    theAnimation.path = thePath;
    theAnimation.duration = 5.0;
    
    // Add the animation to the layer.
    [layer0 addAnimation:theAnimation forKey:@"position"];
}

- (void)setUI6 {
    CALayer *superLayer = self.view.layer;
    
    CALayer *layer0 = [CALayer new];
    layer0.frame = CGRectMake(74, 74, 50, 50);
    layer0.backgroundColor = [UIColor greenColor].CGColor;
    [superLayer addSublayer:layer0];
    
    // Animation 1
    CAKeyframeAnimation* widthAnim = [CAKeyframeAnimation animationWithKeyPath:@"borderWidth"];
    NSArray* widthValues = [NSArray arrayWithObjects:@1.0, @10.0, @5.0, @30.0, @0.5, @15.0, @2.0, @50.0, @0.0, nil];
    widthAnim.values = widthValues;
    widthAnim.calculationMode = kCAAnimationPaced;
    
    // Animation 2
    CAKeyframeAnimation* colorAnim = [CAKeyframeAnimation animationWithKeyPath:@"borderColor"];
    NSArray* colorValues = [NSArray arrayWithObjects:(id)[UIColor greenColor].CGColor,
                            (id)[UIColor redColor].CGColor, (id)[UIColor blueColor].CGColor,  nil];
    colorAnim.values = colorValues;
    colorAnim.calculationMode = kCAAnimationPaced;
    
    // Animation group
    CAAnimationGroup* group = [CAAnimationGroup animation];
    group.animations = [NSArray arrayWithObjects:colorAnim, widthAnim, nil];
    group.duration = 5.0;
    
    [layer0 addAnimation:group forKey:@"BorderChanges"];
}

@end
