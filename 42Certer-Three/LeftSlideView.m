//
//  LeftSlideView.m
//  42Certer-Three
//
//  Created by dragon on 16/4/9.
//  Copyright © 2016年 dragon. All rights reserved.
//

#import "LeftSlideView.h"

@implementation LeftSlideView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)init {
    if (self = [super init]) {
        CGRect frame = [[UIScreen mainScreen] bounds];
        self.frame = frame;
        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

@end
