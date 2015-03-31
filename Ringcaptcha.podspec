Pod::Spec.new do |s|

  s.name         = "Ringcaptcha"
  s.version      = "1.7"
  s.summary      = "RingCaptcha, the fastest way to onboard verified users into any app."

  s.description  = <<-DESC
                   RingCaptcha, the fastest way to onboard verified users into any app.

                   DESC

  s.homepage     = "http://ringcaptcha.com/"
  s.license      = "Apache License, Version 2.0"
  s.authors      = { "mcocaro" => "martin@ringcaptcha.com" }
  s.source       = { :git => "https://github.com/ringcaptcha/ringcaptcha-ios.git", :tag => "v1.7" }
  
  s.resource  = "Ringcaptcha.bundle"
  s.framework  = "Ringcaptcha"

  s.vendored_frameworks = 'Ringcaptcha.framework'
  
  s.ios.framework    = 'CoreTelephony', 'Ringcaptcha'
  s.ios.deployment_target = "4.3"
  s.requires_arc = true

end
