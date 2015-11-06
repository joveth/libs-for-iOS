//
//  GradientViewController.m
//  ILibs
//
//  Created by Shuwei on 15/10/27.
//  Copyright © 2015年 jov. All rights reserved.
//

#import "SAMLoadingViewController.h"
#import "SAMLoadingView.h"

@interface SAMLoadingViewController ()

@end

@implementation SAMLoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SAMLoadingView *loadingView = [[SAMLoadingView alloc] initWithFrame:self.view.bounds];
    loadingView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:loadingView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
