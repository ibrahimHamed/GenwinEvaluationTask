//
//  UIwindow.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 05/02/2023.
//

import UIKit

extension UIWindow {
    func topViewController() -> UIViewController? {
        var top = rootViewController
        while true {
             if let nav = top as? UINavigationController {
                top = nav.visibleViewController
            } else {
                break
            }
        }
        return top
    }
}
