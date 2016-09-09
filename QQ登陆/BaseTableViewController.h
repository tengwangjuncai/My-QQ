//
//  BaseTableViewController.h
//  QQ登陆
//
//  Created by Qianfeng on 16/1/11.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataSource;
- (void)createDataSource ;
- (void)addRightBarButtonItem;
@end
