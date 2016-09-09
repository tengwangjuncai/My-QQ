//
//  QQHomeViewController.m
//  QQ登陆
//
//  Created by Qianfeng on 16/1/2.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "QQHomeViewController.h"
#import "CustomInfoTableViewCell.h"
#import "GetData.h"
@interface QQHomeViewController ()
@property (nonatomic, strong) UISearchBar * searchBar;
@property (nonatomic, strong) UISearchDisplayController *searchDC;
@property (nonatomic, strong) NSMutableArray *resultArray;
@property (nonatomic, strong) NSMutableArray *sectionsState;
@end

@implementation QQHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.6 green:1 blue:0.8 alpha:1];
    self.navigationController.navigationBar.translucent = YES;
    [self createSearchView];
    [self createDataSource];
    [self initSectionsState];
    [self.tableView registerClass:[CustomInfoTableViewCell class] forCellReuseIdentifier:@"ID"];
}
- (void)initSectionsState {
    _sectionsState = [NSMutableArray new];
    for (int i=0; i<self.dataSource.count; i++) {
        [_sectionsState addObject:@0];
    }
    NSLog(@"已初始化");
}
- (void)createDataSource {
    self.dataSource = [NSMutableArray arrayWithArray:[GetData getinfoOfContactObject]];
}
#pragma mark - 折叠效果

#pragma mark -创建搜索
- (void)createSearchView {
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    _searchBar.placeholder = @"请输入";
    self.tableView.tableHeaderView = _searchBar;
    _searchDC = [[UISearchDisplayController alloc] initWithSearchBar:_searchBar contentsController:self];
    _searchDC.searchResultsDataSource = self;
    _searchDC.searchResultsDelegate = self;
}

#pragma mark - 实现代理UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIButton *headerView = [UIButton buttonWithType:UIButtonTypeSystem];
    headerView.frame = CGRectMake(0, 0, self.view.frame.size.width, 44);
    NSString *name = [self.dataSource[section] valueForKey:@"name"];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 12, 200, 20)];
    label.text = name;
    label.font = [UIFont systemFontOfSize:13];
    [headerView addSubview:label];
    headerView.backgroundColor = [UIColor whiteColor];
    headerView.alpha = 1;
    headerView.tag = section + 100;
    headerView.layer.borderColor = [UIColor grayColor].CGColor;
    headerView.layer.borderWidth = 0.3;
    if (section != 0) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(18, 17, 6, 10)];
        imageView.image = [UIImage imageNamed:@"enter3"];
        [headerView addSubview:imageView];
        [headerView addTarget:self action:@selector(headViewPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return headerView;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 0 || section ==2) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 100, 10)];
        if (section == 0) {
            label.text = @"我的手机";
        }else if(section == 2) {
            label.text = @" QQ好友";
        }
        //label.textColor = [UIColor grayColor];
        label.font = [UIFont systemFontOfSize:12];
        [view addSubview:label];
        view.backgroundColor = [UIColor grayColor];
        view.alpha = 0.6 ;
        return view;
    }else {
        return nil;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 100;
    }
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0 || section == 2) {
        return 20;
    }else {
    return 0;
    }
}
- (void)headViewPressed:(UIButton *)sender {
    NSInteger section = sender.tag - 100;
    //取出点击这组的状态
    BOOL state = [_sectionsState[section] boolValue];
    NSNumber *currenState = state ? @0:@1;
    //替换状态数组的数据源
    [_sectionsState replaceObjectAtIndex:section withObject:currenState];
    
    //刷新对应组的section
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationAutomatic];
    NSLog(@"dd");
}
#pragma mark - 实现代理UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"%ld",self.dataSource.count);
    return self.dataSource.count;
};
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSNumber *state = _sectionsState[section];
    if (state.intValue == 0) {
        return 0;
    }
    NSDictionary * dic = self.dataSource[section];
    NSArray * arr = [dic valueForKey:@"obj"];
    return arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomInfoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    NSDictionary * dic = self.dataSource[indexPath.section];
    if (indexPath.section != 0) {
        NSArray * arr = [dic valueForKey:@"obj"];
        UserData * data = arr[indexPath.row];
        [cell configData:data];
    }
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
