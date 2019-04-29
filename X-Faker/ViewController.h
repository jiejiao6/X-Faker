//
//  ViewController.h
//  X-Faker
//
//  Created by whois on 2018/12/15.
//  Copyright © 2018年 whois. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArgSetViewController.h"
#import "AppListViewController.h"
@interface ViewController : UIViewController


@property (strong, nonatomic) ArgSetViewController *ArgSetVc;
@property (strong, nonatomic) AppListViewController *ApplistVc;
@property(nonatomic,retain) DylibBF *dylibCls;


@property(nonatomic,retain) NSMutableDictionary *settingInfo;
@property(retain) NSString *trueDeviceInfo; // @synthesize trueDeviceInfo=_trueDeviceInfo;
@property(retain) NSString *tempAction; // @synthesize tempAction=_tempAction;
@property _Bool setLocationByIp; // @synthesize setLocationByIp=_setLocationByIp;
@property _Bool isMZSMDialogShowing; // @synthesize isMZSMDialogShowing=_isMZSMDialogShowing;
@property _Bool isBackgrounAuthResultDialogShowing; // @synthesize isBackgrounAuthResultDialogShowing=_isBackgrounAuthResultDialogShowing;
@property(retain) NSString *autoKey; // @synthesize autoKey=_autoKey;
@property(retain) NSString *systemTongzhi; // @synthesize systemTongzhi=_systemTongzhi;
@property _Bool neterror; // @synthesize neterror=_neterror;
@property _Bool clear_status_flag; // @synthesize clear_status_flag=_clear_status_flag;
@property(retain) NSString *IPStr; // @synthesize IPStr=_IPStr;
@property(retain) NSString *settingsPath; // @synthesize settingsPath=_settingsPath;
@property(retain) NSString *url; // @synthesize url=_url;
@property(retain) NSString *gonwangIpStr; // @synthesize gonwangIpStr=_gonwangIpStr;
@property(retain) NSString *token2; // @synthesize token2=_token2;
@property int cleanAppNum; // @synthesize cleanAppNum=_cleanAppNum;
@property(retain) NSString *accounttoken; // @synthesize accounttoken=_accounttoken;
@property int type; // @synthesize type=_type;
@property(retain) NSString *app_bundle_path; // @synthesize app_bundle_path=_app_bundle_path;
@property(retain) NSString *app_name_path; // @synthesize app_name_path=_app_name_path;
@property(retain, nonatomic) UIWindow *window; // @synthesize window=_window;
@property(nonatomic) __weak UIButton *mainVc_icon_btn; // @synthesize mainVc_icon_btn=_mainVc_icon_btn;
@property(retain) NSString *expiredateStr; // @synthesize expiredateStr=_expiredateStr;
@property(retain) NSString *bfname; // @synthesize bfname=_bfname;
@property(retain) NSString *action; // @synthesize action=_action;
@property(nonatomic) __weak UILabel *clear_status_label; // @synthesize clear_status_label=_clear_status_label;
@property(nonatomic) __weak UILabel *detail_xinghao_label; // @synthesize detail_xinghao_label=_detail_xinghao_label;
@property(nonatomic) __weak UIButton *version_btn; // @synthesize version_btn=_version_btn;
@property(nonatomic) __weak UISwitch *save_params_switch; // @synthesize save_params_switch=_save_params_switch;
@property(nonatomic) __weak UISegmentedControl *device_type_seg; // @synthesize device_type_seg=_device_type_seg;
@property(nonatomic) __weak UIButton *zengqiangchajian_btn; // @synthesize zengqiangchajian_btn=_zengqiangchajian_btn;
@property(nonatomic) __weak UILabel *main_verion_label; // @synthesize main_verion_label=_main_verion_label;
@property(nonatomic) __weak UISwitch *mainVC_backup_switch; // @synthesize mainVC_backup_switch=_mainVC_backup_switch;
@property(nonatomic) __weak UILabel *gongwangIp_label; // @synthesize gongwangIp_label=_gongwangIp_label;
@property(nonatomic) __weak UILabel *expireDate_label; // @synthesize expireDate_label=_expireDate_label;
@property(nonatomic) __weak UIButton *choosedApps_btn; // @synthesize choosedApps_btn=_choosedApps_btn;

