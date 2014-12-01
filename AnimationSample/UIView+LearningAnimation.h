//
//  UIView+LearningAnimation.h
//  AnimationSample
//
//  Created by mownier on 12/1/14.
//  Copyright (c) 2014 mownier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LearningAnimation)

- (void)easeInWithCompletionBlock:(void (^)(BOOL finished))block;

- (void)easeOutWithCompletionBlock:(void (^)(BOOL finished))block;

- (void)linearWithCompletionBlock:(void (^)(BOOL finished))block;

- (void)noneWithCompletionBlock:(void (^)(BOOL finished))block;

@end
