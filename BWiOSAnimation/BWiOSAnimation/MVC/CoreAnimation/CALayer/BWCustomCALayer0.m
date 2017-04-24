//
//  BWCustomCALayer0.m
//  BWiOSAnimation
//
//  Created by BobWong on 2017/4/24.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "BWCustomCALayer0.h"

@interface BWCustomCALayer0 () <CALayerDelegate>



@end

@implementation BWCustomCALayer0

- (instancetype)init {
    if (self = [super init]) {
        self.delegate = self;
    }
    return self;
}

- (void)displayLayer:(CALayer *)layer {
    
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    CGMutablePathRef thePath = CGPathCreateMutable();
    
    CGPathMoveToPoint(thePath,NULL,15.0f,15.f);
    CGPathAddCurveToPoint(thePath,
                          NULL,
                          15.f,250.0f,
                          295.0f,250.0f,
                          295.0f,15.0f);
    
    CGContextBeginPath(ctx);
    CGContextAddPath(ctx, thePath);
    
    CGContextSetLineWidth(ctx, 5);
    CGContextStrokePath(ctx);
    
    // Release the path
    CFRelease(thePath);
}

@end
