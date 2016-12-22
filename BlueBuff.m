//
//  BlueBuff.m
//  SubjectObserver
//
//  Created by liangjie on 2016/12/20.
//  Copyright © 2016年 liangjie. All rights reserved.
//

#import "BlueBuff.h"

@interface BlueBuff ()
@property (nonatomic, strong) NSMutableArray *observers;
@property (nonatomic, strong) NotifyDataObject *notifyData;
@end

@implementation BlueBuff
@synthesize isChanged = _isChanged;

- (instancetype)init {
    self = [super init];
    if (self) {
        _observers = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)attackOn:(NSString *)name {
    _notifyData = [[NotifyDataObject alloc] initWithDescribed:[NSString stringWithFormat:@"三拳 KO 了%@。", name]];
    for (int i=1; i<=3; ++i) {
        NSLog(@"%@第%d次攻击了%@", NSStringFromClass(self.class), i, name);
        // 确定三次攻击KO了，才会赋值YES，从而更灵活的通知订阅者
        if (i == 3) _isChanged = YES;
        [self notifyObservers];
    }
}
- (NSString *)fetchDescribe {
    return _notifyData.described;
}


#pragma mark -- SubjectDelegate

- (void)registerObserver:(id<Observer>)observer {
    [_observers addObject:observer];
}
- (void)removeObserver:(id<Observer>)observer {
    [_observers removeObject:observer];
}
- (void)notifyObservers {
    if (_isChanged) {
        for (id<Observer> observer in _observers) {
            [observer update:self notifyData:_notifyData];
            // 若需要订阅者主动来拉取感兴趣的数据，参数notifyData应传nil
            [observer update:self notifyData:nil];
        }
        _isChanged = NO;
    }
}

@end


