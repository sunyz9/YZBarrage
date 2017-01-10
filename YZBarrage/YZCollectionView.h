//
//  YZCollectionView.h
//  YZBarrage
//
//  Created by sun on 2017/1/9.
//  Copyright © 2017年 sun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YZMessage.h"

@interface YZCollectionView : UICollectionView

@property (nonatomic, strong) CAGradientLayer * topLayer;

@property (nonatomic, strong) NSMutableArray * messageArray;

-(void)recieveMessage:(YZMessage *)message;

@end
