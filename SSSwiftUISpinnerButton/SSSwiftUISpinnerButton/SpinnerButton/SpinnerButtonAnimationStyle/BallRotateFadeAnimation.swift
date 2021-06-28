//
//  BallRotateFadeAnimation.swift
//  SSSwiftUISpinnerButton
//
//  Created by Chaitali Lad on 28/06/21.
//

import SwiftUI

public struct BallRotateFadeAnimation: View {
    
    // MARK: Binding Variables
    @Binding private var isAnimating: Bool
    
    // MARK: Variables
    public let count: UInt
    public let content: AnyView
    
    // MARK: Init Methods
    
    /// `Content`: Change shape of animating ball
    /// `isAnimating`: State of animation view
    /// `count`: Change number of of animating ball
    /// `size`: Change size of animating ball
    public init<Content: View>(isAnimating: Binding<Bool>, count: UInt = 6, size: CGFloat = 8, content: () -> Content) {
        self._isAnimating = isAnimating
        self.count = count
        self.content = AnyView(content().frame(width: size, height: size))
    }
    
    /// `Content`: Default shape of animating ball to circle if not given
    /// `isAnimating`: State of animation view
    /// `count`: Change number of of animating ball
    /// `size`: Change size of animating ball
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
