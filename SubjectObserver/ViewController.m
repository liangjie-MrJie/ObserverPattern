//
//  ViewController.m
//  SubjectObserver
//
//  Created by liangjie on 2016/12/20.
//  Copyright © 2016年 liangjie. All rights reserved.
//

#import "ViewController.h"
#import "BlueBuff.h"
#import "Summoner1.h"
#import "Summoner2.h"
#import "Summoner3.h"

#import "LJNSNotificationCenter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    BlueBuff *buff = [[BlueBuff alloc] init];
    
    Summoner1 *_1 = [[Summoner1 alloc] init];
    [buff registerObserver:_1];
    Summoner2 *_2 = [[Summoner2 alloc] init];
    [buff registerObserver:_2];
    Summoner3 *_3 = [[Summoner3 alloc] init];
    [buff registerObserver:_3];

    // buff开始对提莫发起攻击
    [buff attackOn:@"提莫"];
    
    // 取消了召唤师3的订阅
    [buff removeObserver:_3];
    [buff attackOn:@"提莫"];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(action:) name:@"LJ" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"LJ" object:self];
 
    [[LJNSNotificationCenter defaultCenter] addObserver:self selector:@selector(ljaction:) name:@"LJ" object:nil];
    [[LJNSNotificationCenter defaultCenter] postNotificationName:@"LJ" object:self];
}

- (void)action:(NSNotification *)notification {
    NSLog(@"系统通知");
}

- (void)ljaction:(LJNSNotification *)notification {
    NSLog(@"自定义通知");
}


@end
