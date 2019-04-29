//
//  DeviceInfo.h
//  X-Faker
//
//  Created by whois on 2018/12/20.
//  Copyright © 2018年 whois. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WIM_DeviceInfo : NSObject
+ (instancetype)sharedInstance;

+ (double)deviceScreenHeight;
+ (double)deviceScreenWith;
+ (_Bool)isIphone;
+ (int)systemVersion_big;
+ (float)systemVersion;

@end
