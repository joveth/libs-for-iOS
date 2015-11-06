//
//  DBHelper.m
//  Isaac
//
//  Created by Shuwei on 15/7/2.
//  Copyright (c) 2015年 Shuwei. All rights reserved.
//

#import "DBHelper.h"
#import "FMDatabase.h"
#import "Common.h"
#import "LibBean.h"

@interface DBHelper(){
    FMDatabase *db;
}
@end

static const NSString *TB_LIBS = @"tb_libs";

@implementation DBHelper
+(id)sharedInstance{
    static DBHelper *sharedInstance = nil;
    static dispatch_once_t once;
    dispatch_once(&once,^{
        sharedInstance = [[super alloc]init];
    });
    return sharedInstance;
}
-(BOOL)openDB{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *fileName = [path stringByAppendingPathComponent:@"ilibs.sqlite"];
    
    // 1.获得数据库对象
    db = [FMDatabase databaseWithPath:fileName];
    
    // 2.打开数据库
    if ([db open]) {
        NSLog(@"打开成功");
        // 2.1创建表
        NSString *sql = @"CREATE TABLE IF NOT EXISTS %@ (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name varchar(200),des varchar(500), content varchar(100),images varchar(100),type char(1),detail varchar(100))";
        BOOL success =  [db executeUpdate:[NSString stringWithFormat:sql,TB_LIBS]];
        return success;
    }else{
        return NO;
    }
}
-(void)deleteData{
    if(![db open]){
        return;
    }
    [db executeUpdate:[NSString stringWithFormat:@"delete from %@ ",TB_LIBS]];
    [db close];
}
-(void)initData{
    NSArray *aArray = [@"data.db" componentsSeparatedByString:@"."];
    NSString *filename = [aArray objectAtIndex:0];
    NSString *sufix = [aArray objectAtIndex:1];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:filename ofType:sufix];
    NSString* myString = [NSString stringWithContentsOfFile:filePath usedEncoding:NULL error:NULL];
    NSArray *result = [myString componentsSeparatedByString:@"\n"];
    if(![db open]){
        return;
    }
    for(int i=0;i<[result count];i++){
        myString = [result objectAtIndex:i];
        if([Common isEmptyString:myString]){
            continue;
        }
        [db executeUpdate:myString];
    }
    [db close];
}
-(NSInteger)getCnt{
    if(![db open])
    {
        return 0;
    }
    FMResultSet *rs = [db executeQuery:[NSString stringWithFormat:@"select count(*) as total from %@ ",TB_LIBS]];
    NSString *temp =@"0";
    if ([rs next]) {
        NSDictionary *dict = [rs resultDictionary];
        temp = dict[@"total"];
    }
    [rs close];
    [db close];
    return temp.integerValue;
}
-(NSMutableArray *)getAllLibs:(NSString *)offset{
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    if(![db open])
    {
        return ret;
    }
    FMResultSet *rs = [db executeQuery:[NSString stringWithFormat:@"select * from %@ ",TB_LIBS]];
    LibBean *bean;
    while ([rs next]) {
        NSDictionary *dict = [rs resultDictionary];
        bean = [[LibBean alloc] init];
        bean.lid = dict[@"id"];
        bean.images = dict[@"images"];
        bean.name = dict[@"name"];
        bean.content = dict[@"content"];
        bean.des = dict[@"des"];
        bean.type = dict[@"type"];
        bean.detail = dict[@"detail"];
        [ret addObject:bean];
    }
    [rs close];
    [db close];
    return ret;
}
-(NSMutableArray *)getLibsByKey:(NSString *)keyword{
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    if(![db open])
    {
        return ret;
    }
    FMResultSet *rs = [db executeQuery:[NSString stringWithFormat:@"select * from %@  where name like '%%%@%%' or des like '%%%@%%' ",TB_LIBS,keyword,keyword]];
    LibBean *bean;
    while ([rs next]) {
        NSDictionary *dict = [rs resultDictionary];
        bean = [[LibBean alloc] init];
        bean.lid = dict[@"id"];
        bean.images = dict[@"images"];
        bean.name = dict[@"name"];
        bean.content = dict[@"content"];
        bean.des = dict[@"des"];
        bean.type = dict[@"type"];
        bean.detail = dict[@"detail"];
        [ret addObject:bean];
    }
    [rs close];
    [db close];
    return ret;
}
-(NSMutableArray *)getLibsByType:(NSString *)type{
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    if(![db open])
    {
        return ret;
    }
    FMResultSet *rs = [db executeQuery:[NSString stringWithFormat:@"select * from %@  where type=? ",TB_LIBS],type];
    LibBean *bean;
    while ([rs next]) {
        NSDictionary *dict = [rs resultDictionary];
        bean = [[LibBean alloc] init];
        bean.lid = dict[@"id"];
        bean.images = dict[@"images"];
        bean.name = dict[@"name"];
        bean.content = dict[@"content"];
        bean.des = dict[@"des"];
        bean.type = dict[@"type"];
        bean.detail = dict[@"detail"];
        [ret addObject:bean];
    }
    [rs close];
    [db close];
    return ret;
}

@end
