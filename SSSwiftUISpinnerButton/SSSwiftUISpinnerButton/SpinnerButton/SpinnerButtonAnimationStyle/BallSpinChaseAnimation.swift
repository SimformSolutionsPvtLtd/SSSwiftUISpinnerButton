//
//  BallSpinChaseAnimation.swift
//  SSSwiftUISpinnerButton
//
//  Created by Chaitali Lad on 28/06/21.
//

import SwiftUI

public struct BallSpinChaseAnimation: View {
    
    // MARK: Binding Variables
    @Binding private var isAnimating: Bool
    
    // MARK: Variables
    public let count: UInt
    public let size: CGFloat
    
    // MARK: Init Methods
    
    /// `isAnimating`: State of animation view
    /// `count`: Change number of balls
    /// `size`: Change size of animating balls
    public init(isAnimating: Binding<Bool>, count: UInt = 8, size: CGFloat = 16) {
        self._isAnimating = isAnimating
        self.count = count
        self.size = size
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ForEach(0..<Int(count)) { index in
                item(forIndex: index, in: geometry.size)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                
            }
        }
        .aspectRatio(contentMode: .fit)
    }
    
    private func item(forIndex index: Int, in geometrySize: CGSize) -> some View {
        let angle = 2 * CGFloat.pi / CGFloat(count) * CGFloat(index)
        let x = (geometrySize.width/2 - size/2) * cos(angle)
        let y = (geometrySize.height/2 - size/2) * sin(angle)
        return Circle()
            .frame(width: size, height: size)
            .scaleEffect(isAnimating ? 0.5 : 1)
            .opacity(isAnimating ? 0.25 : 1)
            .animation(
                Animation
                    .default
                    .repeatCount(isAnimating ? .max : 1, autoreverses: true)
                    .delay(Double(index) / Double(count) / 2)
            )
            .offset(x: x, y: y)
    }
}
