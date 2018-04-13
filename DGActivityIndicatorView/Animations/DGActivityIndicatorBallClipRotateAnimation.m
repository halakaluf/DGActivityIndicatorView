//
//  DGActivityIndicatorBallClipRotateAnimation.m
//  DGActivityIndicatorExample
//
//  Created by Nguyen Vinh on 7/19/15.
//  Copyright (c) 2015 Danil Gontovnik. All rights reserved.
//

#import "DGActivityIndicatorBallClipRotateAnimation.h"

@implementation DGActivityIndicatorBallClipRotateAnimation

- (void)setupAnimationInLayer:(CALayer *)layer withSize:(CGSize)size tintColor:(UIColor *)tintColor {
    CGFloat duration = 0.75f;
    
    // Rotate animation
    CAKeyframeAnimation *rotateAnimation = [self createKeyframeAnimationWithKeyPath:@"transform.rotation.z"];
    
    rotateAnimation.values = @[@0, @M_PI, @(2 * M_PI)];


    CAAnimationGroup *animation = [self createAnimationGroup];
    
    animation.animations = @[rotateAnimation];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.duration = duration;
    animation.repeatCount = HUGE_VALF;
    

    CAShapeLayer *circle = [CAShapeLayer layer];
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.width / 2, size.height / 2) radius:size.width / 2 startAngle:1.5 * M_PI endAngle:M_PI clockwise:true];
    
    circle.path = circlePath.CGPath;
    circle.lineWidth = 3;
    circle.fillColor = nil;
    circle.strokeColor = tintColor.CGColor;
    
    circle.frame = CGRectMake((layer.bounds.size.width - size.width) / 2, (layer.bounds.size.height - size.height) / 2, size.width, size.height);
    [circle addAnimation:animation forKey:@"animation"];
    [layer addSublayer:circle];
}

@end
