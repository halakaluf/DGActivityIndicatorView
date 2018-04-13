//
//  NVActivityIndicatorAnimationCircleStrokeSpin.m
//  DGActivityIndicatorExample
//
//  Created by Fabio Martinez on 12/04/2018.
//  Copyright © 2018 Danil Gontovnik. All rights reserved.
//

#import "NVActivityIndicatorAnimationCircleStrokeSpin.h"

@implementation NVActivityIndicatorAnimationCircleStrokeSpin
#pragma mark -
#pragma mark DGActivityIndicatorAnimation Protocol

- (void)setupAnimationInLayer:(CALayer *)layer withSize:(CGSize)size tintColor:(UIColor *)tintColor {
    CGFloat beginTime = 0.5f;
    CGFloat strokeStartDuration = 1.2f;
    CGFloat strokeEndDuration = 0.7f;
    
    
    // Rotation x animation
    CABasicAnimation *rotationAnimation = [self createBasicAnimationWithKeyPath:@"transform.rotation"];
    double initialValue = M_PI * 2;

    [rotationAnimation setByValue:[NSNumber numberWithDouble:initialValue]];
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionLinear];


    CABasicAnimation *strokeEndAnimation = [self createBasicAnimationWithKeyPath:@"strokeEnd"];
    strokeEndAnimation.duration = strokeEndDuration;
    strokeEndAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.4 :0.0 :0.2 :1.0];
    strokeEndAnimation.fromValue = @0;
    strokeEndAnimation.toValue = @1;
    
    
    CABasicAnimation *strokeStartAnimation = [self createBasicAnimationWithKeyPath:@"strokeStart"];
    strokeStartAnimation.duration = strokeStartDuration;
    strokeStartAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.4 :0.0 :0.2 :1.0];
    strokeStartAnimation.fromValue = @0;
    strokeStartAnimation.toValue = @1;
    strokeStartAnimation.beginTime = beginTime;
    
    
    CAAnimationGroup *groupAnimation = [self createAnimationGroup];
    groupAnimation.duration = strokeStartDuration + beginTime;
    groupAnimation.repeatCount = HUGE_VALF;
    [groupAnimation setRemovedOnCompletion:NO];
    groupAnimation.fillMode = kCAFillModeForwards;
    
    CAShapeLayer *circle = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.width / 2, size.height /2) radius:size.width / 2 startAngle:-(M_PI_2) endAngle:M_PI + M_PI_2  clockwise:YES];
//    circle.p
//    circle.fillColor = nil;
//    circle.strokeColor = tintColor;
//    circle.lineWidth = 2;

    
}

@end
