//
//  BallRotateFadeAnimation.swift
//  SSSwiftUISpinnerButton
//
//  Created by Chaitali Lad on 28/06/21.
//

import SwiftUI

public struct BallRotateFadeAnimation: View {
    
    // MARK: Binding Variables
    /// State of button animation
    @Binding private var isAnimating: Bool
    
    // MARK: Public Variables
    /// Change the number of animating shapes
    public let count: UInt
    
    /// Change the shape from ball to any given view
    public let content: AnyView
    
    // MARK: Init Methods
    /// - Parameters:
    ///   - isAnimating: Binding to determine if button is animating or not
    ///   - count: Change the number of animating shapes
    ///   - size: Change the size of animating shapes
    ///   - content: Change the shape from ball to any given view
    public init<Content: View>(isAnimating: Binding<Bool>, count: UInt = 6, size: CGFloat = 8, content: () -> Content) {
        self._isAnimating = isAnimating
        self.count = count
        self.content = AnyView(content().frame(width: size, height: size))
    }
    
    /// - Parameters:
    ///   - isAnimating: Binding to determine if button is animating or not
    ///   - count: Change the number of animating balls
    ///   - size: Change the size of animating balls
    public init(isAnimating: Binding<Bool>, count: UInt = 6, size: CGFloat = 8) {
        self.init(isAnimating: isAnimating, count: count) {
            Circle().frame(width: size, height: size)
        }
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ForEach(0..<Int(count)) { index in
                item(forIndex: index, in: geometry.size)
                    .rotationEffect(isAnimating ? .degrees(360) : .degrees(0))
                    .animation(
                        Animation
                            .timingCurve(0.5, 0.15 + Double(index) / 5, 0.25, 1, duration: 1.5)
                            .repeatCount(isAnimating ? .max : 1, autoreverses: false)
                    )
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
        .aspectRatio(contentMode: .fit)
    }
    
    private func animatingScale(forIndex index: Int) -> CGFloat {
        CGFloat(index+1) / CGFloat(count)
    }
    
    private func item(forIndex index: Int, in geometrySize: CGSize) -> some View {
        content
            .scaleEffect(isAnimating ? animatingScale(forIndex: index) : 1 )
            .offset(y: geometrySize.width/10 - geometrySize.height/2)
    }
}
