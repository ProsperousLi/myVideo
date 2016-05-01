//
//  VideoPlayerViewController.h
//  42Certer-Three
//
//  Created by LiDragon on 16/3/16.
//  Copyright © 2016年 dragon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppConstant.h"
#import "MyCATransition.h"
#import "KrVideoPlayerController.h"
#include "LeftSlideViewController.h"
#include <ViewDeck/ViewDeck.h>
#import "VideoPlayerView.h"

@interface VideoPlayerViewController : UIViewController{
    KrVideoPlayerController * krVideoPlayerController;
    NSMutableArray *VideoButtonCountArray;
    NSInteger PictureIndex;
    NSMutableArray *videoPathArray;
    NSInteger tagIndex;
}
                                                        


@property(retain,nonatomic) UINavigationBar *NavigationBar;

@property (nonatomic, strong) KrVideoPlayerController  *videoController;

@property (nonatomic,strong) LeftSlideViewController * leftSlideViewController ; //左边视图

@property (nonatomic,strong) IIViewDeckController *deckController;

@property (nonatomic,strong) VideoPlayerView *videoPlayerView;

@property (strong,nonatomic) UIViewController *videoPlayController; //绑定视频播放器页面id的声明

-(void)setPictureIndex:(NSInteger) index;

-(NSInteger)getPictureIndex;

-(void)InitVideoPlayerView;


@end
