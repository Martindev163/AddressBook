//
//  DataSet.m
//  AddressBook
//
//  Created by apple on 16/5/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "DataSet.h"
#import "common.h"
#import "dataModel.h"
@interface DataSet()
{
    FMDatabase *_db;
}

@end

@implementation DataSet


//创建单例
+ (DataSet *)shareManager
{
    static DataSet *shareDataSet = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        shareDataSet = [[self alloc] init];
    });
    return shareDataSet;
}

//创建数据库
- (void)createDatabase
{
    _db = [FMDatabase databaseWithPath:FILENAME];
    if ([_db open]) {
        //创建成功
        BOOL result = [_db executeUpdate:@"create table if not exists c_contents (id integer primary key autoincrement,icon text not null,name text not null,tele integer not null,mail text not null,address text not null);"];
        if (result) {
            NSLog(@"创建表成功");
        }else
        {
            NSLog(@"创建表失败");
        }
    }else
    {
        NSLog(@"数据库创建失败");
    }
}
//查询数据库
- (NSMutableArray *)showDatabase
{
    NSMutableArray *dataArray = [NSMutableArray array];
    if (dataArray.count != 0) {
        dataArray = [NSMutableArray array];
    }
    FMResultSet *result = [_db executeQuery:@"select * from c_contents"];
    while ([result next]) {
        int ID = [result intForColumn:@"id"];
        NSData *icon = [result dataForColumn:@"icon"];
        NSString *name = [result stringForColumn:@"name"];
        NSString *tele = [result stringForColumn:@"tele"];
        NSString *mail = [result stringForColumn:@"mail"];
        NSString *address = [result stringForColumn:@"address"];
        NSString *idStr = [NSString stringWithFormat:@"%i",ID];
        NSDictionary *dic= @{@"id":idStr,@"icon":icon,@"name":name,@"tele":tele,@"mail":mail,@"address":address};
        //加入到数组
        [dataArray addObject:dic];
    }
    return  dataArray;
}
//插入数据
-(BOOL)insertDatabaseIcon:(NSData *)icon name:(NSString *)name tele:(NSString *)tele mail:(NSString *)mail address:(NSString *)address
{
    BOOL result = [_db executeUpdate:@"insert into c_contents (icon,name,tele,mail,address) values (?,?,?,?,?);",icon,name,tele,mail,address];
    return result;
}

//删除某些数据
- (BOOL)deleteDatabase:(int)ID
{
    NSString *deleData = [NSString stringWithFormat:@"delete from c_contents where id = %d",ID];
    BOOL result = [_db executeUpdate:deleData];
    if (result) {
        NSLog(@"删除成功");
    }else
    {
        NSLog(@"删除失败");
    }
    return result;
}
//关闭数据库
- (void)closeDatabase
{
    if ([_db close])
    {
        NSLog(@"关闭数据库成功");
    }
    else
    {
        NSLog(@"关闭数据库失败");
    }
}

@end
