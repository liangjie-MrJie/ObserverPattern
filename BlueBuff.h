//
//  BlueBuff.h
//  SubjectObserver
//
//  Created by liangjie on 2016/12/20.
//  Copyright © 2016年 liangjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Subject.h"

@interface BlueBuff : NSObject <Subject>
- (void)attackOn:(NSString *)name;
- (NSString *)fetchDescribe;
@end

