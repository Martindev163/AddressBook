//
//  DataSet.h
//  AddressBook
//
//  Created by apple on 16/5/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSet : NSObject

//创建单例
+ (DataSet *)shareManager;
//创建数据库
- (void)createDatabase;
//查询数据库
- (NSMutableArray *)showDatabase;
//插入数据
-(BOOL)insertDatabaseIcon:(NSData *)icon name:(NSString *)name tele:(NSString *)tele mail:(NSString *)mail address:(NSString *)address;
//删除某些数据
- (BOOL)deleteDatabase:(int)ID;
//关闭数据库
- (void)closeDatabase;
@end
