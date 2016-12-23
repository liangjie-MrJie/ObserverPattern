//
//  LJNSNotificationCenter.m
//  SubjectObserver
//
//  Created by liangjie on 2016/12/22.
//  Copyright © 2016年 liangjie. All rights reserved.
//

#import "LJNSNotificationCenter.h"


@interface InteriorClass : NSObject
@property (nonatomic) id observer;
@property (nonatomic) id anObject;
@property (nonatomic) SEL aSelector;
@end
@implementation InteriorClass
@end


@implementation LJNSNotificationCenter {
    NSMutableDictionary *_mDict;
}
+ (instancetype)defaultCenter {
    static LJNSNotificationCenter *notifyCenter = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        notifyCenter = [[LJNSNotificationCenter alloc] init];
    });
    
    return notifyCenter;
}
- (instancetype )init {
    self = [super init];
    if (self) {
        _mDict = [[NSMutableDictionary alloc] init];
    }
    return self;
}
- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSNotificationName)aName object:(id)anObject {
    InteriorClass *ic = [InteriorClass new];
    ic.observer = observer;
    ic.aSelector = aSelector;
    ic.anObject = anObject;
    
    NSMutableArray *mArray = [_mDict objectForKey:aName];
    if (mArray) {
        [mArray addObject:ic];
    }
    else {
        mArray = [[NSMutableArray alloc] initWithObjects:ic, nil];
    }
    [_mDict setObject:mArray forKey:aName];
}
- (void)postNotificationName:(NSNotificationName)aName object:(id)anObject {
    NSMutableArray *mArray = [_mDict objectForKey:aName];
    for (InteriorClass *ic in mArray) {
        if (ic.anObject == nil || ic.anObject == anObject) {
            NSMethodSignature *signature = [anObject methodSignatureForSelector:ic.aSelector];
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
            invocation.target = ic.observer;
            invocation.selector = ic.aSelector;
            LJNSNotification *notification = [[LJNSNotification alloc] initWithName:aName object:ic.observer userInfo:0];
            [invocation setArgument:&notification atIndex:2];
            [invocation retainArguments];
            [invocation invoke];
        }
    }
}
@end

@implementation LJNSNotification
- (instancetype)initWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo {
    self = [super init];
    if (self) {
        _name = name;
        _object = object;
        _userInfo = userInfo;
    }
    return self;
}
@end
