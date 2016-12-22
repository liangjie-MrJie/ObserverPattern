//
//  ObserverProtocol.h
//  SubjectObserver
//
//  Created by liangjie on 2016/12/20.
//  Copyright © 2016年 liangjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NotifyDataObject.h"

@protocol Subject;
@protocol Observer <NSObject>
- (void)update:(id<Subject>)subject notifyData:(id)descripte;

@end
