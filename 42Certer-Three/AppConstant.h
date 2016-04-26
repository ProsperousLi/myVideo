//
//  AppConstant.h
//  42Certer-Three
//
//  Created by dragon on 15/11/30.
//  Copyright © 2015年 dragon. All rights reserved.
//  一些常量的定义

#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/UIImageView+AFNetworking.h>

#ifndef AppConstant_h
#define AppConstant_h


#pragma mark  屏幕尺寸
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height


#pragma mark - 颜色配置
#define main_background_color 0xF7F7F7
#define main_background_normal_color 0xFFFFFF
#define main_background_key_color 0xF1EFF0
#define main_background_color_weigth 0xD1CFD0
#define main_background_color_warning 0xFFFFCC
#define main_bottom_background_color 0xECEAEB
#define main_drawer_background_color 0xE3DDDD  //透明度：alpha 0.899    筛选框
#define main_text_key_word_color 0xD45D63  //按钮字体红色
#define main_text_title_color 0x575354      //标题颜色
#define main_text_subtitle_color 0x949293
#define main_text_normal_color 0xFFFFFF
#define main_text_hint_color 0x0000FF
#define main_text_player 0xD45D63   //alpha 0.8
#define main_mask_color 0x424242  //alpha 0.67
#define main_mask_lighter_color 0x000000 //alpha 0.6
#define main_button_background_color 0xD45D63
#define main_selector_selected_color 0x666666  //alpha 0.4
#define main_head_background_color 0xD45D63             //登录按钮
#define main_mediacontroller_bg 0x000000  //alpha 0.6
#define main_loading_line 0xD45D63

#pragma mark 登录界面
#define deLoginTextInfo @"请输入账号"
#define dePwdInTextInfo @"请输入密码"
#define deLoginLabelInfo @"账号"
#define dePwdLabelInfo @"密码"
#define deRemberPwdLabel @"记住密码"
#define deloginButtonTitle @"登录"
#define deLoginOutButtonTitle @"注销"


#pragma mark 警告框
#define AlertTitle @"提示"
#define AlertMeassge @"注销成功"
#define AlertActionTitleOK @"好"


#pragma mark 网络连接的相关数据 
#define PID @"1"
#define CALG @"12345678"
#define LOGINURL @"http://172.24.254.138"
#define LOGIOUTURL @"http://172.24.254.138/F.html"
//保存到arrayKeys
#define KEY1 @"DDDDD"
#define KEY2 @"upass"
#define KEY3 @"R1"
#define KEY4 @"R2"
#define KEY5 @"para"
#define KEY6 @"0MKKEY"
//保存到arrayValues
#define VALUE3 @"0"
#define VALUE4 @"1"
#define VALUE5 @"00"
#define VALUE6 @"123456"


#pragma mark 图片的常量名定义
#define LoadViewPicture @"anim_loading.gif"  //加载数据，用户等待时显示的活动指示器's picture
#define WelcomeOnePicture @"welcome1.jpg"
#define WelcomeTwoPicture @"welcome2.jpg"
#define WelcomeThreePicture @"welcome3.jpg"
#define BackGroundImage @"backage_ground.jpg"

#pragma mark storyBoardID
#define PageViewControllerID @"pageviewcontroller"  //      欢迎页
#define ImageViewControllerID @"ImageViewController"    //
#define TabBarControllerID @"tabBarController"    //下面的导航
#define SearchContentViewControllerID @"SearchContentViewController"  //频道页
#define VideoPlayViewControllerID @"VideoPlayViewController"  // 视频播放页

#pragma mark 引导页按钮的文字
#define ButtonTitle @"进入体验"

#pragma mark 引导页的页数
#define TeachPageNumber 2 //从0开始

#pragma mark 广告页的页数
#define PageNumber 3

#pragma mark 按钮的自定义内容
#define ButtonTitle1 @"最新"
#define ButtonTitle2 @"综艺"
#define ButtonTitle3 @"电影"
#define ButtonTitle4 @"剧场"
#define ButtonTitle5 @"动漫"
#define ButtonTitle6 @"娱乐"
#define ButtonTitle7 @"校内"
#define ButtonTitle8 @"音乐"
#define ButtonTitle9 @"体育"
#define ButtonTitle10 @"更多"

#pragma mark 按钮的自定义内容 cellPageNumber  cellview的高度是一个屏幕的高度
#define cellPageNumber 7
#endif /* AppConstant_h */








