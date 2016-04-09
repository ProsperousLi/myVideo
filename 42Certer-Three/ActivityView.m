//
//  ActivityView.m
//  42Certer-Three
//
//  Created by dragon on 15/12/4.
//  Copyright © 2015年 dragon. All rights reserved.
//

#import "ActivityView.h"
#import "AppConstant.h"
@implementation ActivityView




#pragma mark 活动指示器
-(UIActivityIndicatorView *)act {
    NSLog(@"act");
    if (!_myact) {
        _myact = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(ScreenWidth/2 - ScreenWidth/10, ScreenHeight/2 - ScreenHeight/10, ScreenWidth/5, ScreenHeight/5)];
        _myact.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        //_act.color = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:LoadViewPicture]];
        _myact.color = [UIColor redColor];
        //_act.hidesWhenStopped = NO;
    }
    return _myact;
}


@end



