//
//  WelcomePageData.m
//  42Certer-Three
//
//  Created by dragon on 15/12/5.
//  Copyright © 2015年 dragon. All rights reserved.
//

#import "WelcomePageData.h"

@implementation WelcomePageData

-(NSArray *)Setimages:(NSArray*)array {
    array = @[WelcomeOnePicture,WelcomeTwoPicture,WelcomeThreePicture];
    return array;
}

-(NSArray *)Setlabels :(NSArray*)array{
    array = @[@"1",@"2",@"3"];
    return array;
}

@end