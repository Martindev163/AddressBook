//
//  ShowViewController.m
//  AddressBook
//
//  Created by apple on 16/5/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ShowViewController.h"
#import "common.h"
#import "AddViewController.h"
#import "DataSet.h"
#import "contactTableViewCell.h"
static NSString *const SHOWCELL = @"contactTableViewCell";

@interface ShowViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    DataSet *dataSet;
    NSMutableArray *dataArray;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    //注册单元格
    [_tableView registerNib:[UINib nibWithNibName:@"contactTableViewCell" bundle:nil] forCellReuseIdentifier:SHOWCELL];
    _tableView.rowHeight = 60;
    //设置导航
    [self setNav];
    dataSet = [DataSet shareManager];
    [dataSet createDatabase];
    dataArray = [dataSet showDatabase];
    [dataSet closeDatabase];
}
-(void)setNav
{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    leftBtn.frame = CGRectMake(0, 0, 40, 40);
    //leftBtn.backgroundColor = [UIColor redColor];
    [leftBtn addTarget:self action:@selector(addContents) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    rightBtn.frame = CGRectMake(0, 0, 40, 40);
    [rightBtn setTitle:@"刷新" forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
}

-(void)addContents
{
    AddViewController *addVC = [[AddViewController alloc]initWithNibName:@"AddViewController" bundle:nil];
    [self.navigationController pushViewController:addVC animated:YES];
}

-(void)refreshData
{
    [dataSet createDatabase];
    dataArray = [dataSet showDatabase];
    [dataSet closeDatabase];
    [self.tableView reloadData];
}

#pragma mark - delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    contactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SHOWCELL];
    cell.dataDic = dataArray[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
//删除
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除此联系人";
}
/**
 *  删除操作
 */
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSDictionary *dic = dataArray[indexPath.row];
        int ID = [dic[@"id"] intValue];
        [dataSet createDatabase];
        BOOL result = [dataSet deleteDatabase:ID];
        if (result) {
            [dataArray removeObjectAtIndex:indexPath.row];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
        }
        [dataSet closeDatabase];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
