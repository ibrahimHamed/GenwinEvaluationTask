//
//  AppAlert.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 05/02/2023.
//

import UIKit

class AppAlert: UIAlertController {
    
    static func showErrorMessage(_ error: String?){
        guard let error = error else { return }
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        guard let window = window else {return}
        window.topViewController()?.present(alert, animated: true)
    }
    
}
