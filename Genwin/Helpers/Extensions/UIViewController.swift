//
//  UIViewController.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 03/02/2023.
//

import UIKit

extension UIViewController {
    func push(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}
