# Welcome to Ringcaptcha-iOS repository!

With the ringcaptcha-iOS library, we've simplified interaction with the Ringcaptcha verification REST API. No need to manually create URLS or parse XML/JSON. You now interact with resources directly.

This guide will help you through the setup of Ringcaptcha on your website or mobile application. Should you find any issues or would like to make any comments please do so in the [Issues](http://bitbucket.org/ringcaptcha/ringcaptcha-php/issues) tab. Thanks!

## Supported platforms

- iOS 6.0+
- All others are work in progress

## Creating a widget

Register a new application to match the app name that the widget will be placed on. The embed code, with a unique site key, will be created for you.

```
#!javascript
<script type='text/javascript' charset='UTF-8' src='http(s)://api.ringcaptcha.com/XXXXXXXXX/widget'></script>

```

## Installing your widget on your website


1. Clone this repository on yours and add a reference to it in your php code.


```
#!bash

git clone https://[user]@bitbucket.org/ringcaptcha/ringcaptcha-ios.git
```

2. Add `Ringcaptcha.framework` and `Ringcaptcha.bundle` to your xCode project. NOTE: Remember to copy it instead of adding the references directly unless you prefer otherwise

3. Include in every target that will be using Ringcaptcha.framework the following:
  - `CoreTelephony.framework` as a dependency lib
  - In "Build Settings" tab, under "Linking" -> "Other Linker Flags" include: "-ObjC -all_load"

4. In the ViewController that will be instantiating Ringcaptcha flow, call it using:

```
#!objective-c

[Ringcaptcha verifyPhoneNumberWithAppKey:@"${APP_KEY}" andSecretKey:@"${SECRET_KEY}" delegate: self];

```

5. Implement the following callback methods on your controller

```
#!objective-c

- (void) didFinishPhoneNumberVerification: (RingcaptchaVerification*) verification {
  //Called whenever the phone number verification process ended (successfully or not)

  [verification.verificationSuccessful] //Boolean value indicating whether the phone number has been verified successfully or not

  [verification.verificationId] //Id identifying the verification process

  [verification. phoneNumber] //String value representing verified phone number, correctly typed

  [verification.errorDescription] //Error description in the event the verification is not successful

}

- (void) didFinishPhoneNumberVerificationWithCancel: (RingcaptchaVerification*) verification {
}

```