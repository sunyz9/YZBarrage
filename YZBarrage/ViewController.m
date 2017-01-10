//
//  ViewController.m
//  YZBarrage
//
//  Created by sun on 2017/1/9.
//  Copyright © 2017年 sun. All rights reserved.
//

#import "ViewController.h"
#import "YZCollectionView.h"

@interface ViewController ()

@property (strong, nonatomic) YZCollectionView * barrageCollectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView * backgroundImage = [[UIImageView alloc]init];
    backgroundImage.frame = self.view.bounds;
    backgroundImage.image = [UIImage imageNamed:@"背景"];
    [self.view addSubview:backgroundImage];
    
    self.barrageCollectionView = [[YZCollectionView alloc]initWithFrame:CGRectMake(0, 0, 200, 350) collectionViewLayout:[[UICollectionViewFlowLayout alloc]init] ];
    [self.barrageCollectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.barrageCollectionView.layer.borderWidth = 2;
    [self.view addSubview:self.barrageCollectionView];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.barrageCollectionView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:CGRectGetHeight(self.view.bounds)/2]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.barrageCollectionView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:10]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.barrageCollectionView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:-10]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.barrageCollectionView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:200]];
    
    [self startAutoYZMessage];
}

-(void)startAutoYZMessage{
    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(recieveYZMessage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];

}
-(void)recieveYZMessage{
    YZMessage * message = [YZMessage createRandomMessage];
    [self.barrageCollectionView recieveMessage:message];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
