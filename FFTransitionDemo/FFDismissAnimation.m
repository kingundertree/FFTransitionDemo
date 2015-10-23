//
//  FFDismissAnimation.m
//  FFTransitionDemo
//
//  Created by xiazer on 15/10/23.
//  Copyright © 2015年 com.freshfresh. All rights reserved.
//

#import "FFDismissAnimation.h"
#import "ViewController.h"
#import "MainViewController.h"

#define ScreenWidth [[UIScreen mainScreen]bounds].size.width
#define ScreenHeight [[UIScreen mainScreen]bounds].size.height


@implementation FFDismissAnimation

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *fromVC   = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    if ([fromVC isKindOfClass:[MainViewController class]]) {
        UIImageView *imgView;
        imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth)];
        [imgView setImage:[UIImage imageNamed:@"youzi.jpg"]];

        UIView *containerView = [transitionContext containerView];
        
        if ([toVC isKindOfClass:[UINavigationController class]]) {
            UINavigationController *toNav = (UINavigationController *)toVC;
//            UIViewController *lastVC = (UIViewController *)[toNav.viewControllers lastObject];
//            [containerView addSubview:lastVC.view];
        }

        [containerView addSubview:imgView];
        fromVC.view.alpha = 1.0;

        MainViewController *fVC = (MainViewController *)fromVC;
        [fVC.imgView removeFromSuperview];

        CGRect willFrame = CGRectMake(100, 300+64+20, 100, 100);
        
//        [UIView animateWithDuration:0.5 animations:^{
//        }];
        
        NSTimeInterval duration = [self transitionDuration:transitionContext];
        [UIView animateWithDuration:duration animations:^{
            imgView.frame = willFrame;
//            fVC.view.backgroundColor = [UIColor colorWithRed:255.0 green:255.0 blue:255.0 alpha:0.0];
        } completion:^(BOOL finished) {
            [imgView removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
        
    }
}

@end
