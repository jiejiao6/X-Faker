//
//  DylibBF.m
//  X-Faker
//
//  Created by whois on 2018/12/22.
//  Copyright © 2018年 whois. All rights reserved.
//

#import "DylibBF.h"

@implementation DylibBF



-(instancetype)init{
    self = [super init];
    if (self) {
        _BrowseAllInstalledApplication  = NSClassFromString(@"BrowseAllInstalledApplication");
        _Constants = NSClassFromString(@"Constants");
        _DateUtil = NSClassFromString(@"DateUtil");
        _BirdFakerUtils = NSClassFromString(@"BirdFakerUtils");
        _DeviceInfo = NSClassFromString(@"DeviceInfo");
        _SSCheckBoxView = NSClassFromString(@"SSCheckBoxView");
        _MainViewController =NSClassFromString(@"MainViewController");
        _MasterViewController = NSClassFromString(@"MasterViewController");
    }
    return self;
}

@end
