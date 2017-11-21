//
//  NSURLExtensionTests.m
//  FoundationExtensionsTests
//
//  Created by Kirill Ushkov on 21.11.17.
//  Copyright © 2017 itomy.ch. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSURL+Directories.h"

@interface NSURLExtensionTests : XCTestCase

@end


@implementation NSURLExtensionTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDocumentsDirectoryURL {
    NSURL *documentsURL = [NSURL documentDirectoryURL];
    XCTAssertTrue([documentsURL isFileURL], @"Documents url should be file URL");
    
    NSNumber *isDirectory;
    [documentsURL getResourceValue:&isDirectory forKey:NSURLIsDirectoryKey error:nil];
    XCTAssertTrue([isDirectory boolValue], @"Documents url should be directory");
}

- (void)testTempoparyURL {
    NSURL *tempoparyFolderURL = [NSURL temporaryDirectoryURL];
    XCTAssertTrue([tempoparyFolderURL isFileURL], @"Temp folder url should be file URL");

    NSNumber *isDirectory;
    [tempoparyFolderURL getResourceValue:&isDirectory forKey:NSURLIsDirectoryKey error:nil];
    XCTAssertTrue([isDirectory boolValue], @"Temp folder url should be directory");

    NSString *folderTitle = [tempoparyFolderURL lastPathComponent];
    NSString *tempFolderTitle = [NSTemporaryDirectory() lastPathComponent];
    
    XCTAssertTrue([folderTitle isEqualToString: tempFolderTitle], @"Temp folder should have pre-defined name");
}

@end
