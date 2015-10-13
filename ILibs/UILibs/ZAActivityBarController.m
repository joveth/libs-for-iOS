//
//  ZAActivityBarController.m
//  ILibs
//
//  Created by Shuwei on 15/9/1.
//  Copyright (c) 2015年 jov. All rights reserved.
//

#import "ZAActivityBarController.h"
#import "ZAActivityBar.h"

@interface ZAActivityBarController ()

@end

@implementation ZAActivityBarController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.title=@"ZAActivityBar Demo";
}

- (NSString *) actionForSender:(id)sender show:(BOOL)show {
    
    // Get the action
    UIButton *button = (UIButton *)sender;
    NSString *action = [NSString stringWithFormat:@"Action%ld",button.tag];
    
    // Set the title
    UILabel *label = nil;
    if (button.tag == 1) label = _actionLabel1;
    if (button.tag == 2) label = _actionLabel2;
    if (button.tag == 3) label = _actionLabel3;
    
    NSString *buttonText = nil;
    if (show) {
        buttonText = [NSString stringWithFormat:@"%@: %@", action, _textbox.text];
    } else {
        buttonText = [NSString stringWithFormat:@"%@: -- dismissed --", action];
    }
    
    [label setText:buttonText];
    
    return action;
}

- (IBAction) show:(id)sender {
    [self dismissTextField];
    NSString *action = [self actionForSender:sender show:YES];
    [ZAActivityBar showWithStatus:_textbox.text forAction:action];
}

- (IBAction) showSuccess:(id)sender {
    [self dismissTextField];
    NSString *action = [self actionForSender:sender show:NO];
    [ZAActivityBar showSuccessWithStatus:_textbox.text forAction:action];
}

- (IBAction) showError:(id)sender {
    [self dismissTextField];
    NSString *action = [self actionForSender:sender show:NO];
    [ZAActivityBar showErrorWithStatus:_textbox.text forAction:action];
}

- (IBAction) dismiss:(id)sender {
    [self dismissTextField];
    NSString *action = [self actionForSender:sender show:NO];
    [ZAActivityBar dismissForAction:action];
}

- (IBAction) dismissAll:(id)sender {
    [self dismissTextField];
    
    [_actionLabel1 setText:@"Action1: -- dismissed --"];
    [_actionLabel2 setText:@"Action2: -- dismissed --"];
    [_actionLabel3 setText:@"Action3: -- dismissed --"];
    
    [ZAActivityBar dismiss];
}

///////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark TextField Methods

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [self dismissTextField];
    return YES;
}

- (void) dismissTextField {
    if ([_textbox isFirstResponder]) {
        [_textbox resignFirstResponder];
    }
}

///////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark Rotation Methods

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [ZAActivityBar dismiss];
}

@end
