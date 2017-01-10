//
//  YZCollectionViewCell.h
//  YZBarrage
//
//  Created by sun on 2017/1/9.
//  Copyright © 2017年 sun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YZCollectionViewCellModel.h"

@interface YZCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) YZCollectionViewCellModel * viewModel;
@property (nonatomic, assign) CGFloat cellHeight;

-(void)bindDataWith:(YZCollectionViewCellModel *)viewModel;

@end
