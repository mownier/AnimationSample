//
//  ViewController.m
//  AnimationSample
//
//  Created by mownier on 12/1/14.
//  Copyright (c) 2014 mownier. All rights reserved.
//

#import "ViewController.h"
#import "UIView+LearningAnimation.h"

@interface ViewController () {
    BOOL _isAnimating;
}

@property (strong, nonatomic) UIView *animatedView;
@property (strong, nonatomic) UIView *animatedView2;
@property (strong, nonatomic) UIButton *animateButton;

- (void)animate:(UIButton *)button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.animatedView];
    [self.view addSubview:self.animatedView2];
    [self.view addSubview:self.animateButton];
    
    NSDictionary *views = @{ @"animatedView": self.animatedView,
                             @"animatedView2": self.animatedView2,
                             @"animateButton": self.animateButton };
    NSArray *vertical;
    NSArray *horizontal;
    [self constraintViews:views metrics:nil vertical:&vertical horizontal:&horizontal];
    
    [self.view addConstraints:vertical];
    [self.view addConstraints:horizontal];
}

- (void)constraintViews:(NSDictionary *)views
                metrics:(NSDictionary *)metrics
               vertical:(NSArray **)vertical
             horizontal:(NSArray **)horizontal {
    NSMutableArray *vert = [NSMutableArray new];
    NSMutableArray *horiz = [NSMutableArray new];
    
    [vert addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-44-[animatedView(50)]" options:0 metrics:metrics views:views]];
    [horiz addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[animatedView(100)]" options:0 metrics:metrics views:views]];
    
    [vert addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-108-[animatedView2(50)]" options:0 metrics:metrics views:views]];
    [horiz addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[animatedView2(100)]" options:0 metrics:metrics views:views]];
    
    [vert addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[animateButton(50)]-20-|" options:0 metrics:metrics views:views]];
    [horiz addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[animateButton(100)]" options:0 metrics:metrics views:views]];
    [horiz addObject:[NSLayoutConstraint constraintWithItem:self.animateButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    *vertical = vert;
    *horizontal = horiz;
}

- (UIView *)animatedView {
    if (!_animatedView) {
        _animatedView = [[UIView alloc] initWithFrame:CGRectZero];
        _animatedView.translatesAutoresizingMaskIntoConstraints = NO;
        _animatedView.backgroundColor = [UIColor magentaColor];
    }
    return _animatedView;
}

- (UIView *)animatedView2 {
    if (!_animatedView2) {
        _animatedView2 = [[UIView alloc] initWithFrame:CGRectZero];
        _animatedView2.translatesAutoresizingMaskIntoConstraints = NO;
        _animatedView2.backgroundColor = [UIColor magentaColor];
    }
    return _animatedView2;
}

- (UIButton *)animateButton {
    if (!_animateButton) {
        _animateButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _animateButton.translatesAutoresizingMaskIntoConstraints = NO;
        _animateButton.backgroundColor = [UIColor blueColor];
        [_animateButton setTitle:@"Animate" forState:UIControlStateNormal];
        [_animateButton addTarget:self action:@selector(animate:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _animateButton;
}

- (void)animate:(UIButton *)button {
    if (!_isAnimating) {
        _isAnimating = YES;
        [self.animatedView easeInWithCompletionBlock:^(BOOL finished) {
            _isAnimating = NO;
        }];
        [self.animatedView2 easeOutWithCompletionBlock:^(BOOL finished) {
            _isAnimating = NO;
        }];
    }
}

@end
