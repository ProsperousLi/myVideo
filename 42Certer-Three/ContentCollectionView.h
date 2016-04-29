//
//  ContentCollectionView.h
//  42Certer-Three
//
//  Created by dragon on 15/12/12.
//  Copyright © 2015年 dragon. All rights reserved.
//  首页的Cell内容

#import <UIKit/UIKit.h>

@interface ContentCollectionView : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UISearchBarDelegate>

@property (strong,nonatomic) UIScrollView *verticalScrollView; //竖直滚动
@property (strong,nonatomic) UICollectionView *collectionView;
@property (strong,nonatomic) UISearchBar *searchBar;

@end
