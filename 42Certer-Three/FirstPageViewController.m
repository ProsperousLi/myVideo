
//
//  FirstPageViewController.m
//  42Certer-Three
//
//  Created by dragon on 15/12/6.
//  Copyright © 2015年 dragon. All rights reserved.
//

#import "FirstPageViewController.h"

@implementation FirstPageViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    pageView = [[FirstPageView alloc] init];
    [pageView.moreView addSubview:self.tableView];
    [self customButtonsAddWithDelete:nil showNumberButtonsInOneLine:PageNumber];
    [self.view addSubview:pageView];
//    pageView.carouselView.imageClickBlock = ^(NSInteger index) {
//        [self ImageViewSingleTapAction:index];
//    };
    
    
}



#pragma 按钮控件－－自定义喜欢的类型
-(void)customButtonsAddWithDelete:(id)sender showNumberButtonsInOneLine:(int)number {
    
  
    int showNumberButtonsInOneLine = number; //每行显示多少个按钮
    showNumberButtonsInOneLine = 5;
    [self setValuesForCustomButtons]; //调用方法，初始化button的内容
    //众多按钮的透明背景
    _BUttonbackgroudView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight/2, ScreenWidth, ScreenHeight/3 - (ScreenHeight/11) * 2 + ScreenHeight/15)];
    _BUttonbackgroudView.backgroundColor = [UIColor colorWithHex:primary_color_grey_50 alpha:1.0];
    [pageView.verticalScrollView addSubview:_BUttonbackgroudView];
    
    for (int i = 1; i <= _customButtonContents.count; i++) { //按钮布局
        UIButton *customButton;
        if (i <=showNumberButtonsInOneLine ) {
            if (i == 1) {
                customButton = [[UIButton alloc] initWithFrame:CGRectMake((_BUttonbackgroudView.frame.size.width)/12 *i, _BUttonbackgroudView.frame.size.height/10, (_BUttonbackgroudView.frame.size.width)/8, 2*(_BUttonbackgroudView.frame.size.height)/10)];
            }
            else {
                customButton = [[UIButton alloc] initWithFrame:CGRectMake(2 *(_BUttonbackgroudView.frame.size.width)/11 *(i-1) + (_BUttonbackgroudView.frame.size.width)/12, _BUttonbackgroudView.frame.size.height/10, (_BUttonbackgroudView.frame.size.width)/8, 2*(_BUttonbackgroudView.frame.size.height)/10)];
            }
        }
        else {
            if (i%showNumberButtonsInOneLine + 1 == 1) {
                customButton = [[UIButton alloc] initWithFrame:CGRectMake((_BUttonbackgroudView.frame.size.width)/12 * ((i%showNumberButtonsInOneLine)+1), 3*(_BUttonbackgroudView.frame.size.height)/10 + (_BUttonbackgroudView.frame.size.width)/8 , (_BUttonbackgroudView.frame.size.width)/8, 2*(_BUttonbackgroudView.frame.size.height)/10)];
            }
            else {
                customButton = [[UIButton alloc] initWithFrame:CGRectMake(2 * (_BUttonbackgroudView.frame.size.width)/11 * ((i%showNumberButtonsInOneLine)+1 - 1) + (_BUttonbackgroudView.frame.size.width)/12, 3*(_BUttonbackgroudView.frame.size.height)/10 + (_BUttonbackgroudView.frame.size.width)/8 , (_BUttonbackgroudView.frame.size.width)/8, 2*(_BUttonbackgroudView.frame.size.height)/10)];
            }
            
        }
        
        customButton.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0];
        [customButton setTitleColor:[UIColor colorWithHex:main_text_title_color_light] forState:UIControlStateNormal];
        [customButton setTitle:[_customButtonContents objectAtIndex:(i-1)] forState:UIControlStateNormal];
        customButton.tag = i;
        [customButton addTarget:self action:@selector(custombuttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_BUttonbackgroudView addSubview:customButton];
    }
    
}

#pragma view跳转
-(void)custombuttonAction:(UIButton*)button {
    
        _customButtonContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:SearchContentViewControllerID];
        for (int i =1 ; i <= _customButtonContents.count; i++) {
            if (button.tag == i) {
                NSString * strContent = [NSString stringWithFormat:@"%@",[_customButtonContents objectAtIndex:(i-1)]];
                [super getStrForLabel:strContent];
            }
        }
    
    
        MyCATransition *transition = [[MyCATransition alloc] init];
        [transition transition:4 withView:self.view andToOtherControllerType:2];
        //_customButtonContentViewController.modalPresentationStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:_customButtonContentViewController animated:NO completion:nil];
    
    
}


#pragma mark  设置按钮的内容
-(void)setValuesForCustomButtons{
    
    _customButtonContents = [[NSMutableArray alloc] initWithObjects:ButtonTitle1,ButtonTitle2,ButtonTitle3,ButtonTitle4,ButtonTitle5,ButtonTitle6,ButtonTitle7,ButtonTitle8,ButtonTitle9,ButtonTitle10, nil];
    
}





#pragma mark 广告页可点击响应事件
-(void)ImageViewSingleTapAction:(NSInteger)sender {
    _videoPlayController= [self.storyboard instantiateViewControllerWithIdentifier:VideoPlayViewControllerID];
    MyCATransition *transition = [[MyCATransition alloc] init];
    [transition transition:7 withView:self.view andToOtherControllerType:0];
    [self presentViewController:_videoPlayController animated:NO completion:nil];
}


//#pragma mark 小的tableview
//-(UITableView *)tableView {
//    if (!_tableView) {
//        _tableView = [[UITableView alloc] initWithFrame:pageView.moreView.bounds style:UITableViewStyleGrouped];
//        _tableView.dataSource = self;
//    }
//    
//    return _tableView;
//}








@end
