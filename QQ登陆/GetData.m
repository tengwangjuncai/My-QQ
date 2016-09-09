//
//  GetData.m
//  QQ登陆
//
//  Created by Qianfeng on 16/1/12.
//  Copyright © 2016年 wpy. All rights reserved.
//

#import "GetData.h"
#import "UserData.h"
@implementation GetData
+ (NSMutableArray *)getInfoOfChatObject {
    NSMutableArray *dataArray = [NSMutableArray new];
    UserData *data1 = [[UserData alloc] init];
    data1.iconName = @"3";
    data1.userName = @"小丽";
    data1.message = @"在干什么呢？";
    data1.state = @"09:13";
    
    UserData *data2 = [[UserData alloc] init];
    data2.iconName = @"3.jpg";
    data2.userName = @"一路花香";
    data2.message = @"最近赚钱了，一起去嗨？";
    data2.state = @"昨天";
    
    UserData *data3 = [[UserData alloc] init];
    data3.iconName = @"qq.jpg";
    data3.userName = @"陌生人";
    data3.message = @"在吗？能聊一会吗？";
    data3.state = @"前天";
    
    UserData *data4 = [[UserData alloc] init];
    data4.iconName = @"other";
    data4.userName = @"兄弟";
    data4.message = @"一起扛过抢，打过仗，泡过妞？";
    data4.state = @"刚刚";
    [dataArray addObject:data1];
    [dataArray addObject:data2];
    [dataArray addObject:data3];
    [dataArray addObject:data4];
    return dataArray;
}
+ (NSMutableArray *)getinfoOfContactObject {
    NSMutableArray *resultArray = [NSMutableArray new];
    NSMutableDictionary *dic1 = [NSMutableDictionary new];
    NSMutableArray *equipmentArr = [NSMutableArray new];
    [dic1 setObject:@"我的设备" forKey:@"name"];
    [dic1 setObject:equipmentArr forKey:@"obj"];
    
    NSMutableDictionary *dic2 = [NSMutableDictionary new];
    NSMutableArray *contactNoteArr = [NSMutableArray new];
    [dic2 setObject:@"手机通讯录" forKey:@"name"];
    [dic2 setObject:contactNoteArr forKey:@"obj"];
    
    NSMutableDictionary *dic3 = [NSMutableDictionary new];
    NSMutableArray *friendArr = [NSMutableArray new];
    UserData *data7 = [[UserData alloc] init];
    data7.iconName = @"3";
    data7.userName = @"小丽";
    data7.message = @"在干什么呢？";
    data7.state = @"2G";
    
    UserData *data8 = [[UserData alloc] init];
    data8.iconName = @"3.jpg";
    data8.userName = @"一路花香";
    data8.message = @"最近赚钱了，一起去嗨？";
    data8.state = @"4G";
    
    UserData *data9 = [[UserData alloc] init];
    data9.iconName = @"qq.jpg";
    data9.userName = @"陌生人";
    data9.message = @"在吗？能聊一会吗？";
    data9.state = @"3G";
    
    UserData *data10 = [[UserData alloc] init];
    data10.iconName = @"other";
    data10.userName = @"兄弟";
    data10.message = @"一起扛过抢，打过仗，泡过妞？";
    data10.state = @"4G";
    [friendArr addObject:data7];
    [friendArr addObject:data8];
    [friendArr addObject:data9];
    [friendArr addObject:data10];
    [dic3 setObject:@"我的好友" forKey:@"name"];
    [dic3 setObject:friendArr forKey:@"obj"];

    NSMutableDictionary *dic4 = [NSMutableDictionary new];
    NSMutableArray *familyArr = [NSMutableArray new];
    UserData *data1 = [UserData new];
    data1.iconName = @"3";
    data1.userName = @"姐姐";
    data1.message = @"人生如此美好";
    data1.state = @"无线";
    
    UserData *data2 = [UserData new];
    data2.iconName = @"3";
    data2.userName = @"小弟";
    data2.message = @"强撸灰飞烟灭！";
    data2.state = @"4G";
    
    UserData *data3 = [UserData new];
    data3.iconName = @"3";
    data3.userName = @"小姨";
    data3.message = @"如花般美丽，如风样自由";
    data3.state = @"2G";
    [familyArr addObject:data1];
    [familyArr addObject:data2];
    [familyArr addObject:data3];
    [dic4 setObject:@"家人" forKey:@"name"];
    [dic4 setObject:familyArr forKey:@"obj"];
    
    NSMutableDictionary *dic5 = [NSMutableDictionary new];
    NSMutableArray *classMateArr = [NSMutableArray new];
    UserData *data4 = [UserData new];
    data4.iconName = @"3";
    data4.userName = @"吊吊";
    data4.message = @"我吊加油！";
    data4.state = @"4G";
    
    UserData *data5 = [UserData new];
    data5.iconName = @"3";
    data5.userName = @"小强";
    data5.message = @"国服第一奎因！";
    data5.state = @"4G";
    
    UserData *data6 = [UserData new];
    data6.iconName = @"3";
    data6.userName = @"伟哥";
    data6.message = @"中路杀神";
    data6.state = @"3G";
    [classMateArr addObject:data4];
    [classMateArr addObject:data5];
    [classMateArr addObject:data6];
    [dic5 setObject:@"同学" forKey:@"name"];
    [dic5 setObject:classMateArr forKey:@"obj"];
    NSMutableDictionary *dic = [NSMutableDictionary new];
    NSMutableArray *arr = [NSMutableArray new];
    [dic setObject:arr forKey:@"obj"];
    [resultArray addObject:dic];
    [resultArray addObject:dic1];
    [resultArray addObject:dic2];
    [resultArray addObject:dic3];
    [resultArray addObject:dic4];
    [resultArray addObject:dic5];
    
    return  resultArray;
}
@end
