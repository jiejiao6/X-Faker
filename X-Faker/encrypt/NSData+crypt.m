//
//  NSData+crypt.m
//  DrawRactTest
//
//  Created by ZF on 16/3/23.
//  Copyright © 2016年 ZF. All rights reserved.
//  该分类用来加密解密

#import "NSData+crypt.h"
#import <CommonCrypto/CommonCrypto.h>

 static char base64[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

@implementation NSData (crypt)
/**
 *  AES加密
 *
 *  @param key 明文
 *
 *  @return 返回加密数据
 */
- (NSData *)AES256EncryptWithKey:(NSString *)key {
    
            char keyPtr[kCCKeySizeAES256+1];
           bzero(keyPtr, sizeof(keyPtr));
    
            [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
           NSUInteger dataLength = [self length];
   
            size_t bufferSize = dataLength + kCCBlockSizeAES128;
            void *buffer = malloc(bufferSize);
    
            size_t numBytesEncrypted = 0;
            CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128,
                                                      kCCOptionPKCS7Padding | kCCOptionECBMode,
                                                                                                                                keyPtr, kCCBlockSizeAES128,
                                                                                                                              NULL,
                                                                                                                               [self bytes], dataLength,
                                                                                                                               buffer, bufferSize,
                                                                                                                              &numBytesEncrypted);
            if (cryptStatus == kCCSuccess) {
                        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
                 }
             free(buffer);
             return nil;
}

/**
 *  AES解密
 *
 *  @param key 密文
 *
 *  @return 返回解谜数据
 */
- (NSData *)AES256DecryptWithKey:(NSString *)key {
    
         char keyPtr[kCCKeySizeAES256+1];
         bzero(keyPtr, sizeof(keyPtr));
    
          [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
          NSUInteger dataLength = [self length];
    
          size_t bufferSize = dataLength + kCCBlockSizeAES128;
          void *buffer = malloc(bufferSize);

         size_t numBytesDecrypted = 0;
         CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                                                                                                               kCCOptionPKCS7Padding | kCCOptionECBMode,
                                                                                                                               keyPtr, kCCBlockSizeAES128,
                                                                                                                            NULL,
                                                                                                                               [self bytes], dataLength,
                                                                                                                               buffer, bufferSize,
                                                                                                                               &numBytesDecrypted);
    
          if (cryptStatus == kCCSuccess) {
              
            return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
              
          }
        free(buffer);
        return nil;
}
/**
 *  二进制转成base64字符串
 *
 *  @return 返回base64数据
 */
- (NSString *)newStringInBase64FromData {
     
        NSMutableString *dest = [[NSMutableString alloc] initWithString:@""];
        unsigned char * working = (unsigned char *)[self bytes];
        NSUInteger srcLen = [self length];

         for (int i=0; i<srcLen; i += 3) {
             for (int nib=0; nib<4; nib++) {
                    int byt = (nib == 0)?0:nib-1;
                    int ix = (nib+1)*2;
    
                    if (i+byt >= srcLen) break;
    
                    unsigned char curr = ((working[i+byt] << (8-ix)) & 0x3F);
    
                    if (i+nib < srcLen) curr |= ((working[i+nib] >> ix) & 0x3F);
    
                    [dest appendFormat:@"%c", base64[curr]];
            }
        }
    return dest;
}
@end
