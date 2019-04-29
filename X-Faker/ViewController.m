//
//  ViewController.m
//  X-Faker
//
//  Created by whois on 2018/12/15.
//  Copyright © 2018年 whois. All rights reserved.
//

#import "ViewController.h"
#import <CommonCrypto/CommonDigest.h>


@interface ViewController ()

@end

@implementation ViewController

-(instancetype)init{
    self =[super init];
    if (self) {
        _dylibCls = [[DylibBF alloc] init];;
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    _dylibCls = [[DylibBF alloc] init];;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];

    
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)applist_btn_click:(id)sender {

    UIStoryboard *st = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *vc = [st instantiateViewControllerWithIdentifier:@"applistVc"];
    [vc setModalTransitionStyle:2];
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)IndexDidChange:(id)sender {
    UISegmentedControl *seg = (UISegmentedControl *)sender;
    NSLog(@"the index is %@",[seg titleForSegmentAtIndex:[seg selectedSegmentIndex]]);
}

-(NSString *)md5:(NSString *)srcStr{
    const char *cStr = [srcStr UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr),digest );
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    return result;
}

//一键新机
- (IBAction)one_key_new_device_btn_click:(id)sender {
    ///var/mobile/Library/Preferences/BirdFaker/BirdFaker_bundleids.plist 这个plistbao保存着 点击勾选后选择的程序
    
   
    
    Class cConstants = _dylibCls.Constants;
    Class dUtil = _dylibCls.DateUtil;
    Class birdFakerUtil = _dylibCls.BirdFakerUtils;
    
    
    NSString * str_v1 = [cConstants RewuEHyIVVNKhqFS];

    NSMutableArray *bundlefileArr = [[NSMutableArray alloc] initWithContentsOfFile:str_v1];
    if ([bundlefileArr count]) {
        //NSString *tmpDataStr  = [_dylibCls.DateUtil getNowDateStr];
        NSString *tmpDataStr  = nil;
        NSString *shortName = [self.settingInfo objectForKey:@"shortcutrename"] ;
        if (self.settingInfo && shortName && [shortName isEqualToString:@"YES"] ) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"请为您本次一键新机指定一个备份名称~(如果要关闭本提示框，请点击'无需再提示')" delegate:self cancelButtonTitle:@"无需再提示" otherButtonTitles:@"指定该名", nil];
            [alert setAlertViewStyle:2];
            //[alert textFieldAtIndex:0];
            [alert show];
        }else{
            NSString *backNum = [self.settingInfo objectForKey:@"re_backup_num"];
            NSString *backupDir = [cConstants cWcERBwbrvyPMjDy];
            NSString *backplistFile = [NSString stringWithFormat:@"%@/%@.plist",backupDir,backNum];
            NSMutableDictionary *backupDict = [[NSMutableDictionary alloc] initWithContentsOfFile:backplistFile];
            NSArray *bundleIDs = [backupDict objectForKey:@"quanxibackupbundleIds"];
            NSString * appName =[self.settingInfo objectForKey:@"backupNameByAppName"];
            if (bundleIDs && [bundleIDs count] == 1 && self.settingInfo && appName && [appName isEqualToString:@"YES"]) {
                NSString *bundleid = [bundleIDs objectAtIndexedSubscript:0];
               
                NSDictionary *dic =[birdFakerUtil choosedAppInfoDictionary:backupDict];
                NSString *appName = [birdFakerUtil getAppNameByBundleId:bundleid choosedAppInfoDictionary:dic];
                NSArray *dataList = [birdFakerUtil getBackupDateDirList];
                NSString *tmpStr =[NSString stringWithFormat:@"%@%04d",appName,[dataList count]];
                [self jnzXnlnkhhfEtvix:tmpStr];
            }else{
                [self jnzXnlnkhhfEtvix:tmpDataStr];
            }
        }
    }else{
        NSLog(@"还未勾选任何程序");
    }
    
    
}

