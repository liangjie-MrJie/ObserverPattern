//
//  NotifyDataObject.h
//  SubjectObserver
//
//  Created by liangjie on 2016/12/20.
//  Copyright © 2016年 liangjie. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 对通知数据的封装
 */
@interface NotifyDataObject : NSObject
@property (nonatomic, strong, readonly) NSString *described;
@property (nonatomic, strong, readonly) NSString *extentWord;
- (instancetype)initWithDescribed:(NSString *)describe;
@end
