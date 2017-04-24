//
//  BWCustomCAView0.m
//  BWiOSAnimation
//
//  Created by BobWong on 2017/4/24.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

#import "BWCustomCAView0.h"

@implementation BWCustomCAView0

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        NSLog(@"initWithFrame");
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    NSLog(@"setFrame");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/
- (void)drawRect:(CGRect)rect {
    static NSUInteger executionCounts = 0;
    NSLog(@"executionCounts: %lu", executionCounts);
    executionCounts += 1;
    
    
}

- (void)displayLayer:(CALayer *)layer {
    
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    
}

@end
