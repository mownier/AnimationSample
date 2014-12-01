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
    BOOL _isViewAnimating;
    BOOL _isView2Animating;
    BOOL _isView3Animating;
    BOOL _isView4Animating;
    BOOL _isView5Animating;
}

@property (strong, nonatomic) UIView *animatedView;     // ease in
@property (strong, nonatomic) UIView *animatedView2;    // ease out
@property (strong, nonatomic) UIView *animatedView3;    // linear
@property (strong, nonatomic) UIView *animatedView4;    // none
@property (strong, nonatomic) UIView *animatedView5;    // running scale
@property (strong, nonatomic) UIButton *animateButton;

- (void)animate:(UIButton *)button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.animatedView];
    [self.view addSubview:self.animatedView2];
    [self.view addSubview:self.animatedView3];
    [self.view addSubview:self.animatedView4];
    [self.view addSubview:self.animatedView5];
    [self.view addSubview:self.animateButton];
    
    NSDictionary *views = @{ @"animatedView": self.animatedView,
                             @"animatedView2": self.animatedView2,
                             @"animatedView3": self.animatedView3,
                             @"animatedView4": self.animatedView4,
                             @"animatedView5": self.animatedView5,
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
    
    // animated view
    [vert addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-44-[animatedView(50)]" options:0 metrics:metrics views:views]];
    [horiz addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[animatedView(100)]" options:0 metrics:metrics views:views]];
    
    // animated view2
    [vert addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-108-[animatedView2(50)]" options:0 metrics:metrics views:views]];
    [horiz addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[animatedView2(100)]" options:0 metrics:metrics views:views]];
    
    // animated view3
    [vert addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-172-[animatedView3(50)]" options:0 metrics:metrics views:views]];
    [horiz addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[animatedView3(100)]" options:0 metrics:metrics views:views]];
    
    // aniamted view4
    [vert addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-236-[animatedView4(50)]" options:0 metrics:metrics views:views]];
    [horiz addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[animatedView4(100)]" options:0 metrics:metrics views:views]];
    
    // animated view5
    [vert addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-300-[animatedView5(50)]" options:0 metrics:metrics views:views]];
    [horiz addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[animatedView5(100)]" options:0 metrics:metrics views:views]];
    
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

- (UIView *)animatedView3 {
    if (!_animatedView3) {
        _animatedView3 = [[UIView alloc] initWithFrame:CGRectZero];
        _animatedView3.translatesAutoresizingMaskIntoConstraints = NO;
        _animatedView3.backgroundColor = [UIColor magentaColor];
    }
    return _animatedView3;
}

- (UIView *)animatedView4 {
    if (!_animatedView4) {
        _animatedView4 = [[UIView alloc] initWithFrame:CGRectZero];
        _animatedView4.translatesAutoresizingMaskIntoConstraints = NO;
        _animatedView4.backgroundColor = [UIColor magentaColor];
    }
    return _animatedView4;
}

- (UIView *)animatedView5 {
    if (!_animatedView5) {
        _animatedView5 = [[UIView alloc] initWithFrame:CGRectZero];
        _animatedView5.translatesAutoresizingMaskIntoConstraints = NO;
        _animatedView5.backgroundColor = [UIColor magentaColor];
    }
    return _animatedView5;
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
    if (![self isAnimating]) {
        _isViewAnimating = YES;
        _isView2Animating = YES;
        _isView3Animating = YES;
        _isView4Animating = YES;
        _isView5Animating = YES;
        
        [self.animatedView easeInWithCompletionBlock:^(BOOL finished) {
            _isViewAnimating = NO;
        }];
        [self.animatedView2 easeOutWithCompletionBlock:^(BOOL finished) {
            _isView2Animating = NO;
        }];
        [self.animatedView3 linearWithCompletionBlock:^(BOOL finished) {
            _isView3Animating = NO;
        }];
        [self.animatedView4 noneWithCompletionBlock:^(BOOL finished) {
            _isView4Animating = NO;
        }];
        [self.animatedView5 runningScaleWithCompletionBlock:^(BOOL finished) {
            _isView5Animating = NO;
        }];
    }
}

- (BOOL)isAnimating {
    _isAnimating = (_isViewAnimating && _isView2Animating && _isView3Animating && _isView4Animating && _isView5Animating);
    return _isAnimating;
}

@end
