//
//  NSString+MBHMAC.m
//  MBHMAC
//
//  Created by Marcel Borsten on 5/21/13.
//  Copyright (c) 2013 Impart I.T. All rights reserved.
//

#import "NSString+MBHMAC.h"

@implementation NSString (MBHMAC)

-(NSString *)hmacWithHashingAlgorithm:(CCHmacAlgorithm)algorithm
                                  key:(NSString *)keyString
{
    const char *key = [keyString cStringUsingEncoding:NSUTF8StringEncoding];
    const char *data = [self cStringUsingEncoding:NSUTF8StringEncoding];
    unsigned char cHMAC[[self lengthForAlgorithm:algorithm]];
    CCHmac(algorithm, key, strlen(key), data, strlen(data), cHMAC);
    NSData *resultData = [[NSData alloc] initWithBytes:cHMAC
                                                length:sizeof(cHMAC)];
    char *utf8;
    utf8 = (char *)[resultData bytes];
    NSMutableString *hex = [NSMutableString string];
    while ( *utf8 ) [hex appendFormat:@"%02X" , *utf8++ & 0x00FF];
    return [NSString stringWithFormat:@"%@", hex];
}

-(int)lengthForAlgorithm:(CCHmacAlgorithm)a
{
    int length = 0;
    
    switch (a) {
        case kCCHmacAlgSHA1:
            length = CC_SHA1_DIGEST_LENGTH;
            break;
        case kCCHmacAlgMD5:
            length = CC_MD5_DIGEST_LENGTH;
            break;
        case kCCHmacAlgSHA256:
            length = CC_SHA256_DIGEST_LENGTH;
            break;
        case kCCHmacAlgSHA384:
            length = CC_SHA384_DIGEST_LENGTH;
            break;
        case kCCHmacAlgSHA512:
            length = CC_SHA512_DIGEST_LENGTH;
            break;
    }
    return length;
}

@end
