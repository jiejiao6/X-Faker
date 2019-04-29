//
//  AppListViewController.m
//  X-Faker
//
//  Created by whois on 2018/12/15.
//  Copyright © 2018年 whois. All rights reserved.
//

#import "AppListViewController.h"

@implementation AppListViewController


+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static AppListViewController *dUtil = nil;
    dispatch_once(&onceToken, ^{
        dUtil = [[AppListViewController alloc] init];
    });
    
    return dUtil;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    _dylibCls = [[DylibBF alloc] init];;

}
-(instancetype)init{
    self =[super init];
    if (self) {
       _dylibCls = [[DylibBF alloc] init];;
    }
    return self;
}



- (IBAction)check_all_btn_click:(id)arg1{
    
}
- (IBAction)selectAll_btn_click:(UIButton *)arg1{
    if (_isSelectedAll) {
        [_mBundleIdsArray removeAllObjects];
        [_mNeedBackupBundleIdsArray removeAllObjects];
        [_applist_tableview reloadSections:[[NSIndexSet alloc] initWithIndex:0] withRowAnimation:100];
        _isSelectedAll = NO;
        [arg1 setTitle:@"全选" forState:0];
    }else{
        if ([_apps count]) {
            for (NSDictionary *item in _apps) {
                [_mBundleIdsArray addObject:[item objectForKey:@"bundleid"]];
            }
            [_applist_tableview reloadSections:[[NSIndexSet alloc] initWithIndex:0] withRowAnimation:100];
            _isSelectedAll = YES;
            [arg1 setTitle:@"取消" forState:0];
        }
    }
}
- (IBAction)back_btn_click:(id)arg1{
    _mBundleIdsArray = [_mBundleIdsArray valueForKeyPath:@"@distinctUnionOfObjects.self"];
    _mNeedBackupBundleIdsArray = [_mNeedBackupBundleIdsArray valueForKeyPath:@"@distinctUnionOfObjects.self"];
    [_mBundleIdsArray writeToFile:[_dylibCls.Constants RewuEHyIVVNKhqFS] atomically:YES];
    [_mNeedBackupBundleIdsArray writeToFile:[_dylibCls.Constants getBirdFaker_NeedBackup_BundleIds_File_Path] atomically:YES];
    [_settingInfo setValue:_autoOpenAppBundleId forKey:@"autoOpenAppBundleId"];
    [_settingInfo writeToFile:[_dylibCls.Constants qxrnrEEOKZPjKpQh] atomically:YES];
    NSString *componStr = [_apps componentsJoinedByString:@","];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:_apps];
    NSString *strPath =[[_dylibCls.Constants qxrnrEEOKZPjKpQh] stringByAppendingString:@"data"];
    [data writeToFile:strPath atomically:YES];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self dismissViewControllerAnimated:YES completion:^{
            NSLog(@"执行返回");
        }];
    });
}


