//
//  BallSpinChaseAnimation.swift
//  SSSwiftUISpinnerButton
//
//  Created by Chaitali Lad on 28/06/21.
//

import SwiftUI

public struct BallSpinChaseAnimation: View {
    
    // MARK: Binding Variables
    /// State of button animation
    @Binding private var isAnimating: Bool
    
    // MARK: Public Variables
    /// Change the number of animating ball
    public let count: UInt
    
    /// Change the size of animating ball
    public let size: CGFloat
    
    // MARK: Init Method
    /// - Parameters:
    ///   - isAnimating: Binding to determine if button is animating or not
    ///   - count: Change the number of animating ball
    ///   - size: Change the size of animating ball
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
