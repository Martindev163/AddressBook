//
//  dataModel.h
//  AddressBook
//
//  Created by apple on 16/5/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dataModel : NSObject
//头像
@property (copy, nonatomic) NSString *icon;
//姓名
@property (copy, nonatomic) NSString *name;
//电话
@property (copy, nonatomic) NSString *tele;
//邮箱
@property (copy, nonatomic) NSString *mail;
//地址
@property (copy, nonatomic) NSString *address;
//序号
@property (copy, nonatomic) NSString *ID;

@end