-(void)viewDidLoad{
    

    _applist_tableview.delegate= self;
    _applist_tableview.dataSource = self;
    _apps = [[NSMutableArray alloc] initWithArray:[_dylibCls.BrowseAllInstalledApplication rZfhyJIIExroWxWw] copyItems:YES];
    _mBundleIdsArray = [[NSMutableArray alloc]  initWithContentsOfFile:[_dylibCls.Constants RewuEHyIVVNKhqFS]];
    _mNeedBackupBundleIdsArray = [[NSMutableArray alloc]  initWithContentsOfFile:[_dylibCls.Constants getBirdFaker_NeedBackup_BundleIds_File_Path]];
    if ([_dylibCls.BirdFakerUtils dx_isNullOrNilWithObject:_mBundleIdsArray]) {
        _mBundleIdsArray = [[NSMutableArray alloc] init];
    }
    if ([_dylibCls.BirdFakerUtils dx_isNullOrNilWithObject:_mNeedBackupBundleIdsArray]) {
        _mNeedBackupBundleIdsArray = [[NSMutableArray alloc] init];
    }
    if (([_dylibCls.BirdFakerUtils dx_isNullOrNilWithObject:_apps] & 1) ||  ![_apps count]) {
        
        [_mBundleIdsArray removeAllObjects] ;
        [_mBundleIdsArray writeToFile:[_dylibCls.Constants RewuEHyIVVNKhqFS] atomically:YES];
        [_mNeedBackupBundleIdsArray removeAllObjects];
        [_mNeedBackupBundleIdsArray writeToFile:[_dylibCls.Constants getBirdFaker_NeedBackup_BundleIds_File_Path] atomically:YES];
    }
   NSArray *arr_v1 =  [NSArray arrayWithArray:_mBundleIdsArray];
   if (_apps && _mBundleIdsArray && [_apps count] && [_mBundleIdsArray count]){
       NSString *str = [_apps componentsJoinedByString:@","];
       [arr_v1 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
           if (obj && [obj isKindOfClass: [NSString class]]) {
               NSString *strObj =[NSString stringWithString:obj];
               if (strObj.length && [strObj rangeOfString:str].location == NSNotFound) {
                   //如果不存在此bundleID 就执行删除 目前还没写
               }
           }
       }];
    }
    _settingInfo = [[NSMutableDictionary alloc] initWithContentsOfFile:[_dylibCls.Constants qxrnrEEOKZPjKpQh]];
    NSString *oneAppInfo = [_settingInfo objectForKey:@"oneapponeinfo"];
    if ([oneAppInfo isEqualToString:@"YES"]) {
        [_oneApponeInfo_switch setOn:YES];
    }else{
        [_oneApponeInfo_switch setOn:NO];
    }
    _autoOpenAppBundleId = [_settingInfo objectForKey:@"autoOpenAppBundleId"];
   UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressToDo:)];
    [longPress setMinimumPressDuration:1.0];
    [self.applist_tableview addGestureRecognizer:longPress];
    NSString *topBundlePath = [[NSString alloc] initWithFormat:@"%@%@",[_dylibCls.Constants FVsaeZLIAOUOenvc],@"/topedBundleIds.plist"];
    _topedArray = [[NSMutableArray alloc] initWithContentsOfFile:topBundlePath];
    if (!_topedArray) {
        _topedArray = [[NSMutableArray alloc] init];
    }
    NSMutableArray *arr2 = [[NSMutableArray alloc] init];
    
    NSArray *allBundles = [[[_apps reverseObjectEnumerator] allObjects] mutableCopy];
    for (NSDictionary *item in allBundles) {
        NSString *bundleID = [item objectForKey:@"bundleid"];
        if (_topedArray && [_topedArray count] && [_topedArray containsObject:bundleID]) {
            [_apps removeObject:item];
            [_apps insertObject:item atIndex:0];
        }
    }
    NSString *fenbieStr = [_settingInfo objectForKey:@"fenbieweizhuang"];

    if (fenbieStr && [fenbieStr isEqualToString:@"YES"]) {
        [_fenbieweizhuang_switch setOn:YES];
    }else{
        [_fenbieweizhuang_switch setOn:NO];
    }
    
    
    
}

