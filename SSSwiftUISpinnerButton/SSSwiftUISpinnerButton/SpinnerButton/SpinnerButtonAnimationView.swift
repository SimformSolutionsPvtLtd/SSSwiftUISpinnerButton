//
//  SpinnerButtonAnimationView.swift
//  SSSwiftUISpinnerButton
//
//  Created by Chaitali Lad on 28/06/21.
//

import SwiftUI

// MARK: Spinner Button Animation Style
public enum SpinnerButtonAnimationStyle {
    case arcsRotateChase(count: UInt = 3, width: CGFloat = 2, spacing: CGFloat = 1)
    case ballSpinChase(count: UInt = 8, size: CGFloat = 16)
    case ballRotateFade(count: UInt = 6, size: CGFloat = 10, content: AnyView = AnyView(Circle()))
    case lineSpinFade(count: UInt = 8, width: CGFloat = 0)
}

// MARK: Spinner Button Animation View
public struct SpinnerButtonAnimationView: View {

    // MARK: State Variables
    @State var isAnimating: Bool = false
    
    // MARK: Variables
    private let animationStyle: SpinnerButtonAnimationStyle
    private let buttonViewStyle: SpinnerButtonViewStyle

    public var body: some View {
        Group {
            switch animationStyle {
            case let .arcsRotateChase(count, width, spacing):
                ArcsRotateChaseAnimation(
                    isAnimating: $isAnimating,
                    count: count,
                    width: width,
                    spacing: spacing
                )
            case let .ballSpinChase(count, size):
                BallSpinChaseAnimation(
                    isAnimating: $isAnimating,
                    count: count,
                    size: size
                )
            case let .ballRotateFade(count, size, content):
                BallRotateFadeAnimation(
                    isAnimating: $isAnimating,
                    count: count,
                    size: size,
                    content: { content.frame(width: size, height: size) }
                )
            case let .lineSpinFade(count, width):
                LineSpinFadeAnimation(isAnimating: $isAnimating,
                                      count: count,
                                      width: width)
            }
        }
        .onAppear { isAnimating = true }
        .onDisappear { isAnimating = false }
        .aspectRatio(contentMode: .fit)
    }

    // MARK: Init Method
    public init(animationStyle: SpinnerButtonAnimationStyle = .arcsRotateChase(), buttonViewStyle: SpinnerButtonViewStyle) {
        self.animationStyle = animationStyle
        self.buttonViewStyle = buttonViewStyle
    }
}
