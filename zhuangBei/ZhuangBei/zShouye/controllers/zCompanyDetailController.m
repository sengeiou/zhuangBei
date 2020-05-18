//
//  zCompanyDetailController.m
//  ZhuangBei
//
//  Created by aa on 2020/5/8.
//  Copyright © 2020 aa. All rights reserved.
//

#import "zCompanyDetailController.h"
#import "zCompanyDetailCell.h"
#import "zCompanyHeader.h"

@interface zCompanyDetailController ()<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)UITableView * companyTable;

@property(assign,nonatomic)NSInteger companyType;//0 企业详情 1货源详情

@end

@implementation zCompanyDetailController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

-(UITableView*)companyTable
{
    if (!_companyTable) {
        _companyTable = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _companyTable.backgroundColor = [UIColor clearColor];
        _companyTable.delegate = self;
        _companyTable.dataSource = self;
        _companyTable.estimatedRowHeight = 100;
        _companyTable.showsVerticalScrollIndicator = NO;
        _companyTable.rowHeight = UITableViewAutomaticDimension;
        _companyTable.sectionHeaderHeight =UITableViewAutomaticDimension;
        _companyTable.estimatedSectionHeaderHeight = 2;
        _companyTable.estimatedSectionFooterHeight = 2;
        _companyTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _companyTable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.companyType = 0;
    [self.view addSubview:self.companyTable];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self.companyTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.bottom.mas_equalTo(self.mas_bottomLayoutGuide);
    }];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.companyType == 0) {
        zCompanyDetailCell * cell = [zCompanyDetailCell instanceWithTableView:tableView AndIndexPath:indexPath];
        cell.backgroundColor = [UIColor redColor];
        cell.typesArray = @[];
        return cell;
    }else
    {
        zCompanyDetailCell * cell = [zCompanyDetailCell instanceWithTableView:tableView AndIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }
    
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    __weak typeof(self)weakSelf = self;
    zCompanyHeader * companyHeader = [[zCompanyHeader alloc]init];
    companyHeader.headerSlideBack = ^(NSInteger index) {
        weakSelf.companyType = index;
        [UIView performWithoutAnimation:^{
            NSIndexPath * indexpath = [NSIndexPath indexPathForRow:0 inSection:0];
           [self.companyTable reloadRowAtIndexPath:indexpath withRowAnimation:UITableViewRowAnimationNone];
        }];
    };
    return companyHeader;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}


@end
