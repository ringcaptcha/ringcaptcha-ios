# Welcome to Ringcaptcha-iOS repository!

With the ringcaptcha-iOS library, we've simplified interaction with the Ringcaptcha verification REST API. No need to manually create URLS or parse XML/JSON. You now interact with resources directly.

This guide will help you through the setup of Ringcaptcha on your website or mobile application. Should you find any issues or would like to make any comments please do so in the [Issues](http://bitbucket.org/ringcaptcha/ringcaptcha-php/issues) tab. Thanks!

## Creating a widget

Register a new site to match the domain that the widget will be placed on. The embed code, with a unique site key, will be created for you.

```
#!javascript
<script type='text/javascript' charset='UTF-8' src='http(s)://api.ringcaptcha.com/XXXXXXXXX/widget'></script>

```

## Installing your widget on your website

To embed the widget, simply paste the embed code into your HTML. The widget will be rendered in the spot where the code is placed.

## Ending the verification loop

1. Clone this repository on yours and add a reference to it in your php code.


```
#!bash

git clone https://[user]@bitbucket.org/ringcaptcha/ringcaptcha-php.git
```

2. Integrate within your form verification code.


```
#!php

<?php

//Referencing to Ringcaptcha lib
require_once('lib/Ringcaptcha.php');

$appKey = "your_app_key"; //Please safeguard this key as if it were an acquaintance bank account password
$secretKey = "your_secret_key"; //Please safeguard this key as if it were your bank account password

$lib = new Ringcaptcha($appKey, $secretKey);

$lib->setSecure(true); //Configure whether you want to send the request using SSL or not. We suggest always connecting via SSL.

if ( $lib->isValid($_POST["ringcaptcha_pin_code"], $_POST["ringcaptcha_session_id"]) ) {

  // Successfull verification flow.
  $user_phone = $lib->getPhoneNumber(); //retrieve phone number
  $geo_located = $lib->isGeoLocated(); //retrieve whether its been geo located or not
  $id = $lib->getId(); //retrieve and store transaction id for reconciliation purposes

}
else {

  die ("RingCaptcha verification failed. Reason: " . $response->getMessage());

}

?>

```