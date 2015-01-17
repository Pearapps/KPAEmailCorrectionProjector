//
//  KPAEmail.m
//  EmailCorrectionProjector
//
//  Created by Kenny Ackerson on 12/13/14.
//  Copyright (c) 2014 Kenny Ackerson. All rights reserved.
//

#import "KPAEmail.h"

@interface KPAEmail ()

@property (nonatomic, copy) NSString *TLD;

@property (nonatomic, copy) NSString *domain;

@property (nonatomic, copy) NSString *emailAddress;

@property (nonatomic, copy) NSString *userName;

@end

@implementation KPAEmail

- (instancetype)initWithUserName:(NSString *)userName domain:(NSString *)domain andTLD:(NSString *)TLD {
    self = [super init];
    
    if (self) {
        self.emailAddress = [[NSString alloc] initWithFormat:@"%@@%@%@", userName, domain, TLD];
        self.TLD = TLD;
        self.domain = domain;
        self.userName = userName;
    }
    
    return self;
}

- (instancetype)initWithEmailAddress:(NSString *)emailAddress {
    self = [super init];
    
    if (self) {
        
        NSArray *emailSeperated = [self seperateEmailAddressIntoParts:emailAddress];
        
        if (emailSeperated.count < 2) {
            return nil;
        }
        
        NSString *secondPart = emailSeperated[1];
        
        NSUInteger locationOfDot = [secondPart rangeOfString:@"."].location;
        
        NSString *emailService = [secondPart substringToIndex:locationOfDot];
        
        NSString *dotPart = [secondPart substringFromIndex:locationOfDot];
        
        self.domain = emailService;
        self.TLD = dotPart;
        self.emailAddress = emailAddress;
        self.userName = emailSeperated[0];
        
    }
    
    return self;
}


#pragma mark - Private -

- (NSArray *)seperateEmailAddressIntoParts:(NSString *)emailAddress {
    return [emailAddress componentsSeparatedByString:@"@"];
}

@end
