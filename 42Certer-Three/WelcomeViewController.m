//
//  welcomeViewController.m
//  42Certer-Three
//
//  Created by dragon on 15/12/5.
//  Copyright © 2015年 dragon. All rights reserved.
//

#import "WelcomeViewController.h"

@implementation WelcomeViewController

-(void)setmulitableValue {  //变量的集合方法
    self.imageFiles = @[WelcomeOnePicture,WelcomeTwoPicture,WelcomeThreePicture];
    self.pageTitles = @[@"1",@"2",@"3"];  //初始化
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setmulitableValue];
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:PageViewControllerID]; //storyborad绑定
    self.pageViewController.dataSource = self;
    ImageViewController * statrtViewController = [self viewContentViewController:0];
    
    NSMutableArray * viewControllers = [NSMutableArray arrayWithObject:statrtViewController];
    
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    self.pageViewController.view.frame = CGRectMake(0, 0, ScreenWidth , ScreenHeight); //格式
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark 实现协议

#pragma mark 下一页
-(UIViewController *) pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSInteger index = ((ImageViewController*)viewController).pageIndex;
    if(index == 0 || index == NSNotFound) {
        return nil;
    }
    
    index--;
    return [self viewContentViewController:index];
    
}

#pragma mark 下一页

-(UIViewController *) pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger index = ((ImageViewController*)viewController).pageIndex;
    if (index == NSNotFound) {
        
        return nil;
    }
    
    index ++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewContentViewController:index ];
}

-(ImageViewController*) viewContentViewController : (NSInteger) index {
    if ([self.pageTitles count] == 0 || index >= [self.pageTitles count]) {
        return nil;
    }
    
    ImageViewController *pageContentController = [self.storyboard instantiateViewControllerWithIdentifier:ImageViewControllerID];
    pageContentController.imageFile = self.imageFiles[index];
    pageContentController.titleText = self.pageTitles[index];
    pageContentController.pageIndex = index;
    
    
    return pageContentController;
}



#pragma mark 返回的是页数
-(NSInteger) presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return [self.pageTitles count];
}

-(NSInteger) presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
}

@end
