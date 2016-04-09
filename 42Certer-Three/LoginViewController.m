//
//  NetViewController.m
//  42Certer-Three
//
//  Created by dragon on 15/11/29.
//  Copyright © 2015年 dragon. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    LoginView *loginView = [[LoginView alloc] init];
    [self.view addSubview:loginView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UIView*)mainView {
    if (!_mainView) {
        _mainView = [[LoginView alloc] init];
    }
    return _mainView;
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
