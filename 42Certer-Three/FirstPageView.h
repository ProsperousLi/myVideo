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
#import "UIColor+Hex.h"
#import "FirstpageAllData.h"

@interface FirstPageView : UIView <XRCarouselViewDelegate,UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>


@property (nonatomic, strong) XRCarouselView *carouselView;
@property (nonatomic,strong) FirstpageAllData *FirstPageData;
@property (strong,nonatomic) UIViewController *videoPlayController; //绑定视频播放器页面id的声明
@property (strong,nonatomic) UIScrollView *verticalScrollView; //竖直滚动
@property (nonatomic,retain) NSMutableArray *customButtonContents; //存储按钮的文字内容
@property (strong,nonatomic) UIImageView * backgroudimageView; //背景
@property (nonatomic,strong) UIButton *moreButton; //更多的按钮
@property (nonatomic,strong) UIView *moreView; //更多显示内容
@property (nonatomic,strong) UILabel *title;  //标题
@property (nonatomic,strong) UICollectionView *FirstPageCollectionView;//首页下方的collections

@property (nonatomic,strong) NSMutableArray *TopPicturedata;
@property (nonatomic,strong) NSMutableArray *TopNameData;
@property (nonatomic,strong) NSMutableArray *TopVideoAddr;

@end
