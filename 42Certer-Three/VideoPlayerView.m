//
//  VideoPlayerView.m
//  42Certer-Three
//
//  Created by dragon on 16/5/1.
//  Copyright © 2016年 dragon. All rights reserved.
//

#import "VideoPlayerView.h"

@implementation VideoPlayerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)init {
    if (self = [super init]) {
        
    }
         
    return self;
}
//        self.videoController = [[KrVideoPlayerController alloc] initWithFrame:CGRectMake(0, ScreenHeight/9, ScreenWidth, ScreenWidth*(9.0/16.0))];
-(UILabel *)VideoTitle {
    if (!_VideoTitle) {
        _VideoTitle = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/20, ScreenHeight/8 + ScreenWidth*(9.0/16.0), ScreenWidth/2, ScreenWidth/6)];
        _VideoTitle.backgroundColor = [UIColor clearColor];
        _VideoTitle.textColor = [UIColor colorWithHex:main_text_title_color_dark];
       // _VideoTitle.textAlignment = NSTextAlignmentCenter;
        //_VideoTitle.text = @"123123123";
        
        
    }
    
    return _VideoTitle;
}

-(UILabel *)VideoType {
    if (!_VideoType) {
        _VideoType = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/20, ScreenHeight/6 + ScreenWidth*(9.0/16.0), ScreenWidth/2, ScreenWidth/6)];
         //_VideoType.textAlignment = NSTextAlignmentCenter;
        _VideoType.backgroundColor = [UIColor clearColor];
        _VideoType.textColor = [UIColor colorWithHex:main_text_title_color_lighter];
    }
    
    return _VideoType;
}



-(void)setTitle:(NSString *)Title {
    [self addSubview:self.VideoTitle];
    _VideoTitle.text = Title;
    
}

-(void)setType:(NSString *)Type {
    [self addSubview:self.VideoType];
    _VideoType.text = Type;
    
}



         
@end
