//
//  ChatViewController.m
//  QQ登陆
//
//  Created by Qianfeng on 16/1/2.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "ChatViewController.h"
#import "QQHomeViewController.h"
@interface ChatViewController ()
{
    BOOL _isSystemKey;
     NSMutableArray * _infoArr;
}
@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithRed:0.3 green:0.8 blue:1 alpha:0.7];
     _infoArr = [NSMutableArray array];
    [self createTexfieldView];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardWillHide:) name:UIKeyboardWillHideNotification object:nil];
     
}
#pragma mark - 键盘通知
- (void)keyBoardWillShow:(NSNotification *)sender {
    NSValue *value = [sender.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect rect = [value CGRectValue];
    UIView *view = (UITextField *)[self.view viewWithTag:101];
    CGRect frame = view.frame;
    frame.origin.y -=rect.size.height;
    view.frame = frame;
}
- (void)keyBoardWillHide:(NSNotification *)sender{
    NSValue *value = [sender.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect rect = [value CGRectValue];
    UIView *view = (UITextField *)[self.view viewWithTag:101];
    CGRect frame = view.frame;
    frame.origin.y +=rect.size.height;
    view.frame = frame;
}
#pragma mark - 创建发送TexfieldView
- (void)createTexfieldView {
    CGRect frame = self.view.frame;
    NSInteger width = frame.size.width;
    NSInteger height = 60;
    UIView * sendView = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height-height, width,height)];
    sendView.backgroundColor = [UIColor grayColor];
    sendView.alpha = 0.8;
    sendView.tag = 101;
    UITextField *senInfo = [[UITextField alloc] initWithFrame:CGRectMake(65, 10,self.view.frame.size.width-140 , 40)];
    senInfo.tag = 100;
    senInfo.backgroundColor = [UIColor whiteColor];
    senInfo.borderStyle = UITextBorderStyleRoundedRect;
    _isSystemKey = YES;
    UIButton *sendButton = [self createSendButton];
    UIButton *keyButton = [self createCustomKeyButton];
    [sendView addSubview:senInfo];
    [sendView addSubview:sendButton];
    [sendView addSubview:keyButton];
    [self.view addSubview:sendView];
    
    
}
- (UIButton *)createSendButton {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(self.view.frame.size.width-65, 10, 60, 40);
    btn.layer.borderColor = [UIColor grayColor].CGColor;
    btn.layer.borderWidth = 2.0;
    btn.backgroundColor = [UIColor blueColor];
    btn.alpha = 0.9;
    [btn setTitle:@"发 送" forState:UIControlStateNormal];
    btn.titleLabel.textColor = [UIColor redColor];
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    [btn addTarget:self action:@selector(send) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
- (UIButton *)createCustomKeyButton {
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 10, 50, 50);
    [btn setBackgroundImage:[UIImage imageNamed:@"user7"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(customKey) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
#pragma mark -自定义键盘
- (void)customKey {
    UITextField *tf = (UITextField *) [self.view viewWithTag:100];
    if (_isSystemKey) {
        _isSystemKey = NO;
        tf.inputView = [self createTextFieldInputView];
        tf.inputAccessoryView = [self createTextFieldInputAccessoryView];
        [tf becomeFirstResponder];
    }else {
        _isSystemKey = YES;
        tf.inputView = nil;
        tf.inputAccessoryView = nil;
        [tf resignFirstResponder];
    }
    
    
}
- (UIView *)createTextFieldInputAccessoryView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    view.backgroundColor = [UIColor whiteColor];
    view.alpha = 0.5;
    return view;
}
- (void)send {
    [self createSendInfo];
    
}
- (UIView *)createTextFieldInputView {
    UIView *inputView  = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 216)];
    inputView.backgroundColor = [UIColor grayColor];
    inputView.alpha = 0.6;
    NSArray *arr = @[@[@"1",@"2",@"3",@"*"],@[@"4",@"5",@"6",@"0"],@[@"7",@"8",@"9",@"#"]];
    for (int i=0; i<3; i++)
        for (int j=0; j<4; j++)
        {
            UIButton *btn = [self createKeyButton];
            CGRect temp = btn.frame;
            temp.origin.x =(CGFloat)(j*self.view.frame.size.width/4+20);
            temp.origin.y = i*72+10;
            btn.frame = temp;
            [btn setTitle:arr[i][j] forState:UIControlStateNormal];
            [inputView addSubview:btn];
        }
    
    return inputView;
}
- (UIButton *)createKeyButton {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, 0, 60, 60);
    btn.backgroundColor = [UIColor whiteColor];
    btn.alpha = 0.8;
    btn.titleLabel.font = [UIFont systemFontOfSize:30];
    btn.titleLabel.textColor = [UIColor redColor];
    btn.clipsToBounds = YES;
    btn.layer.cornerRadius = 10;
    btn.layer.borderColor = [UIColor blackColor].CGColor;
    btn.layer.borderWidth = 2.0;
    [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
- (void)btnPressed:(UIButton *)sender {
    UITextField *tf = (UITextField *)[self.view viewWithTag:100];
    tf.text = [tf.text stringByAppendingString:sender.currentTitle];
}
#pragma mark - 定义上工具栏
- (void)createTitleView {
    CGRect frame = self.view.frame;
    NSInteger width = frame.size.width;
    NSInteger height = 50;
    UIView * titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width,height)];
    titleView.backgroundColor = [UIColor colorWithRed:0.5 green:0.7 blue:0.9 alpha:1];
    UILabel *titleLabel = [self createTitleLabel];
    UIButton *returnButton = [self createReturnButton];
    UIButton *objInfoButton = [self createObjectInfoButton];
    [titleView addSubview:titleLabel];
    [titleView addSubview:returnButton];
    [titleView addSubview:objInfoButton];
    [self.view addSubview:titleView];

}
- (UIButton *)createReturnButton {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 15, 30, 30);
    [btn setBackgroundImage:[UIImage imageNamed:@"left_highlighted"] forState:UIControlStateHighlighted];
    [btn setBackgroundImage:[UIImage imageNamed:@"left_disable"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(returnHomeView) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
- (UILabel *)createTitleLabel {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/3+10,0, 100, 50)];
    label.text = @"聊天记录";
    label.font = [UIFont systemFontOfSize:20];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor colorWithRed:0.5 green:0.7 blue:0.9 alpha:1];
    label.alpha = 0.8;
    return label;
}
- (UIButton *)createObjectInfoButton {
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(self.view.frame.size.width-60, 0, 50, 50);
    [btn setBackgroundImage:[UIImage imageNamed:@"user3.png"] forState:UIControlStateNormal];
    return btn;
}
- (void)returnHomeView {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
#pragma mark -senInfoView 
- (void)createSendInfo {
    UITextField *tf = (UITextField *)[self.view viewWithTag:100];
     NSInteger height=0,count =[_infoArr count];
     NSUInteger i=0;
          while (i<count&&i<7) {
               height=((UILabel *)_infoArr[i][0]).frame.size.height + ((UIButton *)_infoArr[i][1]).frame.size.height +height;
               i++;
          }
     NSLog(@"%ld %ld",count,height);
     UIButton *headPicture = [UIButton buttonWithType:UIButtonTypeCustom];
     headPicture.frame = CGRectMake(self.view.frame.size.width-50, height+60, 40, 40);
     [headPicture setBackgroundImage:[UIImage imageNamed:@"other"] forState:UIControlStateNormal];
     headPicture.clipsToBounds = YES;
     headPicture.layer.cornerRadius = 20;
     UILabel *label = [self createInfoLabel:tf.text andHeight:headPicture.frame.origin.y+40];
     NSArray *arr = [NSArray arrayWithObjects:label,headPicture, nil];
    [_infoArr addObject:arr];
    [self.view addSubview:headPicture];
    [self.view addSubview:label];
    tf.text =@"";
}
- (UILabel *)createInfoLabel:(NSString *)str andHeight:(CGFloat)y {
    NSInteger len = [str length];
    NSInteger width = len*15;
    NSInteger height;
    if (width >300) {
        if (len*15%300!=0) {
            height = (len*15/300 + 1)*30;
            width = 300;
        }else {
            height = (len*15/300 )*30;
        }
    }else {
        height = 40;
    }
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width-width-50, y, width, height)];
    label.text = str;
    label.numberOfLines = -1;
    label.clipsToBounds = YES;
    label.layer.cornerRadius = 10;
    label.backgroundColor = [UIColor blueColor];
    label.font = [UIFont systemFontOfSize:20];
    label.textColor = [UIColor whiteColor];
    label.alpha = 0.5;
    label.textAlignment = 1;
    return label;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //重写方法的时候要注意一个问题
    [super touchesBegan:touches withEvent:event];
    
    //结束编辑，隐藏键盘
    [self.view endEditing:YES];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
