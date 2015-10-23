//
//  MainViewController.h
//  FFTransitionDemo
//
//  Created by xiazer on 15/10/23.
//  Copyright © 2015年 com.freshfresh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MainViewDelegate <NSObject>

- (void)doDismiss;

@end

@interface MainViewController : UIViewController

@property (nonatomic, assign) id<MainViewDelegate> delegate;
@property (nonatomic, strong) UIImageView *imgView;
@end
