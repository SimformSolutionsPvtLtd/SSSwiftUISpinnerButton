//
//  SpinnerButton.swift
//  SSSwiftUISpinnerButton
//
//  Created by Chaitali Lad on 28/06/21.
//

import SwiftUI

public struct SpinnerButton<Content: View>: View {
    
    // MARK: Binding Variables
    @Binding var isButtonAnimating: Bool
    
    // MARK: Variables
    var buttonStyle: SpinnerButtonViewStyle
    let content: Content
    var buttonAction: (() -> ())
    var animationType: SpinnerButtonAnimationStyle?
    
    // MARK: Init Method
    public init(buttonAction: @escaping () -> Void, isAnimating: Binding<Bool>, buttonStyle: SpinnerButtonViewStyle? = nil, animationType: SpinnerButtonAnimationStyle? = nil, @ViewBuilder builder: () -> Content) {
        content = builder()
        self._isButtonAnimating = isAnimating
        self.buttonStyle = buttonStyle ?? SpinnerButtonViewStyle()
        self.animationType = animationType
        self.buttonAction = buttonAction
    }
    
    public var body: some View {
        /// Add Button
        Button(action: {
            /// Perform action on tap of button
            /// Toggle `isButtonAnimating` to change the state
            if !isButtonAnimating {
                buttonAction()
            }
            isButtonAnimating = true
        }) {
            /// Add content in button view
            ZStack {
                /// Customise content view based on button style (before and after animation)
                /// Add rectangle in ZStack and add styling customisation
                Rectangle()
                    /// Fill rectandle with given linear gradient
                    /// or
                    /// Add linear gradient with background and loading background color
                    .fill(
                        buttonStyle.gradient ?? LinearGradient(
                            gradient: Gradient(
                                colors: [(isButtonAnimating ? buttonStyle.spinningButtonBackgroundColor:buttonStyle.backgroundColor)]
                            ),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    /// Add given corner radius to rectangle when button is not animating
                    .cornerRadius(
                        isButtonAnimating ? (buttonStyle.height/2):buttonStyle.cornerRadius
                    )
                    /// Add `overlay` to give border or shadow to button
                    /// Add Rounded Rectangle View
                    /// `Stroke`:  Add given custom border and border width
                    /// `Shadow`:  Addgiven custom shadow
                    /// `CornerRadius`:  Add given corner radius when button is not animating (For overlay to clip borders)
                    .overlay(RoundedRectangle(cornerRadius: isButtonAnimating ? buttonStyle.height/2:buttonStyle.cornerRadius)
                                .stroke(buttonStyle.borderColor, lineWidth: buttonStyle.borderWidth)
                                .shadow(color: buttonStyle.shadowColor, radius: buttonStyle.shadowRadius, x: buttonStyle.shadowOffset.x, y: buttonStyle.shadowOffset.y))
                    /// Add animation
                    .animation(.easeInOut)
                
                if isButtonAnimating {
                    /// On animating, add spinning animation to view
                    SpinnerButtonAnimationView(animationStyle: animationType ?? .arcsRotateChase(), buttonViewStyle: buttonStyle)
                            .frame(width: buttonStyle.height / 2, height: buttonStyle.height / 2, alignment: .center)
                            .foregroundColor(buttonStyle.spinningStrokeColor)
                } else {
                    /// On stopping animation, show animation in user-added content
                    VStack {
                        /// Add user added content
                        content
                            .animation(.easeInOut)
                    }
                    .cornerRadius(isButtonAnimating ? buttonStyle.height/2:buttonStyle.cornerRadius)
                }
            }
        }
        /// Add custom frame size
        .frame(width: isButtonAnimating ? buttonStyle.height:buttonStyle.width, height: buttonStyle.height)
        /// Disable view while animating
        .disabled(isButtonAnimating == true)
    }
}
