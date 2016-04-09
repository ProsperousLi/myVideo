//
//  ImageViewController.m
//  42Certer-Three
//
//  Created by dragon on 15/12/5.
//  Copyright © 2015年 dragon. All rights reserved.
//

#import "ImageViewController.h"

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _fristViewController = [self.storyboard instantiateViewControllerWithIdentifier:TabBarControllerID];
    self.titleLable.text = self.titleText;
    [self.view addSubview:self.backgroudImage];
    
    if (_pageIndex == TeachPageNumber) {
        [self.view addSubview:self.StartButton];
    }
    

}

-(UIImageView*)backgroudImage {
    if (!_backgroudImage) {
        _backgroudImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        self.backgroudImage.image = [UIImage imageNamed:self.imageFile];
    }
    return _backgroudImage;
}

-(UIButton *)StartButton {
    if (!_StartButton) {
        _StartButton = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth/3, 3 * ScreenHeight / 4, ScreenWidth/3, 3 * ScreenHeight / 32)];
        _StartButton.backgroundColor = [UIColor redColor];
        _StartButton.tintColor = [UIColor whiteColor];
        [_StartButton setTitle:ButtonTitle forState:UIControlStateNormal];
        [_StartButton addTarget:self action:@selector(ButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _StartButton;
}

-(void) ButtonAction:(UIButton*)button {
    MyCATransition *transition = [[MyCATransition alloc] init];
    [transition transition:4 withView:self.view andToOtherControllerType:2];
    [self presentViewController:_fristViewController animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
