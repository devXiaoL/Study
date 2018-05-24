//
//  XLCreateRandom.h
//  Study
//
//  Created by lanbao on 2018/3/27.
//  Copyright © 2018年 lanbao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XLCreateRandom : NSObject

/**
 生成一组不重复的随机数 （随机数的个数为 最大数-最小数）
 
 @param min 组内最小的数
 @param max 组内最大的数
 @return 不重复的随机数组
 */
- (NSArray *)randomValuesWithMinNum:(NSInteger)min maxNum:(NSInteger )max;

@end
