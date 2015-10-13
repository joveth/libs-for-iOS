//
//  ZAActivityBarController.h
//  ILibs
//
//  Created by Shuwei on 15/9/1.
//  Copyright (c) 2015年 jov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZAActivityBarController : UIViewController <UITextFieldDelegate> {
    __weak IBOutlet UITextField *_textbox;
    
    __weak IBOutlet UILabel *_actionLabel1;
    __weak IBOutlet UILabel *_actionLabel2;
    __weak IBOutlet UILabel *_actionLabel3;
}
// Action Methods
- (IBAction) show:(id)sender;
- (IBAction) showSuccess:(id)sender;
- (IBAction) showError:(id)sender;
- (IBAction) dismiss:(id)sender;
- (IBAction) dismissAll:(id)sender;
@end
