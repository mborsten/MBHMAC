//
//  MBHMACTests.m
//  MBHMACTests
//
//
//  Created by Marcel Borsten on 5/21/13.
//  Copyright (c) 2013 Marcel Borsten All rights reserved.
//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the
//  "Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to
//  the following conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "MBHMACTests.h"
#import "NSString+MBHMAC.h"

@interface MBHMACTests ()
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *key;
@end

@implementation MBHMACTests

- (void)setUp
{
    [super setUp];
    _message = @"The quick brown fox jumps over the lazy dog";
    _key = @"secret";
}

- (void)tearDown
{
    _key = nil;
    _message = nil;
    [super tearDown];
}

- (void)testHashUsingSHA1
{
    NSString *expectedResult = @"198ea1ea04c435c1246b586a06d5cf11c3ffcda6";
    NSString *testObject = [_message hmacWithHashingAlgorithm:kCCHmacAlgSHA1
                                                          key:_key];
    STAssertEqualObjects(testObject, expectedResult, @"hash should equal expected result");
}

- (void)testHashUsingSHA1NoKey
{
    NSString *expectedResult = @"2ba7f707ad5f187c412de3106583c3111d668de8";
    NSString *testObject = [_message hmacWithHashingAlgorithm:kCCHmacAlgSHA1
                                                          key:@""];
    STAssertEqualObjects(testObject, expectedResult, @"hash should equal expected result");
}

- (void)testHashUsingMD5
{
    NSString *expectedResult = @"2e3f3742c21be88e64deb2127fe792d2";
    NSString *testObject = [_message hmacWithHashingAlgorithm:kCCHmacAlgMD5
                                                          key:_key];
    STAssertEqualObjects(testObject, expectedResult, @"hash should equal expected result");
}

- (void)testHashUsingMD5NoKey
{
    NSString *expectedResult = @"ad262969c53bc16032f160081c4a07a0";
    NSString *testObject = [_message hmacWithHashingAlgorithm:kCCHmacAlgMD5
                                                          key:@""];
    STAssertEqualObjects(testObject, expectedResult, @"hash should equal expected result");
}

- (void)testHashUsingSHA256
{
    NSString *expectedResult = @"54cd5b827c0ec938fa072a29b177469c843317b095591dc846767aa338bac600";
    NSString *testObject = [_message hmacWithHashingAlgorithm:kCCHmacAlgSHA256
                                                          key:_key];
    STAssertEqualObjects(testObject, expectedResult, @"hash should equal expected result");
}

- (void)testHashUsingSHA256NoKey
{
    NSString *expectedResult = @"fb011e6154a19b9a4c767373c305275a5a69e8b68b0b4c9200c383dced19a416";
    NSString *testObject = [_message hmacWithHashingAlgorithm:kCCHmacAlgSHA256
                                                          key:@""];
    STAssertEqualObjects(testObject, expectedResult, @"hash should equal expected result");
}

- (void)testHashUsingSHA384
{
    NSString *expectedResult = @"bf8a22d3bd5cf88e0f41fa90eeb00eb908fccd925d55a7305f23e206358bb488fbef01039308e434c255e59f8e3badc3";
    NSString *testObject = [_message hmacWithHashingAlgorithm:kCCHmacAlgSHA384
                                                          key:_key];
    STAssertEqualObjects(testObject, expectedResult, @"hash should equal expected result");
}

- (void)testHashUsingSHA384NoKey
{
    NSString *expectedResult = @"0a3d8f99afb726f97d32cc513f3a5ad51246984fd3e916cefb82fc7967ee42eae547cd88aefd84493d2585e55906e1b0";
    NSString *testObject = [_message hmacWithHashingAlgorithm:kCCHmacAlgSHA384
                                                          key:@""];
    STAssertEqualObjects(testObject, expectedResult, @"hash should equal expected result");
}

- (void)testHashUsingSHA512
{
    NSString *expectedResult = @"76af3588620ef6e2c244d5a360e080c0d649b6dd6b82ccd115eeefee8ff403bcee9aeb08618db9a2a94a9e80c7996bb2cb0c00f6e69de38ed8af2758ef39df0a";
    NSString *testObject = [_message hmacWithHashingAlgorithm:kCCHmacAlgSHA512
                                                          key:_key];
    STAssertEqualObjects(testObject, expectedResult, @"hash should equal expected result");
}

- (void)testHashUsingSHA512NoKey
{
    NSString *expectedResult = @"1de78322e11d7f8f1035c12740f2b902353f6f4ac4233ae455baccdf9f37791566e790d5c7682aad5d3ceca2feff4d3f3fdfd9a140c82a66324e9442b8af71b6";
    NSString *testObject = [_message hmacWithHashingAlgorithm:kCCHmacAlgSHA512
                                                          key:@""];
    STAssertEqualObjects(testObject, expectedResult, @"hash should equal expected result");
}

@end
