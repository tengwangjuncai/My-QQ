//
//  ViewController.m
//  QQ登陆
//
//  Created by Qianfeng on 15/12/31.
//  Copyright © 2015年 wpy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithRed:0.5 green:0.7 blue:0.9 alpha:1];
     [self createImageView];
     [self createUserTextField];
     [self createPassWordTextField];
     [self createEnterButton];
     [self createRegisterButton];
}
- (void)createImageView {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.center.x-50, 60, 100, 100)];
    imageView.image = [UIImage imageNamed:@"qq.jpg"];
    imageView.tag = 105;
    [self.view addSubview:imageView];
}
- (void)returnDataBack:(NSArray *)dataArr {
    UITextField *tfUser = (UITextField *)[self.view viewWithTag:10];
    UITextField *tfPassWord = (UITextField *) [self.view viewWithTag:12];
    tfUser.text = dataArr[0];
    tfPassWord.text = dataArr[1];
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
- (void)createUserTextField {
    UILabel *label = [self createLabel];
    label.frame = CGRectMake(50, 200, 100, 30);
    label.text = @"用户名";
    label.tag = 9;
    UITextField * tf=[[UITextField alloc] initWithFrame:CGRectMake(150, 200, 200, 35)];
    tf.layer.borderWidth =1.0;
    tf.layer.borderColor = [UIColor grayColor].CGColor;
    tf.borderStyle = UITextBorderStyleRoundedRect;
    tf.clearButtonMode = UITextFieldViewModeWhileEditing;
    tf.font = [UIFont systemFontOfSize:20];
    tf.placeholder = @"请输入用户名";
    tf.tag =10;
    tf.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:tf];
}
- (void)createPassWordTextField {
    UILabel *label = [self createLabel];
    label.frame = CGRectMake(50, 300, 100, 30);
    label.text = @"密 码";
    label.tag = 11;
    UITextField * tf=[[UITextField alloc] initWithFrame:CGRectMake(150, 300, 200, 35)];
    tf.layer.borderWidth =1.0;
    tf.layer.borderColor = [UIColor grayColor].CGColor;
    tf.borderStyle = UITextBorderStyleRoundedRect;
    tf.clearButtonMode = UITextFieldViewModeWhileEditing;
    tf.font = [UIFont systemFontOfSize:20];
    tf.placeholder = @"请输入密码";
    tf.secureTextEntry = YES;
    tf.tag = 12;
    tf.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:tf];
}
- (void)createEnterButton {
    UIButton *btn = [self createButton];
    btn.frame =CGRectMake(50, 400, 120, 40);
    btn.titleLabel.textColor = [UIColor blueColor];
    [btn setTitle:@"登 陆" forState:UIControlStateNormal];
    btn.clipsToBounds = YES;
    //设置圆角
    btn.layer.cornerRadius = 10;
    [btn addTarget:self action:@selector(calibrate) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = 13;
    [self.view addSubview:btn];
}
- (void)createRegisterButton {
    UIButton *btn = [self createButton];
    btn.frame = CGRectMake(230, 400, 120, 40);
    btn.titleLabel.textColor = [UIColor blueColor];
    [btn setTitle:@"注册" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(enterRegisterView) forControlEvents:UIControlEventTouchUpInside];
    btn.clipsToBounds = YES;
    //设置圆角
    btn.layer.cornerRadius = 10;
    btn.tag = 14;
    [self.view addSubview:btn];
}
- (void)enterChatView {
    QQHomeViewController *qqhomeView = [[QQHomeViewController alloc] init];
    [self presentViewController:qqhomeView animated:YES completion:^{
        
    }];
}
- (void)enterRegisterView {
    RegisterViewController *viewController = [[RegisterViewController alloc] init];
    viewController.delegate = self;
    [self presentViewController:viewController animated:YES completion:^{
    
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //    NSLog(@"开始触摸");
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}
- (void)qqEnter {
    for (int i=9; i<15; i++) {
        UIView *view = [self.view viewWithTag:i];
        [view removeFromSuperview];
    }
    UIImageView *qqImageView = (UIImageView *)[self.view viewWithTag:105];
    qqImageView.transform = CGAffineTransformMakeTranslation(0, 120);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.text = @"正在登陆……";
    label.font = [UIFont systemFontOfSize:20];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor colorWithRed:0.5 green:0.7 blue:0.9 alpha:1];
    label.center = self.view.center;
    [self.view addSubview:label];
    //创建动画
    // 设置属性
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDelay:0];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationRepeatCount:6];
    qqImageView.transform = CGAffineTransformTranslate(qqImageView.transform, 0, 50);
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(dowloadQQ)];
    [UIView commitAnimations];
    
}
- (void)dowloadQQ {
    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"isLogin"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    if (_delegate && [_delegate respondsToSelector:@selector(loginResult:)]) {
        [self.delegate loginResult:YES];
    }
}
- (void)calibrate {
    UITextField *tf1 =(id)[self.view viewWithTag:10];
    UITextField *tf2 =(id)[self.view viewWithTag:12];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *str1 = [userDefault objectForKey:@"userName"];
    NSString *str2 = [userDefault objectForKey:@"passWord"];
    if ([tf1.text isEqualToString:str1]&&[tf2.text isEqualToString:str2]) {
        [self qqEnter];
    }else {
        UIAlertController *alc = [UIAlertController alertControllerWithTitle:nil message:@"用户名或密码有误，请确认" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        }];
            [alc addAction:action];
            [alc addAction:action2];
        [self presentViewController:alc animated:YES completion:nil];
        return;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
