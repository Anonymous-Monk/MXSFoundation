//
//  NSDate+RHDate.m
//  RHBaseModule
//
//  Created by aicai on 2018/7/9.
//  Copyright © 2018年 aicai. All rights reserved.
//

#import "NSDate+RHDate.h"

@implementation NSDate (RHDate)

#pragma mark - 时间戳处理/计算日期
+ (NSString *)rh_compareCureentTimeWithDate:(NSTimeInterval)timeStamp {
    
    NSDate *rh_timeDate = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    
    NSTimeInterval rh_timeInterval = [rh_timeDate timeIntervalSinceNow];
    
    rh_timeInterval = -rh_timeInterval;
    
    NSInteger temp = 0;
    
    NSCalendar *rh_calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSInteger rh_unitFlags  = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *rh_dateComponents = [rh_calendar components:rh_unitFlags
                                                         fromDate:rh_timeDate];
    
    if (rh_timeInterval < 60) {
        
        return [NSString stringWithFormat:@"刚刚"];
        
    } else if((temp = rh_timeInterval / 60) < 60){
        
        return [NSString stringWithFormat:@"%ld分钟前", (long)temp];
        
    } else if((temp = rh_timeInterval / 3600) < 24){
        
        return [NSString stringWithFormat:@"%ld小时前", (long)temp];
        
    } else if ((temp = rh_timeInterval / 3600 / 24) == 1) {
        
        return [NSString stringWithFormat:@"昨天%ld时", (long)rh_dateComponents.hour];
        
    } else if ((temp = rh_timeInterval / 3600 / 24) == 2) {
        
        return [NSString stringWithFormat:@"前天%ld时", (long)rh_dateComponents.hour];
        
    } else if((temp = rh_timeInterval / 3600 / 24) < 31){
        
        return [NSString stringWithFormat:@"%ld天前", (long)temp];
        
    } else if((temp = rh_timeInterval / 3600 / 24 / 30) < 12){
        
        return [NSString stringWithFormat:@"%ld个月前",(long)temp];
        
    } else {
        
        return [NSString stringWithFormat:@"%ld年前", (long)temp / 12];
    }
}

+ (NSString *)rh_getCurrentTimeStamp {
    
    NSDate *rh_cureentDate = [NSDate date];
    
    return [NSString stringWithFormat:@"%ld", (long)[rh_cureentDate timeIntervalSince1970]];
}

+ (NSString *)rh_displayTimeWithTimeStamp:(NSTimeInterval)timeStamp {
    
    NSDate *rh_timeDate = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    
    NSCalendar *rh_calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSInteger rh_unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *rh_dateComponents = [rh_calendar components:rh_unitFlags
                                                         fromDate:rh_timeDate];
    
    NSInteger rh_year   = rh_dateComponents.year;
    NSInteger rh_month  = rh_dateComponents.month;
    NSInteger rh_day    = rh_dateComponents.day;
    NSInteger rh_hour   = rh_dateComponents.hour;
    NSInteger rh_minute = rh_dateComponents.minute;
    
    return [NSString stringWithFormat:@"%ld年%ld月%ld日 %ld:%ld", (long)rh_year, (long)rh_month, (long)rh_day, (long)rh_hour, (long)rh_minute];
}

+ (NSString *)rh_displayTimeWithTimeStamp:(NSTimeInterval)timeStamp
                                formatter:(NSString *)formatter {
    
    if ([NSString stringWithFormat:@"%@", @(timeStamp)].length == 13) {
        
        timeStamp /= 1000.0f;
    }
    
    NSDate *rh_timeDate = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    
    NSDateFormatter *rh_dateFormatter = [[NSDateFormatter alloc] init];
    
    rh_dateFormatter.dateFormat = formatter;
    
    return [rh_dateFormatter stringFromDate:rh_timeDate];
}

+ (NSString *)rh_getDateStringWithDate:(NSDate *)date
                             formatter:(NSString *)formatter {
    
    NSDateFormatter *rh_dateFormatter = [[NSDateFormatter alloc] init];
    
    rh_dateFormatter.dateFormat = formatter;
    
    return [rh_dateFormatter stringFromDate:date];
}

