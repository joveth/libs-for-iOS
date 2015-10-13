//
//  IQDropDownTextFieldController.m
//  ILibs
//
//  Created by Shuwei on 15/9/29.
//  Copyright © 2015年 jov. All rights reserved.
//

#import "IQDropDownTextFieldController.h"

@interface IQDropDownTextFieldController ()

@end

@implementation IQDropDownTextFieldController{
    IQDropDownTextField *textFieldTextPicker;
    IQDropDownTextField *textFieldOptionalTextPicker;
    IQDropDownTextField *textFieldDatePicker;
    IQDropDownTextField *textFieldTimePicker;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar setBarStyle:UIBarStyleBlackTranslucent];
    [toolbar sizeToFit];
    UIBarButtonItem *buttonflexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *buttonDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneClicked:)];
    CGFloat y = 100;
    textFieldTextPicker = [[IQDropDownTextField alloc] initWithFrame:CGRectMake(8, y, self.view.frame.size.width-20, 40)];
    textFieldTextPicker.borderStyle=UITextBorderStyleRoundedRect;
    textFieldTextPicker.placeholder=@"TextPicker";
    y+=50;
    textFieldOptionalTextPicker = [[IQDropDownTextField alloc] initWithFrame:CGRectMake(8, y, self.view.frame.size.width-20, 40)];
    textFieldOptionalTextPicker.borderStyle=UITextBorderStyleRoundedRect;
    textFieldOptionalTextPicker.placeholder=@"OptionalTextPicker";
    y+=50;
    textFieldDatePicker = [[IQDropDownTextField alloc] initWithFrame:CGRectMake(8, y, self.view.frame.size.width-20, 40)];
    textFieldDatePicker.borderStyle=UITextBorderStyleRoundedRect;
    textFieldDatePicker.placeholder=@"DatePicker";
    y+=50;
    textFieldTimePicker= [[IQDropDownTextField alloc] initWithFrame:CGRectMake(8, y, self.view.frame.size.width-20, 40)];
    textFieldTimePicker.borderStyle=UITextBorderStyleRoundedRect;
    textFieldTimePicker.placeholder=@"TimePicker";
    [toolbar setItems:[NSArray arrayWithObjects:buttonflexible,buttonDone, nil]];
    textFieldDatePicker.inputAccessoryView = toolbar;
    textFieldTextPicker.inputAccessoryView = toolbar;
    textFieldTimePicker.inputAccessoryView = toolbar;
    textFieldOptionalTextPicker.inputAccessoryView = toolbar;
    
    textFieldTextPicker.isOptionalDropDown = NO;
    [textFieldTextPicker setItemList:[NSArray arrayWithObjects:@"London",@"Johannesburg",@"Moscow",@"Mumbai",@"Tokyo",@"Sydney", nil]];
    [textFieldOptionalTextPicker setItemList:[NSArray arrayWithObjects:@"London",@"Johannesburg",@"Moscow",@"Mumbai",@"Tokyo",@"Sydney", nil]];
    
    [textFieldDatePicker setDropDownMode:IQDropDownModeDatePicker];
    
    [textFieldTimePicker setDropDownMode:IQDropDownModeTimePicker];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:textFieldTextPicker];
    [self.view addSubview:textFieldOptionalTextPicker];
    [self.view addSubview:textFieldTimePicker];
    [self.view addSubview:textFieldDatePicker];
    self.view.backgroundColor=[UIColor whiteColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)doneClicked:(UIBarButtonItem*)button
{
    [self.view endEditing:YES];
}

@end
