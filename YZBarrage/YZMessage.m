//
//  YZMessage.m
//  YZBarrage
//
//  Created by sun on 2017/1/9.
//  Copyright © 2017年 sun. All rights reserved.
//

#import "YZMessage.h"

@implementation YZMessage

+(YZMessage *)createRandomMessage{
    return [[self alloc]initRandomMessage];
}

- (instancetype)initRandomMessage
{
    self = [super init];
    if (self) {
        [self create];
    }
    return self;
}

-(void)create{
    NSInteger random = arc4random_uniform(3);
    switch (random) {
        case 0:{
            self.name = @"吃瓜小明";
            self.gender = 1;
            self.content = @"棒棒棒棒棒棒!";
            self.type = YZTextMessage;
            break;
        }
        case 1:{
            self.name = @"土豪小葱";
            self.gender = 1;
            self.content = @"送给主播一个玛莎拉蒂";
            self.type = YZGiftMessage;
            break;
        }
        case 2:{
            self.name = @"闷骚小凡";
            self.gender = 0;
            self.content = @"点亮了房间";
            self.type = YZLikeMessage;
            break;
        }
        default:
            break;
    }
}

@end
