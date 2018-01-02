//
//  DESUtility.h
//  StudentLive
//
//  Created by Liuzhao on 13-9-2.
//  Copyright (c) 2013年 hqyxedu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>


@interface DESUtility : NSObject

+ (NSString *)doCipher:(NSString *)sTextIn key:(NSString *)sKey context:(CCOperation)encryptOrDecrypt;

+ (NSString *)encryptStr:(NSString *) str;

+ (NSString *)decryptStr:(NSString *) str;

+ (NSString *)encryptStr:(NSString *)str withKey:(NSString *)key;

+ (NSString *)decryptStr:(NSString *) str withKey:(NSString *)key;

+ (NSData *)decryptPath:(NSString *)path withKey:(NSString *)key;

@end
