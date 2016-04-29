//
//  FirstPageView.m
//  42Certer-Three
//
//  Created by dragon on 15/12/6.
//  Copyright © 2015年 dragon. All rights reserved.
//

#import "FirstPageView.h"

@implementation FirstPageView 

-(id)init {
    if (self = [super init]) {
        CGRect frame = [[UIScreen mainScreen] bounds];
        self.frame = frame;
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.verticalScrollView];
        
        _moreView.hidden = YES;

        
    }
    return self;
}

-(UIImageView *)backgroudimageView {
    if (!_backgroudimageView) {
        //_backgroudimageView = []
//        _backgroudimageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:BackGroundImage]];
//        _backgroudimageView.contentMode = UIViewContentModeScaleAspectFill; // 图片显示方式
    }
    return _backgroudimageView;
}

-(UIScrollView *)verticalScrollView {
    if (!_verticalScrollView) {
        //verticalScrollView 垂直试图滚动
        _verticalScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        [_verticalScrollView setDelegate:self];
        _verticalScrollView.contentSize = CGSizeMake(ScreenWidth , ScreenHeight * 3);
        _verticalScrollView.backgroundColor = [UIColor colorWithHex:primary_color_0];
        [_verticalScrollView setShowsVerticalScrollIndicator:NO];//隐藏竖直滚动条
        //[_verticalScrollView addSubview:self.backgroudimageView];
        [self jsonTopInit];
        [_verticalScrollView addSubview:self.FirstPageCollectionView];
        

        
        

        
    }
    
    return _verticalScrollView;
}

-(UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth*29/80, ScreenHeight/20, ScreenWidth/3, ScreenWidth/10)];
        _title.backgroundColor = [UIColor clearColor];
        _title.textColor = [UIColor colorWithHex:primary_color_500_mask alpha:0.9];
        _title.text = @"42媒体中心";

    }
    return _title;
}


//图片轮播
-(void)picturesTurn {
    
//    //既有本地图片也有网络图片
//    NSArray *arr3 = @[@"http://www.5068.com/u/faceimg/20140725173411.jpg", [UIImage imageNamed:@"2.jpg"], @"http://file27.mafengwo.net/M00/52/F2/wKgB6lO_PTyAKKPBACID2dURuk410.jpeg", [UIImage imageNamed:@"welcome1.jpg"]];
    
    //NSArray *describeArray = @[@"图片1", @"图片2", @"图片3", @"图片4",@"图片5",@"图片6"];
    
    /**
     *  通过代码创建
     */
    self.carouselView = [XRCarouselView carouselViewWithImageArray:_TopPicturedata describeArray:_TopNameData];
    
    //设置frame
    self.carouselView.frame = CGRectMake(0, ScreenHeight/8, ScreenWidth, ScreenWidth/16*9);
    
    //用block处理图片点击
        self.carouselView.imageClickBlock = ^(NSInteger index) {
            NSLog(@"第%ld张图片被点击", index);
            _videoPlayController= [[self MyviewController].storyboard instantiateViewControllerWithIdentifier:VideoPlayViewControllerID];
//            UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//            UIViewController *myViewController = [story instantiateViewControllerWithIdentifier:VideoPlayViewControllerID];
            MyCATransition *transition = [[MyCATransition alloc] init];
            [transition transition:7 withView:[self MyviewController].view andToOtherControllerType:0];
            [[self MyviewController] presentViewController:_videoPlayController animated:NO completion:nil];
            
            
            
        };
    
    //用代理处理图片点击，如果两个都实现，block优先级高于代理
    self.carouselView.delegate = self;
    
    
    //设置每张图片的停留时间
    _carouselView.time = 2;
    
    //设置分页控件的图片,不设置则为系统默认
    [_carouselView setPageImage:[UIImage imageNamed:@"other"] andCurrentImage:[UIImage imageNamed:@"current"]];
    
    //设置分页控件的位置，默认为PositionBottomCenter
    _carouselView.pagePosition = PositionBottomRight;
    
    /**
     *  设置图片描述控件
     */
    //设置背景颜色，默认为黑色半透明
    _carouselView.desLabelBgColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    //设置字体，默认为13号字体
    _carouselView.desLabelFont = [UIFont systemFontOfSize:16];
    //设置文字颜色，默认为白色
    _carouselView.desLabelColor = [UIColor greenColor];
    

    
    
    /**
     *  通过storyboard创建的轮播控件
     */
    //        _carouselView1.imageArray = arr3;
    //        //设置分页控件指示器的颜色
    //        [_carouselView1 setPageColor:[UIColor redColor] andCurrentPageColor:[UIColor blueColor]];
    //        _carouselView1.time = 2;
    [_verticalScrollView addSubview:_carouselView];
    
    [_verticalScrollView addSubview:self.moreButton];
    [_verticalScrollView addSubview:self.moreView];
    [_verticalScrollView addSubview:self.title];
}





