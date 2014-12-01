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
    [UIView animateWithDuration:0.3f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         CGRect frame = self.frame;
                         frame.origin.x += 100.0f;
                         self.frame = frame;
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationOptionCurveEaseIn animations:^{
                             CGRect frame = self.frame;
                             frame.origin.x -= 100.0f;
                             self.frame = frame;
                         } completion:block];
                     }];
}

- (void)easeOutWithCompletionBlock:(void (^)(BOOL))block {
    [UIView animateWithDuration:0.3f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         CGRect frame = self.frame;
                         frame.origin.x += 100.0f;
                         self.frame = frame;
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
                             CGRect frame = self.frame;
                             frame.origin.x -= 100.0f;
                             self.frame = frame;
                         } completion:block];
                     }];

}

@end
