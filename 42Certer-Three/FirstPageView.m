//
//  FirstPageView.m
//  42Certer-Three
//
//  Created by dragon on 15/12/6.
//  Copyright © 2015年 dragon. All rights reserved.
//

#import "FirstPageView.h"

@implementation FirstPageView 

-(id)init {
    if (self = [super init]) {
        CGRect frame = [[UIScreen mainScreen] bounds];
        self.frame = frame;
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.verticalScrollView];
        _moreView.hidden = YES;

        
    }
    return self;
}

-(UIImageView *)backgroudimageView {
    if (!_backgroudimageView) {
        //_backgroudimageView = []
//        _backgroudimageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:BackGroundImage]];
//        _backgroudimageView.contentMode = UIViewContentModeScaleAspectFill; // 图片显示方式
    }
    return _backgroudimageView;
}

-(UIScrollView *)verticalScrollView {
    if (!_verticalScrollView) {
        //verticalScrollView 垂直试图滚动
        _verticalScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        [_verticalScrollView setDelegate:self];
        _verticalScrollView.contentSize = CGSizeMake(ScreenWidth , ScreenHeight * 3);
        _verticalScrollView.backgroundColor = [UIColor whiteColor];
        
        [_verticalScrollView setShowsVerticalScrollIndicator:NO];//隐藏竖直滚动条
        //[_verticalScrollView addSubview:self.backgroudimageView];
        [self picturesTurn];
        [_verticalScrollView addSubview:self.moreButton];
        [_verticalScrollView addSubview:self.moreView];
        
        

        
    }
    
    return _verticalScrollView;
}


//图片轮播
-(void)picturesTurn {
    
    //既有本地图片也有网络图片
    NSArray *arr3 = @[@"http://www.5068.com/u/faceimg/20140725173411.jpg", [UIImage imageNamed:@"2.jpg"], @"http://file27.mafengwo.net/M00/52/F2/wKgB6lO_PTyAKKPBACID2dURuk410.jpeg", [UIImage imageNamed:@"welcome1.jpg"]];
    
    NSArray *describeArray = @[@"图片1", @"图片2", @"图片3", @"图片4"];
    
    /**
     *  通过代码创建
     */
    self.carouselView = [XRCarouselView carouselViewWithImageArray:arr3 describeArray:describeArray];
    
    //设置frame
    self.carouselView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 180);
    
//    //用block处理图片点击
//        self.carouselView.imageClickBlock = ^(NSInteger index) {
//            NSLog(@"第%ld张图片被点击", index);
//            
//        };
    
    //用代理处理图片点击，如果两个都实现，block优先级高于代理
    self.carouselView.delegate = self;
    
    
    //设置每张图片的停留时间
    _carouselView.time = 2;
    
    //设置分页控件的图片,不设置则为系统默认
    [_carouselView setPageImage:[UIImage imageNamed:@"other"] andCurrentImage:[UIImage imageNamed:@"current"]];
    
    //设置分页控件的位置，默认为PositionBottomCenter
    _carouselView.pagePosition = PositionBottomRight;
    
    /**
     *  设置图片描述控件
     */
    //设置背景颜色，默认为黑色半透明
    _carouselView.desLabelBgColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    //设置字体，默认为13号字体
    _carouselView.desLabelFont = [UIFont systemFontOfSize:16];
    //设置文字颜色，默认为白色
    _carouselView.desLabelColor = [UIColor greenColor];
    
    [_verticalScrollView addSubview:_carouselView];
    
    
    /**
     *  通过storyboard创建的轮播控件
     */
    //        _carouselView1.imageArray = arr3;
    //        //设置分页控件指示器的颜色
    //        [_carouselView1 setPageColor:[UIColor redColor] andCurrentPageColor:[UIColor blueColor]];
    //        _carouselView1.time = 2;
}





#pragma mark 更多按钮
-(UIButton *)moreButton {
    if (!_moreButton) {
        _moreButton = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth*21.5/25, ScreenHeight/15, ScreenWidth/10, ScreenWidth/10)];
       // _moreButton.backgroundColor = [UIColor whiteColor];
        [_moreButton setImage:[UIImage imageNamed:@"NormalMore.png"] forState:UIControlStateNormal];
        [_moreButton setImage:[UIImage imageNamed:@"SelectMore.png"] forState:UIControlStateHighlighted];
        [_moreButton addTarget:self action:@selector(moreButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return _moreButton;
}


#pragma mark 更多按钮点击后显示的内容
-(UIView *) moreView {
    if (!_moreView) {
        _moreView = [[UIView alloc] initWithFrame:CGRectMake(ScreenWidth*16/25, ScreenHeight/7, ScreenWidth/4, ScreenWidth/3)];
        _moreView.backgroundColor = [UIColor whiteColor];
        
        
    }
    
    return _moreView;
}


#pragma mark 更多按钮响应事件
-(void)moreButtonAction:(id)sender {
    static int index = 0;
    //NSLog(@"moreButton is click!!");

    if (index == 0) {
        _moreView.hidden = NO;
        [_moreButton setImage:[UIImage imageNamed:@"SelectMore.png"] forState:UIControlStateNormal];
        index = 1;
    }
    else if (index == 1) {
        _moreView.hidden = YES;
        [_moreButton setImage:[UIImage imageNamed:@"NormalMore.png"] forState:UIControlStateNormal];
        index = 0;
    }
    
    
    
}




@end
