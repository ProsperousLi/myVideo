//
//  ContentCollectionView.m
//  42Certer-Three
//
//  Created by dragon on 15/12/12.
//  Copyright © 2015年 dragon. All rights reserved.
//

#import "ContentCollectionView.h"
#import "AppConstant.h"
@implementation ContentCollectionView



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //确定是水平滚动，还是垂直滚动
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    //[flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0,  ScreenHeight/6, ScreenWidth, ScreenHeight * 3) collectionViewLayout:flowLayout];
    self.collectionView.dataSource=self;
    self.collectionView.delegate=self;
    [self.collectionView setBackgroundColor:[UIColor clearColor]];
    
    //注册Cell，必须要有
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [self.view addSubview:self.verticalScrollView];
    [_verticalScrollView addSubview:self.collectionView];
    [self.view addSubview:self.searchBar];
}


-(UIScrollView *)verticalScrollView {
    if (!_verticalScrollView) {
        //verticalScrollView 垂直试图滚动
        _verticalScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, ScreenHeight/10, ScreenWidth, ScreenHeight)];
        [_verticalScrollView setDelegate:self];
        _verticalScrollView.contentSize = CGSizeMake(ScreenWidth , ScreenHeight * 3);
        _verticalScrollView.backgroundColor = [UIColor whiteColor];
        
        [_verticalScrollView setShowsVerticalScrollIndicator:NO];//隐藏竖直滚动条
    }
    
    return _verticalScrollView;
}

-(UISearchBar*)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight/10)];
       // [[_searchBar.subviews objectAtIndex:0] setHidden:YES];  //隐藏搜索框
        //_searchBar.prompt = @"电影、电视剧";
        _searchBar.placeholder = @"热门搜索:师父";
        //_searchBar.showsCancelButton =YES;

    }
    return _searchBar;
}

#pragma mark -- UICollectionViewDataSource

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"UICollectionViewCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:((10 * indexPath.row) / 255.0) green:((20 * indexPath.row)/255.0) blue:((30 * indexPath.row)/255.0) alpha:1.0f];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    label.textColor = [UIColor redColor];
    label.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    for (id subView in cell.contentView.subviews) {
        [subView removeFromSuperview];
    }
    [cell.contentView addSubview:label];
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(9*ScreenWidth/20, 3*ScreenWidth/8);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(ScreenWidth/30, ScreenWidth/60, ScreenWidth/60, ScreenWidth/60);
}


#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //static int colorIndex = 1;
    static NSInteger rowIndex = -1;
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    //临时改变个颜色，看好，只是临时改变的。如果要永久改变，可以先改数据源，然后在cellForItemAtIndexPath中控制。（和UITableView差不多吧！O(∩_∩)O~）
    if ( indexPath.row != rowIndex ) {
        cell.backgroundColor = [UIColor greenColor];
        
    }
    else {
        
        cell.backgroundColor = [UIColor colorWithRed:((10 * indexPath.row) / 255.0) green:((20 * indexPath.row)/255.0) blue:((30 * indexPath.row)/255.0) alpha:1.0f];
        

    }
    
    NSLog(@"item======%ld",(long)indexPath.item);
    NSLog(@"row=======%ld",(long)indexPath.row);
    NSLog(@"section===%ld",(long)indexPath.section);
    rowIndex = indexPath.row;
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//搜索框的取消按钮的回调
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    //[self.searchDisplayController setActive:NO animated:YES];
}

@end
