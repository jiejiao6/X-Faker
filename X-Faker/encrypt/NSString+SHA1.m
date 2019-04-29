//
//  NSString+SHA1.m
//  DrawRactTest
//
//  Created by ZF on 16/3/25.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "NSString+SHA1.h"
#import <CommonCrypto/CommonCrypto.h>
#import "GTMBase64.h"
/**
 *  MD5,SHA-1,SHA-224,SHA-256,SHA-384,SHA-512，以及它们对应的HMAC算法，都属于散列算法，又叫摘要算法，单向运算，不可逆，所以没法解密。
 */
@implementation NSString (SHA1)
/**
 *  SHA1加密
 *
 *  @return 返回加密结果
 */
- (NSString*) SHA1
{
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (unsigned)data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

/**
 *  SHA1加密base64转码
 *
 *  @return 返回加密转码后的字符串
 */
- (NSString *) SHA1_base64
{
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (unsigned)data.length, digest);
    
    NSData * base64 = [[NSData alloc]initWithBytes:digest length:CC_SHA1_DIGEST_LENGTH];
    base64 = [GTMBase64 encodeData:base64];//转码
    
    NSString * output = [[NSString alloc] initWithData:base64 encoding:NSUTF8StringEncoding];
    return output;
}

/**
 *  md5加密
 *
 *  @return 返回加密数据
 */
- (NSString *) md5
{
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (unsigned)strlen(cStr), digest );
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}
/**
 *  md5加密 加base64转码
 *
 *  @return 加密转码后的字符串
 */
- (NSString *) md5_base64
{
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (unsigned)strlen(cStr), digest );
    
    NSData * base64 = [[NSData alloc]initWithBytes:digest length:CC_MD5_DIGEST_LENGTH];
    base64 = [GTMBase64 encodeData:base64];
    
    NSString * output = [[NSString alloc] initWithData:base64 encoding:NSUTF8StringEncoding];
    return output;
}
@end
