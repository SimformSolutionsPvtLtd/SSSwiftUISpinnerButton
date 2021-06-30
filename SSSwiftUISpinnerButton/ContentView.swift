//
//  ContentView.swift
//  SSSwiftUISpinnerButton
//
//  Created by Nilisha Gupta on 12/02/21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: State variables for animation
    @State var isLineSpinFadeButtonAnimating: Bool = false
    @State var isBallRotateFadeButtonAnimating: Bool = false
    @State var isArcRotateFadeButtonAnimating: Bool = false
    @State var isBallSpinChaseButtonAnimating: Bool = false
    @State var isCustomShapeSpinChaseButtonAnimating: Bool = false
    
    // MARK: Variables for button customisation
    private var buttonStyleWithBasicDesign = SpinnerButtonViewStyle(width: 300, height: 50, cornerRadius: 5, backgroundColor: .black, spinningButtonBackgroundColor: .black, spinningStrokeColor: .white)
    
    private var buttonStyleWithBorderAndShadow: SpinnerButtonViewStyle {
        var buttonStyle = SpinnerButtonViewStyle()
        buttonStyle.cornerRadius = buttonStyle.height / 2
        buttonStyle.backgroundColor = .green
        buttonStyle.spinningButtonBackgroundColor = .green
        buttonStyle.spinningStrokeColor = .black
        buttonStyle.borderWidth = 1.5
        buttonStyle.borderColor = .yellow
        buttonStyle.shadowColor = .yellow
        buttonStyle.shadowRadius = 10
        buttonStyle.shadowOffset = CGPoint(x: 0, y: 0)
        return buttonStyle
    }
    
    private var buttonStyleWithLinearGradient: SpinnerButtonViewStyle {
        var buttonStyle = SpinnerButtonViewStyle()
        buttonStyle.height = 65
        buttonStyle.cornerRadius = buttonStyle.height / 2
        buttonStyle.backgroundColor = .green
        buttonStyle.spinningButtonBackgroundColor = .green
        buttonStyle.spinningStrokeColor = .white
        buttonStyle.gradient = LinearGradient(
            gradient: .init(colors: [.blue, .purple, .red]),
            startPoint: .trailing,
            endPoint: .leading)
        return buttonStyle
    }
    
    private var buttonStyleWithChangedBackground: SpinnerButtonViewStyle {
        var buttonStyle = SpinnerButtonViewStyle()
        buttonStyle.backgroundColor = .white
        buttonStyle.spinningButtonBackgroundColor = .red
        buttonStyle.borderWidth = 1.5
        buttonStyle.borderColor = .red
        buttonStyle.spinningStrokeColor = .white
        return buttonStyle
    }
    
    private var buttonStyleWithLesserWidth: SpinnerButtonViewStyle {
        var buttonStyle = SpinnerButtonViewStyle()
        buttonStyle.width = 200
        buttonStyle.height = 75
        buttonStyle.cornerRadius = buttonStyle.height / 3
        buttonStyle.backgroundColor = .yellow
        buttonStyle.spinningButtonBackgroundColor = .yellow
        return buttonStyle
    }
    
    var body: some View {
        VStack(spacing: 30) {
            /// Line Spin Fade Spinner Button
            SpinnerButton(buttonAction: {
                /// Action to perform
                
                /// Stop animation by toggling value of state variable
                /// Added delay of 5 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                    isLineSpinFadeButtonAnimating.toggle()
                }
            }, isAnimating: $isLineSpinFadeButtonAnimating, buttonStyle: buttonStyleWithBasicDesign, animationType: SpinnerButtonAnimationStyle.lineSpinFade(count: 8, width: 0)) {
                /// Add content in button
                HStack {
                    Image(systemName: "pencil")
                        .renderingMode(.template)
                    Text("Line Spin Fade")
                        .fontWeight(.bold)
                }
                .foregroundColor(.white)
            }
            
            /// Ball Rotate Fade Spinner Button
            SpinnerButton(buttonAction: {
                /// Action to perform
                
                /// Stop animation by toggling value of state variable
                /// Added delay of 2 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    isBallRotateFadeButtonAnimating.toggle()
                }
            }, isAnimating: $isBallRotateFadeButtonAnimating, buttonStyle: buttonStyleWithBorderAndShadow, animationType: SpinnerButtonAnimationStyle.ballSpinChase(count: 7, size: 7)) {
                /// Add content in button
                ZStack {
                    Text("Ball Rotate Fade")
                        .fontWeight(.medium)
                }
                .foregroundColor(.black)
            }
            
            /// Arcs Rotate Chase Spinner Button
            SpinnerButton(buttonAction: {
                /// Action to perform
                
                /// Stop animation by toggling value of state variable
                /// Added delay of 2 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    isArcRotateFadeButtonAnimating.toggle()
                }
            }, isAnimating: $isArcRotateFadeButtonAnimating, buttonStyle: buttonStyleWithLinearGradient, animationType: SpinnerButtonAnimationStyle.arcsRotateChase(count: 3, width: 2, spacing: 2)) {
                /// Add content in button
                HStack {
                    Text("Arcs Rotate Chase")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
            }
            
            /// Ball Spin Chase Spinner Button
            SpinnerButton(buttonAction: {
                /// Action to perform
                
                /// Stop animation by toggling value of state variable
                /// Added delay of 4 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                    isBallSpinChaseButtonAnimating.toggle()
                }
            }, isAnimating: $isBallSpinChaseButtonAnimating, buttonStyle: buttonStyleWithChangedBackground, animationType: SpinnerButtonAnimationStyle.ballRotateFade(count: 5, size: 7)) {
                /// Add content in button
                HStack {
                    Text("Ball Spin Chase")
                }
                .foregroundColor(.red)
            }

            /// Custom Spin Chase Spinner Button
            SpinnerButton(buttonAction: {
                /// Action to perform

                /// Stop animation by toggling value of state variable
                /// Added delay of 4 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                    isCustomShapeSpinChaseButtonAnimating.toggle()
                }
            }, isAnimating: $isCustomShapeSpinChaseButtonAnimating, buttonStyle: buttonStyleWithLesserWidth, animationType: SpinnerButtonAnimationStyle.ballRotateFade(count: 3, content: AnyView(Text("🔥").fixedSize()))) {
                /// Add content in button
                HStack {
                    Text("Custom Spin Chase using emoji 🔥")
                        .fontWeight(.bold)
                        .padding(15)
                }
                .foregroundColor(.orange)
            }
        }
        /// Disable view if any button is animating
        .disabled(isLineSpinFadeButtonAnimating == true || isBallRotateFadeButtonAnimating == true || isArcRotateFadeButtonAnimating == true || isBallSpinChaseButtonAnimating == true || isCustomShapeSpinChaseButtonAnimating == true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
