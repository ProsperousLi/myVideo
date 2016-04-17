//
//  FirstPageViewController.h
//  42Certer-Three
//
//  Created by dragon on 15/12/6.
//  Copyright © 2015年 dragon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppConstant.h"
#import "MyCATransition.h"
#import "FirstPageView.h"
#import "SearchContentViewController.h"

@interface FirstPageViewController : SearchContentViewController  <UIScrollViewDelegate>
{
    @private
    FirstPageView *pageView;
    SearchContentViewController *SVC;
}

@property (strong, nonatomic) UIViewController *customButtonContentViewController; //绑定首页的按钮的ID
@property (strong,nonatomic) UIViewController *videoPlayController; //绑定视频播放器页面id的声明

@property (strong,nonatomic) UIView * BUttonbackgroudView; //按钮背景
@property (nonatomic,retain) NSMutableArray *customButtonContents; //存储按钮的文字内容

@property (nonatomic,strong) UITableView * tableView;



@end
