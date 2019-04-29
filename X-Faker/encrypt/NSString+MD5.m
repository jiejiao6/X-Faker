//
//  NSString+MD5.m
//  DrawRactTest
//
//  Created by ZF on 16/3/23.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (MD5)
/**
 *  32位MD5加密
 *
 *  @param string           加密字符串
 *  @param upperCase 加密选项 {YES:大写；NO:小写}
 *
 *  @return 加密后的字符串
 */
- (NSString *)encodeUsing32BitsMD5WithUpperCaseOption:(BOOL)upperCase{
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (unsigned)strlen(cStr), digest );
    NSMutableString *encodeString = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [encodeString appendFormat:@"%02x", digest[i]];
    
    NSString *cipherText = nil;
    
    if (upperCase) {
        cipherText = [encodeString uppercaseString];
    }else{
        cipherText = [encodeString lowercaseString];
    }
    
    return cipherText;
}


/**
 *  16位MD5加密
 *
 *  @param plainText        明文
 *  @param upperCase 大小写选项
 *
 *  @return 加密结果
 */
- (NSString *)encodeUsing16BitsMD5WithUpperCaseOption:(BOOL)upperCase{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (unsigned)strlen(cStr), result);
    
    NSString *encodeString = [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                              result[0], result[1], result[2], result[3],
                              result[4], result[5], result[6], result[7],
                              result[8], result[9], result[10], result[11],
                              result[12], result[13], result[14], result[15]
                              ];
    
    NSString *cipherText = nil;
    
    if (upperCase) {
        cipherText = [encodeString uppercaseString];
    }else{
        cipherText = [encodeString lowercaseString];
    }
    
    return cipherText;
}


@end
