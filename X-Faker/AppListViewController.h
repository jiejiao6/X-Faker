//
//  AppListViewController.h
//  X-Faker
//
//  Created by whois on 2018/12/15.
//  Copyright © 2018年 whois. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NSMutableArray, NSMutableDictionary, NSString, UIButton, UISwitch, UITableView;

__attribute__((visibility("hidden")))
@interface AppListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate, UIActionSheetDelegate>



@property(nonatomic,retain) DylibBF *dylibCls;

@property (weak, nonatomic) IBOutlet UITableView *AppTableV;
@property (weak, nonatomic) IBOutlet UINavigationBar *AppNaviBar;


@property(nonatomic,copy) NSMutableArray *apps; // @synthesize apps=_apps;
@property(retain) NSString *autoOpenAppBundleId; // @synthesize autoOpenAppBundleId=_autoOpenAppBundleId;
@property(nonatomic) __weak IBOutlet UITableView *applist_tableview; // @synthesize applist_tableview=_applist_tableview;
- (IBAction)back_btn_click:(id)arg1;
- (IBAction)check_all_btn_click:(id)arg1;
- (void)applist_teach_btn_click:(id)arg1;
- (void)auto_open_app_remind_btn_click:(id)arg1;
- (void)backup_initial_data_btn:(id)arg1;
- (void)cancel_all_check_btn_click:(id)arg1;
- (void)chushihuadata_remind_btn:(id)arg1;
- (void)download_api_btn_click:(id)arg1;
- (void)empty_initialdata_btn_click:(id)arg1;
- (void)oneApponeInfo_switch_click:(id)arg1;
- (void)restore_initialdata_btn_click:(id)arg1;
- (void)save_btn_click:(id)arg1;
- (IBAction)selectAll_btn_click:(id)arg1;
- (void)jiaoben_store_btn_click:(id)arg1;
- (void)fenbieweizhuang_switch_click:(id)arg1;

- (void)alertView:(id)arg1 clickedButtonAtIndex:(long long)arg2;

- (void)checkJiaoben:(id)arg1;
+ (instancetype)sharedInstance;
@property(nonatomic) __weak UISwitch *fenbieweizhuang_switch; // @synthesize fenbieweizhuang_switch=_fenbieweizhuang_switch;

@property _Bool isSelectedAll; // @synthesize isSelectedAll=_isSelectedAll;
@property int itemIndex; // @synthesize itemIndex=_itemIndex;

- (void)longPressToDo:(id)arg1;
@property(retain) NSMutableArray *mBundleIdsArray; // @synthesize mBundleIdsArray=_mBundleIdsArray;
@property(retain) NSMutableArray *mNeedBackupBundleIdsArray; // @synthesize mNeedBackupBundleIdsArray=_mNeedBackupBundleIdsArray;
@property(nonatomic) __weak UISwitch *oneApponeInfo_switch; // @synthesize oneApponeInfo_switch=_oneApponeInfo_switch;

@property(retain) NSMutableDictionary *settingInfo; // @synthesize settingInfo=_settingInfo;
@property(retain) NSMutableArray *topedArray; // @synthesize topedArray=_topedArray;


- (void)viewDidAppear:(_Bool)arg1;
- (void)viewDidLoad;
- (id)xhqVSHjNJGfcqvUz:(id)arg1;
@end
