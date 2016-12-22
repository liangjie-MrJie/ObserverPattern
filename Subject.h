//
//  SubjectProtocol.h
//  SubjectObserver
//
//  Created by liangjie on 2016/12/20.
//  Copyright © 2016年 liangjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Observer.h"
#import "NotifyDataObject.h"

@protocol Subject <NSObject>
@property (nonatomic, readonly) BOOL isChanged;
- (void)registerObserver:(id<Observer>)observer;
- (void)removeObserver:(id<Observer>)observer;
- (void)notifyObservers;
@end
