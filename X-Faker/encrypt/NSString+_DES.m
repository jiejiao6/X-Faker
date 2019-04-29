//
//  NSString+_DES.m
//  DrawRactTest
//
//  Created by ZF on 16/3/23.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "NSString+_DES.h"
#import <CommonCrypto/CommonCrypto.h>
#import "GTMBase64.h"//这个导进来  .m文件需要修改 -fno-objc-arc

@implementation NSString (_DES)
/**
 *  加密/解密
 *  @param encryptOperation 加密还是解密
 *  @param key              密钥
 *
 *  @return 返回加密/解密对象
 */
- (NSString *)encryptOrDecrypt:(CCOperation)encryptOperation key:(NSString *)key
{
    const void *vplainText;
    size_t plainTextBufferSize;
    
    if (encryptOperation == kCCDecrypt)
    {
        NSData *decryptData = [GTMBase64 decodeData:[self dataUsingEncoding:NSUTF8StringEncoding]];
        plainTextBufferSize = [decryptData length];
        vplainText = [decryptData bytes];
    }
    else
    {
        NSData* encryptData = [self dataUsingEncoding:NSUTF8StringEncoding];
        plainTextBufferSize = [encryptData length];
        vplainText = (const void *)[encryptData bytes];
    }
    
    CCCryptorStatus ccStatus;
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    
    bufferPtrSize = (plainTextBufferSize + kCCBlockSize3DES) & ~(kCCBlockSize3DES - 1);
    bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    
    NSString *initVec = @"init Kurodo";
    const void *vkey = (const void *) [key UTF8String];
    const void *vinitVec = (const void *) [initVec UTF8String];
    
    ccStatus = CCCrypt(encryptOperation,
                       kCCAlgorithm3DES,//这个地方的参数可以选很多
                       kCCOptionPKCS7Padding,
                       vkey,
                       kCCKeySize3DES,
                       vinitVec,
                       vplainText,
                       plainTextBufferSize,
                       (void *)bufferPtr,
                       bufferPtrSize,
                       &movedBytes);
    
    NSString *result = nil;
    
    if (encryptOperation == kCCDecrypt)
    {
        result = [[NSString alloc] initWithData:[NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)movedBytes] encoding:NSUTF8StringEncoding];
    }
    else
    {
        NSData *data = [NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)movedBytes];
        result = [GTMBase64 stringByEncodingData:data];
    }
    
    return result;
}
/**
 *  3DES加密
 *
 *  @param sText 密钥
 *
 *  @return 返回加密结果
 */
- (NSString *)encryptWithText:(NSString *)passWord
{
    return [self  encryptOrDecrypt:kCCEncrypt key:passWord];
}
/**
 *  3DES解密
 *
 *  @param sText 密钥
 *
 *  @return 返回解谜结果
 */
- (NSString *)decryptWithText:(NSString *)passWord
{
    return [self  encryptOrDecrypt:kCCDecrypt key:passWord];
}
@end
