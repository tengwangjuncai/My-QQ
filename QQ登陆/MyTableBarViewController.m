//
//  MyTableBarViewController.m
//  QQ登陆
//
//  Created by Qianfeng on 16/1/6.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "MyTableBarViewController.h"
#import "BaseNavigationController.h"
@interface MyTableBarViewController ()

@end

@implementation MyTableBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.viewControllers = [self createViewControllers];
    self.tabBar.backgroundImage = [UIImage imageNamed:@"AlbumTipsDividinglines@2x"];
}
- (NSArray *)createViewControllers {
    NSMutableArray *resultArray = [NSMutableArray array];
    NSArray *titles = @[@"消息",@"联系人",@"动态"];
    NSArray *imageNames = @[@"tabbar_mainframe",@"tabbar_me",@"btn_feedCell_collection_selected@2x"];
    NSArray *selectedImageNames = @[@"tabbar_mainframeHL",@"tabbar_meHL",@"btn_feedCell_collection_selected@2x"];
    NSArray *classNames = @[@"MessageViewController",@"QQHomeViewController",@"UpdateViewController"];
    for (int i=0; i<3; i++) {
        Class cls = NSClassFromString(classNames[i]);
        UIViewController *vc = [[cls alloc]init];
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:titles[i] image:[UIImage imageNamed:imageNames[i]] selectedImage:[UIImage imageNamed:selectedImageNames[i]]];
        vc.tabBarItem = item;
        vc.title = titles[i];
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15], NSFontAttributeName,[UIColor grayColor],NSForegroundColorAttributeName,nil];
        [item setTitleTextAttributes:dic forState:UIControlStateSelected];
        [item setTitleTextAttributes:dic forState:UIControlStateNormal];
        BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
        UIImage *image = [UIImage imageNamed:@"toolBar"];
        image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 0, 20)];
        [nav.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        [resultArray addObject:nav];
    }
    
    return resultArray;
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
