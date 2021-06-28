//
//  SpinnerButtonViewStyle.swift
//  SSSwiftUISpinnerButton
//
//  Created by Chaitali Lad on 28/06/21.
//

import SwiftUI

public struct SpinnerButtonViewStyle {
    
    // MARK: Variables
    
    /// `width`: Width of Button
    /// Default width is set to 300
    public var width: CGFloat = 300
    
    /// `height`: Height of Button
    /// Default height is set to 50
    public var height: CGFloat = 50
    
    /// `cornerRadius`: Corner radius of Button
    /// Default cornerRadius is set to 0
    public var cornerRadius: CGFloat = 0
    
    /// `backgroundColor`: Background color of Button
    /// Default backgroundColor is set to primary
    public var backgroundColor: Color = .primary
    
    /// `spinningButtonBackgroundColor`: Background color of Button while button is animating/ spinning
    /// Default spinningButtonBackgroundColor is set to primary
    public var spinningButtonBackgroundColor: Color = .primary
    
    /// `spinningStrokeColor`: Spinning Stroke Color of Button
    /// Default spinningStrokeColor is set to white
    public var spinningStrokeColor: Color = Color.white
    
    /// `borderColor`: Border color of Button
    /// Default borderColor is set to clear
    public var borderColor: Color = Color.clear
    
    /// `borderWidth`: Border width of Button
    /// Default borderWidth is set to 0
    public var borderWidth: CGFloat = 0
    
    /// `gradient`: gradient of Button
    public var gradient: LinearGradient?
    
    /// `shadowColor`: Shadow color of Button
    /// Default shadowColor is set to clear
    public var shadowColor: Color = Color.clear
    
    /// `shadowRadius`: Shadow radius of Button
    /// Default shadowRadius is set to 0
    public var shadowRadius: CGFloat = 0
    
    /// `shadowOffset`: Shadow offset of Button
    /// Default shadowOffset is set to zero
    public var shadowOffset: CGPoint = CGPoint.zero
    
    // MARK: Init Methods
    public init() {
    
    }
    
    // MARK: Init method to add basic customisation to button
    /// `width`: Width of Button
    /// `height`: Height of Button
    /// `cornerRadius`: Corner radius of Button
    /// `backgroundColor`: Background color of Button
    /// `spinningButtonBackgroundColor`: Background color of Button while button is animating/ spinning
    /// `spinningStrokeColor`: Spinning Stroke Color of Button
    public init(width: CGFloat? = nil, height: CGFloat? = nil, cornerRadius: CGFloat? = nil, backgroundColor: Color? = nil, spinningButtonBackgroundColor: Color? = nil, spinningStrokeColor: Color? = nil) {
        self.width = width ?? 300
        self.height = height ?? 50
        self.cornerRadius = cornerRadius ?? 0
        self.backgroundColor = backgroundColor ?? Color.primary
        self.spinningButtonBackgroundColor = spinningButtonBackgroundColor ?? self.backgroundColor
        self.spinningStrokeColor = spinningStrokeColor ?? .white
    }
}
