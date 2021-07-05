//
//  LineSpinFadeAnimation.swift
//  SSSwiftUISpinnerButton
//
//  Created by Chaitali Lad on 28/06/21.
//

import SwiftUI

public struct LineSpinFadeAnimation: View {
    
    // MARK: Binding Variables
    /// State of button animation
    @Binding private var isAnimating: Bool
    
    // MARK: Public Variables
    /// Change the number of animating line
    public let count: UInt
    
    /// Change the width of animating line
    public let width: CGFloat
    
    // MARK: Init Method
    /// - Parameters:
    ///   - isAnimating: Binding to determine if button is animating or not
    ///   - count: Change the number of animating line
    ///   - width: Change the width of animating line
    public init(isAnimating: Binding<Bool>, count: UInt = 8, width: CGFloat = -1) {
        self._isAnimating = isAnimating
        self.count = count
        self.width = width
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ForEach(0..<Int(count)) { index in
                item(forIndex: index, in: geometry.size)
                    .opacity(isAnimating ? 0.25 : 1)
                    .animation(
                        Animation.default
                            .repeatCount(isAnimating ? .max : 1, autoreverses: true)
                            .delay(Double(index) / Double(count) / 2)
                    )
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .aspectRatio(contentMode: .fit)
    }
    
    private func item(forIndex index: Int, in geometrySize: CGSize) -> some View {
        let height: CGFloat = (geometrySize.height / 3.2).rounded()
        let width: CGFloat = (self.width <= 0 ? height/2 : self.width).rounded()
        let angle = 2 * CGFloat.pi / CGFloat(count) * CGFloat(index)
        let x = (geometrySize.width/2 - height/2) * cos(angle)
        let y = (geometrySize.height/2 - height/2) * sin(angle)
        return
            Capsule(style: .continuous)
            .frame(width: width, height: height)
            .rotationEffect(Angle(radians: Double(angle + CGFloat.pi/2)))
            .offset(x: x, y: y)
    }
}
