//
//  NotifyDataObject.m
//  SubjectObserver
//
//  Created by liangjie on 2016/12/20.
//  Copyright © 2016年 liangjie. All rights reserved.
//

#import "NotifyDataObject.h"

@implementation NotifyDataObject 
- (instancetype)initWithDescribed:(NSString *)describe {
    self = [super init];
    if (self) {
        _described = describe;
        _extentWord = @"召唤师峡谷我只手遮天";
    }
    return self;
}

- (NSString *)debugDescription {
    return [NSString stringWithFormat:@"%@ %@", _described, _extentWord];
}

@end
