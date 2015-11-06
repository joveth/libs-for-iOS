//
//  ICViewPagerController.m
//  ILibs
//
//  Created by Shuwei on 15/10/27.
//  Copyright © 2015年 jov. All rights reserved.
//

#import "ICViewPagerController.h"

@interface ICViewPagerController ()

@end

@implementation ICViewPagerController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = self;
    self.delegate = self;
    self.view.backgroundColor=[UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - ViewPagerDataSource
- (NSUInteger)numberOfTabsForViewPager:(ViewPagerController *)viewPager {
    return 10;
}
#pragma mark - ViewPagerDataSource
- (UIView *)viewPager:(ViewPagerController *)viewPager viewForTabAtIndex:(NSUInteger)index {
    
    UILabel *label = [UILabel new];
    label.text = [NSString stringWithFormat:@"Tab #%ld", index];
    [label sizeToFit];
    
    return label;
}


@end
