//
//  CustomInfoTableViewCell.m
//  QQ登陆
//
//  Created by Qianfeng on 16/1/12.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "CustomInfoTableViewCell.h"
@interface CustomInfoTableViewCell ()
@property (nonatomic, strong)UIImageView *headImageView;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *messageLabel;
@property (nonatomic, strong)UILabel *stateLabel;
@property (nonatomic, strong)UIImageView *backgroundImageView;
@end
@implementation CustomInfoTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    //先调用父类的方法
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //在这里可以加自己的东西
        [self initCellUI];
        
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = 0.2;
    }
    return self;
}
- (void)initCellUI {
    _headImageView = [[UIImageView alloc] init];
    _nameLabel = [[UILabel alloc] init];
    _messageLabel = [[UILabel alloc] init];
    _stateLabel = [[UILabel alloc] init];
    _backgroundImageView = [[UIImageView alloc] init];
    
    //添加
    [self.contentView addSubview:_backgroundImageView];
    [self.contentView addSubview:_headImageView];
    [self.contentView addSubview:_nameLabel];
    [self.contentView addSubview:_messageLabel];
    [self.contentView addSubview:_stateLabel];
}

- (void)layoutSubviews {
    // chong
    [super layoutSubviews];
    [self configFrame];

}

/**
 配置界面的Frame
 */
- (void)configFrame {
    CGFloat leftSpace = 10;
    CGFloat topSpace = 10;
    CGFloat imageWidth = 40;
    CGFloat imageHeight = 40;
    //设置背景的frame
    _backgroundImageView.frame = self.contentView.frame;
    
    NSLog(@"%f",[UIScreen mainScreen].bounds.size.width);
    
    // 设置头像的frame
    _headImageView.frame = CGRectMake(leftSpace, topSpace, imageWidth, imageHeight);
    _headImageView.clipsToBounds = YES;
    _headImageView.layer.cornerRadius = 20;
    //设置名字的label
    CGFloat nameLabelX = CGRectGetMaxX(_headImageView.frame) + leftSpace;
    _nameLabel.frame = CGRectMake(nameLabelX, topSpace, 200, 20);
    //设置信息的label
    CGFloat messageLabelY =CGRectGetMaxY(_nameLabel.frame) + topSpace;
    _messageLabel.frame = CGRectMake(nameLabelX, messageLabelY, 200, 10);
    _messageLabel.textColor = [UIColor grayColor];
    _messageLabel.font = [UIFont systemFontOfSize:12];
    //设置状态的frame
    _stateLabel.frame = CGRectMake(self.frame.size.width , topSpace, 40, 10);
    _stateLabel.textColor = [UIColor grayColor];
    _stateLabel.font = [UIFont systemFontOfSize:12];
}
- (void)configData:(UserData *)data {
    
    
    _headImageView.image = [UIImage imageNamed:data.iconName];
    _nameLabel.text = data.userName;
    _messageLabel.text = data.message;
    _stateLabel.text = data.state;
    _backgroundImageView.image = [UIImage imageNamed:@"bg_navigationBar"];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
