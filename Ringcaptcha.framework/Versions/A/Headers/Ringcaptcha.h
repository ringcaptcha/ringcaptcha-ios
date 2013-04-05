//
//  Ringcaptcha.h
//  Ringcaptcha
//
//  Created by Martin Cocaro on 2/11/13.
//  Copyright (c) 2013 Thrivecom LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

#import "RingcaptchaVerification.h"

@protocol RingcaptchaDelegate <NSObject>

@required

- (void) didFinishPhoneNumberVerification: (RingcaptchaVerification*) verification;

@optional

- (void) didFinishPhoneNumberVerificationWithCancel: (RingcaptchaVerification*) verification;

@end

@interface Ringcaptcha : NSObject {
}

//
//  verifyPhoneNumber: UI Controller to take control from and give back to
//  withAppKey: ${app_key} delivered by Ringcaptcha upon registration
//  andSecretKey: ${secret_key} delivered by Ringcaptcha upon registration
//
+ (RingcaptchaVerification*) verifyPhoneNumberWithAppKey:(NSString *)appKey andSecretKey:(NSString *)secretKey delegate: (id<RingcaptchaDelegate>) delegate;

@end