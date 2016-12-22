//
//  Summoner2.m
//  SubjectObserver
//
//  Created by liangjie on 2016/12/20.
//  Copyright © 2016年 liangjie. All rights reserved.
//

#import "Summoner2.h"
#import "BlueBuff.h"

@implementation Summoner2
- (void)update:(id<Subject>)subject notifyData:(id)descripte {
    if (descripte) {
        NotifyDataObject *notifyData = descripte;
        NSLog(@"%@得到了通知：%@ %@", NSStringFromClass(self.class), NSStringFromClass(((NSObject *)subject).class), [notifyData debugDescription]);
    }
    else {
        BlueBuff *bbuff = subject;
        NSLog(@"%@得到了通知：%@ %@", NSStringFromClass(self.class), NSStringFromClass(((NSObject *)subject).class), [bbuff fetchDescribe]);
    }
}
@end
