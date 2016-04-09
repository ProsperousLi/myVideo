//
//  SearchContentViewController.m
//  42Certer-Three
//
//  Created by dragon on 15/12/6.
//  Copyright © 2015年 dragon. All rights reserved.
//

#import "SearchContentViewController.h"
static NSString *myString = nil;
@implementation SearchContentViewController

- (void)setStr:(NSString *)str
{
    myString = str;
}
- (NSString *)getStr
{
    return myString;
}



-(void)getStrForLabel:(NSString *)str {
    [self setStr:str];
}

-(void)viewDidLoad {
    [super viewDidLoad];
    [self Design];
}

-(void)buttonAction :(id)sender{
    [_returnButton isSelected];
    [self dismissViewControllerAnimated:NO completion:nil];
}

-(void)Design{
    //button
    _returnButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2,self.view.frame.size.height/2, 100,120)];
    _returnButton.backgroundColor = [UIColor redColor];
    [_returnButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_returnButton setTitle:@"返回" forState:UIControlStateNormal];
    [_returnButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_returnButton];
    
    
    //label
    _Titlelabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/3,self.view.frame.size.height/3, 100,120)];
    _Titlelabel.backgroundColor = [UIColor redColor];
    [_Titlelabel setTextColor:[UIColor whiteColor]];
    
    [_Titlelabel setText:myString];
    
    [self.view addSubview:_Titlelabel];
    
}

@end
