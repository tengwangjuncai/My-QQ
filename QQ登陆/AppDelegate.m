//
//  AppDelegate.m
//  QQ登陆
//
//  Created by Qianfeng on 15/12/31.
//  Copyright © 2015年 wpy. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTableBarViewController.h"
#import "IntroduceViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self login];
    [self.window makeKeyAndVisible];
    return YES;
}
- (void)login {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    BOOL isLogin = [ud boolForKey:@"isLogin"];
    BOOL isFirstLogin = [ud boolForKey:@"isFirstLogin"];
//    if (isLogin) {
//        [ud setBool:NO forKey:@"isLogin"];
//       // [ud setBool:NO forKey:@"isFirstLogin"];
//    }
    if (isLogin && isFirstLogin) {
        MyTableBarViewController *tbvc = [[MyTableBarViewController alloc] init];
        if (self.window.rootViewController.view ==nil) {
            tbvc.selectedIndex = 1;
            self.window.rootViewController = tbvc;
        }else {
            [UIView transitionFromView:self.window.rootViewController.view toView:tbvc.view duration:0.1 options:UIViewAnimationOptionOverrideInheritedCurve completion:^(BOOL finished) {
                tbvc.selectedIndex = 1;
                self.window.rootViewController = tbvc;
            }];
        }
        
    }else if(isFirstLogin && (isLogin == NO)) {
        ViewController *loginVc = [[ViewController alloc] init];
        
        loginVc.delegate = self;
        loginVc.title = @"登录";
        self.window.rootViewController = loginVc;
    }
    else {
        IntroduceViewController *introduceVC = [[IntroduceViewController alloc] init];
        introduceVC.delegate = self;
        self.window.rootViewController = introduceVC;
    }
}
- (void)loginResult:(BOOL)success {
    [self login];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