+ (NSString *)rh_calculateDaysWithDate:(NSDate *)date {
    
    NSDate *rh_currentDate = [NSDate date];
    
    NSCalendar *rh_calendar = [NSCalendar autoupdatingCurrentCalendar];
    
    NSDateComponents *comps_today = [rh_calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                                                   fromDate:rh_currentDate];
    NSDateComponents *comps_other = [rh_calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                                                   fromDate:date];
    
    if (comps_today.year == comps_other.year &&
        comps_today.month == comps_other.month &&
        comps_today.day == comps_other.day) {
        
        return @"今天";
        
    } else if (comps_today.year == comps_other.year &&
               comps_today.month == comps_other.month &&
               (comps_today.day - comps_other.day) == -1 ) {
        
        return @"明天";
        
    } else if (comps_today.year == comps_other.year &&
               comps_today.month == comps_other.month &&
               (comps_today.day - comps_other.day) == -2) {
        
        return @"后天";
    }
    
    return @"";
}

#pragma mark - 获取日期
+ (NSUInteger)rh_getEraWithDate:(NSDate *)date {
    
    NSDateComponents *rh_dateComponents = [self rh_getCalendarWithUnitFlags:NSCalendarUnitEra
                                                                       date:date];
    
    return rh_dateComponents.era;
}

+ (NSUInteger)rh_getYearWithDate:(NSDate *)date {
    
    NSDateComponents *rh_dateComponents = [self rh_getCalendarWithUnitFlags:NSCalendarUnitYear
                                                                       date:date];
    
    return rh_dateComponents.year;
}

+ (NSUInteger)rh_getMonthWithDate:(NSDate *)date {
    
    NSDateComponents *rh_dateComponents = [self rh_getCalendarWithUnitFlags:NSCalendarUnitMonth
                                                                       date:date];
    
    return rh_dateComponents.month;
}

+ (NSUInteger)rh_getDayWithDate:(NSDate *)date {
    
    NSDateComponents *rh_dateComponents = [self rh_getCalendarWithUnitFlags:NSCalendarUnitDay
                                                                       date:date];
    
    return rh_dateComponents.day;
}

+ (NSUInteger)rh_getHourWithDate:(NSDate *)date {
    
    NSDateComponents *rh_dateComponents = [self rh_getCalendarWithUnitFlags:NSCalendarUnitHour
                                                                       date:date];
    
    return rh_dateComponents.hour;
}

+ (NSUInteger)rh_getMinuteWithDate:(NSDate *)date {
    
    NSDateComponents *rh_dateComponents = [self rh_getCalendarWithUnitFlags:NSCalendarUnitMinute
                                                                       date:date];
    
    return rh_dateComponents.minute;
}

+ (NSUInteger)rh_getSecondWithDate:(NSDate *)date {
    
    NSDateComponents *rh_dateComponents = [self rh_getCalendarWithUnitFlags:NSCalendarUnitSecond
                                                                       date:date];
    
    return rh_dateComponents.second;
}

+ (NSInteger)rh_getWeekdayStringFromDate:(NSDate *)date {
    
    NSDateComponents *rh_dateComponents = [self rh_getCalendarWithUnitFlags:NSCalendarUnitWeekday
                                                                       date:date];
    
    return rh_dateComponents.weekday;
}

+ (NSInteger)rh_getDateTimeDifferenceWithBeginDate:(NSDate *)beginDate
                                           endDate:(NSDate *)endDate {
    
    NSCalendar *rh_calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *rh_dateComponents = [rh_calendar components:NSCalendarUnitDay
                                                         fromDate:beginDate
                                                           toDate:endDate
                                                          options:0];
    
    return rh_dateComponents.day;
}

+ (NSDate *)rh_getMonthFirstDeteWithDate:(NSDate *)date {
    
    return [self rh_getDaysDateWithDate:date
                                   days:-[self rh_getDayWithDate:date] + 1];
}

+ (NSDate *)rh_getMonthLastDayWithDate:(NSDate *)date {
    
    NSDate *rh_firstDate = [self rh_getMonthFirstDeteWithDate:date];
    NSDate *rh_monthDate = [self rh_getMonthDateWithDate:rh_firstDate
                                                  months:1];
    return [self rh_getDaysDateWithDate:rh_monthDate
                                   days:-1];
}

