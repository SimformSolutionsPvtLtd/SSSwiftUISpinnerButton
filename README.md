<a href="https://www.simform.com/"><img src="https://github.com/mobile-simformsolutions/SSSwiftUISpinnerButton/blob/main/simformBanner.png"></a>

# SSSwiftUISpinnerButton


SSSwiftUISpinnerButton is an open-source library in SwiftUI to add different spinning animation to button.

[![Platform][platform-image]][platform-url]
[![swiftUI](https://img.shields.io/badge/-swiftUI-blue)](https://developer.apple.com/documentation/swiftui)
[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]
[![PRs Welcome][PR-image]][PR-url]

![Alt text](https://github.com/mobile-simformsolutions/SSSwiftUISpinnerButton/blob/main/SSSwiftUISpinnerButton.gif?raw=true)

# Features!
  - Various spinner animation styles
  - Rounded button on spinning animation

# Requirements
  - iOS 13.0+
  - Xcode 11+

# Installation
#### CocoaPods
 
- You can use CocoaPods to install `SSSwiftUISpinnerButton` by adding it to your Podfile:

       use_frameworks!
       pod 'SSSwiftUISpinnerButton'

- Import SSSwiftUISpinnerButton in your file:

       import SSSwiftUISpinnerButton

**Manually**
-   Download and drop **SSSwiftUISpinnerButton/Sources** folder in your project.
-   Congratulations!

#### Swift Package Manager
-   When using Xcode 11 or later, you can install `SSSwiftUISpinnerButton` by going to your Project settings > `Swift Packages` and add the repository by providing the GitHub URL. Alternatively, you can go to `File` > `Swift Packages` > `Add Package Dependencies...`

         dependencies: [
             .package(url: "https://github.com/mobile-simformsolutions/SSSwiftUISpinnerButton.git", from: "0.0.2")
         ]

####  Carthage
-   [Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. You can install Carthage with [Homebrew](http://brew.sh/) using the following command:
   
        $ brew update
        $ brew install carthage

-   To integrate `SSSwiftUISpinnerButton` into your Xcode project using Carthage, add the following line to your `Cartfile`:
 
     github "mobile-simformsolutions/SSSwiftUISpinnerButton"

-   Run `carthage` to build and drag the `SSSwiftUISpinnerButton` (Sources/SSSwiftUISpinnerButton) into your Xcode project.

# Usage Examples

   **Add Spinner Button**
    
 - Add state variable to manage spinner button start and stop animation

       @State var isSpinnerButtonAnimating: Bool = false

 - Add Spinner button:

       SpinnerButton(buttonAction: {
                // Your button action code here
            }, isAnimating: $isSpinnerButtonAnimating, builder: {
                // Add any view or content in button if required
                HStack {
                      Text("Save")
                        .foregroundColor(.white)
                }
            }
        )

**Start Animation**
- Animation will start as soon as you will tap on the button (`isSpinnerButtonAnimating` state variable will be set true).
   
**Stop Animation**
- To stop the spinner button animation, simply toggle the state variable `isSpinnerButtonAnimating` value.

      isSpinnerButtonAnimating.toggle()

**Spinner button animation style**
- You can select from different animation styles 
- Every animation style has properties such as count, size, etc which can be modified.

      SpinnerButton(buttonAction: {
               /// Action to perform
         }, isAnimating: $isSpinnerButtonAnimating, 
            animationType: SpinnerButtonAnimationStyle.lineSpinFade(count: 8, width: 0)) {
                 /// Add content in button
         }
**Spinner button customisation**
- You can modify view of the spinner button using `SpinnerButtonViewStyle` 
- Initialise variable with type `SpinnerButtonViewStyle` to design button:
 
      private var buttonStyleWithBasicDesign: SpinnerButtonViewStyle = SpinnerButtonViewStyle(
            width: 300, 
            height: 50, 
            cornerRadius: 5, 
            backgroundColor: .black, 
            spinningButtonBackgroundColor: .black, 
            spinningStrokeColor: .white
      )

- Assign it to `buttonstyle`:
 
      SpinnerButton(buttonAction: {
              /// Action to perform
         }, isAnimating: $isSpinnerButtonAnimating, 
            buttonStyle: buttonStyleWithBasicDesign,
            animationType: SpinnerButtonAnimationStyle.lineSpinFade(count: 8, width: 0)) {
              /// Add content in button
         }

# Swift Library:
-    Check out our Swift Library for Spinner Button - [SSSpinnerButton](https://github.com/SimformSolutionsPvtLtd/SSSpinnerButton)

#  Meta
-    Distributed under the MIT license. See LICENSE for more information.

# Inspired By: 
-   Spinner animations inspired from [iActivityIndicator](https://github.com/MojtabaHs/iActivityIndicator)

[swift-image]:https://img.shields.io/badge/swift-5.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[platform-image]:https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat
[platform-url]:https://github.com/mobile-simformsolutions/SSSwiftUISpinnerButton
[PR-image]:https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square
[PR-url]:http://makeapullrequest.com
