//
//  ViewController.m
//  PlayWithAutoLayoutCode
//
//  Created by Kate Polyakova on 6/20/15.
//  Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong) UIView *redView;
@property(nonatomic, strong) UIView *greenView;
@property(nonatomic, strong) UIView *yellowView;
@property(nonatomic, strong) UIView *blueView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.redView = [[UIView alloc] init];
    self.greenView = [[UIView alloc] init];
    self.yellowView = [[UIView alloc] init];
    self.blueView = [[UIView alloc] init];

    NSArray *colors = @[ [UIColor redColor], [UIColor greenColor], [UIColor yellowColor], [UIColor blueColor] ];
    [@[self.redView, self.greenView, self.yellowView, self.blueView] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        [obj setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.view addSubview:obj]; //добавляем view к parentview
        [obj setBackgroundColor:colors[idx]];
        [obj setAlpha:0.5f];
    }];

    [self setupLayout];

}

-(NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

- (void)setupLayout {

    // left of red to left of parent
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.redView
                                              attribute:NSLayoutAttributeLeading
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeLeft
                                             multiplier:1
                                               constant:8];
    [self.view addConstraint:constraint];

    // top of red to top of parent
    constraint = [NSLayoutConstraint constraintWithItem:self.redView
                                              attribute:NSLayoutAttributeTop
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeTop
                                             multiplier:1
                                               constant:20];
    [self.view addConstraint:constraint];

    // horizontal spacing between green and red
    constraint = [NSLayoutConstraint constraintWithItem:self.greenView
                                              attribute:NSLayoutAttributeLeading
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.redView
                                              attribute:NSLayoutAttributeTrailing
                                             multiplier:1
                                               constant:5];
    [self.view addConstraint:constraint];

    // top of red to top of parent
    constraint = [NSLayoutConstraint constraintWithItem:self.greenView
                                              attribute:NSLayoutAttributeTop
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeTop
                                             multiplier:1
                                               constant:20];
    [self.view addConstraint:constraint];

    // trailing of green to right of parent
    constraint = [NSLayoutConstraint constraintWithItem:self.greenView
                                              attribute:NSLayoutAttributeTrailing
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeRight
                                             multiplier:1
                                               constant:-8];
    [self.view addConstraint:constraint];

    // equal widths of red and green
    constraint = [NSLayoutConstraint constraintWithItem:self.redView
                                              attribute:NSLayoutAttributeWidth
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.greenView
                                              attribute:NSLayoutAttributeWidth
                                             multiplier:1
                                               constant:0];
    [self.view addConstraint:constraint];

    // bottom of red to top of yellow
    constraint = [NSLayoutConstraint constraintWithItem:self.redView
                                              attribute:NSLayoutAttributeBottom
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.yellowView
                                              attribute:NSLayoutAttributeTop
                                             multiplier:1
                                               constant:-5];
    [self.view addConstraint:constraint];

    // bottom of green to top of yellow
    constraint = [NSLayoutConstraint constraintWithItem:self.greenView
                                              attribute:NSLayoutAttributeBottom
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.yellowView
                                              attribute:NSLayoutAttributeTop
                                             multiplier:1
                                               constant:-5];
    [self.view addConstraint:constraint];

    // left of yellow to left of parent
    constraint = [NSLayoutConstraint constraintWithItem:self.yellowView
                                              attribute:NSLayoutAttributeLeading
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeLeft
                                             multiplier:1
                                               constant:8];
    [self.view addConstraint:constraint];

    // trailing of yellow to right of parent
    constraint = [NSLayoutConstraint constraintWithItem:self.yellowView
                                              attribute:NSLayoutAttributeTrailing
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeRight
                                             multiplier:1
                                               constant:-8];
    [self.view addConstraint:constraint];

    // bottom of yellow to top of blue
    constraint = [NSLayoutConstraint constraintWithItem:self.yellowView
                                              attribute:NSLayoutAttributeBottom
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.blueView
                                              attribute:NSLayoutAttributeTop
                                             multiplier:1
                                               constant:-5];
    [self.view addConstraint:constraint];

    // left of blue to left of parent
    constraint = [NSLayoutConstraint constraintWithItem:self.blueView
                                              attribute:NSLayoutAttributeLeading
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeLeft
                                             multiplier:1
                                               constant:8];
    [self.view addConstraint:constraint];

    // trailing of blue to right of parent
    constraint = [NSLayoutConstraint constraintWithItem:self.blueView
                                              attribute:NSLayoutAttributeTrailing
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeRight
                                             multiplier:1
                                               constant:-8];
    [self.view addConstraint:constraint];

    // bottom of blue to bottom of parent
    constraint = [NSLayoutConstraint constraintWithItem:self.blueView
                                              attribute:NSLayoutAttributeBottom
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeBottom
                                             multiplier:1
                                               constant:-8];
    [self.view addConstraint:constraint];

    // equal height of red and green
    constraint = [NSLayoutConstraint constraintWithItem:self.redView
                                              attribute:NSLayoutAttributeHeight
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.greenView
                                              attribute:NSLayoutAttributeHeight
                                             multiplier:1
                                               constant:0];
    [self.view addConstraint:constraint];

    // equal height of red and yellow
    constraint = [NSLayoutConstraint constraintWithItem:self.redView
                                              attribute:NSLayoutAttributeHeight
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.yellowView
                                              attribute:NSLayoutAttributeHeight
                                             multiplier:1
                                               constant:0];
    [self.view addConstraint:constraint];

    // equal height of yellow and blue
    constraint = [NSLayoutConstraint constraintWithItem:self.yellowView
                                              attribute:NSLayoutAttributeHeight
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.blueView
                                              attribute:NSLayoutAttributeHeight
                                             multiplier:1
                                               constant:0];
    [self.view addConstraint:constraint];



}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
