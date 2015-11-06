//
//  MJRefreshController.m
//  ILibs
//
//  Created by Shuwei on 15/9/1.
//  Copyright (c) 2015年 jov. All rights reserved.
//MJExampleViewController

#import "MJRefreshController.h"
#import "Common.h"
#import "MJTableViewController.h"
#import "MJWebViewViewController.h"
#import "MJCollectionViewController.h"
#import "MJExample.h"
#import "UIViewController+Example.h"
#import "MJRefresh.h"
#import <iAd/iAd.h>

static NSString *const MJExample00 = @"UITableView + pull to refresh";
static NSString *const MJExample10 = @"UITableView + pull to load more";
static NSString *const MJExample20 = @"UICollectionView";
static NSString *const MJExample30 = @"UIWebView";

@interface MJRefreshController ()
@property (strong, nonatomic) NSArray *examples;
@end

@implementation MJRefreshController{
    UITableView *tableview;
    ADBannerView *bannerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"MJRefresh Demo";
    self.view.backgroundColor=[UIColor whiteColor];
    tableview = [[UITableView alloc] initWithFrame:self.view.frame];
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
    bannerView = [[ADBannerView alloc]initWithFrame:
                  CGRectMake(0, self.view.frame.size.height-50, self.view.frame.size.width, 50)];
    // Optional to set background color to clear color
    
    [bannerView setBackgroundColor:[UIColor clearColor]];
    //[self.view addSubview: bannerView];
    // 下拉刷新
    tableview.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 结束刷新
            [tableview.header endRefreshing];
        });
    }];
    
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    tableview.header.automaticallyChangeAlpha = YES;
    
    // 上拉刷新
    tableview.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 结束刷新
            [tableview.footer endRefreshing];
        });
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSArray *)examples
{
    if (!_examples) {
        MJExample *exam0 = [[MJExample alloc] init];
        exam0.header = MJExample00;
        exam0.vcClass = [MJTableViewController class];
        exam0.titles = @[@"Default", @"Use animation picture ", @"Hidden update time", @"Hidden state and time", @"Custom text", @"Custom Refresh"];
        exam0.methods = @[@"example01", @"example02", @"example03", @"example04", @"example05", @"example06"];
        
        MJExample *exam1 = [[MJExample alloc] init];
        exam1.header = MJExample10;
        exam1.vcClass = [MJTableViewController class];
        exam1.titles = @[@"Default", @"Use animation picture ", @"Hidden text", @"Load finish", @"Ban auto load ", @"Custom text", @"Hidden after load finish", @"Rebound 01", @"Rebound 02", @"Custom load more(auto load)", @"Custom load more(auto Rebound) "];
        exam1.methods = @[@"example11", @"example12", @"example13", @"example14", @"example15", @"example16", @"example17", @"example18", @"example19", @"example20", @"example21"];
        
        MJExample *exam2 = [[MJExample alloc] init];
        exam2.header = MJExample20;
        exam2.vcClass = [MJCollectionViewController class];
        exam2.titles = @[@"Load more"];
        exam2.methods = @[@"example21"];
        
        MJExample *exam3 = [[MJExample alloc] init];
        exam3.header = MJExample30;
        exam3.vcClass = [MJWebViewViewController class];
        exam3.titles = @[@"Pull to refresh"];
        exam3.methods = @[@"example31"];
        
        self.examples = @[exam0, exam1, exam2, exam3];
    }
    return _examples;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.examples.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    MJExample *exam = self.examples[section];
    return exam.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"example";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.backgroundColor = [UIColor whiteColor];
        cell.tintColor = [UIColor greenColor];
    }
    MJExample *exam = self.examples[indexPath.section];
    cell.textLabel.text = exam.titles[indexPath.row];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", exam.vcClass, exam.methods[indexPath.row]];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    MJExample *exam = self.examples[section];
    return exam.header;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MJExample *exam = self.examples[indexPath.section];
    UIViewController *vc = [[exam.vcClass alloc] init];
    vc.title = exam.titles[indexPath.row];
    [vc setValue:exam.methods[indexPath.row] forKeyPath:@"method"];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
