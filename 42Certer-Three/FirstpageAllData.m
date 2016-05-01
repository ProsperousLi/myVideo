//
//  FirstpageAllData.m
//  42Certer-Three
//
//  Created by dragon on 16/4/27.
//  Copyright © 2016年 dragon. All rights reserved.
//

#import "FirstpageAllData.h"

@implementation FirstpageAllData


-(NSMutableArray *)getJsonData:(NSMutableArray *)json {
    //jsonData = json;
    //NSLog(@"array: %@",json);
    NSMutableArray * array = [[NSMutableArray alloc] init];
    NSString *str = Net_host;
    for (NSString *string in json) {
        str = [str stringByAppendingString:string];
        //NSLog(@"str:  %@",str);
        [array addObject:[NSString stringWithFormat:str]];
        str = Net_host;
    }
    //NSLog(@"array:%@",array);
    //jsonData = array;
    _TopArray = array;
    return array;
}








@end
