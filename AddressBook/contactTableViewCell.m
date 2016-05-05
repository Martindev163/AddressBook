//
//  contactTableViewCell.m
//  AddressBook
//
//  Created by apple on 16/5/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "contactTableViewCell.h"

@implementation contactTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _icon.layer.cornerRadius = _icon.frame.size.width/2;
    _icon.layer.masksToBounds = YES;
}

-(void)setDataDic:(NSDictionary *)dataDic
{
    _dataDic = dataDic;
    
    NSData *iconStr = dataDic[@"icon"];
    if (iconStr == nil) {
        NSString *str= [dataDic[@"name"] substringToIndex:1];
        [_icon setTitle:str forState:UIControlStateNormal];
        int color1 = arc4random() % 255;
        int color2 = arc4random() % 255;
        int color3 = arc4random() % 255;
        _icon.backgroundColor = [UIColor colorWithRed:color1 * 1.0 / 255
                                                green:color2 * 1.0 / 255
                                                 blue:color3 *1.0 / 255
                                                alpha:1.0];
    }else
    {
        UIImage *image = [UIImage imageWithData:_dataDic[@"icon"]];
        [_icon setImage:image forState:UIControlStateNormal];
    }
    _name.text = dataDic[@"name"];
//    _tele.text = dataDic[@"tele"];
}



@end
