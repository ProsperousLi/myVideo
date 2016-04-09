//
//  SearchContentViewController.h
//  42Certer-Three
//
//  Created by dragon on 15/12/6.
//  Copyright © 2015年 dragon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppConstant.h"
@interface SearchContentViewController : UIViewController

@property (strong,nonatomic) UIButton *returnButton;
@property (strong,retain) UILabel * Titlelabel;
@property (strong,nonatomic) UIViewController* fristViewController;
@property (strong,nonatomic) NSString *strString;
-(void)Design;//界面设计
-(void)buttonAction :(id)sender;//返回首页按钮响应事件
-(void)getStrForLabel:(NSString*)str; //从首页拿到button的相关数据

//全局变量的get、set方法
- (void)setStr:(NSString *)str;
- (NSString *)getStr;
@end
