//
//  Colors.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 04/02/2023.
//

import UIKit

final class AppColors {
    static let shared: AppColors = .init()
    
    private init() {}
    
    private func createColor(named: ColorNames) -> UIColor {
        guard let color = UIColor(named: named.rawValue) else {
            fatalError("No color found in assetes with the name \(named.rawValue) please add the color with this name to it")
        }
        return color
    }
    
    // MARK: - Names -

    private enum ColorNames: String {
        // Backgrounds
        case blackBackgroundColor
        case grayBackgroundColor
        
        // Fonts
        case whiteFontColor
        
        // Navigations
        case grayNavigationColor
        case orangeNavigationColor
        
        // StatusBars
        case grayStatusBarColor
        case orangeStatusBarColor
    }
    
    // MARK: - Font -

    var blackBackgroundColor: UIColor {
        return createColor(named: .blackBackgroundColor)
    }

    var grayBackgroundColor: UIColor {
        return createColor(named: .grayBackgroundColor)
    }

    var whiteFontColor: UIColor {
        return createColor(named: .whiteFontColor)
    }

    var grayNavigationColor: UIColor {
        return createColor(named: .grayNavigationColor)
    }

    var orangeNavigationColor: UIColor {
        return createColor(named: .orangeNavigationColor)
    }
    var grayStatusBarColor: UIColor {
        return createColor(named: .grayStatusBarColor)
    }
    var orangeStatusBarColor: UIColor {
        return createColor(named: .orangeStatusBarColor)
    }
    
    
}
