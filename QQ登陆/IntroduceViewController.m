//
//  IntroduceViewController.m
//  QQ登陆
//
//  Created by Qianfeng on 16/1/10.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "IntroduceViewController.h"
#define ValueColor  arc4random()%256/255.0
@interface IntroduceViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIPageControl *pageControl;

@end

@implementation IntroduceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createScrollView];
    [self createImageView];
    [self createPageControl];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3, self.view.frame.size.height);
    self.scrollView.pagingEnabled = YES;
}
- (void)createPageControl {
    UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 200)/2, 500, 200, 40)];
    [self.view addSubview:pageControl];
    //设置页数
    pageControl.numberOfPages = 3;
    // 设置圆点颜色
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    //设置选中圆点的颜色
    pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    [pageControl addTarget:self action:@selector(pageControlPressed:) forControlEvents:UIControlEventValueChanged];
    self.pageControl = pageControl;
    
}
- (void)pageControlPressed:(UIPageControl *)sender {
    //得到水平偏移量
    CGFloat offsetX = sender.currentPage *self.view.frame.size.width;
    //设置滚动视图偏移量
    [_scrollView setContentOffset:CGPointMake(offsetX, 0)];
}
- (void)createScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    scrollView.delegate = self;
    scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
}
- (void)createImageView {
    NSArray *imageNameArr = @[@"1",@"background",@"Default-667h@2x"];
    NSArray *messageArr = @[@"拉近心灵的距离",@"有你便是晴天",@"方式改变生活"];
    for (int i=0; i<3; i++) {
        UIImage *image = [UIImage imageNamed:imageNameArr[i]];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
        imageView.image = image;
        CGRect frame = imageView.frame;
        frame.origin.x = i*self.view.frame.size.width;
        imageView.frame = frame;
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width -300)/2, 100, 300, 50)];
        label.text = messageArr[i];
        label.font = [UIFont systemFontOfSize:30];
        label.textColor = [UIColor colorWithRed:ValueColor green:ValueColor blue:ValueColor alpha:1];
        label.textAlignment = NSTextAlignmentCenter;
        if (i==imageNameArr.count-1) {
            UIButton *btn = [self createButton];
            [imageView addSubview:btn];
            imageView.userInteractionEnabled = YES;
        }
        [imageView addSubview:label];
        [self.scrollView addSubview:imageView];
    }
}
- (UIButton *)createButton {
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake((self.view.frame.size.width - 160)/2, 550, 160, 40);
    btn.layer.backgroundColor = [UIColor grayColor].CGColor;
    btn.backgroundColor = [UIColor whiteColor];
    btn.layer.borderWidth = 1.0;
    btn.clipsToBounds = YES;
    btn.layer.cornerRadius = 10;
    [btn setTitle:@"立即体验" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:30];
    [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
- (void)btnPressed:(UIButton *)sender {
    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"isFirstLogin"];
    [self.delegate loginResult:YES];
}
#pragma mark - 实现 UIScrollViewDelegate 代理 
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger currentPage = scrollView.contentOffset.x / self.view.frame.size.width;
    self.pageControl.currentPage = currentPage;
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
