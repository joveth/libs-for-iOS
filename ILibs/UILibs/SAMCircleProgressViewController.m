//
//  SAMCircleProgressViewController.m
//  ILibs
//
//  Created by Shuwei on 15/10/27.
//  Copyright © 2015年 jov. All rights reserved.
//

#import "SAMCircleProgressViewController.h"
#import "SAMCircleProgressView.h"
@interface SAMCircleProgressViewController ()

@end

@implementation SAMCircleProgressViewController {
    SAMCircleProgressView *_progressView7;
    NSTimer *_timer;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.851f green:0.859f blue:0.882f alpha:1.0f];
    CGFloat y=70;
    SAMCircleProgressView *progressView1 = [[SAMCircleProgressView alloc] initWithFrame:CGRectMake(20.0f, y, 55.0f, 55.0f)];
    progressView1.progress = 0.25;
    [self.view addSubview:progressView1];
    
    SAMCircleProgressView *progressView2 = [[SAMCircleProgressView alloc] initWithFrame:CGRectMake(95.0f, y, 55.0f, 55.0f)];
    progressView2.progress = 0.50;
    [self.view addSubview:progressView2];
    
    SAMCircleProgressView *progressView3 = [[SAMCircleProgressView alloc] initWithFrame:CGRectMake(170.0f, y, 55.0f, 55.0f)];
    progressView3.progress = 0.75;
    [self.view addSubview:progressView3];
    
    SAMCircleProgressView *progressView4 = [[SAMCircleProgressView alloc] initWithFrame:CGRectMake(245.0f, y, 55.0f, 55.0f)];
    progressView4.progress = 1.0;
    [self.view addSubview:progressView4];
    y+=75;
    SAMCircleProgressView *progressView5 = [[SAMCircleProgressView alloc] initWithFrame:CGRectMake(20.0f, y, 130.0f, 130.0f)];
    progressView5.progress = 0.33;
    [self.view addSubview:progressView5];
    
    SAMCircleProgressView *progressView6 = [[SAMCircleProgressView alloc] initWithFrame:CGRectMake(170.0f, y, 130.0f, 130.0f)];
    progressView6.progress = 0.66;
    [self.view addSubview:progressView6];
    
    _progressView7 = [[SAMCircleProgressView alloc] initWithFrame:CGRectMake(95.0f, 280.0f, 130.0f, 130.0f)];
    [self.view addSubview:_progressView7];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(incrementProgress:) userInfo:nil repeats:YES];
}


- (void)viewDidUnload {
    [super viewDidUnload];
    [_timer invalidate];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        return toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
    }
    return YES;
}


#pragma mark - Timer

- (void)incrementProgress:(NSTimer *)timer {
    _progressView7.progress = _progressView7.progress + 0.01;
    if (_progressView7.progress == 1.0f) {
        _progressView7.progress = 0.0;
    }
}
@end
