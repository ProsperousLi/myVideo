//
//  viewDesign.h
//  42Certer-Three
//
//  Created by dragon on 15/11/29.
//  Copyright © 2015年 dragon. All rights reserved.
//  连接Neusoft的界面设置

#import <UIKit/UIKit.h>
#import "NetOperation.h"
#import "AppConstant.h"
#import "ActivityView.h"

@interface LoginView : UIView <UITextFieldDelegate>


@property (nonatomic,strong) UITextField *loginText;//账号
@property (nonatomic,strong) UITextField *passwordText;//密码
@property (nonatomic,strong) UILabel *loginLabel;
@property (nonatomic,strong) UILabel *passwordLabel;
@property (nonatomic,strong) UIButton *loginButton;//登录
@property (nonatomic,strong) UIButton *loginOutButton;//注销
@property (nonatomic,strong) UISwitch *remberPwdSwitch;//记住密码
@property (nonatomic,strong) UILabel *loginInfo;//登录信息
@property (nonatomic,strong) UILabel *remberPwdLabel;
@property (nonatomic,strong) UILabel *Mytitle;//标题,放到nagavation里
@property (nonatomic,strong) UIActivityIndicatorView *act; //活动指示器

@end
