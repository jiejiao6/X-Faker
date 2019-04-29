//
//  BirdFakerUtils.m
//  X-Faker
//
//  Created by whois on 2018/12/16.
//  Copyright © 2018年 whois. All rights reserved.
//

#import "BirdFakerUtils.h"

@implementation WIM_BirdFakerUtils


+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static WIM_BirdFakerUtils *dUtil = nil;
    dispatch_once(&onceToken, ^{
        dUtil = [[WIM_BirdFakerUtils alloc] init];
    });
    
    return dUtil;
}

-(NSString *) getValueByBundleIdAndKey:(NSString *)bundleID key:(id)a4 choosedAppInfoDictionary:(NSDictionary *)Dict{
    NSString * retStr =[[NSString alloc] init];
    
    for (NSDictionary* item in Dict) {
       NSString *bundleidStr = [item objectForKey:@"bundleid"];
        if ([bundleidStr isEqualToString:bundleID]) {
            NSString *keyStr =[item objectForKey:a4];
            if (keyStr) {
                retStr = keyStr;
            }
        }
    }
    return retStr;
}

@end
