//
//  NSURL+Directories.m
//

#import "NSURL+Directories.h"

@implementation NSURL (Directories)

+ (NSURL *)documentDirectoryURL {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
}

+ (NSURL *)temporaryDirectoryURL {
    return [NSURL fileURLWithPath:NSTemporaryDirectory() isDirectory:YES];
}

@end
