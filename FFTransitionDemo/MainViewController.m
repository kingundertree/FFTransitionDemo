//
//  MainViewController.m
//  FFTransitionDemo
//
//  Created by xiazer on 15/10/23.
//  Copyright © 2015年 com.freshfresh. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    
    __weak typeof(self) this = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [this addImg];
    });
}

- (void)addImg {
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width)];
    [self.imgView setImage:[UIImage imageNamed:@"youzi.jpg"]];
    [self.view addSubview:self.imgView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 50, 50);
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:@"back" forState:UIControlStateNormal];
    [self.view addSubview:btn];
}

- (void)click:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(doDismiss)]) {
        [self.delegate doDismiss];
    }
}

@end
