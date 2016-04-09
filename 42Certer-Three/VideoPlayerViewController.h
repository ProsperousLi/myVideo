//
//  VideoPlayerViewController.h
//  42Certer-Three
//
//  Created by LiDragon on 16/3/16.
//  Copyright © 2016年 dragon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppConstant.h"
#import "FirstPageViewController.h"
#import "MyCATransition.h"
#import "KrVideoPlayerController.h"


@interface VideoPlayerViewController : UIViewController{
    KrVideoPlayerController * krVideoPlayerController;
}
                                                        

@property(retain,nonatomic) UINavigationBar * NavigationBar;

@property (nonatomic, strong) KrVideoPlayerController  *videoController;

@end
