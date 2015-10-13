//
//  IQKeyboardManagerController.m
//  ILibs
//
//  Created by Shuwei on 15/9/29.
//  Copyright © 2015年 jov. All rights reserved.
//

#import "IQKeyboardManagerController.h"
#import "IQViewController.h"
@interface IQKeyboardManagerController ()

@end

@implementation IQKeyboardManagerController{
    UIButton *toBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    toBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width-10, 44)];
    [toBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [toBtn setTitle:@"click here to begain." forState:UIControlStateNormal];
    [toBtn addTarget:self action:@selector(to:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:toBtn];
}

-(IBAction)to:(id)sender{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"IQKeyboardManager" bundle:nil];
    IQViewController *vc = (IQViewController *)[sb instantiateViewControllerWithIdentifier:@"IQSID"];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