#pragma mark 更多按钮
-(UIButton *)moreButton {
    if (!_moreButton) {
        _moreButton = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth*21.5/25, ScreenHeight/20, ScreenWidth/10, ScreenWidth/10)];
       // _moreButton.backgroundColor = [UIColor whiteColor];
        [_moreButton setImage:[UIImage imageNamed:@"NormalMore.png"] forState:UIControlStateNormal];
        [_moreButton setImage:[UIImage imageNamed:@"SelectMore.png"] forState:UIControlStateHighlighted];
        [_moreButton addTarget:self action:@selector(moreButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return _moreButton;
}


#pragma mark 更多按钮点击后显示的内容
-(UIView *) moreView {
    if (!_moreView) {
        _moreView = [[UIView alloc] initWithFrame:CGRectMake(ScreenWidth*16/25, ScreenHeight/7, ScreenWidth/4, ScreenWidth/3)];
        _moreView.backgroundColor = [UIColor whiteColor];
        _moreView.hidden = YES;
        
    }
    
    return _moreView;
}


#pragma mark 更多按钮响应事件
-(void)moreButtonAction:(id)sender {

    static int index = 0;
    //NSLog(@"moreButton is click!!");

    if (index == 0) {
        _moreView.hidden = NO;
        [_moreButton setImage:[UIImage imageNamed:@"SelectMore.png"] forState:UIControlStateNormal];
        index = 1;
    }
    else if (index == 1) {
        _moreView.hidden = YES;
        [_moreButton setImage:[UIImage imageNamed:@"NormalMore.png"] forState:UIControlStateNormal];
        index = 0;
    }
    
    
    
}

#pragma mark -cell的初始化
-(UICollectionView*)FirstPageCollectionView {
    
    if (!_FirstPageCollectionView) {
        UICollectionViewFlowLayout *flowLaout = [[UICollectionViewFlowLayout alloc] init];
        [flowLaout setScrollDirection:UICollectionViewScrollDirectionVertical];
        _FirstPageCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, ScreenHeight*3/4, ScreenWidth, ScreenHeight/2) collectionViewLayout:flowLaout];
        _FirstPageCollectionView.delegate = self;
        _FirstPageCollectionView.dataSource = self;
        [_FirstPageCollectionView setBackgroundColor:[UIColor colorWithHex:primary_color_0]];
        
        [_FirstPageCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
        
    }
    
    return _FirstPageCollectionView;
}

#pragma mark -UICollectionViewDataSource 显示首页推荐的cell
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;//返回热门推荐的个数
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;//由首页的几种类型决定
}


//cell内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"UICollectionViewCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithHex:primary_color_500_mask];

    UIImageView* view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 9*ScreenWidth/20, 3*ScreenWidth/8)];
    view.image = [UIImage imageNamed:@"1.jpg"];
    [cell.contentView addSubview:view];
//    for (id subView in cell.contentView.subviews) {
//        [subView removeFromSuperview];
//    }
    
    return cell;
}

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(9*ScreenWidth/20, 3*ScreenWidth/8);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(ScreenWidth/30, ScreenWidth/60, ScreenWidth/60, ScreenWidth/60);
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}


//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


-(void)jsonTopInit {
    NSString * str = Net_host;
    str = [str stringByAppendingString:net_video_multi_top];
    //NSLog(@"str:%@",str);
    NSURL *url = [NSURL URLWithString:str];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setTimeoutInterval:2.0];
        NSOperationQueue *queue = [NSOperationQueue mainQueue];
        [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *returnResponse,NSData *data,NSError *error){
            //NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)returnResponse;
            if (error || data == nil){
                NSLog(@"请求失败");
            }
            else{
                NSLog(@"请求成功");
                NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                NSMutableArray *jsonArray = [dic valueForKeyPath:@"object.videoMulti.preview"];   //图片,路径得到
                NSMutableArray *nameArray = [dic valueForKeyPath:@"object.videoMulti.name"];//就是字符串不是http图片
                NSMutableArray *videoArray = [dic valueForKeyPath:@"object.videoMulti.id"];
                NSLog(@"videoArray : %@",videoArray);
                _TopNameData = nameArray;
                _TopPicturedata = [self getPictureJsonData:jsonArray];
                [self picturesTurn];
                
            }
    
        }];
}

-(NSMutableArray *)getPictureJsonData:(NSMutableArray *)piactureJson {
    //jsonData = json;
    //NSLog(@"array: %@",json);
    NSMutableArray * array = [[NSMutableArray alloc] init];
    NSString *str = Net_host;
    for (NSString *string in piactureJson) {
        str = [str stringByAppendingString:string];
        //NSLog(@"str:  %@",str);
        [array addObject:[NSString stringWithFormat:str]];
        str = Net_host;
    }
    //NSLog(@"array:%@",array);
    //jsonData = array;
    return array;
}

//view里的强行VC跳转
- (UIViewController *)MyviewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}


@end

