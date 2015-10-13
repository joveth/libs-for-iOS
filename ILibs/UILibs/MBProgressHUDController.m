//
//  MBProgressHUDController.m
//  ILibs
//
//  Created by Shuwei on 15/9/1.
//  Copyright (c) 2015年 jov. All rights reserved.
//

#import "MBProgressHUDController.h"
#import "Common.h"
#import "MBProgressHUD.h"
#import <iAd/iAd.h>

@interface MBProgressHUDController() {
    MBProgressHUD *HUD;
    long long expectedLength;
    long long currentLength;
    UIScrollView *scroll;
    ADBannerView *bannerView;
}

@end

@implementation MBProgressHUDController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 900)];
    scroll.backgroundColor=[UIColor whiteColor];
    scroll.delegate = self;
    scroll.scrollEnabled=YES;
    [scroll setContentSize:CGSizeMake(self.view.frame.size.width, 1100)];
    [self.view addSubview:scroll];
    bannerView = [[ADBannerView alloc]initWithFrame:
                  CGRectMake(0, self.view.frame.size.height-50, self.view.frame.size.width, 50)];
    // Optional to set background color to clear color
    
    [bannerView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview: bannerView];
    CGFloat y=10;
    CGFloat width =self.view.frame.size.width-20;
    UIButton *btn1=[[UIButton alloc]initWithFrame:CGRectMake(10, y, width, 40) ];
    [btn1 setTitle:@"Simple indeterminate progress" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn1.layer.borderWidth=1;
    btn1.layer.borderColor=[UIColor grayColor].CGColor;
    btn1.layer.cornerRadius=4;
    btn1.layer.masksToBounds=YES;
    [btn1 addTarget:self action:@selector(showSimple:) forControlEvents:UIControlEventTouchUpInside];
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"MBProgressHUD Demo";
    [scroll addSubview:btn1];
    y+=50;
    UIButton *btn2 =[[UIButton alloc]initWithFrame:CGRectMake(10, y, width, 40) ];
    [btn2 setTitle:@"With label" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn2.layer.borderWidth=1;
    btn2.layer.borderColor=[UIColor grayColor].CGColor;
    btn2.layer.cornerRadius=4;
    btn2.layer.masksToBounds=YES;
    [btn2 addTarget:self action:@selector(showWithLabel:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:btn2];
    y+=50;
    UIButton *btn3 =[[UIButton alloc]initWithFrame:CGRectMake(10, y, width, 40) ];
    [btn3 setTitle:@"With details label" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn3.layer.borderWidth=1;
    btn3.layer.borderColor=[UIColor grayColor].CGColor;
    btn3.layer.cornerRadius=4;
    btn3.layer.masksToBounds=YES;
    [btn3 addTarget:self action:@selector(showWithDetailsLabel:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:btn3];
    y+=50;
    UIButton *btn4 =[[UIButton alloc]initWithFrame:CGRectMake(10, y, width, 40) ];
    [btn4 setTitle:@"Determinate mode" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn4.layer.borderWidth=1;
    btn4.layer.borderColor=[UIColor grayColor].CGColor;
    btn4.layer.cornerRadius=4;
    btn4.layer.masksToBounds=YES;
    [btn4 addTarget:self action:@selector(showWithLabelDeterminate:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:btn4];
    y+=50;
    UIButton *btn5 =[[UIButton alloc]initWithFrame:CGRectMake(10, y, width, 40) ];
    [btn5 setTitle:@"Annular determinate mode" forState:UIControlStateNormal];
    [btn5 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn5.layer.borderWidth=1;
    btn5.layer.borderColor=[UIColor grayColor].CGColor;
    btn5.layer.cornerRadius=4;
    btn5.layer.masksToBounds=YES;
    [btn5 addTarget:self action:@selector(showWIthLabelAnnularDeterminate:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:btn5];
    y+=50;
    UIButton *btn6 =[[UIButton alloc]initWithFrame:CGRectMake(10, y, width, 40) ];
    [btn6 setTitle:@"Bar determinate mode" forState:UIControlStateNormal];
    [btn6 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn6.layer.borderWidth=1;
    btn6.layer.borderColor=[UIColor grayColor].CGColor;
    btn6.layer.cornerRadius=4;
    btn6.layer.masksToBounds=YES;
    [btn6 addTarget:self action:@selector(showWithLabelDeterminateHorizontalBar:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:btn6];
    y+=50;
    UIButton *btn7 =[[UIButton alloc]initWithFrame:CGRectMake(10, y, width, 40) ];
    [btn7 setTitle:@"Custom view" forState:UIControlStateNormal];
    [btn7 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn7.layer.borderWidth=1;
    btn7.layer.borderColor=[UIColor grayColor].CGColor;
    btn7.layer.cornerRadius=4;
    btn7.layer.masksToBounds=YES;
    [btn7 addTarget:self action:@selector(showWithCustomView:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:btn7];
    y+=50;
    UIButton *btn8 =[[UIButton alloc]initWithFrame:CGRectMake(10, y, width, 40) ];
    [btn8 setTitle:@"Mode switching" forState:UIControlStateNormal];
    [btn8 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn8.layer.borderWidth=1;
    btn8.layer.borderColor=[UIColor grayColor].CGColor;
    btn8.layer.cornerRadius=4;
    btn8.layer.masksToBounds=YES;
    [btn8 addTarget:self action:@selector(showWithLabelMixed:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:btn8];
    y+=50;
    UIButton *btn9 =[[UIButton alloc]initWithFrame:CGRectMake(10, y, width, 40) ];
    [btn9 setTitle:@"Using blocks" forState:UIControlStateNormal];
    [btn9 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn9.layer.borderWidth=1;
    btn9.layer.borderColor=[UIColor grayColor].CGColor;
    btn9.layer.cornerRadius=4;
    btn9.layer.masksToBounds=YES;
    [btn9 addTarget:self action:@selector(showUsingBlocks:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:btn9];
    
    y+=50;
    UIButton *btn11 =[[UIButton alloc]initWithFrame:CGRectMake(10, y, width, 40) ];
    [btn11 setTitle:@"On Window" forState:UIControlStateNormal];
    [btn11 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn11.layer.borderWidth=1;
    btn11.layer.borderColor=[UIColor grayColor].CGColor;
    btn11.layer.cornerRadius=4;
    btn11.layer.masksToBounds=YES;
    [btn11 addTarget:self action:@selector(showOnWindow:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:btn11];
    y+=50;
    UIButton *btn12 =[[UIButton alloc]initWithFrame:CGRectMake(10, y, width, 40) ];
    [btn12 setTitle:@"NSURLConnection" forState:UIControlStateNormal];
    [btn12 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn12.layer.borderWidth=1;
    btn12.layer.borderColor=[UIColor grayColor].CGColor;
    btn12.layer.cornerRadius=4;
    btn12.layer.masksToBounds=YES;
    [btn12 addTarget:self action:@selector(showURL:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:btn12];
    y+=50;
    UIButton *btn13 =[[UIButton alloc]initWithFrame:CGRectMake(10, y, width, 40) ];
    [btn13 setTitle:@"Dim background" forState:UIControlStateNormal];
    [btn13 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn13.layer.borderWidth=1;
    btn13.layer.borderColor=[UIColor grayColor].CGColor;
    btn13.layer.cornerRadius=4;
    btn13.layer.masksToBounds=YES;
    [btn13 addTarget:self action:@selector(showWithGradient:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:btn13];
    y+=50;
    UIButton *btn14 =[[UIButton alloc]initWithFrame:CGRectMake(10, y, width, 40) ];
    [btn14 setTitle:@"Text only" forState:UIControlStateNormal];
    [btn14 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn14.layer.borderWidth=1;
    btn14.layer.borderColor=[UIColor grayColor].CGColor;
    btn14.layer.cornerRadius=4;
    btn14.layer.masksToBounds=YES;
    [btn14 addTarget:self action:@selector(showTextOnly:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:btn14];
    y+=50;
    UIButton *btn15 =[[UIButton alloc]initWithFrame:CGRectMake(10, y, width, 40) ];
    [btn15 setTitle:@"Colored" forState:UIControlStateNormal];
    [btn15 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn15.layer.borderWidth=1;
    btn15.layer.borderColor=[UIColor grayColor].CGColor;
    btn15.layer.cornerRadius=4;
    btn15.layer.masksToBounds=YES;
    [btn15 addTarget:self action:@selector(showWithColor:) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:btn15];
}

-(IBAction)backBtn:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)showSimple:(id)sender {
    // The hud will dispable all input on the view (use the higest view possible in the view hierarchy)
    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:HUD];
    
    // Regiser for HUD callbacks so we can remove it from the window at the right time
    
    // Show the HUD while the provided method executes in a new thread
    [HUD showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
}
- (void)myTask {
    // Do something usefull in here instead of sleeping ...
    sleep(3);
}

- (IBAction)showWithLabel:(id)sender {
    
    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:HUD];
    
    HUD.delegate = self;
    HUD.labelText = @"Loading";
    
    [HUD showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
}
- (IBAction)showWithDetailsLabel:(id)sender {
    
    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:HUD];
    
    HUD.delegate = self;
    HUD.labelText = @"Loading";
    HUD.detailsLabelText = @"updating data";
    HUD.square = YES;
    
    [HUD showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
}

- (IBAction)showWithLabelDeterminate:(id)sender {
    
    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:HUD];
    
    // Set determinate mode
    HUD.mode = MBProgressHUDModeDeterminate;
    
    HUD.delegate = self;
    HUD.labelText = @"Loading";
    
    // myProgressTask uses the HUD instance to update progress
    [HUD showWhileExecuting:@selector(myProgressTask) onTarget:self withObject:nil animated:YES];
}

- (IBAction)showWIthLabelAnnularDeterminate:(id)sender {
    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:HUD];
    
    // Set determinate mode
    HUD.mode = MBProgressHUDModeAnnularDeterminate;
    
    HUD.delegate = self;
    HUD.labelText = @"Loading";
    
    // myProgressTask uses the HUD instance to update progress
    [HUD showWhileExecuting:@selector(myProgressTask) onTarget:self withObject:nil animated:YES];
}

- (IBAction)showWithLabelDeterminateHorizontalBar:(id)sender {
    
    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:HUD];
    
    // Set determinate bar mode
    HUD.mode = MBProgressHUDModeDeterminateHorizontalBar;
    
    HUD.delegate = self;
    
    // myProgressTask uses the HUD instance to update progress
    [HUD showWhileExecuting:@selector(myProgressTask) onTarget:self withObject:nil animated:YES];
}

- (IBAction)showWithCustomView:(id)sender {
    
    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:HUD];
    
    // The sample image is based on the work by http://www.pixelpressicons.com, http://creativecommons.org/licenses/by/2.5/ca/
    // Make the customViews 37 by 37 pixels for best results (those are the bounds of the build-in progress indicators)
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    
    // Set custom view mode
    HUD.mode = MBProgressHUDModeCustomView;
    
    HUD.delegate = self;
    HUD.labelText = @"Completed";
    
    [HUD show:YES];
    [HUD hide:YES afterDelay:3];
}

- (IBAction)showWithLabelMixed:(id)sender {
    
    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:HUD];
    
    HUD.delegate = self;
    HUD.labelText = @"Connecting";
    HUD.minSize = CGSizeMake(135.f, 135.f);
    
    [HUD showWhileExecuting:@selector(myMixedTask) onTarget:self withObject:nil animated:YES];
}

- (IBAction)showUsingBlocks:(id)sender {
#if NS_BLOCKS_AVAILABLE
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:hud];
    hud.labelText = @"With a block";
    
    [hud showAnimated:YES whileExecutingBlock:^{
        [self myTask];
    } completionBlock:^{
        [hud removeFromSuperview];
    }];
#endif
}

- (IBAction)showOnWindow:(id)sender {
    // The hud will dispable all input on the window
    HUD = [[MBProgressHUD alloc] initWithView:self.view.window];
    [self.view.window addSubview:HUD];
    
    HUD.delegate = self;
    HUD.labelText = @"Loading";
    
    [HUD showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
}

- (IBAction)showURL:(id)sender {
    NSURL *URL = [NSURL URLWithString:@"http://a1408.g.akamai.net/5/1408/1388/2005110403/1a1a1ad948be278cff2d96046ad90768d848b41947aa1986/sample_iPod.m4v.zip"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
    
    HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    HUD.delegate = self;
}


- (IBAction)showWithGradient:(id)sender {
    
    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:HUD];
    
    HUD.dimBackground = YES;
    
    // Regiser for HUD callbacks so we can remove it from the window at the right time
    HUD.delegate = self;
    
    // Show the HUD while the provided method executes in a new thread
    [HUD showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
}

- (IBAction)showTextOnly:(id)sender {
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.labelText = @"Some message...";
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    
    [hud hide:YES afterDelay:3];
}

- (IBAction)showWithColor:(id)sender{
    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:HUD];
    
    // Set the hud to display with a color
    HUD.color = [UIColor colorWithRed:0.23 green:0.50 blue:0.82 alpha:0.90];
    
    HUD.delegate = self;
    [HUD showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
}


- (void)myProgressTask {
    // This just increases the progress indicator in a loop
    float progress = 0.0f;
    while (progress < 1.0f) {
        progress += 0.01f;
        HUD.progress = progress;
        usleep(50000);
    }
}

- (void)myMixedTask {
    // Indeterminate mode
    sleep(2);
    // Switch to determinate mode
    HUD.mode = MBProgressHUDModeDeterminate;
    HUD.labelText = @"Progress";
    float progress = 0.0f;
    while (progress < 1.0f)
    {
        progress += 0.01f;
        HUD.progress = progress;
        usleep(50000);
    }
    // Back to indeterminate mode
    HUD.mode = MBProgressHUDModeIndeterminate;
    HUD.labelText = @"Cleaning up";
    sleep(2);
    // UIImageView is a UIKit class, we have to initialize it on the main thread
    __block UIImageView *imageView;
    dispatch_sync(dispatch_get_main_queue(), ^{
        UIImage *image = [UIImage imageNamed:@"37x-Checkmark.png"];
        imageView = [[UIImageView alloc] initWithImage:image];
    });
    HUD.customView = imageView;
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.labelText = @"Completed";
    sleep(2);
}

#pragma mark - NSURLConnectionDelegete

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    expectedLength = MAX([response expectedContentLength], 1);
    currentLength = 0;
    HUD.mode = MBProgressHUDModeDeterminate;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    currentLength += [data length];
    HUD.progress = currentLength / (float)expectedLength;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]] ;
    HUD.mode = MBProgressHUDModeCustomView;
    [HUD hide:YES afterDelay:2];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [HUD hide:YES];
}

#pragma mark - MBProgressHUDDelegate

- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
    [HUD removeFromSuperview];
    HUD = nil;
}
@end
