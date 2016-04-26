//
//  UIColor+Hex.h
//  42Certer-Three
//
//  Created by dragon on 16/4/17.
//  Copyright © 2016年 dragon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *)colorWithHex:(long)hexColor;
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity;

@end
