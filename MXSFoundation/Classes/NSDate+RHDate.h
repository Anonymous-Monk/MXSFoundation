//
//  NSDate+RHDate.h
//  RHBaseModule
//
//  Created by aicai on 2018/7/9.
//  Copyright © 2018年 aicai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (RHDate)

#pragma mark - 时间戳处理/计算日期
/**
 通过时间戳计算出与当前时间差
 
 @param timeStamp 时间戳
 @return 与当前时间的差距, 比如一天前
 */
+ (NSString *)rh_compareCureentTimeWithDate:(NSTimeInterval)timeStamp;

/**
 把当前时间转换成时间戳
 
 @return 时间戳
 */
+ (NSString *)rh_getCurrentTimeStamp;

/**
 通过传入的时间戳算出年月日
 
 @param timeStamp 时间戳
 @return 年月日, 默认格式xxxx年xx月xx日
 */
+ (NSString *)rh_displayTimeWithTimeStamp:(NSTimeInterval)timeStamp;


/**
 通过传入的时间戳和日期格式算出年月日
 
 @param timeStamp 时间戳
 @param formatter 时间显示格式
 @return 年月日
 */
+ (NSString *)rh_displayTimeWithTimeStamp:(NSTimeInterval)timeStamp
                                formatter:(NSString *)formatter;

/**
 获取指定NSDate的字符串日期
 
 @param date NSDate
 @param formatter NSString
 @return NSString
 */
+ (NSString *)rh_getDateStringWithDate:(NSDate *)date
                             formatter:(NSString *)formatter;

/**
 通过传入的NSDate计算出是今天/明天/后天
 
 @param date NSDate
 @return 今天/明天/后天
 */
+ (NSString *)rh_calculateDaysWithDate:(NSDate *)date;

#pragma mark - 日期处理
/**
 获取指定NSDate的纪元
 
 @param date NSDate
 @return NSUInteger
 */
+ (NSUInteger)rh_getEraWithDate:(NSDate *)date;

/**
 获取指定NSDate的年
 
 @param date NSDate
 @return NSUInteger
 */
+ (NSUInteger)rh_getYearWithDate:(NSDate *)date;

/**
 获取指定NSDate的月
 
 @param date NSDate
 @return NSUInteger
 */
+ (NSUInteger)rh_getMonthWithDate:(NSDate *)date;

/**
 获取指定NSDate的天
 
 @param date NSDate
 @return NSUInteger
 */
+ (NSUInteger)rh_getDayWithDate:(NSDate *)date;

/**
 获取指定NSDate的时
 
 @param date NSDate
 @return NSUInteger
 */
+ (NSUInteger)rh_getHourWithDate:(NSDate *)date;

/**
 获取指定NSDate的分
 
 @param date NSDate
 @return NSUInteger
 */
+ (NSUInteger)rh_getMinuteWithDate:(NSDate *)date;

/**
 获取指定NSDate的秒
 
 @param date NSDate
 @return NSUInteger
 */
+ (NSUInteger)rh_getSecondWithDate:(NSDate *)date;

/**
 获取指定NSDate的星期几, PS: 1代表的是周日, 2代表的是周一, 以此类推
 
 @param date NSDate
 @return NSInteger
 */
+ (NSInteger)rh_getWeekdayStringFromDate:(NSDate *)date;

/**
 通过传入两组时间, 计算出相差的天数
 
 @param beginDate 开始的时间
 @param endDate 结束的时间
 @return return NSInteger
 */
+ (NSInteger)rh_getDateTimeDifferenceWithBeginDate:(NSDate *)beginDate
                                           endDate:(NSDate *)endDate;

/**
 获取指定NSDate的每月第一天的日期
 
 @param date NSDate
 @return NSDate
 */
+ (NSDate *)rh_getMonthFirstDeteWithDate:(NSDate *)date;

/**
 获取指定NSDate的每月最后一天的日期
 
 @param date NSDate
 @return NSDate
 */
+ (NSDate *)rh_getMonthLastDayWithDate:(NSDate *)date;

/**
 获取指定日期在一年中是第几周
 
 @param date NSDate
 @return NSUInteger
 */
+ (NSUInteger)rh_getWeekOfYearWithDate:(NSDate *)date;

/**
 通过传入指定的时间获取第二天的日期
 
 @param date NSDate
 @return NSDate
 */
+ (NSDate *)rh_getTomorrowDay:(NSDate *)date;

/**
 获取指定NSDate第years年后的日期
 
 @param date NSDate
 @param years NSInteger, 多少年
 @return NSDate
 */
+ (NSDate *)rh_getYearDateWithDate:(NSDate *)date
                             years:(NSInteger)years;

/**
 获取指定NSDate第months月后的日期
 
 @param date NSDate
 @param months NSInteger, 多少月
 @return NSDate
 */
+ (NSDate *)rh_getMonthDateWithDate:(NSDate *)date
                             months:(NSInteger)months;
/**
 获取指定NSDate第days天后的日期
 
 @param date NSDate
 @param days NSInteger, 多少天
 @return NSDate
 */
+ (NSDate *)rh_getDaysDateWithDate:(NSDate *)date
                              days:(NSInteger)days;

/**
 获取指定NSDate第hours时后的日期
 
 @param date NSDate
 @param hours NSInteger, 多少小时
 @return NSDate
 */
+ (NSDate *)rh_getHoursDateWithDate:(NSDate *)date
                              hours:(NSInteger)hours;

#pragma mark - 日期判断
/**
 判断传入的NSDate是否是闰年
 
 @param date NSDate
 @return BOOL
 */
+ (BOOL)rh_isLeapYear:(NSDate *)date;

/**
 传入指定的时间判断是否为今天
 
 @param date 指定时间
 @return BOOL
 */
+ (BOOL)rh_checkTodayWithDate:(NSDate *)date;

#pragma mark - 获取NSDateComponents
/**
 获取指定NSCalendarUnit和指定NSDate的NSDateComponents
 
 @param unitFlags NSCalendarUnit
 @param date NSDate
 @return NSDateComponents
 */
+ (NSDateComponents *)rh_getCalendarWithUnitFlags:(NSCalendarUnit)unitFlags
                                             date:(NSDate *)date;

@end
