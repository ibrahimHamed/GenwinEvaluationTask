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
    
    func addTapGesture(_ action: @escaping () -> Void) {
        endEditing(true)
        isUserInteractionEnabled = true
        
        let tap = MyTapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.action = action
        addGestureRecognizer(tap)
        
        endEditing(true)
    }
    
    class MyTapGestureRecognizer: UITapGestureRecognizer {
        var action: (() -> Void)?
    }
    
    @objc func handleTap(_ sender: MyTapGestureRecognizer) {
        alpha = 0.2
        UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveLinear], animations: { self.alpha = 1.0 }, completion: nil)
        sender.action!()
    }
}







