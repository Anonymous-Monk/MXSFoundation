//
//  NSDictionary+RHDictionary.h
//  RHBaseModule
//
//  Created by aicai on 2018/7/9.
//  Copyright © 2018年 aicai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (RHDictionary)

/**
 将指定的URL字符串转成NSDictionary
 
 @param urlString URL字符串, 格式: http://www.xxxx.com?a=1&b=2 || a=1&b=2
 @return NSDictionary
 */
+ (NSDictionary *)rh_dictionaryWithURLString:(NSString *)urlString;

@end
