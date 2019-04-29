//
//  NSString+MD5.h
//  DrawRactTest
//
//  Created by ZF on 16/3/23.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5)
/**
 *  32位加密
 *
 *  @param upperCase 大小写
 *
 *  @return 加密字符串
 */
- (NSString *)encodeUsing32BitsMD5WithUpperCaseOption:(BOOL)upperCase;
/**
 *  16位加密
 *
 *  @param upperCase 大小写
 *
 *  @return 加密字符串
 */
- (NSString *)encodeUsing16BitsMD5WithUpperCaseOption:(BOOL)upperCase;

@end
