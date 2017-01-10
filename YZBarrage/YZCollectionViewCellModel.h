//
//  YZCollectionViewCellModel.h
//  YZBarrage
//
//  Created by sun on 2017/1/9.
//  Copyright © 2017年 sun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "YZMessage.h"

@interface YZCollectionViewCellModel : NSObject

@property (nonatomic, strong) NSMutableAttributedString * contentAttributedString;

+(instancetype)createModelWith:(YZMessage *)message;

@end
