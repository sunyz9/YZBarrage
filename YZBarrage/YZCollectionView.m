//
//  YZCollectionView.m
//  YZBarrage
//
//  Created by sun on 2017/1/9.
//  Copyright © 2017年 sun. All rights reserved.
//

#import "YZCollectionView.h"
#import "YZCollectionViewCell.h"
#import "YZCollectionViewCellModel.h"

@interface YZCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation YZCollectionView

static NSString * const collectionViewCellID = @"collectionViewCellID";

-(NSMutableArray *)messageArray
{
    if (!_messageArray) {
        _messageArray = [NSMutableArray array];
    }
    return _messageArray;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor clearColor];
        self.bounces = YES;
        [self registerClass:[YZCollectionViewCell class] forCellWithReuseIdentifier:collectionViewCellID];
    }
    return self;
}


-(void)recieveMessage:(YZMessage *)message
{
    YZCollectionViewCellModel * model = [YZCollectionViewCellModel createModelWith:message];
    if (self.messageArray.count == 20) {
        [self.messageArray removeObjectAtIndex:0];
        [self reloadData];
    }
    [self.messageArray addObject:model];
    if (self.messageArray.count != 0) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.messageArray.count - 1 inSection:0];
        
        if ([self numberOfItemsInSection:0] != self.messageArray.count-1) {
            if ([self isAtTheBottomOfTableView]) {
                [self scrollToBottomAnimated:YES];
            }
            return;
        }
        NSArray * arr = [NSArray arrayWithObject:indexPath];
        [self insertItemsAtIndexPaths:arr];
        [self scrollToBottomAnimated:YES];
    }
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.messageArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YZCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellID forIndexPath:indexPath];
    if (cell) {
        YZCollectionViewCellModel * vm = self.messageArray[indexPath.row];
        [cell bindDataWith:vm];
    }
    return cell;
}


#pragma mark ---- UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YZCollectionViewCell * cell = [[YZCollectionViewCell alloc]initWithFrame:CGRectZero];
    YZCollectionViewCellModel * vm = self.messageArray[indexPath.row];
    [cell bindDataWith:vm];
    return (CGSize){CGRectGetWidth(self.frame),cell.cellHeight};
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}
- (void)scrollToBottomAnimated:(BOOL)animated {
    if ([self numberOfSections] == 0) {
        return;
    }
    NSUInteger finalRow = MAX(0, [self numberOfItemsInSection:0] - 1);
    if (0 == finalRow) {
        return;
    }
    NSIndexPath *finalIndexPath =
    [NSIndexPath indexPathForItem:finalRow inSection:0];
    [self scrollToItemAtIndexPath:finalIndexPath atScrollPosition:UICollectionViewScrollPositionBottom animated:animated];
    
}

- (BOOL)isAtTheBottomOfTableView {
    CGSize contentSize = self.contentSize;
    if (contentSize.height <= self.frame.size.height) {
        return YES;
    }
    CGPoint contentOffset = self.contentOffset;
    if(contentOffset.y >= (self.contentSize.height - self.frame.size.height)) {
        return YES;
    }else{
        return NO;
    }
}
- (CAGradientLayer *)topLayer {
    if (!_topLayer) {
        _topLayer = [CAGradientLayer layer];
        _topLayer.startPoint = CGPointMake(0, 0);
        _topLayer.endPoint   = CGPointMake(0, 1);
        _topLayer.locations  = @[@(0),@(0.05), @(0.1),@(0.15), @(1)];
        _topLayer.colors = @[
                             (__bridge id)[UIColor colorWithWhite:0 alpha:0.0].CGColor,
                             (__bridge id)[UIColor colorWithWhite:0 alpha:0.25].CGColor,
                             (__bridge id)[UIColor colorWithWhite:0 alpha:0.5].CGColor,
                             (__bridge id)[UIColor colorWithWhite:0 alpha:0.75].CGColor,
                             (__bridge id)[UIColor colorWithWhite:0 alpha:1].CGColor];
    }
    
    return _topLayer;
}

@end
