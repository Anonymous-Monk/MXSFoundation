//
//  NSBundle+RHBundle.m
//  RHBaseModule
//
//  Created by aicai on 2018/7/9.
//  Copyright © 2018年 aicai. All rights reserved.
//

#import "NSBundle+RHBundle.h"

@implementation NSBundle (RHBundle)

+ (NSString *)rh_getBundleDisplayName {
    
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

+ (NSString *)rh_getBundleShortVersionString {
    
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)rh_getBundleVersion {
    
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

+ (NSString *)rh_getBundleIdentifier {
    
    return [[NSBundle mainBundle] bundleIdentifier];
}

@end
