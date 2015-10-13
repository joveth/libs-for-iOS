//
//  TAPromoteeController.m
//  ILibs
//
//  Created by Shuwei on 15/9/28.
//  Copyright © 2015年 jov. All rights reserved.
//

#import "TAPromoteeController.h"
#import "TAPromotee.h"
@interface TAPromoteeController ()

@end

@implementation TAPromoteeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width-20, 44)];
    [btn1 setTitle:@"showAddButton" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(showAddButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(10, 200, self.view.frame.size.width-20, 44)];
    [btn2 setTitle:@"showWithCustomBackground" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(showWithCustomBackgroundAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(IBAction) showAddButtonAction
{
    
    // 361309726  Pages
    // 284882215  Facebook
    // 822702909  Daylight
    // 355833469  App with long name
    [TAPromotee showFromViewController:self appId:822702909 caption:@"Sun clock in your pocket" completion:^(TAPromoteeUserAction userAction) {
        [self handleUserAction:userAction];
    }];
    
}

- (IBAction)showWithCustomBackgroundAction
{
    [TAPromotee showFromViewController:self appId:937151343 caption:@"Your Battlefield soldier's companion" backgroundImage:[UIImage imageNamed:@"sample-app-background"] completion:^(TAPromoteeUserAction userAction) {
        [self handleUserAction:userAction];
    }];
}

#pragma mark - Helper
-(void) handleUserAction:(TAPromoteeUserAction) userAction
{
    switch (userAction) {
        case TAPromoteeUserActionDidClose:
            // The user just closed the add
            NSLog(@"User did click close");
            break;
        case TAPromoteeUserActionDidInstall:
            // The user did click on the Install button so here you can for example disable the ad for the future
            NSLog(@"User did click install");
            break;
    }
}
@end
