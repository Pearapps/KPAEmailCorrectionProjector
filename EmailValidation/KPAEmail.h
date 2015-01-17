//
//  KPAEmail.h
//  EmailCorrectionProjector
//
//  Created by Kenny Ackerson on 12/13/14.
//  Copyright (c) 2014 Kenny Ackerson. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Model class to describe an email and the parts of an email address.
 */
@interface KPAEmail : NSObject

/**
 *  @param emailAddress The string email address.
 *
 *  @return Initialized instance of a KPAEmail or nil.
 */
- (instancetype)initWithEmailAddress:(NSString *)emailAddress;

/**
 *  @param userName Email username.
 *  @param domain   The domain the email server is on.
 *  @param TLD      The top level domain of the email, eg .com, .co.uk, .net.
 *
 *  @return Initialized instance of a KPAEmail.
 */
- (instancetype)initWithUserName:(NSString *)userName domain:(NSString *)domain andTLD:(NSString *)TLD;

@property (nonatomic, copy, readonly) NSString *TLD;

@property (nonatomic, copy, readonly) NSString *domain;

@property (nonatomic, copy, readonly) NSString *emailAddress;

@property (nonatomic, copy, readonly) NSString *userName;

@end
