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
    anim.beginTime = CACurrentMediaTime()+0.0f;
    anim.repeatCount = INFINITY;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CABasicAnimation *theAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    theAnimation.fromValue = [NSNumber numberWithFloat:self.frame.origin.x];
    theAnimation.toValue = [NSNumber numberWithFloat:300.0f];
    theAnimation.autoreverses = YES;
    theAnimation.duration = 2.0f;
    theAnimation.removedOnCompletion = NO;
    theAnimation.beginTime = CACurrentMediaTime()+0.0f;
    theAnimation.repeatCount = INFINITY;
    theAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.layer addAnimation:anim forKey:@"scale"];
    [self.layer addAnimation:theAnimation forKey:@"animateLayer"];
}

@end
