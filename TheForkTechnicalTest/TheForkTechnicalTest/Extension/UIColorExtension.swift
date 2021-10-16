//
//  UIColorExtension.swift
//  TheForkTechnicalTest
//
//  Created by Alban on 16/10/2021.
//

import UIKit

infix operator |: AdditionPrecedence
extension UIColor {
    /* Variables */
    static let lightBackground = UIColor(red: 232 / 255, green: 232 / 255, blue:232 / 255, alpha: 1)
    static let darkBackground = UIColor(red: 90 / 255, green: 90 / 255, blue: 90 / 255, alpha: 1)
    static let theForkColor = UIColor(red: 102 / 255, green: 145 / 255, blue: 76 / 255, alpha: 1)

    /* Functions */
    /// Easily define two colors for both light and dark mode.
    /// - Parameters:
    ///   - lightMode: The color to use in light mode.
    ///   - darkMode: The color to use in dark mode.
    /// - Returns: A dynamic color that uses both given colors respectively for the given user interface style.
    static func | (lightMode: UIColor, darkMode: UIColor) -> UIColor {
        guard #available(iOS 13.0, *) else { return lightMode }
            
        return UIColor { (traitCollection) -> UIColor in
            return traitCollection.userInterfaceStyle == .light ? lightMode : darkMode
        }
    }
}

