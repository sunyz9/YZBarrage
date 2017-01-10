//
//  YZMessage.h
//  YZBarrage
//
//  Created by sun on 2017/1/9.
//  Copyright © 2017年 sun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, YZMessageType) {
    YZTextMessage = 0,
    YZGiftMessage,
    YZLikeMessage
};

@interface YZMessage : NSObject

@property (copy, nonatomic) NSString * name;
@property (assign, nonatomic) NSInteger gender;
@property (copy, nonatomic) NSString * content;
@property (assign, nonatomic) YZMessageType type;

+(YZMessage *)createRandomMessage;

@end
