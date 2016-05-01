//
//  VideoPlayerView.h
//  42Certer-Three
//
//  Created by dragon on 16/5/1.
//  Copyright © 2016年 dragon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppConstant.h"
#import "UIColor+Hex.h"

@interface VideoPlayerView : UIView

@property (nonatomic,strong) UIView *videoButtonBackgroudView;
@property (nonatomic,strong) UILabel *VideoTitle;
@property (nonatomic,strong) UILabel *VideoType;
-(void)setTitle:(NSString *)Title;
-(void)setType:(NSString *)Type;

@end
