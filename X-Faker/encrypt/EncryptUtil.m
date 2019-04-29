//
//  EncryptUtil.m
//  X-Faker
//
//  Created by whois on 2018/12/15.
//  Copyright © 2018年 whois. All rights reserved.
//

#import "EncryptUtil.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation EncryptUtil1




+ (NSString *)encryptOrDecrypt:(NSString *)srcStr encryptOrDecrypt:(CCOperation)encryptOperation key:(NSString *)key1
{
    
    Class cEncryptUtil = NSClassFromString(@"EncryptUtil");
    NSString * cipher =[cEncryptUtil DrtKqgfDEPvmyXEP:srcStr encryptOrDecrypt:encryptOperation key:key1];
    //NSArray *arr=[NSArray arrayWithObjects:srcStr,encryptOperation,key1, nil];
    //NSString * cipher = [cEncryptUtil performSelector:NSSelectorFromString(@"DrtKqgfDEPvmyXEP:encryptOrDecrypt:key:") withObjects:arr];
    NSLog(@"ciphertext： %@", cipher);
    
    
    const void *vplainText;
    size_t plainTextBufferSize;
    //NSString *srcStr =[[NSString alloc]initWithUTF8String:"dlvXS8jCkYFQUk5r9O3mAg=="];
    if (encryptOperation == kCCDecrypt)
    {
        NSData *decryptData = [NSData dataWithContentsOfFile:@"/Users/whois/Desktop/123.bin"];
        //NSData *decryptData = [GTMBase64 decodeData:[srcStr dataUsingEncoding:NSUTF8StringEncoding]];
        plainTextBufferSize = [decryptData length];
        vplainText = [decryptData bytes];
        
    }
    else
    {
        NSData* encryptData = [srcStr dataUsingEncoding:NSUTF8StringEncoding];
        plainTextBufferSize = [encryptData length];
        vplainText = (const void *)[encryptData bytes];
    }
    
    CCCryptorStatus ccStatus;
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    
    bufferPtrSize = ((plainTextBufferSize + 8) & -8uLL);
    bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
    bzero((void *)bufferPtr, bufferPtrSize);
    NSString *key =@"Kurodo";
    NSString *initVec = @"init Kurodo";
    const void *vkey = (const void *) [key UTF8String];
    const void *vinitVec = (const void *) [initVec UTF8String];

    ccStatus = CCCrypt(encryptOperation,2LL,1LL,vkey,24,vinitVec,vplainText,plainTextBufferSize,(void *)bufferPtr,bufferPtrSize,&movedBytes);

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

//加密
+ (NSString *) MWerGhKZaDBbiUxH:(NSString *)srcStr{
    return [EncryptUtil1 encryptOrDecrypt:srcStr encryptOrDecrypt:kCCEncrypt key:@"Kurodo"];
}

//解密
+ (NSString *) vHCspdGrJYjXlaGh:(NSString *)srcStr{
    return [EncryptUtil1 encryptOrDecrypt:srcStr encryptOrDecrypt:kCCDecrypt key:@"Kurodo"];
}
@end
