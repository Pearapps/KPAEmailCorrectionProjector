//
//  main.m
//  EmailCorrectionProjector
//
//  Created by Kenny Ackerson on 12/13/14.
//  Copyright (c) 2014 Kenny Ackerson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KPAEmailCorrectionProjector.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        [KPAEmailCorrectionProjector projectEmailAccuracy:[[KPAEmail alloc] initWithEmailAddress:@"pearapps@gnail.com"] completion:^(BOOL madeProjection, KPAEmail *emailProjection, KPAEmailCorrectorProjectionAccuracy projectionAccuracy) {
            if (madeProjection) {
                if (projectionAccuracy > KPAEmailCorrectorProjectionAccuracyLow) {
                    NSLog(@"Accurate enough for meh!");
                }
                NSLog(@"%@", emailProjection.emailAddress);
            }
        }];
        
    }
    return 0;
}
