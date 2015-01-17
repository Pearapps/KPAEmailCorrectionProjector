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

/**
 *  Definition of the completion block.
 *
 *  @param madeProjection     Whether or not KPAEmailCorrectionProjector was able to project a different email.
 *  @param emailProjection    The email projection.
 *  @param projectionAccuracy How accruate the projection is.
 */
typedef void (^KPAEmailCorrectorCompletionBlock)(BOOL madeProjection, KPAEmail *emailProjection, KPAEmailCorrectorProjectionAccuracy projectionAccuracy);

@interface KPAEmailCorrectionProjector : NSObject

/**
 *  @param email      Email used to project.
 *  @param completion Called with parameters on completion.
 */
+ (void)projectEmailAccuracy:(KPAEmail *)email completion:(KPAEmailCorrectorCompletionBlock)completion;

@end