- (void)mainVc_icon_btn_click:(id)arg1;
- (void)nztDataImportError:(id)arg1;
- (void)location_by_ip_btn_click:(id)arg1;
- (void)nzt_data_import_btn_click:(id)arg1;
- (void)mzsm_mainVc_btn_click:(id)arg1;
- (void)wx62data_pb_btn_click:(id)arg1;
- (void)cleanSetting_btn_click:(id)arg1;
- (void)umGiMfdqmeAxrvhH;
- (void)justGaichuanUi;
- (void)justupdatefake_clean_btn_click:(id)arg1;
- (void)justCleanUi;
- (void)just_clean_btn_click:(id)arg1;
- (void)justBackUpUi;
- (void)just_backup_btn_click:(id)arg1;
- (id)convertDataToHexStr:(id)arg1;
- (id)convertStringToHexStr:(id)arg1;
- (id)save62data_Api;
- (void)main_bugAndSuggest_btn_click:(id)arg1;
- (void)main_jiaoben_store_btn_click:(id)arg1;
- (void)main_dinggzhiSoft_btn_click:(id)arg1;
- (id)checkIpIsUsed_api;
- (void)ucNNpxwUTrXnJgbG;
- (void)new_version_remind_btn_click:(id)arg1;
- (void)jiaoben_fuzhu_btn_click:(id)arg1;
- (void)async_task_remind:(id)arg1;
- (id)IBDhdkZJhzdIaBCP:(id)arg1;
- (id)ytqiIpjsnYDTtQmS:(id)arg1;
- (void)softModify_btn_click:(id)arg1;
- (void)device_type_seg_click:(id)arg1;
- (id)ekdfrOLMBOUUTFom:(id)arg1;
- (id)yhzpYMvYsjOpaKiN;
- (void)alertView:(id)arg1 clickedButtonAtIndex:(long long)arg2;
- (void)nErEElRjAHupWOVz;
- (void)zengQiangPlugin_btn_click:(id)arg1;
- (void)save_params_switch:(id)arg1;
- (_Bool)SXjxMdWDglmpHATw;
- (void)original_deviceInfo_btn_click:(id)arg1;
- (void)version_btn_click:(id)arg1;
- (void)ip_remind:(id)arg1;
- (void)LbPzuqMbDtYUeXdW;
- (void)backuphis_btn_click:(id)arg1;
- (void)backup_switch_click:(id)arg1;
- (void)systemSettings_btn_click:(id)arg1;
- (void)vPzKgkkueCdlQoMz;
- (id)ZTZuDIGhbbZlSajE:(id)arg1;
- (void)AqkdRyrDSdgoQjjE:(id)arg1 processName:(id)arg2;
- (void)LFVwRryncEyqfAIo:(id)arg1;
- (void)nLYSKyXoUZTiGYol:(id)arg1;
- (void)yrunsyxuxehoUbQR:(id)arg1;
- (void)checkIsIllegalServer:(id)arg1;
- (void)plzwPPpAiETdBxsJ:(id)arg1;
- (void)kLCLcYiioGRsxiPn;
- (id)vAILbkabsPhFGfAV;
- (void)YHFGNWhWiFaoPnzh:(NSString *)arg1 deviceInfoDic:(NSDictionary *)arg2;
- (void)JfyPWwLBznrQXAZl;
- (void)nTbYlMcDJHeCLLIC:(id)arg1;
- (void)JTyhoekNYDxanxpP:(id)arg1;
- (id)LGpmJhOsgvMSUboM;
- (id)bZfKNiMvotuQrEkk;
- (id)imfJRpHYiYCmjIHz;
- (id)UOapxkUiuqfTMiTa:(id)arg1;
- (id)md5:(id)arg1;
- (void)QjzDebSmCgJuVAqs:(id)arg1;
- (void)one_key_new_device_btn_click:(id)arg1;
- (_Bool)KTyKvIYAPWBLFrZa:(NSString *)arg1;
- (struct CGAffineTransform)transformForOrientation;
- (void)FUBLeHYOpRqEtLBu:(id)arg1;
- (void)quit_app_btn_click:(id)arg1;
- (void)didReceiveMemoryWarning;
- (void)KmbvVGRWtZakZZOG;
- (void)GjxLfoTplsCSdKmA:(id)arg1;
- (void)applist_btn_click:(id)arg1;
- (void)wVxlFxnMbJndmMAq;
- (void)KLQKOnluyivPLRGr:(id)arg1;
- (void)operationAuth_serverRetunNothing;
- (void)CnSwXmJEJaCIMufa:(id)arg1;
- (void)fake_locaiton_btn_click:(id)arg1;
- (void)fake_device_info_click:(id)arg1;
- (void)viewWillAppear:(_Bool)arg1;
- (_Bool)FdllRgtdMEXVqVRG:(id)arg1;
- (void)setDeviceInfoByRealInfo;
- (id)TmffGoZHEWyhulXo;
- (void)xYJsWltMFJhrWQYt;
- (void)LAJbHBrAMEgFWInE;
- (void)MwDnELzwBRVPPlaU;
- (void)KPQdPdJvPTgMfnTl;
- (void)viewDidAppear:(_Bool)arg1;
- (void)viewDidLoad;
- (void)MOSKiBeDaaMnJwaK;
- (id)init;


- (BOOL) jnzXnlnkhhfEtvix:(NSString *)srcString;

@end

