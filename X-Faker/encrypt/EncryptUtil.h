//
//  EncryptUtil.h
//  X-Faker
//
//  Created by whois on 2018/12/15.
//  Copyright © 2018年 whois. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTMBase64.h"
#import "GTMDefines.h"
#import "NSData+crypt.h"
#import "NSString+MD5.h"
#import "NSString+_DES.h"
#import "NSString+SHA1.h"
#import <CommonCrypto/CommonCrypto.h>
@interface EncryptUtil1 : NSObject

+ (NSString *)encryptOrDecrypt:(NSString *)srcStr1 encryptOrDecrypt:(CCOperation)encryptOperation key:(NSString *)key;
//解密
+ (NSString *) MWerGhKZaDBbiUxH:(NSString *)srcStr;
//加密
+ (NSString *) vHCspdGrJYjXlaGh:(NSString *)srcStr;


@end