#pragma mark - Table View

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (self.apps) {
        return [NSString stringWithFormat:@"%lu Apps Detected", (unsigned long)self.apps.count];
    } else {
        return @"Detection in progress...";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.apps.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    int sysVer =[_dylibCls.DeviceInfo systemVersion_big];
    static NSString *CellIdentifier = @"app_cell";
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        } else {
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
        }
    }
    NSDictionary *appDictionary = [self.apps objectAtIndex:indexPath.row];
    //系统版本在8到10之间
    if (sysVer -8 < 3) {
        if ([_dylibCls.BirdFakerUtils dx_isNullOrNilWithObject: appDictionary]) {
        LABEL_74:
            [cell setSelectionStyle:0];
            return cell;
        }
        
        NSString *appname = [appDictionary objectForKey:@"appName"];
        if (appname && appname.length> 0) {
            cell.textLabel.text = appname;
        }
        NSString *bundleId = [appDictionary objectForKey:@"bundleid"];
        if ([_topedArray containsObject:bundleId]) {
            cell.detailTextLabel.text = @"已置顶";
            cell.detailTextLabel.textColor = [UIColor redColor];
        }
        NSURL *resDir =[appDictionary objectForKey:@"resourcesDirectoryURL"];
        NSString * resDirStr =nil;
        if (sysVer != 7) {
            resDirStr = [resDir absoluteString];
        }
        NSString *tmpStrV1 = [resDirStr stringByReplacingPercentEscapesUsingEncoding:4];
        NSArray *strArr = [tmpStrV1 componentsSeparatedByString:@"file://"];
        NSString *tmpStrV2 =[strArr objectAtIndexedSubscript:1];
        NSString *tmpStrV3 =[tmpStrV2 stringByReplacingOccurrencesOfString:@"%20" withString:@" "];
        NSString *tmpStrV4 = [tmpStrV3 stringByAppendingString:@"/Info.plist"];
        NSString *tmpStrV5 =[tmpStrV4 stringByReplacingOccurrencesOfString:@"%20" withString:@" "];
        
        NSDictionary *dict2 = [[NSDictionary alloc]initWithContentsOfFile: tmpStrV5];
        NSArray *iConArr =nil;
        NSArray *iConfilesArr =[dict2 objectForKey:@"CFBundleIconFiles"];
        if (iConfilesArr) {
            iConArr =iConfilesArr;
        }else{
            if ([dict2 objectForKey:@"CFBundleIcons"]) {
                if ([dict2 objectForKey:@"CFBundlePrimaryIcon"]) {
                    iConArr = [dict2 objectForKey:@"CFBundleIconFiles"];
                }
            }
        }
        UIImage *image = nil;
        if (iConArr && [iConArr count]) {
            NSString *iConName =[iConArr objectAtIndexedSubscript:0];
            NSString *pngStr = iConName;
            if (iConName && [iConName rangeOfString:@".png"].location != -1) {
                pngStr = [iConName stringByReplacingOccurrencesOfString:@".png" withString:@""];
            }
            NSString *StrV1 = [[NSString alloc] initWithFormat:@"%@/%@.png",tmpStrV3,pngStr];
            NSString *StrV2 = [[NSString alloc] initWithFormat:@"%@/%@@2x.png",tmpStrV3,pngStr];
            NSString *StrV3 = [[NSString alloc] initWithFormat:@"%@/%@@3x.png",tmpStrV3,pngStr];
            NSFileManager *fm = [NSFileManager defaultManager];
            NSString *pngPath =nil;
            if ([fm fileExistsAtPath:StrV1]) {
                pngPath = StrV1;
            }else if([fm fileExistsAtPath:StrV2]) {
                pngPath = StrV2;
            }else if([fm fileExistsAtPath:StrV3]) {
                pngPath = StrV3;
            }
            image = [[UIImage alloc] initWithContentsOfFile:pngPath];
        }else{
            image = [UIImage imageNamed:@"placeholder-icon.png"];
        }
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(40.0, 40.0), 0, 0.0);
        [image drawInRect:CGRectMake(0, 0, 40, 40)];
        UIImageView *imageView = [cell imageView];
        UIImage *image1 =  UIGraphicsGetImageFromCurrentImageContext();
        [imageView setImage:image1];
        UIGraphicsEndImageContext();
        SSCheckBoxView* checkBox1 =  [[SSCheckBoxView alloc] initWithFrame:CGRectMake(180.0,10.0,70.0,30.0) style:4 checked:0];
        [checkBox1 setText:@""];
        SSCheckBoxView* checkBox2 =  [[SSCheckBoxView alloc] initWithFrame:CGRectMake(230.0,10.0,70.0,30.0) style:4 checked:0];
        [checkBox2 setText:@""];
        SSCheckBoxView* checkBox3 =  [[SSCheckBoxView alloc] initWithFrame:CGRectMake(280.0,10.0,70.0,30.0) style:4 checked:0];
        [checkBox3 setText:@""];
        if (_settingInfo && _autoOpenAppBundleId && [_autoOpenAppBundleId length]) {
           
            if ([[appDictionary objectForKey:@"bundleid"] isEqualToString:_autoOpenAppBundleId]) {
                [checkBox1 setChecked:1];
            }
        }
        for (NSString *item in _mBundleIdsArray) {
            if ([[appDictionary objectForKey:@"bundleid"] isEqualToString:item]) {
                [checkBox2 setChecked:1];
            }
        }
        for (NSString *item in _mNeedBackupBundleIdsArray) {
            if ([[appDictionary objectForKey:@"bundleid"] isEqualToString:item]) {
                [checkBox3 setChecked:1];
            }
        }
        [checkBox1 setStateChangedBlock: ^(SSCheckBoxView* V){
            if ([V checked]) {
                NSDictionary *dic1 = [self.apps objectAtIndex:indexPath.row];
                _autoOpenAppBundleId = [dic1 objectForKey:@"bundleid"];
                [_applist_tableview reloadSections:[[NSIndexSet alloc] initWithIndex:0] withRowAnimation:100];
            }else{
                _autoOpenAppBundleId =@"";
            }
        }];
        [cell addSubview:checkBox1];
        [checkBox2 setStateChangedBlock: ^(SSCheckBoxView* V){
            if ([V checked]) {
                [_mBundleIdsArray addObject:[appDictionary objectForKey:@"bundleid"]];
                _mBundleIdsArray = [self xhqVSHjNJGfcqvUz:_mBundleIdsArray];
                
            }else{
                //[checkBox3 setChecked:0];
                
                [_mNeedBackupBundleIdsArray removeObject:[appDictionary objectForKey:@"bundleid"]];
                _mBundleIdsArray = [self xhqVSHjNJGfcqvUz:_mBundleIdsArray];
                _mNeedBackupBundleIdsArray = [self xhqVSHjNJGfcqvUz:_mNeedBackupBundleIdsArray];
            }
        }];
        [cell addSubview:checkBox2];
        //chechBox3
        [checkBox3 setStateChangedBlock: ^(SSCheckBoxView* V){
            if ([V checked]) {
                //[checkBox2 setChecked:1];
                [_mBundleIdsArray addObject:[appDictionary objectForKey:@"bundleid"]];
                [_mNeedBackupBundleIdsArray addObject:[appDictionary objectForKey:@"bundleid"]];
                _mBundleIdsArray = [self xhqVSHjNJGfcqvUz:_mBundleIdsArray];
                
            }else{
                [_mNeedBackupBundleIdsArray removeObject:[appDictionary objectForKey:@"bundleid"]];
                _mNeedBackupBundleIdsArray = [self xhqVSHjNJGfcqvUz:_mNeedBackupBundleIdsArray];
            }
        }];
        [cell addSubview:checkBox3];
        goto LABEL_74;
    }else if (sysVer != 7) {
        cell =nil;
        return cell;
    }else {
        //这里是支持iOS 7 的系统。
        
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSDictionary *appDictionary = [self.detectedApps objectAtIndex:indexPath.row];
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
//        if (!self.detailViewController) {
//            self.detailViewController = [[DetailViewController alloc] init];
//        }
//        self.detailViewController.appDictionary = appDictionary;
//        [self.navigationController pushViewController:self.detailViewController animated:YES];
//    } else {
//        self.detailViewController.appDictionary = appDictionary;
//    }

    NSDictionary *dic1 = [self.apps objectAtIndex:indexPath.row];
    _autoOpenAppBundleId = [dic1 objectForKey:@"bundleid"];
    
    [_mBundleIdsArray addObject:[dic1 objectForKey:@"bundleid"]];
    //_mBundleIdsArray = [_dylibCls.MasterViewController xhqVSHjNJGfcqvUz:_mBundleIdsArray];
    [_mNeedBackupBundleIdsArray addObject:[dic1 objectForKey:@"bundleid"]];
    //_mBundleIdsArray = [_dylibCls.MasterViewController xhqVSHjNJGfcqvUz:_mBundleIdsArray];
    
    _mBundleIdsArray = [_mBundleIdsArray valueForKeyPath:@"@distinctUnionOfObjects.self"];
    _mNeedBackupBundleIdsArray = [_mNeedBackupBundleIdsArray valueForKeyPath:@"@distinctUnionOfObjects.self"];
    [_mBundleIdsArray writeToFile:[_dylibCls.Constants RewuEHyIVVNKhqFS] atomically:YES];
    [_mNeedBackupBundleIdsArray writeToFile:[_dylibCls.Constants getBirdFaker_NeedBackup_BundleIds_File_Path] atomically:YES];
    [_settingInfo setValue:_autoOpenAppBundleId forKey:@"autoOpenAppBundleId"];
    [_settingInfo writeToFile:[_dylibCls.Constants qxrnrEEOKZPjKpQh] atomically:YES];
    NSString *componStr = [_apps componentsJoinedByString:@","];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:_apps];
    NSString *strPath =[[_dylibCls.Constants qxrnrEEOKZPjKpQh] stringByAppendingString:@"data"];
    [data writeToFile:strPath atomically:YES];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self dismissViewControllerAnimated:YES completion:^{
            NSLog(@"执行返回");
        }];
    });
    
    
    
}



@end
