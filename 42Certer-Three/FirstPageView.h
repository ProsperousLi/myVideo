//
//  FirstPageView.h
//  42Certer-Three
//
//  Created by dragon on 15/12/6.
//  Copyright © 2015年 dragon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppConstant.h"
#import "MyCATransition.h"


@interface FirstPageView : UIView <UIScrollViewDelegate>
{

    
}


@property (strong,nonatomic) UIScrollView *verticalScrollView; //竖直滚动
@property (strong,nonatomic) UIScrollView *horizontaScrollView; //水平滚动
@property (strong,nonatomic) UIPageControl *pageControl; //分页
@property (nonatomic,retain) NSMutableArray *customButtonContents; //存储按钮的文字内容
@property (strong,nonatomic) UIImageView * backgroudimageView; //背景
@property (nonatomic,strong) UIButton *moreButton; //更多的按钮
@property (nonatomic,strong) UIView *moreView; //更多显示内容

@end
