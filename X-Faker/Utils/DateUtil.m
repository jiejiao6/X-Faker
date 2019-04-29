//
//  DateUtil.m
//  X-Faker
//
//  Created by whois on 2018/12/16.
//  Copyright © 2018年 whois. All rights reserved.
//

#import "DateUtil.h"

@implementation WIM_DateUtil



+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static WIM_DateUtil *dUtil = nil;
    dispatch_once(&onceToken, ^{
        dUtil = [[WIM_DateUtil alloc] init];
    });
    
    return dUtil;
}


- (NSString *)getNowDateStr{
    NSDateFormatter *dtF = [[NSDateFormatter alloc] init];
    [dtF setDateFormat:@"YYYY-MM-dd-HH-mm-ss"];
    return [dtF stringFromDate:[NSDate date]];
}

- (NSString *)getNowDateStr3{
    NSDateFormatter *dtF = [[NSDateFormatter alloc] init];
    [dtF setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    return [dtF stringFromDate:[NSDate date]];
}
- (NSDate *)dateWithString:(NSString *)arg1{
    NSDateFormatter *dtF = [[NSDateFormatter alloc] init];
    [dtF setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dtF dateFromString:arg1];
}



@end
