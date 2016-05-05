//
//  contactTableViewCell.h
//  AddressBook
//
//  Created by apple on 16/5/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface contactTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIButton *icon;

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *tele;

//数据
@property(strong,nonatomic)NSDictionary *dataDic;
@end
