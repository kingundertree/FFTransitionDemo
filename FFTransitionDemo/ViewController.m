//
//  ViewController.m
//  FFTransitionDemo
//
//  Created by xiazer on 15/10/22.
//  Copyright © 2015年 com.freshfresh. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"
#import "FFPushAnimation.h"
#import "FFDismissAnimation.h"
#import "FFTransition.h"

@interface ViewController () <UIViewControllerTransitioningDelegate, MainViewDelegate>
@property (nonatomic, strong) FFPushAnimation *pushAnimation;
@property (nonatomic, strong) FFDismissAnimation *dismissAnimation;

@property (nonatomic, strong) FFTransition *transition;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    [self.imgView setImage:[UIImage imageNamed:@"youzi.jpg"]];
    [self.view addSubview:self.imgView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 500, self.view.frame.size.width, 50);
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:@"click" forState:UIControlStateNormal];
//    [btn setImage:[UIImage imageNamed:@"youzi.jpg"] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)click:(id)sender {
    MainViewController *mainVC = [[MainViewController alloc] init];
    mainVC.transitioningDelegate = self;
    mainVC.delegate = self;
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mainVC];

    [self presentViewController:mainVC animated:YES completion:^{
    }];

//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mainVC];
//    [self.navigationController presentViewController:nav animated:YES completion:nil];
}

#pragma mark - TransitioningDelegate /system
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.pushAnimation;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.dismissAnimation;
}

- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator{
    
    return self.transition.interacting ? self.transition : nil;
}


#pragma mark - MaimViewDelegate
- (void)doDismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - get method
- (FFPushAnimation *)pushAnimation {
    if (!_pushAnimation) {
        _pushAnimation = [[FFPushAnimation alloc] init];
    }
    
    return _pushAnimation;
}

- (FFDismissAnimation *)dismissAnimation {
    if (!_dismissAnimation) {
        _dismissAnimation = [[FFDismissAnimation alloc] init];
    }
    
    return _dismissAnimation;
}


- (FFTransition *)transition {
    if (!_transition) {
        _transition = [[FFTransition alloc] init];
    }
    
    return _transition;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
