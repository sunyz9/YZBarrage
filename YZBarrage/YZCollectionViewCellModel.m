//
//  YZCollectionViewCellModel.m
//  YZBarrage
//
//  Created by sun on 2017/1/9.
//  Copyright © 2017年 sun. All rights reserved.
//

#import "YZCollectionViewCellModel.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation YZCollectionViewCellModel

+(instancetype)createModelWith:(YZMessage *)message{
    return [[self alloc]initWithYZMessage:message];
}
- (instancetype)initWithYZMessage:(YZMessage*)message
{
    self = [super init];
    if (self) {
        [self dealMessage:message];
    }
    return self;
}
-(void)dealMessage:(YZMessage *)message{
    
    NSDictionary *nameAttributeDict;
    NSDictionary *contentAttributeDict;
    
    NSString * sender = [NSString stringWithFormat:@"%@:",message.name];

    if (message.type == YZTextMessage) {
        contentAttributeDict = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15.0],NSFontAttributeName,[UIColor whiteColor],NSForegroundColorAttributeName,nil];
    }
    if (message.type == YZGiftMessage) {
        contentAttributeDict = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15.0],NSFontAttributeName,[UIColor orangeColor],NSForegroundColorAttributeName,nil];
    }
    if (message.type == YZLikeMessage) {
        contentAttributeDict = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15.0],NSFontAttributeName,[UIColor redColor],NSForegroundColorAttributeName,nil];
    }
    if (message.gender == 0) {
        nameAttributeDict = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15.0],NSFontAttributeName,UIColorFromRGB(0xffbbff),NSForegroundColorAttributeName,nil];
    }else{
        nameAttributeDict = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15.0],NSFontAttributeName,UIColorFromRGB(0x67ccff),NSForegroundColorAttributeName,nil];
    }

    NSMutableAttributedString * senderName = [[NSMutableAttributedString alloc]initWithString:sender attributes:nameAttributeDict];

    NSMutableAttributedString * contentText = [[NSMutableAttributedString alloc]initWithString:message.content attributes:contentAttributeDict];
    self.contentAttributedString = [NSMutableAttributedString new];
    [self.contentAttributedString appendAttributedString:senderName];
    [self.contentAttributedString appendAttributedString:contentText];
}
@end
