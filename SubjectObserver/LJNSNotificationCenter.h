//
//  LJNSNotificationCenter.h
//  SubjectObserver
//
//  Created by liangjie on 2016/12/22.
//  Copyright © 2016年 liangjie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJNSNotification : NSObject
@property (readonly, copy) NSNotificationName name;
@property (readonly, retain) id object;
@property (readonly, copy) NSDictionary *userInfo;
- (instancetype)initWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo;
@end

@interface LJNSNotificationCenter : NSObject
+ (instancetype)defaultCenter;
- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject;
- (void)postNotificationName:(NSString *)aName object:(id)anObject;
@end
