//
//  FileHelper.m
//  X-Faker
//
//  Created by whois on 2018/12/19.
//  Copyright © 2018年 whois. All rights reserved.
//

#import "FileHelper.h"

@implementation WIM_FileHelper


+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static WIM_FileHelper *dUtil = nil;
    dispatch_once(&onceToken, ^{
        dUtil = [[WIM_FileHelper alloc] init];
    });
    
    return dUtil;
}


- (_Bool)isDirectoryExit:(NSString *)arg1{
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL *isDiret  = nil;
    BOOL ret =[fm fileExistsAtPath:arg1 isDirectory:isDiret];
    return  ret & (isDiret != 0);
}
@end