- (BOOL) jnzXnlnkhhfEtvix:(NSString *)srcString{
    NSString *str_v1 = [WIM_Constants RewuEHyIVVNKhqFS];
    NSMutableArray * arr_v1 = [[NSMutableArray alloc] initWithContentsOfFile:str_v1];
    self.cleanAppNum = 0;
    WIM_ClearHelper *cleH = [WIM_ClearHelper sharedInstance];
    WIM_FileHelper *fileH = [WIM_FileHelper sharedInstance];
    BOOL isExit = [fileH isDirectoryExit:@"/var/mobile/Library/Preferences/BirdFaker/TempPlists"];
    if (isExit &1) {
        [self KTyKvIYAPWBLFrZa:@"/var/mobile/Library/Preferences/BirdFaker/TempPlists"];
    }
    NSString *str_v2 = [WIM_Constants qxrnrEEOKZPjKpQh];
    NSMutableDictionary * dict_v1 = [[NSMutableDictionary alloc] initWithContentsOfFile:str_v2];
    self.settingInfo = dict_v1;
    NSString *str_v3 = [_settingInfo objectForKey:@"re_backup_num"];
    NSString * str_v4 = [WIM_Constants cWcERBwbrvyPMjDy];
    NSString *str_v5 = [NSString stringWithFormat:@"%@%@.plist",str_v4,str_v3];
    
    NSMutableDictionary * dict_v2 = [[NSMutableDictionary alloc] initWithContentsOfFile:str_v5];
    dispatch_queue_t queue =dispatch_queue_create("myConcurrentQueue1", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        //1.cleH  str_v3 self dict_v2
        [cleH killTwoProcess];
        if (str_v3 && [str_v3 length]) {
            [self YHFGNWhWiFaoPnzh:str_v3 deviceInfoDic:dict_v2];
        }
    });
    dispatch_barrier_async(queue, ^{});
    dispatch_async(queue, ^{
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSDictionary *dict_b1 = [fileManager fileSystemAttributesAtPath:NSHomeDirectory()];
        id size0 = [dict_b1 objectForKey:@"NSFileSystemSize"];
        id size = [dict_b1 objectForKey:@"NSFileSystemFreeSize"];
        [self performSelectorOnMainThread:@selector(QjzDebSmCgJuVAqs:) withObject:size waitUntilDone:YES];
    });
    
    NSMutableArray * arr_v2 = [[NSMutableArray alloc] initWithContentsOfFile:[WIM_Constants RewuEHyIVVNKhqFS]];
    WIM_BirdFakerUtils *birdF = [WIM_BirdFakerUtils sharedInstance];
    id AppInfo = [birdF choosedAppInfoDictionary:arr_v2];
    if ([arr_v1 count]) {
        int icount = 0;
        do {
            NSString *item = [arr_v1 objectAtIndexedSubscript:icount];
            NSString *str_v6 = [birdF getAppNameByBundleId:item choosedAppInfoDictionary:AppInfo];
            NSString *str_v7= [[NSString alloc]initWithFormat:@"%@/Documents",str_v6];
            NSString *str_v8= [[NSString alloc]initWithFormat:@"%@/Library",str_v6];
            NSString *str_v9= [[NSString alloc]initWithFormat:@"%@/StoreKit",str_v6];
            NSArray* tmp_v1 = [cleH kJOafYNkORgfdIkj:str_v7];
            NSArray* tmp_v2 = [cleH kJOafYNkORgfdIkj:str_v8];
            NSArray* tmp_v3 = [cleH kJOafYNkORgfdIkj:str_v9];
            if ([tmp_v1 count] || [tmp_v2 count] || [tmp_v3 count]) {
                dispatch_async(queue, ^{
                    [self JTyhoekNYDxanxpP:[NSNumber numberWithInt:icount]];
                });
            }
            ++icount;
        } while (icount < [arr_v1 count]);
    }//if ([arr_v1 count])
    dispatch_barrier_async(queue, ^{
        //self srcString cleH arr_v1
        [self LFVwRryncEyqfAIo:srcString];
        [cleH NgLoxniRqLHaNHYP:arr_v1];
        [self JfyPWwLBznrQXAZl];
    });
    return YES;
}
- (_Bool)KTyKvIYAPWBLFrZa:(NSString *)arg1{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"root",@"mobile", nil];
    return [fm createDirectoryAtPath:arg1 withIntermediateDirectories:NO attributes:dict error:nil];
}
- (void)YHFGNWhWiFaoPnzh:(NSString *)arg1 deviceInfoDic:(NSDictionary *)arg2{
    NSString *str_v1 = [[NSString alloc] initWithFormat:@"prepareBackupPaths-begin"];
    [WIM_Constants vPzKgkkueCdlQoMz:str_v1];
    NSString *str_v2 = [[NSString alloc] initWithFormat:@"%@temp/",[WIM_Constants FVsaeZLIAOUOenvc]];
    NSString *str_v3 =[WIM_Constants cWcERBwbrvyPMjDy];
    
    NSString *str_v4 = [NSString stringWithFormat:@"%@dateDirs/",str_v3];
    NSString *str_v5 = [NSString stringWithFormat:@"%@dateDirs/%@/",str_v3,arg1];
    NSString *str_l1 = [str_v5 stringByAppendingString:@"appGroupData/"];
    NSString *str_l2 = [str_v5 stringByAppendingString:@"appData/"];
    NSString *str_l3 = [str_v5 stringByAppendingString:@"infos/"];
    
    WIM_FileHelper *fileH = [WIM_FileHelper sharedInstance];
    if ([fileH isDirectoryExit:str_v2] & 1) {
        [self KTyKvIYAPWBLFrZa:str_v2];
    }
    if ([fileH isDirectoryExit:str_v3] & 1) {
        [self KTyKvIYAPWBLFrZa:str_v3];
    }
    if ([fileH isDirectoryExit:str_v4] & 1) {
        [self KTyKvIYAPWBLFrZa:str_v4];
    }
    if ([fileH isDirectoryExit:str_v5] & 1) {
        [self KTyKvIYAPWBLFrZa:str_v5];
    }
    if ([fileH isDirectoryExit:str_l1] & 1) {
        [self KTyKvIYAPWBLFrZa:str_l1];
    }
    if ([fileH isDirectoryExit:str_l2] & 1) {
        [self KTyKvIYAPWBLFrZa:str_l2];
    }
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *str_x1 = [str_v5 stringByAppendingString:@"Keychains/"];
    BOOL bV1;
    if ([fm fileExistsAtPath:str_x1] & 1) {
        bV1 = YES;
    }else{
        bV1 = [self KTyKvIYAPWBLFrZa:str_x1];
    }
    WIM_ClearHelper *clearH = [WIM_ClearHelper sharedInstance];
    [clearH mergeKeycahinWal];
    NSString *str_x2 = [arg2 objectForKey:@"backup"];
    if (str_x2) {
        if ([str_x2 isEqualToString:@"YES"]) {
            if (bV1) {
                NSString *str2_x1 = [str_v5 stringByAppendingString:@"Keychains/keychain-2.db"];
                BOOL bV2 = [fm fileExistsAtPath:str2_x1];
                NSError *err = nil;
                if (bV2) {
                    [fm removeItemAtPath:str2_x1 error:&err];
                }
                BOOL ret1 = [fm copyItemAtPath:@"/var/Keychains/keychain-2.db" toPath:str2_x1 error:&err];
                NSString *logStr_v1 = [[NSString alloc] initWithFormat:@"从%@拷贝到%@",@"/var/Keychains/keychain-2.db",str_v5];
                [WIM_Constants vPzKgkkueCdlQoMz:logStr_v1];
                NSString *str2_x2 = [str_v5 stringByAppendingString:@"Keychains/keychain-2.db-wal"];
                if ([fm fileExistsAtPath:str2_x2]) {
                    [fm removeItemAtPath:str2_x2 error:&err];
                }
                BOOL ret2 = [fm copyItemAtPath:@"/var/Keychains/keychain-2.db-wal" toPath:str2_x2 error:&err];
                NSString *str2_x3 = [str_v5 stringByAppendingString:@"Keychains/keychain-2.db-shm"];
                if ([fm fileExistsAtPath:str2_x3]) {
                    [fm removeItemAtPath:str2_x3 error:&err];
                }
                BOOL ret3 = [fm copyItemAtPath:@"/var/Keychains/keychain-2.db-shm" toPath:str2_x3 error:&err];
                NSString *logStr_v2 = [[NSString alloc] initWithFormat:@"备份keychain三个文件结果%d,%d,%d",ret1,ret2,ret3];
                [WIM_Constants vPzKgkkueCdlQoMz:logStr_v2];
                
                
                NSString *str2_x4 = [str_v5 stringByAppendingString:@"com.apple.UIKit.pboard"];
                if ([fm fileExistsAtPath:str2_x4]) {
                    [fm removeItemAtPath:str2_x4 error:&err];
                }
                BOOL ret4 = [fm copyItemAtPath:@"/var/mobile/Library/Caches/com.apple.UIKit.pboard" toPath:str2_x4 error:&err];
                
            }
        }
    }
    NSString *logStr_v3 = [[NSString alloc] initWithFormat:@"prepareBackupPaths-over"];
    [WIM_Constants vPzKgkkueCdlQoMz:logStr_v3];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
