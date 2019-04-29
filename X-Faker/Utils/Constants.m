//
//  Constants.m
//  X-Faker
//
//  Created by whois on 2018/12/17.
//  Copyright © 2018年 whois. All rights reserved.
//

#import "Constants.h"
#import "EncryptUtil.h"

@implementation WIM_Constants :NSObject

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static WIM_Constants *dUtil = nil;
    dispatch_once(&onceToken, ^{
        dUtil = [[WIM_Constants alloc] init];
    });
    
    return dUtil;
}

//日志记录
+ (void)vPzKgkkueCdlQoMz:(NSString *)arg1{
    
    return;
}
+ (NSString *) FSLUMfjGywFpHmle{

    return @"http://www.taobaoer.cc/forgeManage/mobile/";

}
+ (NSString *) FVsaeZLIAOUOenvc{
    return [EncryptUtil1 vHCspdGrJYjXlaGh:@"AGgBM35AzmftIjky+tB16wEON/3lUNNkzYSPuOle1v9ucxiZbfoRn7s6YeWmQrkZ"];
}
+ (NSString *) cWcERBwbrvyPMjDy
{
    return [EncryptUtil1 vHCspdGrJYjXlaGh:@"AGgBM35AzmftIjky+tB16wEON/3lUNNkzYSPuOle1v9ucxiZbfoRn1Bskn5+tLH9ymM7uvZ6aj0="];
}
+ (NSString *) qxrnrEEOKZPjKpQh
{
    return [EncryptUtil1 vHCspdGrJYjXlaGh:@"AGgBM35AzmftIjky+tB16wEON/3lUNNkzYSPuOle1v9ucxiZbfoRn1abDAmAq5GQVQhuqsNWezoo3c1j4JGOjjoBCLFHMuO7QAjBEsEe7P0="];
}

+ (NSString *) getBirdFaker_randomParams_setting_path
{
    return [EncryptUtil1 vHCspdGrJYjXlaGh:@"AGgBM35AzmftIjky+tB16wEON/3lUNNkzYSPuOle1v9ucxiZbfoRn1abDAmAq5GQSCjdAAslvrrrGrUM5b7xNgiyVWLMeKFM"];
}

+ (NSString *) RewuEHyIVVNKhqFS
{
    return [EncryptUtil1 vHCspdGrJYjXlaGh:@"AGgBM35AzmftIjky+tB16wEON/3lUNNkzYSPuOle1v9ucxiZbfoRn1abDAmAq5GQNXZkVvADtAtYrO1Y7IA9WnNM+zwJf6cJ"];
}
+ (NSString *) getBirdFaker_NeedBackup_BundleIds_File_Path
{
    return [EncryptUtil1 vHCspdGrJYjXlaGh:@"AGgBM35AzmftIjky+tB16wEON/3lUNNkzYSPuOle1v9ucxiZbfoRn1Bskn5+tLH9LwdZ5b/QSc992Ereyo83vw=="];
}
            
+ (NSString *) getTempPlistPath
{
    return [EncryptUtil1 vHCspdGrJYjXlaGh:@"AGgBM35AzmftIjky+tB16wEON/3lUNNkzYSPuOle1v9ucxiZbfoRn8HA4veXqyVdbrithb4jaY0="];
}

+ (NSString *)wx62dataImportPath
{
    return [EncryptUtil1 vHCspdGrJYjXlaGh:@"AGgBM35AzmftIjky+tB16wEON/3lUNNkzYSPuOle1v9ucxiZbfoRn5zMtaFvDWBO7qygz8f5ocUh2AVXzK5rvw=="];
}
+ (NSString *)wx62dataOutputPath
{
    return [EncryptUtil1 vHCspdGrJYjXlaGh:@"AGgBM35AzmftIjky+tB16wEON/3lUNNkzYSPuOle1v9ucxiZbfoRn5zMtaFvDWBO7qygz8f5ocUtWf/jhf7Eaw=="];
}
+ (NSString *)accountCachePath
{
    return [EncryptUtil1 vHCspdGrJYjXlaGh:@"AGgBM35AzmftIjky+tB16wEON/3lUNNkzYSPuOle1v9ucxiZbfoRn4gUUVMWmBlA4UtIlS6n+gkmirEKGc98Ew=="];
}


+ (void)deleteBirdFakerResultFile
{
    NSFileManager *v2 =nil; // x0
    
    v2 = [NSFileManager defaultManager];
    [v2 removeItemAtPath:@"/var/mobile/Library/Preferences/BirdFaker/BirdFakerResult.plist" error:0];
}
+ (void)writeToBirdFakerResultFile: (NSString *)a3
{
    id v3; // x19
    __int64 v4; // x22
    id v6; // x20
    
    v3 = a3;
    NSMutableDictionary *v5 = [[NSMutableDictionary alloc ]init];
    [v5 setObject:a3 forKey:@"result"];
    [v5 writeToFile:@"/var/mobile/Library/Preferences/BirdFaker/BirdFakerResult.plist" atomically:NO];
}

+ (NSString *)locationHistoryPath
{
    //objc_retainAutorelease(@"/var/mobile/Library/Preferences/BirdFaker/locationHistory.plist")];
    return (id)@"/var/mobile/Library/Preferences/BirdFaker/locationHistory.plist";
}

+ (NSString *)randomJixingIphoneIOSOtherPath
{
    //objc_retainAutorelease(@"/var/mobile/Library/Preferences/BirdFaker/randomJixingIphoneOther.plist")];
    return (id)@"/var/mobile/Library/Preferences/BirdFaker/randomJixingIphoneOther.plist";
}

+ (NSString *)randomJixingIphoneIOS8Path
{
    //objc_retainAutorelease(@"/var/mobile/Library/Preferences/BirdFaker/randomJixingIphoneIOS8.plist")];
    return (id)@"/var/mobile/Library/Preferences/BirdFaker/randomJixingIphoneIOS8.plist";
}
+ (NSString *)randomJixingIpadPath
{
    //objc_retainAutorelease(@"/var/mobile/Library/Preferences/BirdFaker/randomJixingIpad.plist")];
    return (id)@"/var/mobile/Library/Preferences/BirdFaker/randomJixingIpad.plist";
}
+ (NSString *)randomJixingItouchPath
{
    //objc_retainAutorelease(@"/var/mobile/Library/Preferences/BirdFaker/randomJixingItouch.plist")];
    return (id)@"/var/mobile/Library/Preferences/BirdFaker/randomJixingItouch.plist";
}
+ (NSString *)getCustomSysVersionsPath
{
    //objc_retainAutorelease(@"/var/mobile/Library/Preferences/BirdFaker/customSysVersions.plist")];
    return (id)@"/var/mobile/Library/Preferences/BirdFaker/customSysVersions.plist";
}

+ (NSString *)getCustomJixingPath
{
    //objc_retainAutorelease(@"/var/mobile/Library/Preferences/BirdFaker/customJixing.plist")];
    return (id)@"/var/mobile/Library/Preferences/BirdFaker/customJixing.plist";
}

@end
