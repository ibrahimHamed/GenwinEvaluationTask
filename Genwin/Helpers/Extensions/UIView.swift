//
//  UIView.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 04/02/2023.
//

import UIKit

extension UIView {
    func setHeight(constant: CGFloat, isLowPeriorty: Bool = false) {
        constraints.filter({ $0.firstAnchor == heightAnchor }).forEach { $0.isActive = false }
        let constraint = heightAnchor.constraint(equalToConstant: constant)
        constraint.isActive = true
    }
    
    func round( _ radius: CGFloat = 8) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func addBorder(color: UIColor, width: CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
}

