//
//  FFPushAnimation.m
//  FFTransitionDemo
//
//  Created by xiazer on 15/10/22.
//  Copyright © 2015年 com.freshfresh. All rights reserved.
//

#import "FFPushAnimation.h"
#import "ViewController.h"
#import "MainViewController.h"

#define ScreenWidth [[UIScreen mainScreen]bounds].size.width
#define ScreenHeight [[UIScreen mainScreen]bounds].size.height

@implementation FFPushAnimation

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    //1
    UIViewController *fromVC   = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    if ([fromVC isKindOfClass:[UINavigationController class]]) {
        UINavigationController *fromeNav = (UINavigationController *)fromVC;
        UIViewController *lastVC = (UIViewController *)[fromeNav.viewControllers lastObject];

        
        UIImageView *imgView;
        if ([lastVC isKindOfClass:[ViewController class]]) {
//            ViewController *vc = (ViewController *)lastVC;
            
            imgView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 300+64+20, 100, 100)];
            [imgView setImage:[UIImage imageNamed:@"youzi.jpg"]];

//            imgView = [vc.imgView copy];
            
            CGRect willFrame = CGRectMake(0, 0, ScreenWidth, ScreenWidth);
            [[transitionContext containerView] addSubview:imgView];
            
            
            CGRect screenBounds = [[UIScreen mainScreen] bounds];
            CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
            toVC.view.frame = CGRectOffset(finalFrame, 0, screenBounds.size.height);
            
            // 3. Add toVC's view to containerView
            UIView *containerView = [transitionContext containerView];
            [containerView addSubview:toVC.view];
            toVC.view.frame = finalFrame;
            toVC.view.alpha = 0.0;
            
            NSTimeInterval duration = [self transitionDuration:transitionContext];
            [UIView animateWithDuration:duration animations:^{
                imgView.frame = willFrame;
                toVC.view.alpha = 1.0;
            } completion:^(BOOL finished) {
                [imgView removeFromSuperview];
                [transitionContext completeTransition:YES];
            }];
            
//            [UIView animateWithDuration:duration
//                                  delay:duration
//                                options:UIViewAnimationOptionCurveLinear
//                             animations:^{
//                             }
//                             completion:^(BOOL finished) {
//                             }];           
        }
    }
}

@end
