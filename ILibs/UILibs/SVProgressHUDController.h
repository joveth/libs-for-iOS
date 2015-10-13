//
//  SVProgressHUDController.h
//  ILibs
//
//  Created by Shuwei on 15/9/1.
//  Copyright (c) 2015年 jov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SVProgressHUDController : UIViewController
- (IBAction)show;
- (IBAction)showWithStatus;

- (IBAction)dismiss;
- (IBAction)showInfoWithStatus;
- (IBAction)showSuccessWithStatus;
- (IBAction)showErrorWithStatus;

- (IBAction)changeStyle:(id)sender;
- (IBAction)changeAnimationType:(id)sender;
- (IBAction)changeMaskType:(id)sender;

@end
