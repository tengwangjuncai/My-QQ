//
//  RegisterViewController.h
//  QQ登陆
//
//  Created by Qianfeng on 15/12/31.
//  Copyright © 2015年 wpy. All rights reserved.
//


#import <UIKit/UIKit.h>

@protocol RegisterViewControllerDelegate  <NSObject>

- (void)returnDataBack:(NSArray *)dataArr;

@end
@interface RegisterViewController : UIViewController
@property (nonatomic,weak) id<RegisterViewControllerDelegate> delegate;
@end
