//
//  KPAEmailCorrectionProjector.h
//  EmailCorrectionProjector
//
//  Created by Kenny Ackerson on 12/13/14.
//  Copyright (c) 2014 Kenny Ackerson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KPAEmail.h"

typedef NS_ENUM(NSInteger, KPAEmailCorrectorProjectionAccuracy) {
    KPAEmailCorrectorProjectionAccuracyUnknown = -1,
    KPAEmailCorrectorProjectionAccuracyInaccurate, // Inaccurate, most likely.
    KPAEmailCorrectorProjectionAccuracyLow, // Fairly low, the comparisons have some things in common.
    KPAEmailCorrectorProjectionAccuracyMedium, // Farily high probability that the prjection is accurate.
    KPAEmailCorrectorProjectionAccuracyHigh // Really high probability that the projection is accurate.
};

typedef void (^KPAEmailCorrectorCompletionBlock)(BOOL madeProjection, KPAEmail *emailProjection, KPAEmailCorrectorProjectionAccuracy projectionAccuracy);

@interface KPAEmailCorrectionProjector : NSObject

+ (void)projectEmailAccuracy:(KPAEmail *)email completion:(KPAEmailCorrectorCompletionBlock)completion;

@end
