//
//  ViewController.h
//  QQ登陆
//
//  Created by Qianfeng on 15/12/31.
//  Copyright © 2015年 wpy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"
#import "QQHomeViewController.h"
@protocol LoginDelegate <NSObject>

- (void)loginResult:(BOOL)success;

@end
@interface ViewController : UIViewController<RegisterViewControllerDelegate>

@property(nonatomic,weak)id<LoginDelegate> delegate;
@end

