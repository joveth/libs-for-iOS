//
//  ViewController.m
//  KeyboardTextFieldDemo

#import "IQViewController.h"
#import "IQKeyboardManager.h"

@interface IQViewController ()<UIActionSheetDelegate>

@end


@implementation IQViewController{
    ADBannerView *bannerView;
}

- (IBAction)shareClicked:(UIBarButtonItem *)sender
{
    
#ifdef NSFoundationVersionNumber_iOS_5_1

    NSString *shareString = @"IQKeyboardManager is really great control for iOS developer to manage keyboard-textField.";
    UIImage *shareImage = [UIImage imageNamed:@"IQKeyboardManagerScreenshot"];
    NSURL *youtubeUrl = [NSURL URLWithString:@"http://youtu.be/6nhLw6hju2A"];
    
    NSArray *activityItems = @[youtubeUrl,
                              shareString,
                              shareImage];
    
    UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    NSArray *excludedActivities = @[UIActivityTypePrint,
                                    UIActivityTypeCopyToPasteboard,
                                    UIActivityTypeAssignToContact,
                                    UIActivityTypeSaveToCameraRoll];
    controller.excludedActivityTypes = excludedActivities;
    [self presentViewController:controller animated:YES completion:nil];
#endif
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [[IQKeyboardManager sharedManager] setToolbarManageBehaviour:IQAutoToolbarByPosition];
    bannerView = [[ADBannerView alloc]initWithFrame:
                  CGRectMake(0, self.view.frame.size.height-100, self.view.frame.size.width, 50)];
    // Optional to set background color to clear color
    [bannerView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview: bannerView];
}

-(BOOL)shouldAutorotate
{
    return NO;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

#ifdef NSFoundationVersionNumber_iOS_5_1

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

#endif

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

@end

