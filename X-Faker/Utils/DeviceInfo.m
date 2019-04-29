//
//  DeviceInfo.m
//  X-Faker
//
//  Created by whois on 2018/12/20.
//  Copyright © 2018年 whois. All rights reserved.
//

#import "DeviceInfo.h"

@implementation WIM_DeviceInfo


+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static WIM_DeviceInfo *dUtil = nil;
    dispatch_once(&onceToken, ^{
        dUtil = [[WIM_DeviceInfo alloc] init];
    });
    
    return dUtil;
}


@end
