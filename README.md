# KPAEmailCorrectionProjector

This is a simple couple of classes for detecting a mistyped email address and suggesting what it could potentially actually be.

    [KPAEmailCorrectionProjector projectEmailAccuracy:[[KPAEmail alloc] initWithEmailAddress:@"pearapps@gnail.com"] completion:^(BOOL madeProjection, KPAEmail *emailProjection, KPAEmailCorrectorProjectionAccuracy projectionAccuracy) {
            if (madeProjection) {
                NSLog(@"%@", emailProjection.emailAddress);
            }
        }];

A good potential use for this is on login pages inside an app; and if this projects that it was wrong and has a high projected accuracy - you might want to present some UI to allow them to change the email to the suggested one without making them type at all to correct.
