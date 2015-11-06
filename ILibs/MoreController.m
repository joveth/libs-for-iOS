//
//  MoreController.m
//  ILibs
//
//  Created by Shuwei on 15/8/28.
//  Copyright (c) 2015年 jov. All rights reserved.
//

#import "MoreController.h"
#import "AboutController.h"
#import "Common.h"
#import "ShowController.h"
#import "ShareData.h"

@interface MoreController ()

@end

@implementation MoreController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor=[Common colorWithHexString:@"#e0e0e0"];
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0){
        if(indexPath.row==0){
            [ShareData shareInstance].flag=YES;
            UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            ShowController *show = (ShowController*)[storyboard instantiateViewControllerWithIdentifier:@"ShowId"];
            show.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:show animated:YES];
        }else if(indexPath.row==1){
            UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            AboutController *show = (AboutController*)[storyboard instantiateViewControllerWithIdentifier:@"AboutId"];
            show.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:show animated:YES];
        }
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *myHeader = [[UIView alloc] init];
    UILabel *myLabel = [[UILabel alloc] init];
    [myLabel setFrame:CGRectMake(8, 0, 200, 10)];
    [myLabel setTag:101];
    [myLabel setAlpha:0.5];
    [myLabel setFont: [UIFont fontWithName:@"Arial" size:14]];
    [myLabel setBackgroundColor:[UIColor clearColor]];
    [myHeader setBackgroundColor:[Common colorWithHexString:@"#e0e0e0"]];
    [myLabel setText:[NSString stringWithFormat:@" "]];
    [myHeader addSubview:myLabel];
    
    return myHeader;
}

@end
