//
//  ChameleonBean.h
//  ILibs
//
//  Created by Shuwei on 15/9/18.
//  Copyright © 2015年 jov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@interface ChameleonBean : NSObject
@property(nonatomic,retain) NSString *colorName;
@property(nonatomic,copy) UIColor *color;
-(ChameleonBean *)initWithProp:(NSString *)colorName andColor:(UIColor *)color;
@end
