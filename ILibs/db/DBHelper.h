//
//  DBHelper.h
//  Isaac
//
//  Created by Shuwei on 15/7/2.
//  Copyright (c) 2015年 Shuwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBHelper : NSObject
+(id)sharedInstance;
-(BOOL)openDB;
-(void)initData;
-(void)deleteData;
-(NSInteger)getCnt;
-(NSMutableArray *)getAllLibs:(NSString *)offset;
-(NSMutableArray *)getLibsByKey:(NSString *)keyword;
-(NSMutableArray *)getLibsByType:(NSString *)type;
@end
