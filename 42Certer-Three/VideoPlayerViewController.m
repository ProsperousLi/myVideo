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
    [self.view addSubview:self.NavigationBar];
    

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
    [self InitVideoPlayerView];
    // Do any additional setup after loading the view.
    [self playVideo:@"123"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setPictureIndex:(NSInteger)index {
    PictureIndex = index;
}

-(NSInteger)getPictureIndex{
    return PictureIndex;
}


-(void)getIndexes:(NSNotification *)noti {
    NSDictionary * dic = [noti userInfo];
    //NSLog(@"dic : %@",dic);
    PictureIndex = [[dic objectForKey:@"pictureIndex"] integerValue];
    //NSLog(@"PictureIndex %ld",(long)PictureIndex);
    
    videoPathArray = [[NSMutableArray alloc] initWithCapacity:50];
    //    NSInteger  index = [[NSUserDefaults standardUserDefaults] integerForKey:@"picIndex"];
    //    NSLog(@"index  : %ld",(long)index);
    _videoPlayerView = [[VideoPlayerView alloc] init];
    [self.view addSubview:_videoPlayerView];
    //    [_videoPlayerView setTitle:@"睡兄弟"];
    //    [_videoPlayerView setType:@"中国"];
    //    [self setVideoEpisodeButton:3];
    
    
    NSString * str = Net_host;
    str = [str stringByAppendingString:net_video_multi_top];
    //NSLog(@"str:%@",str);
    NSURL *url = [NSURL URLWithString:str];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setTimeoutInterval:1.0];
    NSOperationQueue *queue = [NSOperationQueue mainQueue];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *returnResponse,NSData *data,NSError *error){
        
        NSMutableArray *introduceArray;
        NSMutableArray *Type0Array;
        NSMutableArray *Type1Array;
        NSMutableArray *nameArray;
        NSMutableArray *videoIDArray;
        
        //NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)returnResponse;
        if (error || data == nil){
            //NSLog(@"请求失败");
        }
        else{
            //NSLog(@"请求成功");
            NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            introduceArray = [dic valueForKeyPath:@"object.videoMulti.introduce"];//简介
            Type0Array = [dic valueForKeyPath:@"object.videoTypeLevel_0.name"];//类型
            Type1Array = [dic valueForKeyPath:@"object.videoTypeLevel_2.name"];//地区
            nameArray = [dic valueForKeyPath:@"object.videoMulti.name"];//就是字符串不是http图片
            videoIDArray = [dic valueForKeyPath:@"object.videoMulti.id"];//置顶的视频的id
            
        }
        
        for (int i = 0; i < [videoIDArray count]; i ++) {

            if (i == PictureIndex) {
                NSString * str = Net_host;
                //str = [str stringByAppendingString:net_video_parts];
                str = [str stringByAppendingFormat:@"%@%@",net_video_parts,[videoIDArray objectAtIndex:i]];
                //NSLog(@"str:%@",str);
                NSURL *url = [NSURL URLWithString:str];
                NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
                [request setHTTPMethod:@"GET"];
                [request setTimeoutInterval:1.0];
                NSOperationQueue *queue = [NSOperationQueue mainQueue];
                [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *returnResponse,NSData *data,NSError *error){
                    NSMutableArray *fileIdArray;
                    
                    if (error || data == nil){
                        //NSLog(@"请求失败");
                    }
                    else {
                        NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                        fileIdArray = [dic valueForKeyPath:@"object.fileId"];
                        //NSLog(@"fileId : %@",fileIdArray);
                        int EpisodeCount = (int)[fileIdArray count]; //剧集数
                        [self setVideoEpisodeButton:EpisodeCount];
                        [_videoPlayerView setTitle:[nameArray objectAtIndex:i]];
                        [_videoPlayerView setType:[Type0Array objectAtIndex:i]];
                        
                        for (NSString *  fileId in fileIdArray) {
                            
                            //NSLog(@"fileId: %@",fileId);
                            //NSLog(@"%@",dic);
                            NSString * str = Net_host;
                            str = [str stringByAppendingFormat:@"%@%@",net_video_parts_file,fileId];
                            //NSLog(@"str:%@",str);
                            NSURL *url = [NSURL URLWithString:str];
                            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
                            [request setHTTPMethod:@"GET"];
                            [request setTimeoutInterval:1.0];
                            NSOperationQueue *queue = [NSOperationQueue mainQueue];
                            [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *returnResponse,NSData *data,NSError *error){
                                NSMutableArray *VideoPath = {0};
                                if (error || data == nil){
                                    //NSLog(@"请求失败");
                                }
                                else {
                                    NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                                    VideoPath = [dic valueForKeyPath:@"object.path"];  //具体视频内容,//具体播放地址，倒序
                                    
                                    //NSLog(@"VideoPath :%@",VideoPath);
                                    [videoPathArray addObject:VideoPath];
                                    
                                    
                                    //int arrayCount = sizeof(VideoPath)/sizeof(VideoPath[0]);
                                    //NSLog(@"%d",arrayCount);
                                    //[self setVideoEpisodeButton:Arraycount];
                                    
                                }
                                
                                if (fileId == [fileIdArray objectAtIndex:[fileIdArray count]-1]) {
//                                    //NSLog(@"%@",videoPathArray);
//                                    for (int i = 1; i <= [videoPathArray count]; i++) {
//                                        if (i == [self getButtonTag]) {
//                                            NSLog(@"相同");
//                                        }
//                                        else {
//                                            NSLog(@"不相同");
//                                        }
//                                    }
                                }

                                
                                
                                
                            }];
                            
                            
                        }
                    }
                }];
            }

        }
 
    
     }];
    

}

