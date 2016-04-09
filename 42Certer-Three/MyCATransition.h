//
//  CATransition.h
//  42centerTwo
//
//  Created by dragon on 15/11/23.
//  Copyright © 2015年 dragon. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyCATransition : UIViewController

@property (nonatomic,assign) int Mysubtype;

- (void)transition:(int)transType  withView:(UIView*)view  andToOtherControllerType:(int)type;


@end
