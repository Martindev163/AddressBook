//
//  ViewController.m
//  AddressBook
//
//  Created by apple on 16/5/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "StartViewController.h"
#import "ShowViewController.h"
#import "common.h"

@interface StartViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *bgImgView;
@property (strong, nonatomic) IBOutlet UIButton *enterBtn;
- (IBAction)enterAction:(UIButton *)sender;

@property (strong, nonnull) UIVisualEffectView *visualEffectView;
@end

@implementation StartViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    //隐藏导航栏
    self.navigationController.navigationBar.hidden = YES;
    //背景图片设置
    [self setBackImageView];
    
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

/**
 *  背景高斯模糊
 */
-(void)setBackImageView
{
    //实现模糊效果
    _visualEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
    _visualEffectView.frame = self.view.bounds;
    _visualEffectView.alpha = 0.9;
    [_bgImgView addSubview:_visualEffectView];
}
/**
 *  跳转页面
 */
- (IBAction)enterAction:(UIButton *)sender
{
    //动画进入
    [UIView animateWithDuration:1.0 animations:^{
        self.view.transform = CGAffineTransformMakeScale(2.0, 2.0);
        self.view.alpha = 0.7;
        _visualEffectView.alpha = 0.0;
    } completion:^(BOOL finished) {
        ShowViewController *showVC = [[ShowViewController alloc] initWithNibName:@"ShowViewController" bundle:nil];
        [self.navigationController pushViewController:showVC animated:YES];
    }];
}
@end
