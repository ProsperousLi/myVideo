//
//  LeftSlideViewController.m
//  42Certer-Three
//
//  Created by dragon on 16/4/9.
//  Copyright © 2016年 dragon. All rights reserved.
//

#import "LeftSlideViewController.h"

@interface LeftSlideViewController ()

@end

@implementation LeftSlideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.leftSlideView = [[LeftSlideView alloc] init];
    [self.view addSubview:_leftSlideView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
