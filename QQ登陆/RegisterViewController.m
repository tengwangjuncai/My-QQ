//
//  RegisterViewController.m
//  QQ登陆
//
//  Created by Qianfeng on 15/12/31.
//  Copyright © 2015年 wpy. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.4 green:0.7 blue:0.8 alpha:1];
    [self createUserTestField];
    [self createPassWordTextField];
    [self createRepeatPassWordTextField];
    [self createEmailTextField];
    [self createReplaceButton];
    [self createCertainButton];
}
- (UILabel *)createLabel {
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:label];
    return label;
}
- (UIButton *)createButton {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.layer.borderWidth = 2.0;
    btn.layer.borderColor = [UIColor grayColor].CGColor;
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    return btn;
}
- (UITextField*)createTextField {
    UITextField * tf=[[UITextField alloc] init];
    tf.layer.borderWidth =1.0;
    tf.layer.borderColor = [UIColor grayColor].CGColor;
    tf.borderStyle = UITextBorderStyleRoundedRect;
    tf.clearButtonMode = UITextFieldViewModeWhileEditing;
    tf.font = [UIFont systemFontOfSize:20];
    tf.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:tf];
    return tf;
}
- (void)createUserTestField {
    UILabel *label = [self createLabel];
    label.frame = CGRectMake(10, 100, 100, 30);
    label.text = @"用户名";
    UITextField *tf = [self createTextField];
    tf.frame = CGRectMake(120, 100, 200, 30);
    tf.tag = 13;
    tf.placeholder = @"请输入用户名";
    
}
- (void)createPassWordTextField {
    UILabel *label = [self createLabel];
    label.frame = CGRectMake(10, 170, 100, 30);
    label.text = @"密码";
    UITextField *tf = [self createTextField];
    tf.frame = CGRectMake(120, 170, 200, 30);
    tf.placeholder = @"请输入密码";
    tf.tag =14;
}
- (void)createRepeatPassWordTextField {
    UILabel *label = [self createLabel];
    label.frame = CGRectMake(10, 240, 100, 30);
    label.text = @"确认密码";
    UITextField *tf = [self createTextField];
    tf.frame = CGRectMake(120, 240, 200, 30);
    tf.placeholder = @"请再次输入密码";
}
- (void)createEmailTextField {
    UILabel *label = [self createLabel];
    label.frame = CGRectMake(10, 310, 100, 30);
    label.text = @"邮箱";
    UITextField *tf = [self createTextField];
    tf.frame = CGRectMake(120, 310, 200, 30);
    tf.placeholder = @"请再邮箱";
    tf.tag = 15;
}
- (void)createCertainButton {
    UIButton *btn = [self createButton];
    btn.frame = CGRectMake(70, 400, 120, 40);
    [btn setTitle:@"确 定" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(returnUserView) forControlEvents:UIControlEventTouchUpInside];
    btn.clipsToBounds = YES;
    //设置圆角
    btn.layer.cornerRadius = 10;
    [self.view addSubview:btn];
}
- (void)createReplaceButton {
    UIButton *btn = [self createButton];
    btn.frame = CGRectMake(230, 400, 120, 40);
     [btn setTitle:@"重 置" forState:UIControlStateNormal];
    btn.clipsToBounds = YES;
    //设置圆角
    btn.layer.cornerRadius = 10;
    [self.view addSubview:btn];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //    NSLog(@"开始触摸");
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

- (void)returnUserView {
    UITextField *tfUser = (UITextField *)[self.view viewWithTag:13];
    UITextField *tfPassWord = (UITextField *)[self.view viewWithTag:14];
    NSArray *arr = [NSArray arrayWithObjects:tfUser.text,tfPassWord.text, nil];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:tfUser.text forKey:@"userName"];
    [userDefaults setObject:tfPassWord.text forKey:@"passWord"];
    [userDefaults synchronize];
    [self dismissViewControllerAnimated:YES completion:^{
        if ([_delegate respondsToSelector:@selector(returnDataBack:)]) {
            [self.delegate returnDataBack:arr];
        }
    }];

    
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
