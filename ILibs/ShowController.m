//
//  ShowController.m
//  ILibs
//
//  Created by Shuwei on 15/8/28.
//  Copyright (c) 2015年 jov. All rights reserved.
//

#import "ShowController.h"
#import "MBProgressHUDController.h"
#import "ShareData.h"
#import <iAd/iAd.h>
@interface ShowController ()<ADBannerViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webview;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *rightBtn;

@end

@implementation ShowController{
    ADBannerView *bannerView;
    MBProgressHUD *hud;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    self.title=[ShareData shareInstance].libBean.name;
    NSString *path = [[NSBundle mainBundle] pathForResource:[ShareData shareInstance].libBean.content ofType:@"html"];
    if([ShareData shareInstance].flag){
        self.title=@"Information of this App";
        self.rightBtn.title=@"";
        path= [[NSBundle mainBundle] pathForResource:@"about" ofType:@"html"];
    }else if(![ShareData shareInstance].hasDemo){
        self.rightBtn.title=@"";
    }
    hud = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:hud];
    [hud show:YES];
    NSString *html = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    [_webview loadHTMLString:html baseURL:baseURL];
    _webview.delegate=self;
    bannerView = [[ADBannerView alloc]initWithFrame:
                  CGRectMake(0, self.view.frame.size.height-50, self.view.frame.size.width, 50)];
    // Optional to set background color to clear color
    bannerView.delegate=self;
    [bannerView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview: bannerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)showDemo:(id)sender {
    NSLog(@"control=%@",[ShareData shareInstance].libBean.detail);
    Class cls = NSClassFromString([ShareData shareInstance].libBean.detail);
    UIViewController *a= [[cls  alloc]  init];
    //[a addSubview:bannerView];
    a.title=[NSString stringWithFormat:@"%@ Demo",[ShareData shareInstance].libBean.name];
    [a.view addSubview:bannerView];
    [self.navigationController pushViewController:a animated:YES];
}
-(void)bannerView:(ADBannerView *)banner
didFailToReceiveAdWithError:(NSError *)error{
    NSLog(@"Error loading:%@",error);
}

-(void)bannerViewDidLoadAd:(ADBannerView *)banner{
    NSLog(@"Ad loaded");
}
-(void)bannerViewWillLoadAd:(ADBannerView *)banner{
    NSLog(@"Ad will load");
}
-(void)bannerViewActionDidFinish:(ADBannerView *)banner{
    NSLog(@"Ad did finish");
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [hud hide:YES];
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [hud hide:YES];
}
@end
