//
//  DESUtility.m
//  StudentLive
//
//  Created by Liuzhao on 13-9-2.
//  Copyright (c) 2013年 Liuzhao. All rights reserved.
//
//  Main function:加密处理类
//
//  Other specifications:
//
//  ************************************************************************

#import "DESUtility.h"
#import "NSString+Encrypt.h"

static NSString *_key = @"BJJW_ABBUS_SSGJ_2013";

@implementation DESUtility

+ (NSData *)decryptPath:(NSString *)path withKey:(NSString *)key {
    return nil;
}

+ (NSString *)encryptStr:(NSString *)str {
	return [DESUtility doCipher:str key:_key context:kCCEncrypt];
}

+ (NSString *)decryptStr:(NSString *)str {
	return [DESUtility doCipher:str key:_key context:kCCDecrypt];
}

+ (NSString *)encryptStr:(NSString *)str withKey:(NSString *)key {
    return [DESUtility doCipher:str key:key context:kCCEncrypt];
}

+ (NSString *)decryptStr:(NSString *)str withKey:(NSString *)key {
	return [DESUtility doCipher:str key:key context:kCCDecrypt];
}

+ (NSString *)doCipher:(NSString *)sTextIn key:(NSString *)sKey
			   context:(CCOperation)encryptOrDecrypt {
	NSStringEncoding EnC = NSUTF8StringEncoding;
	
    NSMutableData *dTextIn;
    if (encryptOrDecrypt == kCCDecrypt) {
        // ios7自带base64转换方法
        dTextIn = [[NSMutableData alloc] initWithBase64EncodedString:sTextIn options:0];
    }
    else {
        dTextIn = [[sTextIn dataUsingEncoding:EnC] mutableCopy];
    }
    NSMutableData *dKey = [[sKey dataUsingEncoding:EnC] mutableCopy];
    [dKey setLength:kCCBlockSizeDES];
    uint8_t *bufferPtr1 = NULL;
    size_t bufferPtrSize1 = 0;
    size_t movedBytes1 = 0;
	Byte iv[] = {0x12, 0x34, 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF};
    bufferPtrSize1 = ([sTextIn length] + kCCKeySizeDES) & ~(kCCKeySizeDES -1);
    bufferPtr1 = malloc(bufferPtrSize1 * sizeof(uint8_t));
    memset((void *)bufferPtr1, 0x00, bufferPtrSize1);
	CCCrypt(encryptOrDecrypt, // CCOperation op
			kCCAlgorithmDES, // CCAlgorithm alg
			kCCOptionPKCS7Padding, // CCOptions options
			[dKey bytes], // const void *key
			[dKey length], // size_t keyLength
			iv, // const void *iv
			[dTextIn bytes], // const void *dataIn
			[dTextIn length],  // size_t dataInLength
			(void *)bufferPtr1, // void *dataOut
			bufferPtrSize1,     // size_t dataOutAvailable
			&movedBytes1);      // size_t *dataOutMoved
    
    NSString *sResult;
    if (encryptOrDecrypt == kCCDecrypt){
        sResult = [[NSString alloc] initWithData:[NSData dataWithBytes:bufferPtr1
                                                                length:movedBytes1] encoding:EnC];
    }
    else {        
        NSData *dResult = [NSData dataWithBytes:bufferPtr1 length:movedBytes1];
        // ios7系统自带转base64方法
        sResult = [dResult base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    }
    return sResult;
}

@end
