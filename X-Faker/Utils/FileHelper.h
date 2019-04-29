//
//  FileHelper.h
//  X-Faker
//
//  Created by whois on 2018/12/19.
//  Copyright © 2018年 whois. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/NSObject.h>

__attribute__((visibility("hidden")))
@interface WIM_FileHelper : NSObject
{
}
+ (instancetype)sharedInstance;
- (_Bool)wIHOHydDoolvxrdD:(id)arg1 owner:(id)arg2 ownerGroup:(id)arg3;
- (_Bool)KTyKvIYAPWBLFrZa:(id)arg1;
- (_Bool)isDirectoryExit:(NSString *)arg1;
- (_Bool)appendDictionary:(id)arg1 dicData:(id)arg2;
- (void)deleteFile:(id)arg1 fileName:(id)arg2;
- (id)getFileAttriutes:(id)arg1;
- (id)readFile:(id)arg1;
- (void)writeFile:(id)arg1 arraycContent:(id)arg2;
- (void)writeFile:(id)arg1 strcontent:(id)arg2;
- (void)createFile:(id)arg1;
- (id)getTempPath;
- (id)getCachePath;
- (void)deleteFile:(id)arg1;
- (id)getFileAttribute:(id)arg1;
- (id)getDocPath;
- (id)getHomePath;

@end

