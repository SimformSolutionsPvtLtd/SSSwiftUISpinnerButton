//
//  SpinnerButtonViewStyle.swift
//  SSSwiftUISpinnerButton
//
//  Created by Chaitali Lad on 28/06/21.
//

import SwiftUI

public struct SpinnerButtonViewStyle {
    
    // MARK: Variables
    
    /// Width of button - default width is set to 300
    public var width: CGFloat = 300
    
    /// height of button - default height is set to 50
    public var height: CGFloat = 50
    
    /// Corner radius of button - default cornerRadius is set to 0
    public var cornerRadius: CGFloat = 0
    
    /// Background color of button - default backgroundColor is set to primary
    public var backgroundColor: Color = .primary
    
    /// Background color of button when button is animating / spinning - default spinningButtonBackgroundColor is set to primary
    public var spinningButtonBackgroundColor: Color = .primary
    
    /// Spinning stroke color of button - default spinningStrokeColor is set to white
    public var spinningStrokeColor: Color = Color.white
    
    /// Border color of button - default borderColor is set to clear
    public var borderColor: Color = Color.clear
    
    /// Border width of button - default borderWidth is set to 0
    public var borderWidth: CGFloat = 0
    
    /// Gradient of button
    public var gradient: LinearGradient?
    
    /// Shadow color of button - default shadowColor is set to clear
    public var shadowColor: Color = Color.clear
    
    /// Shadow radius of button - default shadowRadius is set to 0
    public var shadowRadius: CGFloat = 0
    
    /// Shadow offset of button - default shadowOffset is set to zero
    public var shadowOffset: CGPoint = CGPoint.zero
    
    // MARK: Init Methods
    /// Initialise to design button view
    public init() {
        
    }
    
    // MARK: Init method to add basic customisation to button
    /// Initialise to add basic custom design to button view
    /// - Parameters:
    ///   - width: Width of button
    ///   - height: Height of button
    ///   - cornerRadius: Corner radius of button
    ///   - backgroundColor: Background color of button
    ///   - spinningButtonBackgroundColor: Background color of button while button is animating / spinning
    ///   - spinningStrokeColor: Spinning Stroke Color of button
    public init(width: CGFloat? = nil, height: CGFloat? = nil, cornerRadius: CGFloat? = nil, backgroundColor: Color? = nil, spinningButtonBackgroundColor: Color? = nil, spinningStrokeColor: Color? = nil) {
        self.width = width ?? 300
        self.height = height ?? 50
        self.cornerRadius = cornerRadius ?? 0
        self.backgroundColor = backgroundColor ?? Color.primary
        self.spinningButtonBackgroundColor = spinningButtonBackgroundColor ?? self.backgroundColor
        self.spinningStrokeColor = spinningStrokeColor ?? .white
    }
}
