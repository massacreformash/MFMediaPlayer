//
//  NSArray+Sort.h
//  StudentLive
//
//  Created by hefanghui on 2016/11/10.
//  Copyright © 2016年 hqyxedu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Sort)

- (NSArray *)sortWithKeyToInt:(NSString *)key ascending:(BOOL)ascending;
- (NSArray *)sortWithKeyArrayToInt:(NSArray *)keyArray ascending:(BOOL)ascending;

@end
