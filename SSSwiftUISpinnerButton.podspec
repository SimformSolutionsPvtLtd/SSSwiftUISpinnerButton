#
#  Be sure to run `pod spec lint SSSwiftUISpinnerButton.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "SSSwiftUISpinnerButton"
  spec.version      = "0.0.1"
  spec.summary      = "Button with different spinner animation styles."
  spec.description  = "SpinnerButton is a custom button with different spinner animation styles."
  spec.homepage     = "https://github.com/mobile-simformsolutions/SSSwiftUISpinnerButton"
  #spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Chaitali Lad" => "chaitali.l@simformsolutions.com" }
  spec.platform     = :ios
  spec.ios.deployment_target = "13.0"

  spec.source            = { :git => "https://github.com/mobile-simformsolutions/SSSwiftUISpinnerButton", :tag => "#{spec.version}" } 
  spec.source_files  = "SpinnerButton/*.swift", "SpinnerButton/**/*.swift"
  #spec.documentation_url = 'docs/index.html'

end