//
//  NSString+NSString_KPAAdditions.m
//  EmailCorrectionProjector
//
//  Created by Kenny Ackerson on 1/17/15.
//  Copyright (c) 2015 Kenny Ackerson. All rights reserved.
//

#import "NSString+KPAAdditions.h"

@implementation NSString (KPAAdditions)

- (NSInteger)composedCharacterDifferencesFromString:(NSString *)fromString {
    if ([self isEqualToString:fromString]) {
        return 0;
    }
    
    if (self.length != fromString.length) {
        return -1;
    }
    
    __block NSInteger i = 0;
    
    // The other here is less important
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        
        [fromString enumerateSubstringsInRange:substringRange options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substringSecond, NSRange substringRangeSecond, NSRange enclosingRangeSecond, BOOL *stopSecond) {
            
            if (![substring isEqualToString:substringSecond]) {
                i++;
            }
        }];
        
    }];
    
    return i;
}



@end
