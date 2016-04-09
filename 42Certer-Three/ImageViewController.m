//
//  ImageViewController.m
//  42Certer-Three
//
//  Created by dragon on 15/12/5.
//  Copyright © 2015年 dragon. All rights reserved.
//

#import "ImageViewController.h"

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _fristViewController = [self.storyboard instantiateViewControllerWithIdentifier:TabBarControllerID];
    self.titleLable.text = self.titleText;
    [self.view addSubview:self.backgroudImage];
    
    if (_pageIndex == TeachPageNumber) {
        [self.view addSubview:self.StartButton];
    }
    

}

-(UIImageView*)backgroudImage {
    if (!_backgroudImage) {
        _backgroudImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        self.backgroudImage.image = [UIImage imageNamed:self.imageFile];
    }
    return _backgroudImage;
}

-(UIButton *)StartButton {
    if (!_StartButton) {
        _StartButton = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth/3, 3 * ScreenHeight / 4, ScreenWidth/3, 3 * ScreenHeight / 32)];
        _StartButton.backgroundColor = [UIColor redColor];
        _StartButton.tintColor = [UIColor whiteColor];
        [_StartButton setTitle:ButtonTitle forState:UIControlStateNormal];
        [_StartButton addTarget:self action:@selector(ButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _StartButton;
}

-(void) ButtonAction:(UIButton*)button {
    
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
    
    
    //切换视图操作
    MyCATransition *transition = [[MyCATransition alloc] init];
    [transition transition:4 withView:self.view andToOtherControllerType:2];
    [self presentViewController:self.deckController animated:NO completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
