//
//  NSObject+NetOperation.h
//  42Certer-Three
//
//  Created by dragon on 15/11/29.
//  Copyright © 2015年 dragon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h> // 加密导入的头文件
#import "AppConstant.h"


@interface NetOperation : NSObject
{
    NSString *pid; //pid
    NSString *calg; //calg
    NSMutableArray *arrayKeys;  //存储写死的数据
    NSMutableArray *arrayValues; //存储写死的数据
    NSMutableString *upass;  //加密后的字符串
    NSString *loginOutUrl; //注销需要访问的网页
    NSMutableDictionary *words; //两组写死的数据组合
    NSMutableString *postString; //要发送的数据（字符串）
}


-(void)connectNet:(NSString*)username WithPassword:(NSString*)password;
-(void)LoginOutNet;
@end
