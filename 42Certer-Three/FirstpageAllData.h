//
//  FirstpageAllData.h
//  42Certer-Three
//
//  Created by dragon on 16/4/27.
//  Copyright © 2016年 dragon. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "AppConstant.h"
@interface FirstpageAllData : NSObject <NSURLConnectionDelegate>

{
    NSMutableArray *jsonData;
}
@property (nonatomic,strong) NSMutableArray *TopArray;
-(NSMutableArray *) getJsonData:(NSMutableArray *)json;


@end
