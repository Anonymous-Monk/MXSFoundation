//
//  NSMutableDictionary+RHMutableDictionary.h
//  RHBaseModule
//
//  Created by aicai on 2018/7/9.
//  Copyright © 2018年 aicai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (RHMutableDictionary)

/**
 安全的存储一个键值对
 
 @param object 值
 @param key 键
 */
- (void)rh_setSafeObject:(id)object
                  forKey:(id)key;

/**
 安全的根据一个键获取对应的对象
 
 @param key key
 @return id
 */
- (id)rh_safeObjectForKey:(id)key;

/**
 安全的根据value获取对应的key
 
 @param value id object
 @return id
 */
- (id)rh_safeKeyForValue:(id)value;

@end
