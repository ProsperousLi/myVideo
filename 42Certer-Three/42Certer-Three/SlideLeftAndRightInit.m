//
//  SlideLeftAndRightInit.m
//  42Certer-Three
//
//  Created by dragon on 16/4/10.
//  Copyright © 2016年 dragon. All rights reserved.
//

#import "SlideLeftAndRightInit.h"

@implementation SlideLeftAndRightInit

-(instancetype)init {
    if (self = [super init]) {
        //获取storyboard的ID
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        //由storyboard根据myView的storyBoardID来获取我们要切换的视图
        UIViewController *myView = [story instantiateViewControllerWithIdentifier:@"tabBarController"];
        
        //加入中间视图（tabBarViewController）,左边视图，右边视图。
        self.leftSlideViewController = [[LeftSlideViewController alloc] init];
        self.deckController = [[IIViewDeckController alloc] initWithCenterViewController:myView leftViewController:self.leftSlideViewController rightViewController:nil];
        
        //点击中间视图，中间视图的控件不响应，返回中间视图
        self.deckController.centerhiddenInteractivity = IIViewDeckCenterHiddenNotUserInteractiveWithTapToClose;
        
        //左边视图显示宽度
        self.deckController.leftSize = ScreenWidth/2;
    }
    
    return self;
}

@end
