//
//  VideoPlayerViewController.m
//  42Certer-Three
//
//  Created by LiDragon on 16/3/16.
//  Copyright © 2016年 dragon. All rights reserved.
//

#import "VideoPlayerViewController.h"


@interface VideoPlayerViewController ()

@end

@implementation VideoPlayerViewController

static int TapBarindex = 0;


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {  //隐藏状态栏的更新操作
//        
//        [self prefersStatusBarHidden];                                         //
//        
//        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];       //
//        
//    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.NavigationBar];
    // Do any additional setup after loading the view.
    [self playVideo:@"123"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//导航栏
-(UINavigationBar*)NavigationBar {
    if (!_NavigationBar) {
        _NavigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight/10)];
        UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:nil action:@selector(BackAction:)];
        UINavigationItem *item = [[UINavigationItem alloc] init];
        item.leftBarButtonItem = leftButton;
        [_NavigationBar pushNavigationItem:item animated:NO];
    }
    
    return _NavigationBar;
}

//导航栏左边按钮响应事件
-(void)BackAction:(id)sender {
    
    [self.videoController pause]; //返回上一页面时，停止播放
    
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
    
    MyCATransition *transition = [[MyCATransition alloc] init];
    [transition transition:2 withView:self.view andToOtherControllerType:0];
    [self presentViewController:self.deckController animated:NO completion:nil];
}

#pragma mark - 隐藏电池栏的函数调用
- (BOOL)prefersStatusBarHidden{
    if (TapBarindex == 1) {
        return YES;
    }
    else if (TapBarindex == 0) {
        return NO;
    }
    return NULL;
}


- (void)playVideo:(NSString*)sting {
    NSURL *url = [NSURL URLWithString:@"http://172.24.4.44/mrs/upload/video/mp4/1461299512698.mp4"];
    //NSURL *url = [NSURL URLWithString:@"http://krtv.qiniudn.com/150522nextapp"];
    //NSURL *url = [NSURL URLWithString:sting];
    [self addVideoPlayerWithURL:url];
}

- (void)addVideoPlayerWithURL:(NSURL *)url{
    if (!self.videoController) {
        //CGFloat width = [UIScreen mainScreen].bounds.size.width;
        self.videoController = [[KrVideoPlayerController alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenWidth*(9.0/16.0))];
        __weak typeof(self)weakSelf = self;
        [self.videoController setDimissCompleteBlock:^{
            weakSelf.videoController = nil;
        }];
        [self.videoController setWillBackOrientationPortrait:^{
            if ([weakSelf respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {  //顶部状态栏的更新操作
                
                TapBarindex = 0;
                [weakSelf prefersStatusBarHidden];                                         //
                
                [weakSelf performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];       //
                
            }
        }];
        [self.videoController setWillChangeToFullscreenMode:^{
            //[weakSelf toolbarHidden:YES];
            if ([weakSelf respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {  //顶部状态栏的更新操作
                
                TapBarindex = 1;
                [weakSelf prefersStatusBarHidden];                                         //
                
                [weakSelf
                 performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];       //
                
            }
        }];
        
        [self.view addSubview:self.videoController.view];
    }
    self.videoController.contentURL = url;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
