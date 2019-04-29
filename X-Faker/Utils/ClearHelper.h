//
//  ClearHelper.h
//  X-Faker
//
//  Created by whois on 2018/12/19.
//  Copyright © 2018年 whois. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/NSObject.h>

@class NSMutableDictionary, NSString;

__attribute__((visibility("hidden")))
@interface WIM_ClearHelper : NSObject
{
    NSString *_app_name_path;
    NSString *_app_bundle_path;
    NSString *_locationName;
    NSMutableDictionary *_randomParams_settingDic;
}

@property(retain) NSMutableDictionary *randomParams_settingDic; // @synthesize randomParams_settingDic=_randomParams_settingDic;
@property(retain) NSString *locationName; // @synthesize locationName=_locationName;
@property(retain) NSString *app_bundle_path; // @synthesize app_bundle_path=_app_bundle_path;
@property(retain) NSString *app_name_path; // @synthesize app_name_path=_app_name_path;
+ (instancetype)sharedInstance;
- (void)killTwoProcess;

- (void)NgLoxniRqLHaNHYP:(id)arg1;
- (_Bool)sHdldTyHrAxoBNSy:(id)arg1;
- (_Bool)GsHtzXCukAVZeLcX:(id)arg1 choosedAppInfoDictionary:(id)arg2;
- (_Bool)cySkXEGcEKKBddWD:(id)arg1 fileManager:(id)arg2 dontEmptyFilesNames:(id)arg3;
- (_Bool)YnMVSxfsrGhtrwZX:(id)arg1;
- (_Bool)WjxVHZUXTgBMgluQ:(id)arg1 desPath:(id)arg2;
- (_Bool)qKAOSYaKkecEhTdI:(id)arg1 desPath:(id)arg2;
- (_Bool)tgkMKPgoieoBkaod:(id)arg1 desPath:(id)arg2;
- (id)runningProcesses;
- (_Bool)DmTfTYUCvovwIPtn:(id)arg1;
- (id)IBDhdkZJhzdIaBCP:(id)arg1;
- (id)ytqiIpjsnYDTtQmS:(id)arg1;
- (_Bool)isBlankString:(id)arg1;
- (_Bool)RIqrFuKwaXxJLLfN:(id)arg1 sri:(id)arg2 udid:(id)arg3 nickNameStr:(id)arg4 macStr:(id)arg5 paramsFileNameNosubfix:(id)arg6;
- (_Bool)ReCSdpHRwXajRFdI:(id)arg1 sri:(id)arg2 udid:(id)arg3 nickNameStr:(id)arg4 macStr:(id)arg5 paramsFileNameNosubfix:(id)arg6;
- (void)doData:(int)arg1 olddic:(id)arg2 key:(id)arg3 stmt:(struct sqlite3_stmt *)arg4;
- (_Bool)tWsyCHNbxFlbemzy:(id)arg1 desFilePath:(id)arg2;
- (void)IqKgHntmRsLOdDIU;
- (void)customer_delete_filePath;
- (_Bool)mergeKeycahinWal;
- (_Bool)jcJRupGkSfglqpsq:(id)arg1;
- (_Bool)UEeNqhfOadFyBVbf;
- (_Bool)wCUmjbqCbeZMgjzm;
- (_Bool)kwFIVJZcDowWYVeM:(NSString *)path fileManager:(NSFileManager *)fm;
- (void)SYkPrjucPyUwXjbY;
- (NSMutableArray *)kJOafYNkORgfdIkj:(NSString *)arg1;
- (float)mhvQjzcEHXGpLfMs:(id)arg1;
- (long long)NdLcFYIKNEBsCbiM:(id)arg1;
- (_Bool)moveDirToOtherPlace:(id)arg1 desPath:(id)arg2 isMustMove:(_Bool)arg3;
- (_Bool)backupOneAppInfoByCopy:(id)arg1 bundleId:(id)arg2 choosedAppInfoDictionary:(id)arg3 backup_appGroupPath:(id)arg4 backup_appPath:(id)arg5;
- (_Bool)vMEasOSLcpHLrLob:(id)arg1 bundleId:(id)arg2 choosedAppInfoDictionary:(id)arg3 backup_appGroupPath:(id)arg4 backup_appPath:(id)arg5;
- (_Bool)xeZJIASwklrlVJDP:(id)arg1 backup_appPath:(id)arg2 choosedAPPBundlesArray:(id)arg3 plistPath:(id)arg4 plistDict:(id)arg5;
- (void)vPzKgkkueCdlQoMz:(id)arg1;
- (_Bool)KPTpwOKWlOEnhhEC;
- (_Bool)HapxwEsqsEKhoyCN;
- (_Bool)wIHOHydDoolvxrdD:(id)arg1 owner:(id)arg2 ownerGroup:(id)arg3;
- (_Bool)KTyKvIYAPWBLFrZa:(id)arg1;

//清理cookie
- (_Bool)sJFoURBOtHmrutgZ;
- (_Bool)OmwiUsMqcZqCHiUo;
- (_Bool)rFVarJnvgiBZajpg:(id)arg1;

@end

