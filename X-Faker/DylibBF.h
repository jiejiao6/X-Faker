//
//  DylibBF.h
//  X-Faker
//
//  Created by whois on 2018/12/22.
//  Copyright © 2018年 whois. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DylibBF : NSObject


@property(nonatomic,retain) id BirdFakerUtils;
@property(nonatomic,retain) id DateUtil;
@property(nonatomic,retain) id Constants;
@property(nonatomic,retain) id BrowseAllInstalledApplication;
@property(nonatomic,retain) id DeviceInfo;
@property(nonatomic,retain) id SSCheckBoxView;
@property(nonatomic,retain) id MainViewController;
@property(nonatomic,retain) id MasterViewController;


- (instancetype)init;
@end
