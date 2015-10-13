//
//  ChameleonController.m
//  ILibs
//
//  Created by Shuwei on 15/9/18.
//  Copyright © 2015年 jov. All rights reserved.
//

#import "ChameleonController.h"
#import <ChameleonFramework/Chameleon.h>
#import "ChameleonBean.h"

@interface ChameleonController ()

@end

@implementation ChameleonController{
    NSMutableArray *list;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView=[[UIView alloc] init];
    self.title=@"Chameleon Demo";
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    list=[[NSMutableArray alloc] initWithObjects:
          [[ChameleonBean alloc] initWithProp:@"FlatBlack" andColor:FlatBlack],
          [[ChameleonBean alloc] initWithProp:@"FlatBlackDark" andColor:FlatBlackDark],
          [[ChameleonBean alloc] initWithProp:@"FlatBlue" andColor:FlatBlue],
          [[ChameleonBean alloc] initWithProp:@"FlatBlueDark" andColor:FlatBlueDark],
          [[ChameleonBean alloc] initWithProp:@"FlatBrown" andColor:FlatBrown],
          [[ChameleonBean alloc] initWithProp:@"FlatBrownDark" andColor:FlatBrownDark],
          [[ChameleonBean alloc] initWithProp:@"FlatCoffee" andColor:FlatCoffee],
          [[ChameleonBean alloc] initWithProp:@"FlatCoffeeDark" andColor:FlatCoffeeDark],
          [[ChameleonBean alloc] initWithProp:@"FlatForestGreen" andColor:FlatForestGreen],
          [[ChameleonBean alloc] initWithProp:@"FlatForestGreenDark" andColor:FlatForestGreenDark],
          [[ChameleonBean alloc] initWithProp:@"FlatGray" andColor:FlatGray],
          [[ChameleonBean alloc] initWithProp:@"FlatGrayDark" andColor:FlatGrayDark],
          [[ChameleonBean alloc] initWithProp:@"FlatGreen" andColor:FlatGreen],
          [[ChameleonBean alloc] initWithProp:@"FlatGreenDark" andColor:FlatGreenDark],
          [[ChameleonBean alloc] initWithProp:@"FlatLime" andColor:FlatLime],
          [[ChameleonBean alloc] initWithProp:@"FlatLimeDark" andColor:FlatLimeDark],
          [[ChameleonBean alloc] initWithProp:@"FlatMagenta" andColor:FlatMagenta],
          [[ChameleonBean alloc] initWithProp:@"FlatMagentaDark" andColor:FlatMagentaDark],
          [[ChameleonBean alloc] initWithProp:@"FlatMaroon" andColor:FlatMaroon],
          [[ChameleonBean alloc] initWithProp:@"FlatMaroonDark" andColor:FlatMaroonDark],
          [[ChameleonBean alloc] initWithProp:@"FlatMint" andColor:FlatMint],
          [[ChameleonBean alloc] initWithProp:@"FlatMintDark" andColor:FlatMintDark],
          [[ChameleonBean alloc] initWithProp:@"FlatNavyBlue" andColor:FlatNavyBlue],
          [[ChameleonBean alloc] initWithProp:@"FlatNavyBlueDark" andColor:FlatNavyBlueDark],
          [[ChameleonBean alloc] initWithProp:@"FlatOrange" andColor:FlatOrange],
          [[ChameleonBean alloc] initWithProp:@"FlatOrangeDark" andColor:FlatOrangeDark],
          [[ChameleonBean alloc] initWithProp:@"FlatPink" andColor:FlatPink],
          [[ChameleonBean alloc] initWithProp:@"FlatPinkDark" andColor:FlatPinkDark],
          [[ChameleonBean alloc] initWithProp:@"FlatPlum" andColor:FlatPlum],
          [[ChameleonBean alloc] initWithProp:@"FlatPlumDark" andColor:FlatPlumDark],
          [[ChameleonBean alloc] initWithProp:@"FlatPowderBlue" andColor:FlatPowderBlue],
          [[ChameleonBean alloc] initWithProp:@"FlatPowderBlueDark" andColor:FlatPowderBlueDark],
          [[ChameleonBean alloc] initWithProp:@"FlatPurple" andColor:FlatPurple],
          [[ChameleonBean alloc] initWithProp:@"FlatPurpleDark" andColor:FlatPurpleDark],
          [[ChameleonBean alloc] initWithProp:@"FlatRed" andColor:FlatRed],
          [[ChameleonBean alloc] initWithProp:@"FlatRedDark" andColor:FlatRedDark],
          [[ChameleonBean alloc] initWithProp:@"FlatSand" andColor:FlatSand],
          [[ChameleonBean alloc] initWithProp:@"FlatSandDark" andColor:FlatSandDark],
          [[ChameleonBean alloc] initWithProp:@"FlatSkyBlue" andColor:FlatSkyBlue],
          [[ChameleonBean alloc] initWithProp:@"FlatSkyBlueDark" andColor:FlatSkyBlueDark],
          [[ChameleonBean alloc] initWithProp:@"FlatTeal" andColor:FlatTeal],
          [[ChameleonBean alloc] initWithProp:@"FlatTealDark" andColor:FlatTealDark],
          [[ChameleonBean alloc] initWithProp:@"FlatWatermelon" andColor:FlatWatermelon],
          [[ChameleonBean alloc] initWithProp:@"FlatWatermelonDark" andColor:FlatWatermelonDark],
          [[ChameleonBean alloc] initWithProp:@"FlatWhite" andColor:FlatWhite],
          [[ChameleonBean alloc] initWithProp:@"FlatWhiteDark" andColor:FlatWhiteDark],
          [[ChameleonBean alloc] initWithProp:@"FlatYellow" andColor:FlatYellow],
          [[ChameleonBean alloc] initWithProp:@"FlatYellowDark" andColor:FlatYellowDark],
          nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Chameleon";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.backgroundColor = [UIColor whiteColor];
        cell.tintColor = [UIColor greenColor];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    ChameleonBean *exam = [list objectAtIndex:indexPath.row];
    cell.textLabel.text = exam.colorName;
    cell.backgroundColor = exam.color;
    return cell;
}


@end
