//
//  ClearHelper.m
//  X-Faker
//
//  Created by whois on 2018/12/19.
//  Copyright © 2018年 whois. All rights reserved.
//

#import "ClearHelper.h"

@implementation WIM_ClearHelper



+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static WIM_ClearHelper *dUtil = nil;
    dispatch_once(&onceToken, ^{
        //dUtil = [[WIM_ClearHelper alloc] init];
        dUtil = NSClassFromString(@"ClearHelper");
    });
    
    return dUtil;
}

//- (NSMutableArray *)kJOafYNkORgfdIkj:(NSString *)arg1{
//    NSFileManager *fm =[NSFileManager defaultManager];
//    NSMutableArray *mArr = [[NSMutableArray alloc] initWithArray:[fm contentsOfDirectoryAtPath:arg1 error:nil]];
//    return mArr;
//}
//
//- (void)NgLoxniRqLHaNHYP:(id)arg1{
//    NSString *str_v1 =[WIM_Constants qxrnrEEOKZPjKpQh];
//    NSDictionary *dict_v1 =[[NSDictionary alloc] initWithContentsOfFile:str_v1];
//    [WIM_Constants vPzKgkkueCdlQoMz:@"清理cookie...."];
//    if (dict_v1) {
//        NSString *str_v2 = [dict_v1 objectForKey:@"clearsafari"];
//        if (str_v2) {
//            if ([str_v2 isEqualToString:@"YES"]) {
//                [self sJFoURBOtHmrutgZ];  //
//            }
//        }
//    }
//    [self wCUmjbqCbeZMgjzm];
//    [WIM_Constants vPzKgkkueCdlQoMz:@"清理pastboard....."];
//    if (dict_v1) {
//        NSString *str_v2 = [dict_v1 objectForKey:@"cleanpastboard"];
//        if (str_v2) {
//            if ([str_v2 isEqualToString:@"YES"]) {
//                [self UEeNqhfOadFyBVbf];
//            }
//        }
//    }
//    [WIM_Constants vPzKgkkueCdlQoMz:@"清理keychain....."];
//    [self jcJRupGkSfglqpsq:arg1];
//    
//}
//
//- (_Bool)sJFoURBOtHmrutgZ{
//    [self OmwiUsMqcZqCHiUo];
//    NSFileManager *fm =[NSFileManager defaultManager];
//    int sysVer = [WIM_DeviceInfo systemVersion_big];
//    if ((unsigned int)(sysVer-8)<3){
//        [self kwFIVJZcDowWYVeM:@"/var/mobile/Library/Caches/com.apple.mobilesafari" fileManager:fm];
//        [self kwFIVJZcDowWYVeM:@"/var/mobile/Library/Caches/Safari" fileManager:fm];
//        [self kwFIVJZcDowWYVeM:@"/var/mobile/Library/Safari" fileManager:fm];
//        [self kwFIVJZcDowWYVeM:@"/var/mobile/Library/WebKit" fileManager:fm];
//        //system("rm /var/mobile/Library/Safari/History.plist");
//        //system("rm /var/mobile/Library/Safari/SuspendState.plist");
//        run_cmd("rm /var/mobile/Library/Safari/History.plist");
//        run_cmd("rm /var/mobile/Library/Safari/SuspendState.plist");
//        NSString *str_v1 =[[NSString alloc] init];
//        NSArray *Arr_v1 = [WIM_BrowseAllInstalledApplication browseInstalledAppLisWithSystemApp];
//        for (NSDictionary *item in Arr_v1) {
//            NSString *str_v2 = [item objectForKey:@"bundleid"];
//            if (str_v2 && [str_v2 isEqualToString:@"com.apple.mobilesafari"]) {
//                NSString *str_v3 = [[item objectForKey:@"appStoreReceiptURL"] absoluteString];
//                NSArray *arr_v2 = [str_v3 componentsSeparatedByString:@"/private"];
//                NSString *str_v4 = [arr_v2 objectAtIndexedSubscript:1];
//                NSArray *arr_v3 = [str_v4 componentsSeparatedByString:@"/StoreKit/"];
//                str_v1 =[arr_v3 objectAtIndexedSubscript:0];
//            }
//        }
//        if (str_v1 && [str_v1 length]) {
//            NSString *str_l1 = [str_v1 stringByAppendingString:@"/Library"];
//            [self kwFIVJZcDowWYVeM:str_l1 fileManager:fm];
//            NSString *str_l2 = [str_v1 stringByAppendingString:@"/Documents"];
//            [self kwFIVJZcDowWYVeM:str_l1 fileManager:fm];
//            NSString *str_l3 = [str_v1 stringByAppendingString:@"/tmp"];
//            [self kwFIVJZcDowWYVeM:str_l1 fileManager:fm];
//        }
//
//    }
//    if (sysVer == 7) {
//        [fm removeItemAtPath:@"/var/mobile/Library/Safari/History.plist" error:nil];
//        [fm removeItemAtPath:@"/var/mobile/Library/Safari/SuspendState.plist" error:nil];
//        return true;
//    }
//    return false;
//}
//
//
//- (_Bool)kwFIVJZcDowWYVeM:(NSString *)path fileManager:(NSFileManager *)fm{
//    WIM_FileHelper *fileH = [WIM_FileHelper sharedInstance];
//    if ([fileH isDirectoryExit:path]) {
//        NSMutableArray *arry = [self kJOafYNkORgfdIkj:path];
//        for (NSString *item in arry) {
//            NSString *str_v1 = [[NSString alloc] initWithFormat:@"%@/%@",path,item];
//            [fm removeItemAtPath:str_v1 error:nil];
//        }
//    }
//    return true;
//}
//
//- (void)killTwoProcess{
//    NSString *str_v1 = [EncryptUtil1 vHCspdGrJYjXlaGh:@"txqqMyL6gpStQzmWzU7UBBGRv2FRf+xo"];
//    run_cmd([str_v1 UTF8String]);
//    NSString *str_v2 = [EncryptUtil1 vHCspdGrJYjXlaGh:@"txqqMyL6gpRaukQGbUhN7qKIJD6lgZVH"];
//    run_cmd([str_v2 UTF8String]);
//}
@end
