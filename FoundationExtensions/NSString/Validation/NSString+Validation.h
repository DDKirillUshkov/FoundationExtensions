//
//  NSString+Validation.h
//

#import <Foundation/Foundation.h>

@interface NSString (Validation)
- (BOOL)isValidEmail;
- (BOOL)isEmpty;
- (BOOL)containsOnlyAlphaNumeric;
@end
