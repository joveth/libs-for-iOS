//
//  ChameleonBean.m
//  ILibs
//
//  Created by Shuwei on 15/9/18.
//  Copyright © 2015年 jov. All rights reserved.
//

#import "ChameleonBean.h"

@implementation ChameleonBean
-(ChameleonBean *)initWithProp:(NSString *)colorName andColor:(UIColor *)color{
    self.colorName = colorName;
    self.color = color;
    return self;
}
@end
