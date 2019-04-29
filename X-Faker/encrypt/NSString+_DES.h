//
//  NSString+_DES.h
//  DrawRactTest
//
//  Created by ZF on 16/3/23.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (_DES)
/**
 *  加密
 */
- (NSString *)encryptWithText:(NSString *)passWord;
/**
 *  解密
 *
 */
- (NSString *)decryptWithText:(NSString *)passWord;
@end
