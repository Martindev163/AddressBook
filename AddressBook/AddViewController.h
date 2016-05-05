//
//  AddViewController.h
//  AddressBook
//
//  Created by apple on 16/5/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *headIcon;
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *age;
@property (strong, nonatomic) IBOutlet UITextField *tele;
@property (strong, nonatomic) IBOutlet UITextField *mail;
@property (strong, nonatomic) IBOutlet UITextView *address;
- (IBAction)saveContactAction:(UIButton *)sender;
@end
