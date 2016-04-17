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
#import "XRCarouselView.h"

@interface FirstPageView : UIView <XRCarouselViewDelegate,UIScrollViewDelegate>


@property (nonatomic, strong) XRCarouselView *carouselView;

@property (strong,nonatomic) UIScrollView *verticalScrollView; //竖直滚动
@property (nonatomic,retain) NSMutableArray *customButtonContents; //存储按钮的文字内容
@property (strong,nonatomic) UIImageView * backgroudimageView; //背景
@property (nonatomic,strong) UIButton *moreButton; //更多的按钮
@property (nonatomic,strong) UIView *moreView; //更多显示内容
@property (nonatomic,strong) UILabel *title;

@end
