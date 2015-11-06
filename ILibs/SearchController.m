//
//  SearchController.m
//  ILibs
//
//  Created by Shuwei on 15/10/27.
//  Copyright © 2015年 jov. All rights reserved.
//

#import "SearchController.h"

@interface SearchController ()

@end

@implementation SearchController{
    UISearchController *searchController;
    NSMutableArray *list;
    DBHelper *db;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    db =[DBHelper sharedInstance];
    list = [[NSMutableArray alloc] init];
    searchController= [[UISearchController alloc] initWithSearchResultsController:nil];
    searchController.searchResultsUpdater = self;
    searchController.dimsBackgroundDuringPresentation = YES;
    searchController.hidesNavigationBarDuringPresentation = NO;
    searchController.searchBar.frame = CGRectMake(searchController.searchBar.frame.origin.x,searchController.searchBar.frame.origin.y, searchController.searchBar.frame.size.width, 44.0);
    searchController.searchBar.placeholder=@"search";
    self.tableView.tableHeaderView = searchController.searchBar;
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
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellidentifier = @"cellIdentifier";
    UITableViewCell    *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
    cell.backgroundColor = [UIColor whiteColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    UILabel *nameLabel =(UILabel*)[cell viewWithTag:1];
    UILabel *contentLabel=(UILabel*)[cell viewWithTag:2];
    
    if(nameLabel==nil){
        nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 8, self.view.frame.size.width-50, 22)];
        nameLabel.lineBreakMode=NSLineBreakByWordWrapping;
        nameLabel.numberOfLines=0;
        nameLabel.tag=1;
        [cell addSubview:nameLabel];
    }
    
    if(contentLabel==nil){
        contentLabel = [[UILabel alloc] init];
        contentLabel.lineBreakMode=NSLineBreakByWordWrapping;
        contentLabel.numberOfLines=0;
        contentLabel.font = [UIFont fontWithName:@"Arial" size:12.0f];
        contentLabel.tag=2;
        contentLabel.alpha=0.6;
        [cell addSubview:contentLabel];
    }
    LibBean *bean = [list objectAtIndex:indexPath.row];
    if(bean){
        nameLabel.text = [NSString stringWithFormat:@"%@",bean.name];
        CGSize size = [bean.des sizeWithAttributes:[NSDictionary dictionaryWithObject:[UIFont fontWithName:@"Arial" size:12.0f] forKey:NSFontAttributeName]];
        CGFloat width = [UIScreen mainScreen].applicationFrame.size.width-55;
        CGFloat line = size.width/width;
        if(line<1){
            line=1;
        }else{
            NSString *th = [NSString stringWithFormat:@"%0.0f",line];
            NSInteger t = th.integerValue;
            if(line-t>0){
                line  = t+1;
            }else{
                line = t;
            }
        }
        //            NSString *temp = [NSString stringWithFormat:@"%0.0f",lines];
        contentLabel.frame=CGRectMake(10, 30, self.view.frame.size.width-50, size.height*line+10);
        contentLabel.text = bean.des;
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    LibBean *bean = [list objectAtIndex:indexPath.row];
    if(bean){
        CGSize size = [bean.des sizeWithAttributes:[NSDictionary dictionaryWithObject:[UIFont fontWithName:@"Arial" size:12.0f] forKey:NSFontAttributeName]];
        CGFloat width = [UIScreen mainScreen].applicationFrame.size.width-55;
        CGFloat line = size.width/width;
        if(line<1){
            line=1;
        }else{
            NSString *th = [NSString stringWithFormat:@"%0.0f",line];
            NSInteger t = th.integerValue;
            if(line-t>0){
                line  = t+1;
            }else{
                line = t;
            }
        }
        CGFloat height =size.height*line;
        return height+50;
    }
    return 44;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [ShareData shareInstance].libBean = [list objectAtIndex:indexPath.row];
    [ShareData shareInstance].flag=NO;
    [ShareData shareInstance].hasDemo=YES;
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    ShowController *show = (ShowController*)[storyboard instantiateViewControllerWithIdentifier:@"ShowId"];
    show.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:show animated:YES];
}
-(void)updateSearchResultsForSearchController:(UISearchController *)sController {
    NSString *searchString = [searchController.searchBar text];
    if(![Common isEmptyString:searchString]){
        list = [db getLibsByKey:searchString];
        [self.tableView reloadData];
    }
}
@end
