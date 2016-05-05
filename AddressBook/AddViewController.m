//
//  AddViewController.m
//  AddressBook
//
//  Created by apple on 16/5/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "AddViewController.h"

#import "DataSet.h"
#import "common.h"

@interface AddViewController()<UITextFieldDelegate,UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    DataSet *dataSet;
    
    UIImage *chooseImage;
}
@end
@implementation AddViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    //给图片添加点击事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openImageBook)];
    self.headIcon.userInteractionEnabled = YES;
    [self.headIcon addGestureRecognizer:tap];
}

- (IBAction)saveContactAction:(UIButton *)sender
{
//   判断数据是否完整
    NSString *result;
    if (!([_name.text isEqualToString:@""]||[_tele.text isEqualToString:@""])) {
        //创建数据库
        dataSet = [DataSet shareManager];
        [dataSet createDatabase];
        NSData *data;
        data = UIImagePNGRepresentation(chooseImage);
        if (data == nil) {
            data = [NSData data];
        }
        if ([dataSet insertDatabaseIcon:data name:_name.text tele:_tele.text mail:_mail.text address:_address.text]) {
            result = @"信息添加成功";
        }
        else
        {
            result = @"信息添加失败";
        }
    }
    
    NSLog(@"%@",result);
    
    [dataSet closeDatabase];
}


-(void)openImageBook
{
     UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate                 = self;
    picker.sourceType               = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.allowsEditing            = YES;
    [self presentViewController:picker animated:YES completion:NULL];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    chooseImage = info[UIImagePickerControllerEditedImage];
    
    NSData *imageData = UIImagePNGRepresentation(chooseImage);
    _headIcon.image = [UIImage imageWithData:imageData];
    
    //处理完毕，回到原来页面
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
@end
