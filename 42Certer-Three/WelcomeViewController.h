//
//  welcomeViewController.h
//  42Certer-Three
//
//  Created by dragon on 15/12/5.
//  Copyright © 2015年 dragon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageViewController.h"
#import "AppConstant.h"
#import "WelcomePageData.h"
@interface WelcomeViewController : UIViewController <UIPageViewControllerDataSource>

@property (nonatomic,assign) WelcomePageData *data;
@property (strong,nonatomic) UIPageViewController *pageViewController;
@property (strong,nonatomic) NSArray *pageTitles;
@property (strong,nonatomic) NSArray *imageFiles;
@property (nonatomic,assign) int numberIndex;


@end
