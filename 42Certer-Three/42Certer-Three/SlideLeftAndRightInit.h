//
//  SlideLeftAndRightInit.h
//  42Certer-Three
//
//  Created by dragon on 16/4/10.
//  Copyright © 2016年 dragon. All rights reserved.
//  初始化滑动根视图deckController

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <ViewDeck/ViewDeck.h>
#import "AppConstant.h"
#import "LeftSlideViewController.h"

@interface SlideLeftAndRightInit : NSObject

@property (strong, nonatomic) IIViewDeckController *deckController; //滑动视图控制器
@property (nonatomic,strong) LeftSlideViewController * leftSlideViewController ; //左边视图

@end
