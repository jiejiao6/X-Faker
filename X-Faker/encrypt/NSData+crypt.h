//
//  NSData+crypt.h
//  DrawRactTest
//
//  Created by ZF on 16/3/23.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (crypt)
/**加密*/
- (NSData *)AES256EncryptWithKey:(NSString *)key;
/**解密*/
- (NSData *)AES256DecryptWithKey:(NSString *)key;
/**二进制转成Base64字符串*/
- (NSString *)newStringInBase64FromData;
@end
