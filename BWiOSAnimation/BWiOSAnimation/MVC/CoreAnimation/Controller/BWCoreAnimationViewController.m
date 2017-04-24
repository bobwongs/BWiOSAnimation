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
//    [self usingKeyframeAnimation];
    [self animateMultipleChangesTogether];
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

- (void)usingKeyframeAnimation {
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

- (void)animateMultipleChangesTogether {
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
