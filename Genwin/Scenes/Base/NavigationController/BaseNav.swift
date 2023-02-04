//
//  BaseNav.swift
//  Genwin
//
//  Created by Ibrahim Hamed on 04/02/2023.
//

import UIKit


class BaseNav: UINavigationController {
    
    // To make StatusBar textColor light
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        handleAppearance()
    }
    
    private func handleAppearance(){
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.titleTextAttributes = [.foregroundColor: AppColors.shared.whiteFontColor, .font: UIFont.boldSystemFont(ofSize: 16)]
            appearance.backgroundColor = AppColors.shared.grayNavigationColor
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
        }

    }
    
}
