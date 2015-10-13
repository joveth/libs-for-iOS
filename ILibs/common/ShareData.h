//
//  ShareData.h
//  Isaac
//
//  Created by Shuwei on 15/7/23.
//  Copyright (c) 2015年 Shuwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LibBean.h"

@interface ShareData : NSObject

@property(atomic,retain) LibBean *libBean;
@property(atomic,retain) NSString *type;
@property(atomic,assign)BOOL flag;
@property(atomic,assign)BOOL hasDemo;
+(ShareData *) shareInstance;
@end
