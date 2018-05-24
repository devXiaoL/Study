//
//  XLCreateRandom.m
//  Study
//
//  Created by lanbao on 2018/3/27.
//  Copyright © 2018年 lanbao. All rights reserved.
//

#import "XLCreateRandom.h"

@implementation XLCreateRandom


- (NSArray *)randomValuesWithMinNum:(NSInteger)min maxNum:(NSInteger )max{
    
    NSInteger count = max - min + 1;
    NSMutableArray <NSNumber *>*randomValues = [NSMutableArray array];
    //保存随机数
    NSInteger value;
    
    for (int i = 0; i < count; i++) {
        do {
            value = arc4random() % (max-min+1) + min;
        } while ([randomValues containsObject:[NSNumber numberWithInteger:value]]);
        
        [randomValues addObject:[NSNumber numberWithInteger:value]];
    }
    return randomValues;
}

@end
