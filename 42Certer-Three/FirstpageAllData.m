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



-(void)jsonTopInit {
    NSString * str = Net_host;
    str = [str stringByAppendingString:net_video_multi_top];
    //NSLog(@"str:%@",str);
    NSURL *url = [NSURL URLWithString:str];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setTimeoutInterval:2.0];
//    NSOperationQueue *queue = [NSOperationQueue mainQueue];
//    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *returnResponse,NSData *data,NSError *error){
//        //NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)returnResponse;
//        if (error || data == nil){
//            NSLog(@"请求失败");
//        }
//        else{
//            NSLog(@"请求成功");
//            NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//            NSMutableArray *jsonArray = [dic valueForKeyPath:@"object.videoMulti.preview"];   //图片,路径得到
//           jsonData = [self getJsonData:jsonArray];
//        }
//        
//    }];
//
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:self];
}





@end
