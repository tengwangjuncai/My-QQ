//
//  MessageViewController.m
//  QQ登陆
//
//  Created by Qianfeng on 16/1/6.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "MessageViewController.h"
#import "ChatViewController.h"
#import "CustomInfoTableViewCell.h"
#import "UserData.h"
#import "GetData.h"
#define ColoValue  arc4random()%256/255.0
@interface MessageViewController ()<UISearchBarDelegate,UISearchDisplayDelegate>
@property (nonatomic, strong)UISearchBar * searchBar;
@property (nonatomic, strong)UISearchDisplayController * searchDC;
@property (nonatomic, strong)NSMutableArray *resultOfSearchArr ;
@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.6 green:1 blue:0.8 alpha:1];
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self createDataSource];
    [self createSearchView];
//    手写代码的时候 也可以这样 先注册cell，注册完以后，在cellForRow 这个方法里面，就可以不去创建cell，直接检查复用队列存不存在可以使用cell，如果没有的cell，系统会帮我们创建.
    [self.tableView registerClass:[CustomInfoTableViewCell class] forCellReuseIdentifier:@"cellID"];
    
}
- (void)createDataSource {
    
    self.dataSource = [NSMutableArray arrayWithArray:[GetData getInfoOfChatObject]];
}
#pragma mark - 删除功能
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}
/**
 重写系统方法 可以在编辑是出现多个按钮以便多更多操作 不写就会用系统的
 */
- (NSArray<UITableViewRowAction *>*)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *deletaAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault   title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        //删除数据源
        [self.dataSource removeObjectAtIndex:indexPath.row];
        //刷新界面
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
    
    UITableViewRowAction *phoneAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"语音" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
    }];
    return @[deletaAction,phoneAction];
}
#pragma mark - 查找功能
- (void)createSearchView {
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    _searchBar.placeholder = @"请输入";
    self.tableView.tableHeaderView = _searchBar;
    _searchDC = [[UISearchDisplayController alloc] initWithSearchBar:_searchBar contentsController:self];
    _searchDC.searchResultsDataSource = self;
    _searchDC.searchResultsDelegate = self;
}
#pragma mark - 实现代理UITableViewDelegate 的方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 62;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ChatViewController * chatVC = [[ChatViewController alloc] init];
    UserData * data = self.dataSource[indexPath.row];
    chatVC.title = data.userName;
    [self.navigationController pushViewController:chatVC animated:YES];
    
}
#pragma mark - 实现代理UITableViewDataSource 的方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.tableView) {
        return self.dataSource.count;
    }else {
        self.resultOfSearchArr = [NSMutableArray new];
        for (UserData *user in self.dataSource) {
            BOOL contains = [user.userName containsString:_searchBar.text];
            if (contains) {
                [_resultOfSearchArr addObject:user];
            }
        }
        return self.resultOfSearchArr.count;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomInfoTableViewCell *cell =  nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    UserData *data;
    if (tableView == self.tableView) {
        
        data = self.dataSource[indexPath.row];
    }else {
       
        if (!cell) {
            cell = [[CustomInfoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        }
        data =  self.resultOfSearchArr[indexPath.row];
    }
//    CGRect frame = cell.frame;
//    frame.size.width = self.view.frame.size.width;
//    frame.size.height = 31;
//    cell.frame = frame;
   // NSLog(@"%f",cell.frame.size.width);
    [cell configData:data];
    
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
