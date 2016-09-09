//
//  UpdateViewController.m
//  QQ登陆
//
//  Created by Qianfeng on 16/1/6.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "UpdateViewController.h"
#import "ViewController.h"
@interface UpdateViewController ()

@end

@implementation UpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.6 green:1 blue:0.8 alpha:1];
    [self createButton];
}
- (void)createButton {
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(30, 100, 200, 50);
    [btn setTitle:@"切换用户" forState:UIControlStateNormal];
    btn.layer.borderColor = [UIColor grayColor].CGColor;
    btn.layer.borderWidth = 2.0;
    [btn addTarget:self action:@selector(btnPessed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
- (void)btnPessed:(UIButton *)sender {
//    ViewController *vc = [[ViewController alloc] init];
//    [self presentViewController:vc animated:YES completion:^{
//        
//    }];
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
