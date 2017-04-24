//
//  BWResearchViewController.m
//  BWiOSAnimation
//
//  Created by BobWong on 2017/4/18.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "BWResearchViewController.h"

@interface BWResearchViewController ()

@property (weak, nonatomic) IBOutlet UIView *view0;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;

@end

@implementation BWResearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UIView *view;
    
}

#pragma mark - Animate in block

- (IBAction)animateInBlockAction:(id)sender {
    [self animateInBlock];
}

- (void)animateInBlock {
    // ---------- Performing a simple block-based animation ----------
#if 0
    [UIView animateWithDuration:1.0 animations:^{
        self.view0.alpha = !self.view0.alpha;
        self.view1.alpha = !self.view1.alpha;
    }];
#endif
    
    // ---------- Creating an animation block with custom options ----------
#if 0
    // Fade out the view right away
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.view0.alpha = 0.0;
                     }
                     completion:^(BOOL finished){
                         // Wait one second and then fade in the view
                         [UIView animateWithDuration:2.0
                                               delay:1.0
                                             options:UIViewAnimationOptionTransitionFlipFromTop
                                          animations:^{
                                              self.view0.alpha = 1.0;
                                          }
                                          completion:nil];
                     }];
#endif
    
    // ---------- Nesting animations that have different configurations ----------
#if 0
    [UIView animateWithDuration:1.0
                          delay:1.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.view0.alpha = 0.0;
                         
                         // Create a nested animation that has a different
                         // duration, timing curve, and configuration.
                         [UIView animateWithDuration:0.2
                                               delay:0.0
                                             options: UIViewAnimationOptionOverrideInheritedCurve |
                          UIViewAnimationOptionCurveLinear |
                          UIViewAnimationOptionOverrideInheritedDuration |
                          UIViewAnimationOptionRepeat |
                          UIViewAnimationOptionAutoreverse
                                          animations:^{
                                              [UIView setAnimationRepeatCount:2.5];
                                              self.view2.alpha = 0.0;
                                          }
                                          completion:nil];
                         
                     }
                     completion:nil];
#endif
    
    // ---------- Swapping an empty text view for an existing one ----------
#if 1
    [UIView transitionWithView:self.view
                      duration:1.0
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        self.view0.hidden = YES;
                        self.view1.hidden = NO;
                    }
                    completion:^(BOOL finished){
                        // Save the old text and then swap the views.
//                        [self saveNotes:temp];
                        
//                        UIView *temp = self.view0;
//                        self.view0 = self.view1;
//                        self.view1 = temp;
                    }];
#endif
}



#pragma mark - Using the Begin/Commit Methods

- (IBAction)animateUsingBeginOrCommitMethodsAction:(id)sender {
    [self animateUsingBeginOrCommitMethods];
}

- (void)animateUsingBeginOrCommitMethods {
    /*
     If your application runs in iOS 3.2 and earlier, you must use the beginAnimations:context: and commitAnimations class methods of UIView to define your animation blocks.
     
      If you are writing an application for iOS 4 or later, you should use the block-based methods for animating your content instead.
     */
    
    // ---------- Performing a simple begin/commit animation ----------
    [UIView beginAnimations:@"ToggleViews" context:nil];
    [UIView setAnimationDuration:1.0];
    
    // Make the animatable changes.
    self.view0.alpha = 0.0;
    self.view1.alpha = 1.0;
    
    // Commit the changes and perform the animation.
    [UIView commitAnimations];
}

@end
