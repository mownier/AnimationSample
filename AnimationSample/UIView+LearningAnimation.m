//
//  UIView+LearningAnimation.m
//  AnimationSample
//
//  Created by mownier on 12/1/14.
//  Copyright (c) 2014 mownier. All rights reserved.
//

#import "UIView+LearningAnimation.h"

@implementation UIView (LearningAnimation)

- (void)easeInWithCompletionBlock:(void (^)(BOOL))block {
    [UIView animateWithDuration:2.0f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat
                     animations:^{
                         CGRect frame = self.frame;
                         frame.origin.x += 300.0f;
                         self.frame = frame;
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:2.0f delay:0.0f options:UIViewAnimationOptionCurveEaseIn animations:^{
                             CGRect frame = self.frame;
                             frame.origin.x -= 300.0f;
                             self.frame = frame;
                         } completion:block];
                     }];
}

- (void)easeOutWithCompletionBlock:(void (^)(BOOL))block {
    [UIView animateWithDuration:2.0f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat
                     animations:^{
                         CGRect frame = self.frame;
                         frame.origin.x += 300.0f;
                         self.frame = frame;
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:2.0f delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
                             CGRect frame = self.frame;
                             frame.origin.x -= 300.0f;
                             self.frame = frame;
                         } completion:block];
                     }];
}

- (void)linearWithCompletionBlock:(void (^)(BOOL))block {
    [UIView animateWithDuration:2.0f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat
                     animations:^{
                         CGRect frame = self.frame;
                         frame.origin.x += 300.0f;
                         self.frame = frame;
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:2.0f delay:0.0f options:UIViewAnimationOptionCurveLinear animations:^{
                             CGRect frame = self.frame;
                             frame.origin.x -= 300.0f;
                             self.frame = frame;
                         } completion:block];
                     }];
}

- (void)noneWithCompletionBlock:(void (^)(BOOL))block {
    [UIView animateWithDuration:2.0f
                          delay:0.0f
                        options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat
                     animations:^{
                         CGRect frame = self.frame;
                         frame.origin.x += 300.0f;
                         self.frame = frame;
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:2.0f delay:0.0f options:0 animations:^{
                             CGRect frame = self.frame;
                             frame.origin.x -= 300.0f;
                             self.frame = frame;
                         } completion:block];
                     }];
}

- (void)runningScaleWithCompletionBlock:(void (^)(BOOL))block {
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anim.fromValue = [NSNumber numberWithFloat:1.0f];
    anim.toValue = [NSNumber numberWithFloat:0.0f];
    anim.autoreverses = YES;
    anim.duration = 2.0f;
    anim.removedOnCompletion = NO;
    anim.beginTime = CACurrentMediaTime() + 0.0f;
    anim.repeatCount = INFINITY;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CABasicAnimation *theAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    theAnimation.fromValue = [NSNumber numberWithFloat:self.frame.origin.x];
    theAnimation.toValue = [NSNumber numberWithFloat:300.0f];
    theAnimation.autoreverses = YES;
    theAnimation.duration = 2.0f;
    theAnimation.removedOnCompletion = NO;
    theAnimation.beginTime = CACurrentMediaTime() + 0.0f;
    theAnimation.repeatCount = INFINITY;
    theAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.layer addAnimation:theAnimation forKey:@"animateLayer"];
    [self.layer addAnimation:anim forKey:@"scale"];
}

- (void)squareToCircleToRoundedRectangle {
    self.layer.masksToBounds = YES;
    self.layer.position = self.frame.origin;
    self.layer.anchorPoint = CGPointMake(0.0f, 0.0f);
    self.layer.cornerRadius = MIN(self.frame.size.width, self.frame.size.height) / 2.0f;
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    anim.removedOnCompletion = NO;
    anim.fromValue = @0;
    anim.toValue = @(self.layer.cornerRadius);
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    anim.duration = 0.7f;
    anim.beginTime = 0.0f;
    anim.autoreverses = NO;
    
    CABasicAnimation *anim2 = [CABasicAnimation animationWithKeyPath:@"bounds.size.width"];
    anim2.removedOnCompletion = NO;
    anim2.fromValue = @(self.bounds.size.width);
    anim2.toValue = @(self.bounds.size.width + 240.0f);
    anim2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    anim2.duration = 0.7f;
    anim2.beginTime = 0.7f;

    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[anim, anim2];
    group.duration = 1.4f;
    group.beginTime = 0.0f;
    group.removedOnCompletion = NO;
    group.repeatCount = INFINITY;
    group.autoreverses = YES;
    
    [self.layer addAnimation:group forKey:@"animation"];
}

@end