+ (NSUInteger)rh_getWeekOfYearWithDate:(NSDate *)date {
    
    NSUInteger rh_week = 1;
    NSUInteger rh_year = [self rh_getYearWithDate:date];
    
    NSDate *rh_lastDate = [self rh_getMonthLastDayWithDate:date];
    
    while ([self rh_getYearWithDate:[self rh_getDaysDateWithDate:rh_lastDate
                                                            days:-7 * rh_week]] == rh_year) {
        rh_week++;
    };
    
    return rh_week;
}

+ (NSDate *)rh_getTomorrowDay:(NSDate *)date {
    
    NSCalendar *rh_calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *rh_dateComponents = [rh_calendar components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
                                                         fromDate:date];
    
    rh_dateComponents.day = rh_dateComponents.day + 1;
    
    return [rh_calendar dateFromComponents:rh_dateComponents];
}

+ (NSDate *)rh_getYearDateWithDate:(NSDate *)date
                             years:(NSInteger)years {
    
    NSCalendar *rh_calendar = [NSCalendar autoupdatingCurrentCalendar];
    
    NSDateComponents *rh_dateComponents = [[NSDateComponents alloc] init];
    
    rh_dateComponents.year = years;
    
    return [rh_calendar dateByAddingComponents:rh_dateComponents
                                        toDate:date
                                       options:0];
}

+ (NSDate *)rh_getMonthDateWithDate:(NSDate *)date
                             months:(NSInteger)months {
    
    
    NSDateComponents *rh_dateComponents = [[NSDateComponents alloc] init];
    
    rh_dateComponents.month = months;
    
    return [self rh_getDateWithDateComponents:rh_dateComponents
                                         date:date];
}

+ (NSDate *)rh_getDaysDateWithDate:(NSDate *)date
                              days:(NSInteger)days {
    
    NSDateComponents *rh_dateComponents = [[NSDateComponents alloc] init];
    
    rh_dateComponents.day = days;
    
    return [self rh_getDateWithDateComponents:rh_dateComponents
                                         date:date];
}

+ (NSDate *)rh_getHoursDateWithDate:(NSDate *)date
                              hours:(NSInteger)hours {
    
    NSDateComponents *rh_dateComponents = [[NSDateComponents alloc] init];
    
    rh_dateComponents.hour = hours;
    
    return [self rh_getDateWithDateComponents:rh_dateComponents
                                         date:date];
}

+ (NSDate *)rh_getDateWithDateComponents:(NSDateComponents *)dateComponents
                                    date:(NSDate *)date {
    
    NSCalendar *rh_calendar = [NSCalendar autoupdatingCurrentCalendar];
    
    return [rh_calendar dateByAddingComponents:dateComponents
                                        toDate:date
                                       options:0];
}

#pragma mark - 日期判断
+ (BOOL)rh_isLeapYear:(NSDate *)date {
    
    NSUInteger rh_year = [self rh_getYearWithDate:date];
    
    return ((rh_year % 4 == 0) && (rh_year % 100 != 0)) || (rh_year % 400 == 0);
}

+ (BOOL)rh_checkTodayWithDate:(NSDate *)date {
    
    NSInteger rh_calendarUnit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    
    NSDateComponents *rh_dateComponents = [self rh_getCalendarWithUnitFlags:rh_calendarUnit
                                                                       date:date];
    
    NSDateComponents *rh_currentDateComponents = [self rh_getCalendarWithUnitFlags:rh_calendarUnit
                                                                              date:[NSDate date]];
    
    return (rh_currentDateComponents.year == rh_dateComponents.year) &&
    (rh_currentDateComponents.month == rh_dateComponents.month) &&
    (rh_currentDateComponents.day == rh_dateComponents.day);
}


#pragma mark - 获取NSDateComponents
+ (NSDateComponents *)rh_getCalendarWithUnitFlags:(NSCalendarUnit)unitFlags
                                             date:(NSDate *)date {
    
    NSCalendar *rh_calendar = [NSCalendar autoupdatingCurrentCalendar];
    
    return [rh_calendar components:unitFlags
                          fromDate:date];
}

@end
