//
//  NSString+MBHMAC.h
//  MBHMAC
//
//  Created by Marcel Borsten on 5/21/13.
//  Copyright (c) 2013 Impart I.T. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>

@interface NSString (MBHMAC)

/**
 * @brief Generates a HMAC with a given key
 * @param algorithm The hashing algorithm that is going to be used to
 * create the HMAC:
 kCCHmacAlgSHA1,
 kCCHmacAlgMD5,
 kCCHmacAlgSHA256,
 kCCHmacAlgSHA384,
 kCCHmacAlgSHA512,
 kCCHmacAlgSHA224
 * @param keyString the secret key to be used to create the HMAC
 * @return The HMAC in base64 string format
 */
-(NSString *)hmacWithHashingAlgorithm:(CCHmacAlgorithm)algorithm
                                  key:(NSString *)keyString;

@end
