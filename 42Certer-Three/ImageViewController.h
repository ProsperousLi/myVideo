//
//  ImageViewController.h
//  42Certer-Three
//
//  Created by dragon on 15/12/5.
//  Copyright © 2015年 dragon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCATransition.h"
#import "AppConstant.h"
#import <ViewDeck/ViewDeck.h>
#import "LeftSlideViewController.h"

@interface ImageViewController : UIViewController

@property (weak, nonatomic)  UILabel *titleLable;
@property (strong, nonatomic) UIImageView *backgroudImage;
@property (strong,nonatomic) UIViewController * fristViewController;
@property (nonatomic,assign)NSInteger pageIndex;
@property (nonatomic,copy) NSString * imageFile;
@property (nonatomic,copy) NSString * titleText;
@property (nonatomic,strong) UIButton *StartButton;
@property (nonatomic,strong) UIPageControl * pageControl;

@property (strong, nonatomic) IIViewDeckController *deckController; //滑动视图控制器
@property (nonatomic,strong) LeftSlideViewController * leftSlideViewController ; //左边视图

@end
