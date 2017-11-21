//
//  NSStringExtensionsTests.m
//  FoundationExtensionsTests
//
//  Created by Kirill Ushkov on 21.11.17.
//  Copyright © 2017 itomy.ch. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+Validation.h"

@interface NSStringExtensionsTests : XCTestCase

@end

@implementation NSStringExtensionsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNSStringIsEmailValid {
    NSString *plistPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"EmailTests" ofType:@"plist"];
    NSArray *cases = [NSArray arrayWithContentsOfFile:plistPath];
    
    for (NSInteger i = 0; i < cases.count - 1; i++) {
        NSString *emailCase = cases[i];
        XCTAssertFalse([emailCase isValidEmail]);
    }
    
    NSString *emailCase = [cases lastObject];
    XCTAssertTrue([emailCase isValidEmail]);
}

- (void)testNSStringIsEmpty {
    NSArray<NSString*> *cases = @[@"", @"not empty", @"      "];
    
    XCTAssertTrue([cases[0] isEmpty]);
    XCTAssertFalse([cases[1] isEmpty]);
    XCTAssertTrue([cases[2] isEmpty]);
}

- (void)testNSStringContainsOnlyAlphaNumeric {
    NSArray<NSString*> *cases = @[@"asdfasdfasdf", @"3453453", @"   ", @"asgjdfh32145", @"432#$%fgjhs", @"", @"$#$"];

    XCTAssertFalse([cases[0] isEmpty]);
    XCTAssertFalse([cases[1] isEmpty]);
    XCTAssertTrue([cases[2] isEmpty]);
    XCTAssertFalse([cases[3] isEmpty]);
    XCTAssertFalse([cases[4] isEmpty]);
    XCTAssertTrue([cases[5] isEmpty]);
    XCTAssertFalse([cases[6] isEmpty]);
}

@end
