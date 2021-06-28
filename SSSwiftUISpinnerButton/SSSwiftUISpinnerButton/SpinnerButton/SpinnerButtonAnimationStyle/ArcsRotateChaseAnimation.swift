//
//  ArcsRotateChaseAnimation.swift
//  SSSwiftUISpinnerButton
//
//  Created by Chaitali Lad on 28/06/21.
//

import SwiftUI

public struct ArcsRotateChaseAnimation: View {
    
    // MARK: Binding Variables
    @Binding private var isAnimating: Bool
    
    // MARK: Variables
    public let count: UInt
    public let width: CGFloat
    public let spacing: CGFloat
    
    // MARK: Init Methods
    
    /// `isAnimating`: State of animation view
    /// `count`: Change number of arcs
    /// `width`: Change width of animating arcs
    /// `spacing`: Add spacing between animating arcs
    public init(isAnimating: Binding<Bool>, count: UInt = 3, width: CGFloat = 2, spacing: CGFloat = 1) {
        self._isAnimating = isAnimating
        self.count = count
        self.width = width
        self.spacing = spacing
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ForEach(0..<Int(count)) { index in
                item(forIndex: index, in: geometry.size)
                    .rotationEffect(isAnimating ? .degrees(360) : .degrees(0))
                    .animation(
                        Animation.default
                            .speed(Double.random(in: 0.2...0.5))
                            .repeatCount(isAnimating ? .max : 1, autoreverses: false)
                    )
            }
        }
        .aspectRatio(contentMode: .fit)
    }
    
    private func item(forIndex index: Int, in geometrySize: CGSize) -> some View {
        Group { () -> Path in
            var path = Path()
            path.addArc(center: CGPoint(x: geometrySize.width/2, y: geometrySize.height/2),
                        radius: geometrySize.width/2 - width/2 - CGFloat(index) * (width + spacing),
                        startAngle: .degrees(0),
                        endAngle: .degrees(Double(Int.random(in: 180...300))),
                        clockwise: true)
            return path.strokedPath(.init(lineWidth: width))
        }
        .frame(width: geometrySize.width, height: geometrySize.height)
    }
}
