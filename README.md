# Using Ringcaptcha widget on your iOS App

Register or Log-in to the [Ringcaptcha.com](http://ringcaptcha.com) site and create a new widget matching the application name it will be placed on. It is important that the name is exactly as shown on the Apple App Store for the widget to work correctly, any mistake can lead to unexpected errors. Select the default service to use for PIN code requests, and activate desired features. An embed code, with a unique app key, will be created for you automatically.

## Import the signed library into your project

To embed the SDK just drag&drop or copy&paste the library provided to you by Ringcaptcha into your libs folder in your XCode project. In addition to that, in every target that the SDK will be included you must: link it to **CoreTelephony.framework** and include under "Build Settings", "Linking" -> "Other Linker Flags" the following value: "-ObjC -all_load".

Make sure the Navigation Bar is visible and displayed for the flow controls to appear.

> _Note: The library is compatible with iOS 4.3+ or greater. The widget UI is compatible with iOS 5.0+ or greater._

Launch a fully functional widget by calling the following code:

	#!objective-c
	#import <Ringcaptcha/Ringcaptcha.h>
	[Ringcaptcha verifyPhoneNumberWithAppKey:@"APP_KEY" andSecretKey:@"SECRET_KEY" inViewController:self delegate: self];

And implement the following delegate methods:

	#!objective-c
	- (void) didFinishPhoneNumberVerification: (RingcaptchaVerification*) verification;
	- (void) didFinishPhoneNumberVerificationWithCancel: (RingcaptchaVerification*) verification;

Or use Success and Cancel blocks instead:

	#!objective-c
	success:^(RingcaptchaVerification *verification) {
      NSLog(@"Verification process ended successfully? %@", verification.verificationId);
      NSLog(@"Verification process ended successfully? %d", verification.verificationSuccessful);
      NSLog(@"Verification process ended successfully? %@", verification.phoneNumber);
      NSLog(@"Verification process ended successfully? %@", verification.errorDescription);
    } cancel:^(RingcaptchaVerification *verification) {
      NSLog(@"Verification process cancelled? %d", verification.verificationSuccessful);
    }

If you have access to the API directly, access the SDK directly with:

	#!objective-c
	#import <RingcaptchaAPI/RingcaptchaAPI.h>
	RingcaptchaAPI* controller = [[RingcaptchaAPI alloc] initWithAppKey:@”APP_KEY” andApiKey:@”API_KEY”];
	[controller sendCaptchaCodeToNumber:@”PHONE_NUMBER” withService:SMS delegate:self];
	[controller verifyCaptchaWithCode:@”PIN_CODE” delegate:self];

And implement the following delegate methods:

	#!objective-c
	- (void) didFinishCodeRequest: (RingcaptchaResponse*) rsp; 
	- (void) didFinishCodeRequestWithError: (NSError*) err;
	- (void) didFinishVerifyRequest: (RingcaptchaResponse*) rsp;
	- (void) didFinishVerifyRequestWithError: (NSError*) err;

That's it. Download the [SDK](https://bitbucket.org/ringcaptcha/ringcaptcha-ios/src) and you are ready to start verifying your community phone numbers!
