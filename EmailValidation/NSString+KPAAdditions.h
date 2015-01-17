//
//  NSString+NSString_KPAAdditions.h
//  EmailCorrectionProjector
//
//  Created by Kenny Ackerson on 1/17/15.
//  Copyright (c) 2015 Kenny Ackerson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (KPAAdditions)

/**
 *  Strings must be same length! 
 *  Very, very naive implementation of character difference counting. Good enough for this purposes though.
 *
 *  @param fromString The string to compare to.
 *
 *  @return The amount of difference between this string and the string passed in.
 */
- (NSInteger)composedCharacterDifferencesFromString:(NSString *)fromString;

@end