-(void)InitVideoPlayerView {

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getIndexes:) name:@"picture" object:nil];
    
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
        self.videoController = [[KrVideoPlayerController alloc] initWithFrame:CGRectMake(0, ScreenHeight/9, ScreenWidth, ScreenWidth*(9.0/16.0))];
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




//剧集按钮
-(void)setVideoEpisodeButton:(int)number {
    
    
    UIButton *button;
    for (int i = 1; i<= number ; i++) {
    


        if (i <= 5) {
            button = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth/18 *i +  ScreenWidth/8 * (i-1), ScreenHeight/3 + ScreenWidth*(9.0/16.0), ScreenWidth/8, ScreenWidth/8)];
        }
        else if (i>5 && i <=10) {
            button = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth/18 *i +  ScreenWidth/8 * (i%5-1), ScreenHeight/2 + ScreenWidth*(9.0/16.0), ScreenWidth/8, ScreenWidth/8)];
        }
        else if (i>10 && i <=15) {
           button = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth/18 *i +  ScreenWidth/8 * (i%10-1), ScreenHeight*2/3 + ScreenWidth*(9.0/16.0), ScreenWidth/8, ScreenWidth/8)];
        }
        
        else if (i>15 && i <=20) {
            button = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth/18 *i +  ScreenWidth/8 * (i%15-1), ScreenHeight*3/4 + ScreenWidth*(9.0/16.0), ScreenWidth/8, ScreenWidth/8)];
        }
        
        else if (i>20 && i <=25) {
            button = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth/18 *i +  ScreenWidth/8 * (i%20-1), ScreenHeight*4/5 + ScreenWidth*(9.0/16.0), ScreenWidth/8, ScreenWidth/8)];
        }
        else if (i>25 && i <=30) {
            button = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth/18 *i +  ScreenWidth/8 * (i%25-1), ScreenHeight*5/6 + ScreenWidth*(9.0/16.0), ScreenWidth/8, ScreenWidth/8)];
        }
        else if (i>30 && i <=35) {
            button = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth/18 *i +  ScreenWidth/8 * (i%30-1), ScreenHeight*7/8 + ScreenWidth*(9.0/16.0), ScreenWidth/8, ScreenWidth/8)];
        }
    
    
        button.tag = i;
    
       // NSLog(@"%d",i);
        [button setBackgroundColor:[UIColor colorWithHex:primary_color_0]];
    
        //button.titleLabel.backgroundColor = [UIColor clearColor];
    
        //button.titleLabel.textAlignment = NSTextAlignmentCenter;
    
        [button setTitleColor:[UIColor colorWithHex:main_text_title_color_light] forState:UIControlStateNormal];
    
    
        [button setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
    
    
        [button addTarget:self action:@selector(videoButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
        [self.view addSubview:button];
    }
    
}

-(void)videoButtonAction:(UIButton *)button {
    
    NSLog(@"第%ld个按钮被点击",button.tag);
    [self setButtonTag:button.tag];
}

-(void)setButtonTag:(NSInteger)tag {
    tagIndex = tag;
}

-(NSInteger)getButtonTag {
    NSLog(@"%ld",(long)tagIndex);
    return tagIndex;
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
