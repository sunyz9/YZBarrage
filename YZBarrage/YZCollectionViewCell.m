//
//  YZCollectionViewCell.m
//  YZBarrage
//
//  Created by sun on 2017/1/9.
//  Copyright © 2017年 sun. All rights reserved.
//

#import "YZCollectionViewCell.h"

@interface YZCollectionViewCell ()

@property (strong, nonatomic) UILabel * contentLabel;

@end

@implementation YZCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
         self.backgroundColor = [UIColor clearColor];
    
         NSLayoutConstraint *tempWidthConstraint =[NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:200];
         [self.contentView setTranslatesAutoresizingMaskIntoConstraints:NO];
         [self.contentView addConstraint:tempWidthConstraint];
        
        self.contentLabel = [[UILabel alloc]init];
        self.contentLabel.font = [UIFont systemFontOfSize:15.0];
        self.contentLabel.numberOfLines = 0;
        self.contentLabel.shadowColor = [UIColor blackColor];
        [self.contentLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:5]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:-5]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    }
    return self;
}

-(void)bindDataWith:(YZCollectionViewCellModel *)viewModel{
    self.viewModel = viewModel;
    
    [self.contentLabel setAttributedText:viewModel.contentAttributedString];
    
    [self.contentView layoutIfNeeded];
    
    self.cellHeight = [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
}

@end
