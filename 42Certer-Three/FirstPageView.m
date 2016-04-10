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
        [_verticalScrollView addSubview:self.horizontaScrollView];
        [_verticalScrollView addSubview:self.pageControl];
        [_verticalScrollView addSubview:self.moreButton];
        [_verticalScrollView addSubview:self.moreView];
    }
    
    return _verticalScrollView;
}


#pragma mark 广告页
-(UIScrollView*)horizontaScrollView {
    if (!_horizontaScrollView) {
        //水平视图滚动horizontaScrollView
        _horizontaScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, (ScreenHeight)/6, ScreenWidth, 2*ScreenHeight/7)];
        [_horizontaScrollView setDelegate:self];
        _horizontaScrollView.contentSize = CGSizeMake(ScreenWidth * PageNumber, _horizontaScrollView.frame.size.height);
        [_horizontaScrollView setPagingEnabled:YES]; //开启滚动分页功能
        [_horizontaScrollView setShowsHorizontalScrollIndicator:NO]; //隐藏水平滚动条
        //[self imageviewForscrollView:nil imageViewNumber:PageNumber];
    }
    return _horizontaScrollView;
}






#pragma  mark pageViewController,翻页时显示的小圆点
-(UIPageControl*)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(ScreenWidth/2 - ScreenWidth/11, ScreenHeight/3 + ScreenHeight/19, (ScreenWidth)/8, (ScreenWidth)/8)];
        _pageControl.backgroundColor = [UIColor clearColor];//透明色
        NSString *str = [NSString stringWithFormat:@"%d",PageNumber]; //页数
        NSInteger pageNumberInteger = [str integerValue];
        [_pageControl setNumberOfPages:pageNumberInteger];//设置页数;
        [_pageControl addTarget:self action:@selector(pageChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _pageControl;
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


#pragma mark  页面滚动时调用，设置当前页面的ID
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {

    if (scrollView == _horizontaScrollView) {
//                if (scrollView.contentOffset.x > ScreenWidth * 2) {
//        
//                    [_pageControl setCurrentPage:1];
//                }
        [_pageControl setCurrentPage:fabs(scrollView.contentOffset.x/ScreenWidth)];
       // NSLog(@"%f",fabs(scrollView.contentOffset.x/ScreenWidth));
        
        NSLog(@"_horizontaScrollView");
        //NSLog(@"视图滚动中X轴坐标%f",scrollView.contentOffset.x);
        //NSLog(@"视图滚动中Y轴坐标%f",scrollView.contentOffset.y);
    }
    else if (scrollView == _verticalScrollView) {
        NSLog(@"_verticalScrollView");
        //NSLog(@"视图滚动中X轴坐标%f",scrollView.contentOffset.x);
        //NSLog(@"视图滚动中Y轴坐标%f",scrollView.contentOffset.y);
    }
    
}

#pragma mark 当scroll改变时，触发此方法
-(void) pageChange:(id)sender {
//    if (_horizontaScrollView.contentOffset.x > ScreenWidth * 2) {
//        
//        [_pageControl setCurrentPage:1];
//    }
    //NSInteger page = [sender currentPage];
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
