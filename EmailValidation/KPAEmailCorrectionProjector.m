//
//  KPAEmailCorrectionProjector.m
//  EmailCorrectionProjector
//
//  Created by Kenny Ackerson on 12/13/14.
//  Copyright (c) 2014 Kenny Ackerson. All rights reserved.
//

#import "KPAEmailCorrectionProjector.h"
#import "NSString+KPAAdditions.h"

@implementation KPAEmailCorrectionProjector

+ (void)projectEmailAccuracy:(KPAEmail *)email completion:(KPAEmailCorrectorCompletionBlock)completion {
    
    if (!email) {
        completion(NO, nil, KPAEmailCorrectorProjectionAccuracyUnknown);
        return;
    }
    
    NSMutableArray *semiGoodProjections = [[NSMutableArray alloc] init];
    NSMutableArray *goodProjections = [[NSMutableArray alloc] init];
    
    for (NSString *es in [self domains]) {
        NSInteger numberOfDifferences = [email.domain composedCharacterDifferencesFromString:es];

        if (numberOfDifferences == 0) {
            completion(NO, email, KPAEmailCorrectorProjectionAccuracyUnknown);
            return;
        } else if (numberOfDifferences == 1) {
            [goodProjections addObject:[[KPAEmail alloc] initWithUserName:email.userName domain:es andTLD:email.TLD]];
        } else if (numberOfDifferences == 2) {
            [semiGoodProjections addObject:[[KPAEmail alloc] initWithUserName:email.userName domain:es andTLD:email.TLD]];
        }
    }
    
    BOOL (^iterateAndFindProjection)(NSArray *projections, KPAEmailCorrectorProjectionAccuracy accuracy) = ^BOOL(NSArray *projections, KPAEmailCorrectorProjectionAccuracy accuracy) {
        for (KPAEmail *es in projections) {
            if ([[email.domain substringToIndex:1] composedCharacterDifferencesFromString:[es.domain substringToIndex:1]] == 0) {
                completion(YES, [[KPAEmail alloc] initWithUserName:email.userName domain:es.domain andTLD:email.TLD], accuracy);
                return YES;
            }
        }
        return NO;
    };
    
    if (iterateAndFindProjection(goodProjections, KPAEmailCorrectorProjectionAccuracyMedium)) {
        return;
    }
    
    if (iterateAndFindProjection(semiGoodProjections, KPAEmailCorrectorProjectionAccuracyLow)) {
        return;
    }
    
    KPAEmail *guessToGive = [goodProjections firstObject];
    
    KPAEmailCorrectorProjectionAccuracy accuracy = KPAEmailCorrectorProjectionAccuracyLow;
    
    if (!guessToGive) {
        accuracy = KPAEmailCorrectorProjectionAccuracyInaccurate;
        guessToGive = [semiGoodProjections firstObject];
    }
    
    BOOL madeProjection = (guessToGive != nil);
    
    completion(madeProjection, guessToGive, (madeProjection ? accuracy : KPAEmailCorrectorProjectionAccuracyUnknown));

}

// The known domains to use to base the projections off of.
+ (NSArray *)domains {
    return [NSArray arrayWithObjects:@"gmail", @"yahoo", @"msn", @"icloud", @"ymail", @"facebook", @"aol", @"outlook", nil];
}

@end
