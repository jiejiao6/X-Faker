//
//  NSString+SHA1.h
//  DrawRactTest
//
//  Created by ZF on 16/3/25.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SHA1)
/**
 *  SHA1加密
 */
- (NSString *) SHA1;
/**
 *  SHA1加密加base64转码
 */
- (NSString *) SHA1_base64;
/**
 *  md5加密
 */
- (NSString *) md5;
/**
 *  md5加密加base64转码
 */
- (NSString *) md5_base64;
@end
